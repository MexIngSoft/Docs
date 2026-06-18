[CmdletBinding(SupportsShouldProcess = $true)]
param(
    [Parameter(Mandatory = $true)]
    [ValidateSet("web", "api")]
    [string]$Type,

    [Parameter(Mandatory = $true)]
    [ValidatePattern("^[A-Z][A-Za-z0-9]+$")]
    [string]$Name,

    [int]$Port,
    [switch]$SkipDockerCompose
)

$ErrorActionPreference = "Stop"

$repoRoot = Resolve-Path (Join-Path $PSScriptRoot "..\..\..\..")
$projectKey = $Name.ToLowerInvariant()
$domainApp = $projectKey
$script:createdProject = $false

function New-TextFile {
    param(
        [string]$Path,
        [string]$Content
    )

    if (Test-Path $Path) {
        throw "El archivo ya existe: $Path"
    }

    $parent = Split-Path -Parent $Path
    if (-not (Test-Path $parent)) {
        New-Item -ItemType Directory -Path $parent -Force | Out-Null
    }

    Set-Content -Path $Path -Value $Content -Encoding utf8
}

function New-DirectoryIfMissing {
    param([string]$Path)
    if (-not (Test-Path $Path)) {
        New-Item -ItemType Directory -Path $Path -Force | Out-Null
    }
}

