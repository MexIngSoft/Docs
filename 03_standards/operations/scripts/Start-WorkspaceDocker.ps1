[CmdletBinding()]
param(
    [switch]$BuildApi,
    [switch]$BuildWeb,
    [switch]$ReleasePorts,
    [switch]$RepairCss,
    [switch]$RunDjangoChecks,
    [int]$WaitSeconds = 150
)

$ErrorActionPreference = "Stop"

$workspaceRoot = Resolve-Path (Join-Path $PSScriptRoot "..\..\..\..")
$composeFiles = @{
    Db = Join-Path $workspaceRoot "Docker.DB.PG\docker-compose.yml"
    Api = Join-Path $workspaceRoot "Docker.API.PY\docker-compose.yml"
    Web = Join-Path $workspaceRoot "Docker.WEB.NJ\docker-compose.yml"
    Nginx = Join-Path $workspaceRoot "Docker.SW.Nginx\docker-compose.yml"
}

$apiServices = @(
    @{ Name = "auth"; Port = 8000; CheckPath = "/api/auth/jwt/verify/"; Method = "POST"; Body = "{}"; Expected = @(400, 401) },
    @{ Name = "catalog"; Port = 8001; Expected = @(200, 301, 302, 401, 403, 404) },
    @{ Name = "inventory"; Port = 8002; Expected = @(200, 301, 302, 401, 403, 404) },
    @{ Name = "lexnova"; Port = 8003; CheckPath = "/api/cases/"; Expected = @(200, 401, 403) },
    @{ Name = "pricing"; Port = 8004; Expected = @(200, 301, 302, 401, 403, 404) },
    @{ Name = "procurement"; Port = 8005; Expected = @(200, 301, 302, 401, 403, 404) },
    @{ Name = "sales"; Port = 8006; Expected = @(200, 301, 302, 401, 403, 404) },
    @{ Name = "supplier"; Port = 8007; Expected = @(200, 301, 302, 401, 403, 404) },
    @{ Name = "tecnotelec"; Port = 8009; Expected = @(200, 301, 302, 401, 403, 404) },
    @{ Name = "customization"; Port = 8010; Expected = @(200, 301, 302, 401, 403, 404) },
    @{ Name = "document"; Port = 8011; Expected = @(200, 301, 302, 401, 403, 404) },
    @{ Name = "docucore"; Port = 8012; Expected = @(200, 301, 302, 401, 403, 404) },
    @{ Name = "fiscora"; Port = 8015; Expected = @(200, 301, 302, 401, 403, 404) },
    @{ Name = "fiscal"; Port = 8016; Expected = @(200, 301, 302, 401, 403, 404) },
    @{ Name = "imagrafity"; Port = 8019; CheckPath = "/api/imagrafity/health/"; Expected = @(200) },
    @{ Name = "leadhunter"; Port = 8021; CheckPath = "/api/leadhunter/health/"; Expected = @(200) },
    @{ Name = "jobcron"; Port = 8022; Expected = @(200, 301, 302, 401, 403, 404) },
    @{ Name = "gateway"; Port = 8025; CheckPath = "/health/"; Expected = @(200) }
)

$webServices = @(
    @{ Name = "jobcron"; Port = 3000; Url = "http://localhost:3000/" },
    @{ Name = "tecnotelec"; Port = 3001; Url = "http://localhost:3001/" },
    @{ Name = "lexnova"; Port = 3002; Url = "http://localhost:3002/auth/login"; CssProject = "lexnova" },
    @{ Name = "docucore"; Port = 3004; Url = "http://localhost:3004/" },
    @{ Name = "fiscora"; Port = 3005; Url = "http://localhost:3005/"; Static = $true },
    @{ Name = "imagrafity"; Port = 3006; Url = "http://localhost:3006/" },
    @{ Name = "leadhunter"; Port = 3007; Url = "http://localhost:3007/prospectos" }
)

function Write-Step {
    param([string]$Message)
    Write-Host ""
    Write-Host "== $Message ==" -ForegroundColor Cyan
}

function Invoke-WorkspaceCommand {
    param([string[]]$Command, [string]$Label)
    Write-Host "$Label"
    & $Command[0] @($Command | Select-Object -Skip 1)
    if ($LASTEXITCODE -ne 0) {
        throw "$Label fallo con exit code $LASTEXITCODE"
    }
}

