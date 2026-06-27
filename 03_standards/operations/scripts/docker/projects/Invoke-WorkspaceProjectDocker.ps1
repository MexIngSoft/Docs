param(
    [Parameter(Mandatory = $true)]
    [ValidateSet(
        "docucore",
        "fiscora",
        "imagrafity",
        "jobcron",
        "lexnova",
        "refapart",
        "tecnotelec",
        "mexingsof"
    )]
    [string]$Project,

    [Parameter(Mandatory = $true)]
    [ValidateSet("start", "stop", "status", "health")]
    [string]$Action,

    [switch]$Build
)

$ErrorActionPreference = "Stop"

$workspaceRoot = Resolve-Path (Join-Path $PSScriptRoot "..\..\..\..\..\..")
$composeProjectName = "comercial_platform"
$composeFiles = @(
    (Join-Path $workspaceRoot "Docker.DB.PG\docker-compose.master.db.yml"),
    (Join-Path $workspaceRoot "Docker.API.PY\docker-compose.master.api.yml"),
    (Join-Path $workspaceRoot "Docker.WEB.NJ\docker-compose.master.web.yml"),
    (Join-Path $workspaceRoot "Docker.SW.Nginx\docker-compose.master.nginx.yml")
)

$projects = @{
    docucore = @{
        Label = "DocuCore"
        WebProjects = "docucore"
        ApiProjects = "auth gateway document docucore"
        Url = "http://127.0.0.1:3004/"
        Port = 3004
        Gateway = "http://127.0.0.1:8025/health/"
    }
    fiscora = @{
        Label = "Fiscora"
        WebProjects = "fiscora"
        ApiProjects = "auth gateway document fiscora fiscal"
        Url = "http://127.0.0.1:3005/"
        Port = 3005
        Gateway = "http://127.0.0.1:8025/health/"
    }
    imagrafity = @{
        Label = "Imagrafity"
        WebProjects = "imagrafity"
        ApiProjects = "auth gateway imagrafity"
        Url = "http://127.0.0.1:3006/"
        Port = 3006
        Gateway = "http://127.0.0.1:8025/health/"
    }
    jobcron = @{
        Label = "JobCron"
        WebProjects = "jobcron"
        ApiProjects = "auth gateway jobcron search"
        Url = "http://127.0.0.1:3000/"
        Port = 3000
        Gateway = "http://127.0.0.1:8025/health/"
    }
    lexnova = @{
        Label = "LexNova"
        WebProjects = "lexnova"
        ApiProjects = "auth gateway lexnova document"
        Url = "http://127.0.0.1:3002/auth/login"
        Port = 3002
        Gateway = "http://127.0.0.1:8025/health/"
    }
    refapart = @{
        Label = "REFAPART"
        WebProjects = "refapart"
        ApiProjects = "auth gateway refapart address search"
        Url = "http://127.0.0.1:3008/"
        Port = 3008
        Gateway = "http://127.0.0.1:8025/health/"
    }
    tecnotelec = @{
        Label = "TecnoTelec"
        WebProjects = "tecnotelec"
        ApiProjects = "auth gateway catalog inventory pricing procurement sales supplier tecnotelec customization search"
        Url = "http://127.0.0.1:3001/"
        Port = 3001
        Gateway = "http://127.0.0.1:8025/health/"
    }
    mexingsof = @{
        Label = "MexIngSof"
        WebProjects = "mexingsof"
        ApiProjects = "auth gateway jobcron search"
        Url = "http://127.0.0.1:3009/"
        Port = 3009
        Gateway = "http://127.0.0.1:8025/health/"
    }
}

function Invoke-Compose {
    param([string[]]$ComposeArgs)

    $baseArgs = @("compose", "-p", $composeProjectName)
    foreach ($composeFile in $composeFiles) {
        $baseArgs += @("-f", $composeFile)
    }

    docker @($baseArgs + $ComposeArgs)
    if ($LASTEXITCODE -ne 0) {
        throw "docker compose fallo con exit code $LASTEXITCODE"
    }
}

