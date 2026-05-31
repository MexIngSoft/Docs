[CmdletBinding(SupportsShouldProcess = $true)]
param(
    [ValidateSet("jobcron", "tecnotelec", "lexnova", "docucore", "fiscora", "imagrafity")]
    [string]$Project = "docucore",
    [switch]$CleanCache,
    [switch]$SkipInstall,
    [switch]$SkipBuild,
    [switch]$SkipLint
)

$ErrorActionPreference = "Stop"

$repoRoot = Resolve-Path (Join-Path $PSScriptRoot "..\..\..\..")
$projects = @{
    jobcron = @{ Port = 3000; Path = "Docker.WEB.NJ\WEB.NJ.NEXT.JobCron"; Routes = @("/", "/upload") }
    tecnotelec = @{ Port = 3001; Path = "Docker.WEB.NJ\WEB.NJ.NEXT.TecnoTelec"; Routes = @("/") }
    lexnova = @{ Port = 3002; Path = "Docker.WEB.NJ\WEB.NJ.NEXT.LexNova"; Routes = @("/") }
    docucore = @{ Port = 3004; Path = "Docker.WEB.NJ\WEB.NJ.NEXT.DocuCore"; Routes = @("/", "/upload", "/workspace") }
    fiscora = @{ Port = 3005; Path = "Docker.WEB.NJ\WEB.NJ.NEXT.Fiscora"; Routes = @("/") }
    imagrafity = @{ Port = 3006; Path = "Docker.WEB.NJ\WEB.NJ.NEXT.Imagrafity"; Routes = @("/") }
}

$config = $projects[$Project]
$projectPath = Join-Path $repoRoot $config.Path
$port = [int]$config.Port
$outLog = Join-Path $env:TEMP "$Project-next-$port.out.log"
$errLog = Join-Path $env:TEMP "$Project-next-$port.err.log"

function Invoke-Step {
    param(
        [string]$Label,
        [scriptblock]$Script
    )
    Write-Host "==> $Label"
    & $Script
}

function Stop-PortProcess {
    param([int]$Port)
    $connections = Get-NetTCPConnection -LocalPort $Port -State Listen -ErrorAction SilentlyContinue
    $processIds = @($connections | Select-Object -ExpandProperty OwningProcess -Unique)
    foreach ($processId in $processIds) {
        if ($PSCmdlet.ShouldProcess("PID $processId on port $Port", "Stop Next local dev server")) {
            Stop-Process -Id $processId -Force
        }
    }
}

function Remove-NextCache {
    param([string]$ProjectPath)
    $nextPath = Join-Path $ProjectPath ".next"
    if (Test-Path $nextPath) {
        $resolvedProject = (Resolve-Path $ProjectPath).Path
        $resolvedNext = (Resolve-Path $nextPath).Path
        if (-not $resolvedNext.StartsWith($resolvedProject)) {
            throw "Ruta .next fuera del proyecto: $resolvedNext"
        }
        if ($PSCmdlet.ShouldProcess($resolvedNext, "Remove Next cache")) {
            Remove-Item -LiteralPath $resolvedNext -Recurse -Force
        }
    }
}

function Test-Route {
    param([string]$Url)
    try {
        $response = Invoke-WebRequest -Uri $Url -UseBasicParsing -TimeoutSec 30
        Write-Host "$Url -> $($response.StatusCode)"
        return $response.StatusCode -eq 200
    } catch {
        Write-Host "$Url -> ERROR $($_.Exception.Message)"
        return $false
    }
}

if (-not (Test-Path $projectPath)) {
    throw "No existe el proyecto: $projectPath"
}

if (-not $SkipInstall -and -not (Test-Path (Join-Path $projectPath "node_modules"))) {
    Invoke-Step "npm install" { npm install --prefix $projectPath }
}

if (-not $SkipLint) {
    Invoke-Step "npm run lint" { npm run lint --prefix $projectPath }
}

if (-not $SkipBuild) {
    Invoke-Step "npm run build" { npm run build --prefix $projectPath }
}

Invoke-Step "stop port $port" { Stop-PortProcess -Port $port }

if ($CleanCache) {
    Invoke-Step "clean .next" { Remove-NextCache -ProjectPath $projectPath }
}

Invoke-Step "start dev server" {
    Start-Process -FilePath "npm.cmd" -ArgumentList @("run", "dev", "--", "-p", "$port") -WorkingDirectory $projectPath -RedirectStandardOutput $outLog -RedirectStandardError $errLog -WindowStyle Hidden
}

Start-Sleep -Seconds 10

$allOk = $true
foreach ($route in $config.Routes) {
    $ok = Test-Route -Url "http://localhost:$port$route"
    if (-not $ok) {
        $allOk = $false
    }
}

Write-Host "stdout: $outLog"
Write-Host "stderr: $errLog"

if (-not $allOk) {
    exit 2
}
