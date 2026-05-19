[CmdletBinding(SupportsShouldProcess = $true)]
param(
    [ValidateSet("lexnova", "jobcron", "tecnotelec", "docucore", "fiscora")]
    [string]$Project = "lexnova",
    [string]$Url,
    [switch]$Repair,
    [switch]$Docker,
    [switch]$Local
)

$ErrorActionPreference = "Stop"

$projectMap = @{
    jobcron = @{
        Port = 3000
        LocalPath = "Docker.WEB.NJ\WEB.NJ.NEXT.JobCron"
        ContainerPath = "/usr/src/web/jobcron"
    }
    tecnotelec = @{
        Port = 3001
        LocalPath = "Docker.WEB.NJ\WEB.NJ.NEXT.TecnoTelec"
        ContainerPath = "/usr/src/web/tecnotelec"
    }
    lexnova = @{
        Port = 3002
        LocalPath = "Docker.WEB.NJ\WEB.NJ.NEXT.LexNova"
        ContainerPath = "/usr/src/web/lexnova"
    }
    docucore = @{
        Port = 3004
        LocalPath = "Docker.WEB.NJ\WEB.NJ.NEXT.DocuCore"
        ContainerPath = "/usr/src/web/docucore"
    }
    fiscora = @{
        Port = 3005
        LocalPath = "Docker.WEB.NJ\WEB.NJ.NEXT.Fiscora"
        ContainerPath = "/usr/src/web/fiscora"
    }
}

if (-not $Docker -and -not $Local) {
    $Docker = $true
}

$config = $projectMap[$Project]
if (-not $Url) {
    $Url = "http://localhost:$($config.Port)"
}

function Invoke-Http {
    param([string]$TargetUrl)
    try {
        return Invoke-WebRequest -Uri $TargetUrl -UseBasicParsing -TimeoutSec 30
    } catch {
        return $_.Exception.Response
    }
}

function Get-StatusCode {
    param($Response)
    if (-not $Response) {
        return $null
    }
    if ($Response.StatusCode -is [int]) {
        return $Response.StatusCode
    }
    return [int]$Response.StatusCode
}

function Get-PageCssLinks {
    param([string]$Html)
    $matches = [regex]::Matches($Html, 'href="([^"]*\/_next\/static\/[^"]+\.css[^"]*)"')
    foreach ($match in $matches) {
        $match.Groups[1].Value -replace "&amp;", "&"
    }
}

function Resolve-AssetUrl {
    param([string]$BaseUrl, [string]$AssetPath)
    if ($AssetPath.StartsWith("http://") -or $AssetPath.StartsWith("https://")) {
        return $AssetPath
    }
    $base = [Uri]$BaseUrl
    return [Uri]::new($base, $AssetPath).AbsoluteUri
}

function Test-NextCss {
    param([string]$BaseUrl)

    $page = Invoke-Http -TargetUrl $BaseUrl
    $pageStatus = Get-StatusCode -Response $page
    if ($pageStatus -ne 200) {
        return [PSCustomObject]@{
            Ok = $false
            Reason = "La pagina respondio $pageStatus"
            CssLinks = @()
        }
    }

    $cssLinks = @(Get-PageCssLinks -Html $page.Content)
    if ($cssLinks.Count -eq 0) {
        return [PSCustomObject]@{
            Ok = $false
            Reason = "La pagina no incluye CSS de Next"
            CssLinks = @()
        }
    }

    $failed = @()
    foreach ($cssLink in $cssLinks) {
        $assetUrl = [uri]::UnescapeDataString((Resolve-AssetUrl -BaseUrl $BaseUrl -AssetPath $cssLink))
        $asset = Invoke-Http -TargetUrl $assetUrl
        $assetStatus = Get-StatusCode -Response $asset
        if ($assetStatus -ne 200 -or [string]::IsNullOrWhiteSpace($asset.Content)) {
            $failed += "$assetUrl -> $assetStatus"
        }
    }

    if ($failed.Count -gt 0) {
        return [PSCustomObject]@{
            Ok = $false
            Reason = "CSS no disponible: $($failed -join '; ')"
            CssLinks = $cssLinks
        }
    }

    return [PSCustomObject]@{
        Ok = $true
        Reason = "CSS disponible"
        CssLinks = $cssLinks
    }
}

function Repair-DockerCss {
    param([string]$ContainerPath)

    if ($PSCmdlet.ShouldProcess("web-frontend-node:$ContainerPath/.next", "Stop container, remove Next cache and start container")) {
        docker stop web-frontend-node | Out-Null
        docker run --rm --volumes-from web-frontend-node crejo-web-frontend-node sh -lc "find '$ContainerPath/.next' -mindepth 1 -maxdepth 1 -exec rm -rf {} +"
        docker start web-frontend-node | Out-Null
    }
}

function Repair-LocalCss {
    param([string]$LocalPath, [int]$Port)

    $nextPath = Join-Path $LocalPath ".next"
    if (Test-Path $nextPath) {
        if ($PSCmdlet.ShouldProcess($nextPath, "Remove local Next cache")) {
            Remove-Item -LiteralPath $nextPath -Recurse -Force
        }
    }

    $connections = Get-NetTCPConnection -LocalPort $Port -State Listen -ErrorAction SilentlyContinue
    $processIds = @($connections | Select-Object -ExpandProperty OwningProcess -Unique)
    foreach ($processId in $processIds) {
        if ($PSCmdlet.ShouldProcess("PID $processId on port $Port", "Stop local dev server")) {
            Stop-Process -Id $processId -Force
        }
    }
}

$result = Test-NextCss -BaseUrl $Url
$result | Format-List

if ($result.Ok) {
    exit 0
}

if (-not $Repair) {
    Write-Host "Diagnostico solamente. Ejecuta con -Repair para limpiar cache y reiniciar."
    exit 2
}

if ($Docker) {
    Repair-DockerCss -ContainerPath $config.ContainerPath
}

if ($Local) {
    Repair-LocalCss -LocalPath $config.LocalPath -Port $config.Port
}

Start-Sleep -Seconds 45
$afterRepair = Test-NextCss -BaseUrl $Url
$afterRepair | Format-List

if (-not $afterRepair.Ok) {
    exit 3
}