function Invoke-WithProjectEnvironment {
    param(
        [hashtable]$Config,
        [scriptblock]$Script
    )

    $previousApi = [Environment]::GetEnvironmentVariable("API_PROJECTS", "Process")
    $previousWeb = [Environment]::GetEnvironmentVariable("WEB_PROJECTS", "Process")

    [Environment]::SetEnvironmentVariable("API_PROJECTS", $Config.ApiProjects, "Process")
    [Environment]::SetEnvironmentVariable("WEB_PROJECTS", $Config.WebProjects, "Process")

    try {
        & $Script
    }
    finally {
        [Environment]::SetEnvironmentVariable("API_PROJECTS", $previousApi, "Process")
        [Environment]::SetEnvironmentVariable("WEB_PROJECTS", $previousWeb, "Process")
    }
}

function Test-Http {
    param([string]$Url)

    $curl = Get-Command curl.exe -ErrorAction SilentlyContinue
    if ($curl) {
        $previousErrorActionPreference = $ErrorActionPreference
        $ErrorActionPreference = "Continue"
        try {
            $statusCode = & $curl.Source -sS -o NUL -w "%{http_code}" --max-time 60 $Url 2>$null
            $exitCode = $LASTEXITCODE
        }
        finally {
            $ErrorActionPreference = $previousErrorActionPreference
        }

        if ($exitCode -eq 0 -and $statusCode -match "^[0-9]{3}$") {
            if ($statusCode -ge 200 -and $statusCode -lt 400) {
                return "OK HTTP $statusCode"
            }
            return "ERROR HTTP $statusCode"
        }
        return "ERROR curl exit $exitCode HTTP $statusCode"
    }

    try {
        $response = Invoke-WebRequest -Uri $Url -UseBasicParsing -TimeoutSec 25
        return "OK HTTP $($response.StatusCode)"
    }
    catch {
        if ($_.Exception.Response) {
            return "ERROR HTTP $([int]$_.Exception.Response.StatusCode)"
        }
        return "ERROR $($_.Exception.Message)"
    }
}

function Show-Status {
    param([hashtable]$Config)

    Write-Host ""
    Write-Host "Proyecto: $($Config.Label)"
    Write-Host "WEB_PROJECTS=$($Config.WebProjects)"
    Write-Host "API_PROJECTS=$($Config.ApiProjects)"
    Write-Host "URL=$($Config.Url)"
    Write-Host ""
    docker compose -p $composeProjectName ps
    Write-Host ""
    docker ps --format "table {{.Names}}\t{{.Image}}\t{{.Status}}\t{{.Ports}}"
}

function Invoke-Health {
    param([hashtable]$Config)

    Show-Status $Config
    Write-Host ""
    Write-Host "Gateway: $(Test-Http $Config.Gateway)"
    Write-Host "Web:     $(Test-Http $Config.Url)"
    Write-Host ""
    docker network inspect jobcron_network --format "network={{.Name}} containers={{len .Containers}}"
}

$config = $projects[$Project]

switch ($Action) {
    "start" {
        docker network inspect jobcron_network *> $null
        if ($LASTEXITCODE -ne 0) {
            docker network create jobcron_network | Out-Host
        }

        Invoke-WithProjectEnvironment $config {
            $upArgs = @("up", "-d")
            if ($Build) {
                $upArgs += "--build"
            }
            $upArgs += @("db-postgresql", "api-multiproyecto", "web-frontend-node", "nginx")
            Invoke-Compose $upArgs
        }

        Invoke-Health $config
    }
    "stop" {
        $baseline = @{
            ApiProjects = "auth gateway jobcron search"
            WebProjects = "jobcron"
        }
        Invoke-WithProjectEnvironment $baseline {
            Invoke-Compose @("up", "-d", "api-multiproyecto", "web-frontend-node")
        }
        Write-Host ""
        Write-Host "Proyecto desactivado: $($config.Label)"
        Write-Host "Se conservan dependencias compartidas y PostgreSQL. No se borraron volumenes."
        Show-Status $config
    }
    "status" {
        Show-Status $config
    }
    "health" {
        Invoke-Health $config
    }
}
