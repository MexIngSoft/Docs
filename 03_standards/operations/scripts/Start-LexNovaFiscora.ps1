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

Invoke-Step "Starting PostgreSQL" {
    docker compose -f (Join-Path $root "Docker.DB.PG\docker-compose.yml") up -d
}

$apiArgs = @(
    "compose",
    "-f", (Join-Path $root "Docker.API.PY\docker-compose.lexnova-fiscora.yml"),
    "up", "-d"
)

if ($Build) {
    $apiArgs += "--build"
}

Invoke-Step "Starting focused APIs: Auth, LexNova, Document, Fiscora and Fiscal" {
    docker @apiArgs
}

$webArgs = @(
    "compose",
    "-f", (Join-Path $root "Docker.WEB.NJ\docker-compose.lexnova-fiscora.yml"),
    "up", "-d"
)

if ($Build) {
    $webArgs += "--build"
}

Invoke-Step "Starting focused webs: LexNova and Fiscora" {
    docker @webArgs
}

if ($RunChecks) {
    Invoke-Step "Django checks" {
        Push-Location (Join-Path $root "Docker.API.PY\API.PY.DJANGO.Auth")
        Invoke-WithEnv @{
            DJANGO_SECRET_KEY = "local-auth-secret"
            POSTGRES_DB = "auth"
            POSTGRES_USER = "auth_user"
            POSTGRES_PASSWORD = "local-auth-password"
            DB_SCHEMA = "Auth"
            DEVELOPMENT_MODE = "True"
            REDIRECT_URIS = "http://localhost:3002,http://localhost:3003,http://localhost:3005"
        } {
            python manage.py check
        }
        Pop-Location

        Push-Location (Join-Path $root "Docker.API.PY\API.PY.DJANGO.LexNova")
        Invoke-WithEnv @{
            DJANGO_SECRET_KEY = "local-lexnova-secret"
            POSTGRES_DB = "lexnova"
            POSTGRES_USER = "lexnova_user"
            POSTGRES_PASSWORD = "local-lexnova-password"
            DB_SCHEMA = "Person"
            DEVELOPMENT_MODE = "True"
            AUTH_API_VERIFY_URL = "http://localhost:8000/api/auth/jwt/verify/"
        } {
            python manage.py check
        }
        Pop-Location

        Push-Location (Join-Path $root "Docker.API.PY\API.PY.DJANGO.LexNova.Gateway")
        Invoke-WithEnv @{
            DJANGO_SECRET_KEY = "local-lexnova-gateway-secret"
            DATABASE_URL = "sqlite:///:memory:"
            AUTH_API_BASE_URL = "http://localhost:8000"
            LEXNOVA_API_BASE_URL = "http://localhost:8003"
            DEVELOPMENT_MODE = "True"
        } {
            python manage.py check
        }
        Pop-Location

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

        Push-Location (Join-Path $root "Docker.API.PY\API.PY.DJANGO.Fiscora.Gateway")
        Invoke-WithEnv @{
            DJANGO_SECRET_KEY = "local-fiscora-gateway-secret"
            POSTGRES_DB = "comercial"
            POSTGRES_USER = "comercial_user"
            POSTGRES_PASSWORD = "local-comercial-password"
            DB_SCHEMA = "FiscoraGateway"
            FISCORA_API_BASE_URL = "http://localhost:8015"
            FISCAL_API_BASE_URL = "http://localhost:8016"
            DEVELOPMENT_MODE = "True"
        } {
            python manage.py check
        }
        Pop-Location

        Push-Location (Join-Path $root "Docker.API.PY\API.PY.DJANGO.Fiscora")
        Invoke-WithEnv @{
            DJANGO_SECRET_KEY = "local-fiscora-secret"
            POSTGRES_DB = "comercial"
            POSTGRES_USER = "comercial_user"
            POSTGRES_PASSWORD = "local-comercial-password"
            DB_SCHEMA = "Fiscora"
            DEVELOPMENT_MODE = "True"
        } {
            python manage.py check
        }
        Pop-Location

        Push-Location (Join-Path $root "Docker.API.PY\API.PY.DJANGO.Fiscal")
        Invoke-WithEnv @{
            DJANGO_SECRET_KEY = "local-fiscal-secret"
            POSTGRES_DB = "comercial"
            POSTGRES_USER = "comercial_user"
            POSTGRES_PASSWORD = "local-comercial-password"
            DB_SCHEMA = "Fiscal"
            DEVELOPMENT_MODE = "True"
        } {
            python manage.py check
        }
        Pop-Location
    }

    Invoke-Step "Fiscora build" {
        Push-Location (Join-Path $root "Docker.WEB.NJ\WEB.NJ.NEXT.Fiscora")
        npm run build
        Pop-Location
    }
}

Write-Host ""
Write-Host "LexNova: http://localhost:3002/auth/login"
Write-Host "Fiscora: http://localhost:3005/"
Write-Host "LexNova Gateway: http://localhost:8017/api/lexnova/health/"
Write-Host "Fiscora Gateway: http://localhost:8014/api/fiscora/health/"
