param(
    [string]$WorkspaceRoot = (Resolve-Path (Join-Path $PSScriptRoot "..\..")).Path
)

$webRoot = Join-Path $WorkspaceRoot "Docker.WEB.NJ"
$projects = @(
    "WEB.NJ.NEXT.RefaPart",
    "WEB.NJ.NEXT.MexIngSof",
    "WEB.NJ.NEXT.TecnoTelec",
    "WEB.NJ.NEXT.JobCron",
    "WEB.NJ.NEXT.LexNova",
    "WEB.NJ.NEXT.DocuCore",
    "WEB.NJ.NEXT.Fiscora",
    "WEB.NJ.NEXT.Imagrafity"
)

$routes = @(
    @{ Name = "login"; Canonical = "app\auth\login\page.tsx"; Alias = "app\login\page.tsx" },
    @{ Name = "register"; Canonical = "app\auth\register\page.tsx"; Alias = "app\register\page.tsx" },
    @{ Name = "forgot-password"; Canonical = "app\auth\forgot-password\page.tsx"; Alias = "app\forgot-password\page.tsx" },
    @{ Name = "resend"; Canonical = "app\auth\resend\page.tsx"; Alias = $null },
    @{ Name = "activation"; Canonical = "app\activation\[uid]\[token]\page.tsx"; Alias = "app\verify-email\page.tsx" },
    @{ Name = "reset"; Canonical = "app\auth\reset\[uid]\[token]\page.tsx"; Alias = "app\reset-password\page.tsx" },
    @{ Name = "google"; Canonical = "app\auth\google\page.tsx"; Alias = $null },
    @{ Name = "facebook"; Canonical = "app\auth\facebook\page.tsx"; Alias = $null },
    @{ Name = "auth-success"; Canonical = "app\auth\success\page.tsx"; Alias = $null },
    @{ Name = "auth-error"; Canonical = "app\auth\error\page.tsx"; Alias = $null },
    @{ Name = "logout"; Canonical = "app\logout\page.tsx"; Alias = $null },
    @{ Name = "403"; Canonical = "app\403\page.tsx"; Alias = $null }
)

foreach ($project in $projects) {
    $projectPath = Join-Path $webRoot $project
    if (-not (Test-Path $projectPath)) {
        continue
    }

    Write-Output ""
    Write-Output "## $project"

    $gatewayClient = Test-Path (Join-Path $projectPath "lib\api\gateway-client.ts")
    $authFeature = Test-Path (Join-Path $projectPath "features\auth")

    Write-Output ("Gateway client: " + ($(if ($gatewayClient) { "OK" } else { "MISSING" })))
    Write-Output ("Auth feature: " + ($(if ($authFeature) { "OK" } else { "MISSING" })))

    foreach ($route in $routes) {
        $canonical = Test-Path -LiteralPath (Join-Path $projectPath $route.Canonical)
        $alias = $false
        if ($route.Alias) {
            $alias = Test-Path -LiteralPath (Join-Path $projectPath $route.Alias)
        }

        $state = if ($canonical) {
            "CANONICAL"
        } elseif ($alias) {
            "ALIAS_ONLY"
        } else {
            "MISSING"
        }

        Write-Output ("{0}: {1}" -f $route.Name, $state)
    }
}