function Test-DockerReady {
    try {
        $serverVersion = docker version --format "{{.Server.Version}}" 2>$null
        return ($LASTEXITCODE -eq 0 -and -not [string]::IsNullOrWhiteSpace($serverVersion))
    } catch {
        return $false
    }
}

function Start-DockerDesktop {
    if (Test-DockerReady) {
        return
    }

    $dockerDesktop = "C:\Program Files\Docker\Docker\Docker Desktop.exe"
    if (-not (Test-Path $dockerDesktop)) {
        throw "Docker Desktop no esta disponible en $dockerDesktop"
    }

    Start-Process -FilePath $dockerDesktop -WindowStyle Hidden
    $deadline = (Get-Date).AddSeconds(150)
    while ((Get-Date) -lt $deadline) {
        if (Test-DockerReady) {
            return
        }
        Start-Sleep -Seconds 5
    }

    throw "Docker Desktop no respondio despues de esperar 150 segundos."
}

function Invoke-HttpCheck {
    param(
        [string]$TargetUrl,
        [string]$Method = "GET",
        [string]$Body = $null,
        [int[]]$Expected = @(200)
    )

    try {
        if ([string]::IsNullOrWhiteSpace($TargetUrl)) {
            throw "URL vacia para validacion HTTP"
        }
        $curlCommand = "curl.exe -sS -o NUL -w ""%{http_code}"" --max-time 90 -X $Method"
        if ($Body -ne $null) {
            $escapedBody = $Body.Replace('"', '\"')
            $curlCommand += " -H ""Content-Type: application/json"" --data ""$escapedBody"""
        }
        $curlCommand += " ""$TargetUrl"""
        $rawStatus = cmd /d /c $curlCommand
        $statusCode = [int]$rawStatus
        return [PSCustomObject]@{
            Ok = $Expected -contains $statusCode
            Status = $statusCode
            Detail = "HTTP $statusCode"
        }
    } catch {
        $statusCode = $null
        if ($_.Exception.Response) {
            $statusCode = [int]$_.Exception.Response.StatusCode
        }
        return [PSCustomObject]@{
            Ok = $statusCode -and ($Expected -contains $statusCode)
            Status = $statusCode
            Detail = $_.Exception.Message
        }
    }
}

function Test-TcpPort {
    param([int]$Port)
    try {
        $client = [Net.Sockets.TcpClient]::new()
        $async = $client.BeginConnect("127.0.0.1", $Port, $null, $null)
        $ok = $async.AsyncWaitHandle.WaitOne(3000, $false)
        if ($ok) {
            $client.EndConnect($async)
        }
        $client.Close()
        return $ok
    } catch {
        return $false
    }
}

function Get-ApiProcessPorts {
    try {
        $output = docker exec api-backend-python sh -lc "python - <<'PY'
import os, re
ports = []
for pid in sorted([p for p in os.listdir('/proc') if p.isdigit()], key=int):
    try:
        raw = open(f'/proc/{pid}/cmdline', 'rb').read().replace(b'\0', b' ').decode(errors='ignore')
    except Exception:
        continue
    if 'uvicorn' in raw:
        match = re.search(r'--port\s+(\d+)', raw)
        if match:
            ports.append(match.group(1))
print('\n'.join(sorted(set(ports), key=int)))
PY"
        return @($output -split "`n" | ForEach-Object { $_.Trim() } | Where-Object { $_ })
    } catch {
        return @()
    }
}

function Get-WebProcessPorts {
    try {
        $output = docker exec web-frontend-node sh -lc "node <<'JS'
const fs = require('fs');
const ports = [];
for (const pid of fs.readdirSync('/proc').filter((x) => /^\d+$/.test(x)).sort((a,b) => Number(a)-Number(b))) {
  try {
    const raw = fs.readFileSync('/proc/' + pid + '/cmdline').toString().replace(/\0/g, ' ');
    const match = raw.match(/--port\s+(\d+)/);
    if (raw.includes('next') && match) ports.push(match[1]);
  } catch {}
}
console.log([...new Set(ports)].sort((a,b) => Number(a)-Number(b)).join('\n'));
JS"
        return @($output -split "`n" | ForEach-Object { $_.Trim() } | Where-Object { $_ })
    } catch {
        return @()
    }
}

