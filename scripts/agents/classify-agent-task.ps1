param(
  [string]$Inbox = 'Docs/agents/instructions/inbox.md',
  [string]$Output = 'Docs/agents/instructions/classification-result.md'
)
$raw = if (Test-Path $Inbox) { Get-Content -Raw $Inbox } else { '' }
$rules = @{
  Auth='auth|login|registro|password|correo|sesion|permiso|rol'
  Gateway='gateway|cors|preflight|proxy|ruta'
  Database='postgres|sqlite|migracion|schema|tabla|base de datos'
  Frontend='web|next|ui|ux|pantalla|dashboard|login'
  Docker='docker|compose|contenedor|imagen'
  Nginx='nginx|proxy_pass|upstream'
  RefaPart='refapart|pieza|cotizacion|proveedor'
  JobCron='jobcron|erp|admin|usuarios|roles'
  MexIngSof='mexingsof'
  TecnoTelec='tecnotelec|tecno telec|cotizador|catalogo'
}
$matches = foreach ($k in $rules.Keys) { if ($raw -match $rules[$k]) { $k } }
if (-not $matches) { $matches = @('documentation-cleanup') }
@('# Resultado de clasificacion', '', ('Generado: ' + (Get-Date -Format s)), '', '## Dominios detectados', '', ($matches | ForEach-Object { "- $_" }), '', '## Nota', '', 'Clasificacion heuristica; confirmar con `routing-matrix.md` antes de implementar.') | Set-Content -Path $Output -Encoding UTF8
Write-Host "Clasificacion generada en $Output"