function New-WebProject {
    $webPort = if ($Port) { $Port } else { 3000 }
    $root = Join-Path $repoRoot "Docker.WEB.NJ\WEB.NJ.NEXT.$Name"

    if (Test-Path $root) {
        throw "Ya existe el proyecto Web: $root"
    }

    if ($PSCmdlet.ShouldProcess($root, "Create Next.js workspace project")) {
        $script:createdProject = $true
        foreach ($dir in @("app", "components", "features", "hooks", "lib", "public", "styles", "types")) {
            New-DirectoryIfMissing (Join-Path $root $dir)
        }

        New-TextFile (Join-Path $root ".env.local.example") @"
NEXT_PUBLIC_APP_NAME=$Name
NEXT_PUBLIC_HOST=http://localhost:$webPort
NEXT_PUBLIC_GATEWAY_BASE_URL=http://localhost:PENDIENTE_DE_DEFINIR/api/$projectKey
NEXT_PUBLIC_ENVIRONMENT=local
"@

        New-TextFile (Join-Path $root ".gitignore") @"
node_modules/
.next/
out/
.env.local
.env*.local
npm-debug.log*
"@

        New-TextFile (Join-Path $root "package.json") @"
{
  "name": "web-nj-next-$projectKey",
  "version": "0.1.0",
  "private": true,
  "scripts": {
    "dev": "next dev",
    "build": "next build",
    "lint": "next lint"
  },
  "dependencies": {
    "next": "15.3.3",
    "react": "19.0.0",
    "react-dom": "19.0.0"
  },
  "devDependencies": {
    "@types/node": "20.14.10",
    "@types/react": "19.0.8",
    "@types/react-dom": "19.0.3",
    "eslint": "9.29.0",
    "eslint-config-next": "15.3.3",
    "typescript": "5.8.3"
  }
}
"@

        New-TextFile (Join-Path $root "tsconfig.json") @"
{
  "compilerOptions": {
    "target": "ES2017",
    "lib": ["dom", "dom.iterable", "esnext"],
    "allowJs": true,
    "skipLibCheck": true,
    "strict": true,
    "noEmit": true,
    "esModuleInterop": true,
    "module": "esnext",
    "moduleResolution": "bundler",
    "resolveJsonModule": true,
    "isolatedModules": true,
    "jsx": "preserve",
    "incremental": true,
    "plugins": [{ "name": "next" }],
    "paths": { "@/*": ["./*"] }
  },
  "include": ["next-env.d.ts", "**/*.ts", "**/*.tsx", ".next/types/**/*.ts"],
  "exclude": ["node_modules"]
}
"@

        New-TextFile (Join-Path $root "next.config.ts") @"
import type { NextConfig } from "next";

const nextConfig: NextConfig = {};

export default nextConfig;
"@

        New-TextFile (Join-Path $root "eslint.config.mjs") @"
import { dirname } from "path";
import { fileURLToPath } from "url";
import { FlatCompat } from "@eslint/eslintrc";

const __filename = fileURLToPath(import.meta.url);
const __dirname = dirname(__filename);
const compat = new FlatCompat({ baseDirectory: __dirname });

const eslintConfig = [...compat.extends("next/core-web-vitals", "next/typescript")];

export default eslintConfig;
"@

        New-TextFile (Join-Path $root "next-env.d.ts") @"
/// <reference types="next" />
/// <reference types="next/image-types/global" />
"@

        New-TextFile (Join-Path $root "lib\config.ts") @"
export const appConfig = {
  name: process.env.NEXT_PUBLIC_APP_NAME ?? "$Name",
  host: process.env.NEXT_PUBLIC_HOST ?? "http://localhost:$webPort",
  gatewayBaseUrl: process.env.NEXT_PUBLIC_GATEWAY_BASE_URL ?? "",
  environment: process.env.NEXT_PUBLIC_ENVIRONMENT ?? "local",
};
"@

        New-TextFile (Join-Path $root "app\layout.tsx") @"
import type { Metadata } from "next";
import "./globals.css";

export const metadata: Metadata = {
  title: "$Name",
  description: "PENDIENTE_DE_DEFINIR",
  icons: {
    icon: "/favicon.svg",
  },
};

export default function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  return (
    <html lang="es">
      <body>{children}</body>
    </html>
  );
}
"@

        New-TextFile (Join-Path $root "app\page.tsx") @"
import { appConfig } from "@/lib/config";

export default function Home() {
  return (
    <main>
      <h1>{appConfig.name}</h1>
      <p>PENDIENTE_DE_DEFINIR</p>
    </main>
  );
}
"@

        New-TextFile (Join-Path $root "app\globals.css") @"
:root {
  color-scheme: light;
  font-family: Arial, Helvetica, sans-serif;
}

* {
  box-sizing: border-box;
}

body {
  margin: 0;
  background: #f7f9fb;
  color: #17202a;
}

main {
  min-height: 100vh;
  padding: 48px;
}
"@

        New-TextFile (Join-Path $root "public\favicon.svg") @"
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 64 64" role="img" aria-labelledby="title">
  <title>$Name</title>
  <rect width="64" height="64" rx="12" fill="#17202a"/>
  <text x="32" y="39" text-anchor="middle" font-family="Arial, Helvetica, sans-serif" font-size="22" font-weight="700" fill="#ffffff">$($Name.Substring(0,1))</text>
</svg>
"@

        foreach ($dir in @("components", "features", "hooks", "styles", "types")) {
            New-TextFile (Join-Path $root "$dir\.gitkeep") ""
        }

        New-TextFile (Join-Path $root "README.md") @"
# WEB.NJ.NEXT.$Name

Frontend Next.js de $Name.

## Variables

Copiar `.env.local.example` a `.env.local`.

| Variable | Uso |
|---|---|
| `NEXT_PUBLIC_APP_NAME` | Nombre visible. |
| `NEXT_PUBLIC_HOST` | Host local. |
| `NEXT_PUBLIC_GATEWAY_BASE_URL` | Gateway General. |
| `NEXT_PUBLIC_ENVIRONMENT` | Ambiente local. |

## Desarrollo

```powershell
npm install
npm run lint
npm run build
npm run dev -- -p $webPort
```

## Pendientes

- PENDIENTE_DE_DEFINIR: dominio visual.
- PENDIENTE_DE_DEFINIR: URL real del Gateway General.
"@

        if (-not $SkipDockerCompose) {
            New-TextFile (Join-Path $repoRoot "Docker.WEB.NJ\docker-compose.$projectKey.web.yml") @"
services:
  web-frontend-node:
    extends:
      file: docker-compose.yml
      service: web-frontend-node
    environment:
      - WEB_PROJECTS=$projectKey
"@
        }
    }
}

