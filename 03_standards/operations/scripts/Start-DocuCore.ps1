param(
    [switch]$Build,
    [switch]$RunChecks
)

$ErrorActionPreference = "Stop"

$root = Resolve-Path (Join-Path $PSScriptRoot "..\..\..\..")

function Invoke-Step {
    param(
        [string]$Title,
        [scriptblock]$Script
    )

    Write-Host ""
    Write-Host "== $Title =="
    & $Script
}

function Invoke-WithEnv {
    param(
        [hashtable]$Env,
        [scriptblock]$Script
    )

    $previous = @{}
    foreach ($key in $Env.Keys) {
        $previous[$key] = [Environment]::GetEnvironmentVariable($key, "Process")
        [Environment]::SetEnvironmentVariable($key, [string]$Env[$key], "Process")
    }

    try {
        & $Script
    }
    finally {
        foreach ($key in $Env.Keys) {
            [Environment]::SetEnvironmentVariable($key, $previous[$key], "Process")
        }
    }
}

Invoke-Step "Stopping full API and Web compose stacks" {
    docker compose -f (Join-Path $root "Docker.API.PY\docker-compose.yml") down --remove-orphans
    docker compose -f (Join-Path $root "Docker.WEB.NJ\docker-compose.yml") down --remove-orphans
}

Invoke-Step "Starting PostgreSQL" {
    docker compose -f (Join-Path $root "Docker.DB.PG\docker-compose.yml") up -d
}

$apiArgs = @(
    "compose",
    "-f", (Join-Path $root "Docker.API.PY\docker-compose.docucore.yml"),
    "up", "-d"
)

if ($Build) {
    $apiArgs += "--build"
}

Invoke-Step "Starting focused DocuCore APIs: Document, DocuCore and Gateway" {
    docker @apiArgs
}

$webArgs = @(
    "compose",
    "-f", (Join-Path $root "Docker.WEB.NJ\docker-compose.docucore.yml"),
    "up", "-d"
)

if ($Build) {
    $webArgs += "--build"
}

Invoke-Step "Starting focused DocuCore web" {
    docker @webArgs
}

if ($RunChecks) {
    Invoke-Step "Django checks" {
        Push-Location (Join-Path $root "Docker.API.PY\API.PY.DJANGO.Document")
        Invoke-WithEnv @{
            DJANGO_SECRET_KEY = "local-document-secret"
            POSTGRES_DB = "comercial"
            POSTGRES_USER = "comercial_user"
            POSTGRES_PASSWORD = "local-comercial-password"
            DB_SCHEMA = "Document"
            DEVELOPMENT_MODE = "True"
        } {
            python manage.py check
        }
        Pop-Location

        Push-Location (Join-Path $root "Docker.API.PY\API.PY.DJANGO.DocuCore")
        Invoke-WithEnv @{
            DJANGO_SECRET_KEY = "local-docucore-secret"
            POSTGRES_DB = "comercial"
            POSTGRES_USER = "comercial_user"
            POSTGRES_PASSWORD = "local-comercial-password"
            DB_SCHEMA = "DocuCore"
            DEVELOPMENT_MODE = "True"
        } {
            python manage.py check
        }
        Pop-Location

        Push-Location (Join-Path $root "Docker.API.PY\API.PY.DJANGO.DocuCore.Gateway")
        Invoke-WithEnv @{
            DJANGO_SECRET_KEY = "local-docucore-gateway-secret"
            POSTGRES_DB = "comercial"
            POSTGRES_USER = "comercial_user"
            POSTGRES_PASSWORD = "local-comercial-password"
            DB_SCHEMA = "DocuCoreGateway"
            DOCUMENT_API_BASE_URL = "http://localhost:8011"
            DOCUCORE_API_BASE_URL = "http://localhost:8012"
            DEVELOPMENT_MODE = "True"
        } {
            python manage.py check
        }
        Pop-Location
    }

    Invoke-Step "DocuCore web build" {
        Push-Location (Join-Path $root "Docker.WEB.NJ\WEB.NJ.NEXT.DocuCore")
        npm run build
        Pop-Location
    }
}

Write-Host ""
Write-Host "DocuCore Web: http://localhost:3004/"
Write-Host "Document API: http://localhost:8011/"
Write-Host "DocuCore API: http://localhost:8012/"
Write-Host "DocuCore Gateway: http://localhost:8013/api/docucore/health/"