function Start-ComposeStack {
    Write-Step "Levantando Docker Compose"
    Invoke-WorkspaceCommand -Command @("docker", "compose", "-f", $composeFiles.Db, "up", "-d") -Label "PostgreSQL"

    $apiArgs = @("compose", "-f", $composeFiles.Api, "up", "-d")
    if ($BuildApi) {
        $apiArgs += "--build"
    } else {
        $apiArgs += "--no-build"
    }
    $apiCommand = @("docker") + $apiArgs
    Invoke-WorkspaceCommand -Command $apiCommand -Label "APIs Django"

    $webArgs = @("compose", "-f", $composeFiles.Web, "up", "-d")
    if ($BuildWeb) {
        $webArgs += "--build"
    } else {
        $webArgs += "--no-build"
    }
    $webCommand = @("docker") + $webArgs
    Invoke-WorkspaceCommand -Command $webCommand -Label "Webs Next.js"

    Invoke-WorkspaceCommand -Command @("docker", "compose", "-f", $composeFiles.Nginx, "up", "-d", "--no-build") -Label "Nginx"
}

function Test-Workspace {
    Write-Step "Estado de contenedores"
    docker ps --format "table {{.Names}}\t{{.Status}}\t{{.Ports}}"

    Write-Step "Procesos API esperados"
    $apiProcessPorts = Get-ApiProcessPorts
    $apiRows = foreach ($service in $apiServices) {
        $portText = [string]$service.Port
        $tcpOk = Test-TcpPort -Port $service.Port
        $processOk = $apiProcessPorts -contains $portText
        $path = if ($service.CheckPath) { $service.CheckPath } else { "/" }
        $method = if ($service.Method) { $service.Method } else { "GET" }
        $body = if ($service.Body) { $service.Body } else { $null }
        $http = Invoke-HttpCheck -TargetUrl "http://localhost:$($service.Port)$path" -Method $method -Body $body -Expected $service.Expected

        [PSCustomObject]@{
            Name = $service.Name
            Port = $service.Port
            Process = $processOk
            Tcp = $tcpOk
            Http = $http.Ok
            Status = $http.Status
            Path = $path
        }
    }
    $apiRows | Format-Table -AutoSize

    Write-Step "Procesos Web esperados"
    $webProcessPorts = Get-WebProcessPorts
    $webRows = foreach ($service in $webServices) {
        $portText = [string]$service.Port
        $tcpOk = Test-TcpPort -Port $service.Port
        $http = Invoke-HttpCheck -TargetUrl $service.Url -Expected @(200)
        $processOk = ($webProcessPorts -contains $portText) -or ($service.Static -and $tcpOk -and $http.Ok)

        [PSCustomObject]@{
            Name = $service.Name
            Port = $service.Port
            Process = $processOk
            Tcp = $tcpOk
            Http = $http.Ok
            Status = $http.Status
            Url = $service.Url
        }
    }
    $webRows | Format-Table -AutoSize
}

Push-Location $workspaceRoot
try {
    Write-Step "Preparando Docker"
    Start-DockerDesktop

    if ($ReleasePorts) {
        $reserveScript = Join-Path $PSScriptRoot "Reserve-WorkspacePorts.ps1"
        & powershell -NoProfile -ExecutionPolicy Bypass -File $reserveScript -KillConflicts
    }

    Start-ComposeStack

    if ($WaitSeconds -gt 0) {
        Write-Step "Esperando $WaitSeconds segundos"
        Start-Sleep -Seconds $WaitSeconds
    }

    if ($RepairCss) {
        $repairScript = Join-Path $PSScriptRoot "Repair-NextCss.ps1"
        & powershell -NoProfile -ExecutionPolicy Bypass -File $repairScript -Project lexnova -Url "http://localhost:3002/auth/login" -Repair -Docker
    }

    Test-Workspace

    if ($RunDjangoChecks) {
        Write-Step "Django checks principales"
        foreach ($project in @("auth", "gateway", "lexnova")) {
            docker compose -f $composeFiles.Api exec -T api-multiproyecto sh /usr/src/api/start.sh manage $project check
        }
    }
} finally {
    Pop-Location
}
