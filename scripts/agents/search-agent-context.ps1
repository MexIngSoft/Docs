param(
  [string]$Root = (Resolve-Path (Join-Path $PSScriptRoot '..\..\..')).Path,
  [string]$Output = 'Docs/00_audit/agent-context-search-report.md'
)
$ErrorActionPreference = 'Continue'
Set-Location $Root
$sections = @(
  @{Title='Docs pendientes/bloqueos'; Cmd='rg -n "PENDIENTE_DE_DEFINIR|TODO|FIXME|BLOQUEADO" Docs'},
  @{Title='Fetch/direct API en webs'; Cmd='rg -n "api/gateway|localhost/api|fetch\(" Docker.WEB.NJ'},
  @{Title='SQLite prohibido'; Cmd='rg -n "sqlite|db\.sqlite3" Docker.API.PY Docker.DB.PG'},
  @{Title='Nginx rutas'; Cmd='rg -n "proxy_pass|upstream" Docker.SW.Nginx'},
  @{Title='Application code'; Cmd='rg -n "X-Application-Code|application_code" Docker.API.PY Docker.WEB.NJ'}
)
$out = @('# Reporte de busqueda de contexto agent', '', ('Generado: ' + (Get-Date -Format s)), '')
foreach ($s in $sections) {
  $out += "## $($s.Title)"
  $out += '```text'
  $result = Invoke-Expression $s.Cmd 2>&1 | Select-Object -First 200
  if ($result) { $out += $result } else { $out += 'Sin coincidencias.' }
  $out += '```'
  $out += ''
}
$out | Set-Content -Path $Output -Encoding UTF8
Write-Host "Reporte generado en $Output"
