param(
    [string[]]$Projects = @(
        "jobcron",
        "tecnotelec",
        "lexnova",
        "docucore",
        "fiscora",
        "imagrafity",
        "leadhunter",
        "refapart",
        "mexingsof"
    ),
    [int]$MaxProjects = 3,
    [int]$WaitSeconds = 30,
    [switch]$Execute
)

$ErrorActionPreference = "Stop"

$root = $PSScriptRoot
$orchestrator = Join-Path $root "Invoke-WorkspaceProjectDocker.ps1"

if (-not (Test-Path $orchestrator)) {
    throw "No existe el orquestador Docker: $orchestrator"
}

$allowed = @(
    "jobcron",
    "tecnotelec",
    "lexnova",
    "docucore",
    "fiscora",
    "imagrafity",
    "leadhunter",
    "refapart",
    "mexingsof"
)

$selected = $Projects |
    ForEach-Object { $_.ToLowerInvariant() } |
    Where-Object { $allowed -contains $_ } |
    Sort-Object { Get-Random } |
    Select-Object -First ([Math]::Min($MaxProjects, $Projects.Count))

if (-not $selected) {
    throw "No hay proyectos validos para probar."
}

foreach ($project in $selected) {
    $start = Join-Path $root "start-$project.ps1"
    $stop = Join-Path $root "stop-$project.ps1"

    if (-not (Test-Path $start)) {
        throw "Falta script start para ${project}: $start"
    }

    if (-not (Test-Path $stop)) {
        throw "Falta script stop para ${project}: $stop"
    }
}

Write-Host "Proyectos seleccionados: $($selected -join ', ')"

if (-not $Execute) {
    Write-Host "Modo validacion documental. Usa -Execute para activar start/health/stop."
    exit 0
}

docker network inspect jobcron_network *> $null
if ($LASTEXITCODE -ne 0) {
    docker network create jobcron_network | Out-Null
}

foreach ($project in $selected) {
    Write-Host "== ${project}: start =="
    & $orchestrator -Project $project -Action start

    if ($WaitSeconds -gt 0) {
        Start-Sleep -Seconds $WaitSeconds
    }

    Write-Host "== ${project}: health =="
    & $orchestrator -Project $project -Action health

    Write-Host "== ${project}: stop =="
    & $orchestrator -Project $project -Action stop
}

Write-Host "Validacion aleatoria completada."
