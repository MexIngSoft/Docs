docker network inspect jobcron_network *> $null
if ($LASTEXITCODE -ne 0) {
    docker network create jobcron_network | Out-Host
}

$root = Resolve-Path (Join-Path $PSScriptRoot "..\..\..\..\..\..")
$files = @(
    (Join-Path $root "Docker.DB.PG\docker-compose.master.db.yml"),
    (Join-Path $root "Docker.API.PY\docker-compose.master.api.yml"),
    (Join-Path $root "Docker.WEB.NJ\docker-compose.master.web.yml"),
    (Join-Path $root "Docker.SW.Nginx\docker-compose.master.nginx.yml")
)

docker compose -p comercial_platform -f $files[0] -f $files[1] -f $files[2] -f $files[3] up -d @args