function New-ApiProject {
    $apiPort = if ($Port) { $Port } else { 8000 }
    $root = Join-Path $repoRoot "Docker.API.PY\API.PY.DJANGO.$Name"

    if (Test-Path $root) {
        throw "Ya existe el proyecto API: $root"
    }

    if ($PSCmdlet.ShouldProcess($root, "Create Django API workspace project")) {
        $script:createdProject = $true
        foreach ($dir in @("config", "$domainApp", "$domainApp\migrations")) {
            New-DirectoryIfMissing (Join-Path $root $dir)
        }

        New-TextFile (Join-Path $root ".env.local.example") @"
API_NAME=$Name
API_VERSION=0.1.0
API_DESCRIPTION=PENDIENTE_DE_DEFINIR
API_DOMAIN=$projectKey
API_PORT=$apiPort
API_BASE_PATH=/api/$projectKey/
API_HEALTH_PATH=/api/$projectKey/health/
API_DOCS_PATH=PENDIENTE_DE_DEFINIR
API_SCHEMA_NAME=$Name
API_DATABASE_NAME=$projectKey
DEVELOPMENT_MODE=True
DJANGO_SECRET_KEY=change-me-$projectKey-secret
DJANGO_ALLOWED_HOSTS=127.0.0.1,localhost
CORS_ALLOWED_ORIGINS=http://localhost:3000
POSTGRES_DB=$projectKey
POSTGRES_USER=${projectKey}_user
POSTGRES_PASSWORD=change-me-$projectKey
POSTGRES_HOST=localhost
POSTGRES_PORT=5432
DB_SCHEMA=$Name
"@

        New-TextFile (Join-Path $root ".gitignore") @"
venv/
__pycache__/
*.py[cod]
.env.local
.env
db.sqlite3
.pytest_cache/
"@

        New-TextFile (Join-Path $root "requirements.txt") @"
Django==4.2.5
djangorestframework==3.14.0
django-cors-headers==4.2.0
dj-database-url==2.1.0
python-dotenv==1.0.0
psycopg2-binary==2.9.7
uvicorn==0.23.2
"@

        New-TextFile (Join-Path $root "manage.py") @"
#!/usr/bin/env python
import os
import sys


def main():
    os.environ.setdefault("DJANGO_SETTINGS_MODULE", "config.settings")
    from django.core.management import execute_from_command_line

    execute_from_command_line(sys.argv)


if __name__ == "__main__":
    main()
"@

        New-TextFile (Join-Path $root "config\__init__.py") ""
        New-TextFile (Join-Path $root "config\settings.py") @"
from os import getenv, path
from pathlib import Path

import dj_database_url
import dotenv

BASE_DIR = Path(__file__).resolve().parent.parent
dotenv_file = BASE_DIR / ".env.local"

if path.isfile(dotenv_file):
    dotenv.load_dotenv(dotenv_file)

PROJECT_NAME = "$Name"
DEVELOPMENT_MODE = getenv("DEVELOPMENT_MODE", "False") == "True"

SECRET_KEY = getenv("DJANGO_SECRET_KEY", "dev-$projectKey-secret")
DEBUG = DEVELOPMENT_MODE
ALLOWED_HOSTS = getenv("DJANGO_ALLOWED_HOSTS", "127.0.0.1,localhost").split(",")

INSTALLED_APPS = [
    "django.contrib.auth",
    "django.contrib.contenttypes",
    "django.contrib.sessions",
    "django.contrib.staticfiles",
    "rest_framework",
    "corsheaders",
    "$domainApp",
]

MIDDLEWARE = [
    "django.middleware.security.SecurityMiddleware",
    "corsheaders.middleware.CorsMiddleware",
    "django.contrib.sessions.middleware.SessionMiddleware",
    "django.middleware.common.CommonMiddleware",
]

ROOT_URLCONF = "config.urls"
WSGI_APPLICATION = "config.wsgi.application"
ASGI_APPLICATION = "config.asgi.application"

if getenv("DATABASE_URL"):
    DATABASES = {"default": dj_database_url.parse(getenv("DATABASE_URL"))}
else:
    DATABASES = {
        "default": {
            "ENGINE": getenv("DB_ENGINE", "django.db.backends.postgresql"),
            "NAME": getenv("POSTGRES_DB", "$projectKey"),
            "USER": getenv("POSTGRES_USER", "${projectKey}_user"),
            "PASSWORD": getenv("POSTGRES_PASSWORD", "change-me-$projectKey"),
            "HOST": getenv("POSTGRES_HOST", "localhost"),
            "PORT": getenv("POSTGRES_PORT", "5432"),
        }
    }

REST_FRAMEWORK = {
    "DEFAULT_AUTHENTICATION_CLASSES": [],
    "DEFAULT_PERMISSION_CLASSES": ["rest_framework.permissions.AllowAny"],
}

CORS_ALLOWED_ORIGINS = getenv("CORS_ALLOWED_ORIGINS", "http://localhost:3000").split(",")
CORS_ALLOW_CREDENTIALS = True
STATIC_URL = "/static/"
DEFAULT_AUTO_FIELD = "django.db.models.BigAutoField"
LANGUAGE_CODE = "es-mx"
TIME_ZONE = "America/Mexico_City"
USE_I18N = True
USE_TZ = True
"@

        New-TextFile (Join-Path $root "config\urls.py") @"
from django.urls import include, path
from rest_framework.decorators import api_view
from rest_framework.response import Response


@api_view(["GET"])
def health(_request):
    return Response({"service": "$Name", "status": "ok"})


urlpatterns = [
    path("api/$projectKey/health/", health),
    path("api/$projectKey/", include("$domainApp.urls")),
]
"@

        New-TextFile (Join-Path $root "config\asgi.py") @"
import os

from django.core.asgi import get_asgi_application

os.environ.setdefault("DJANGO_SETTINGS_MODULE", "config.settings")

application = get_asgi_application()
"@

        New-TextFile (Join-Path $root "config\wsgi.py") @"
import os

from django.core.wsgi import get_wsgi_application

os.environ.setdefault("DJANGO_SETTINGS_MODULE", "config.settings")

application = get_wsgi_application()
"@

        New-TextFile (Join-Path $root "$domainApp\__init__.py") ""
        New-TextFile (Join-Path $root "$domainApp\migrations\__init__.py") ""
        New-TextFile (Join-Path $root "$domainApp\apps.py") @"
from django.apps import AppConfig


class DomainConfig(AppConfig):
    default_auto_field = "django.db.models.BigAutoField"
    name = "$domainApp"
"@
        New-TextFile (Join-Path $root "$domainApp\models.py") ""
        New-TextFile (Join-Path $root "$domainApp\admin.py") ""
        New-TextFile (Join-Path $root "$domainApp\tests.py") ""
        New-TextFile (Join-Path $root "$domainApp\views.py") @"
from rest_framework.decorators import api_view
from rest_framework.response import Response


@api_view(["GET"])
def index(_request):
    return Response({"service": "$Name", "status": "ready"})
"@
        New-TextFile (Join-Path $root "$domainApp\urls.py") @"
from django.urls import path

from .views import index

urlpatterns = [
    path("", index),
]
"@

        New-TextFile (Join-Path $root "README.md") @"
# API.PY.DJANGO.$Name

API Django de $Name.

## Variables

Copiar `.env.local.example` a `.env.local`.

## Desarrollo

```powershell
python -m venv venv
.\venv\Scripts\Activate.ps1
pip install -r requirements.txt
python manage.py check
python manage.py migrate
python manage.py runserver $apiPort
```

## Endpoints

```http
GET /api/$projectKey/health/
GET /api/$projectKey/
```

## Pendientes

- PENDIENTE_DE_DEFINIR: contratos API.
- PENDIENTE_DE_DEFINIR: permisos.
- PENDIENTE_DE_DEFINIR: modelo de datos.
"@

        if (-not $SkipDockerCompose) {
            New-TextFile (Join-Path $repoRoot "Docker.API.PY\docker-compose.$projectKey.api.yml") @"
services:
  api-multiproyecto:
    extends:
      file: docker-compose.yml
      service: api-multiproyecto
    environment:
      - API_PROJECTS=$projectKey
"@
            New-TextFile (Join-Path $repoRoot "Docker.DB.PG\docker-compose.$projectKey.db.yml") @"
include:
  - docker-compose.yml
"@
        }
    }
}

switch ($Type) {
    "web" { New-WebProject }
    "api" { New-ApiProject }
}

if ($script:createdProject) {
    Write-Host "Proyecto $Type creado para $Name. Revisa PENDIENTE_DE_DEFINIR antes de cerrar."
} else {
    Write-Host "No se crearon archivos para $Name."
}
