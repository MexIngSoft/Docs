param([string]$Output='Docs/00_audit/documentation-health-report.md')
$agents = Get-ChildItem Docs\agents -Filter 'AGENTS-*.md' | Sort-Object Name
$empty = @(); $active=@()
foreach ($a in $agents) { $raw = Get-Content -Raw $a.FullName -ErrorAction SilentlyContinue; if ($null -eq $raw) { $raw='' }; if ($raw.Trim().Length -eq 0) { $empty += $a.Name } else { $active += $a.Name } }
$out = @('# Reporte de salud documental', '', ('Generado: ' + (Get-Date -Format s)), '', '## Agents activos', '')
$out += ($active | ForEach-Object { "- $_" })
$out += ''
$out += '## Agents vacios / sin instrucciones'
$out += ($empty | ForEach-Object { "- $_" })
$out += ''
$out += '## Contradicciones'
$out += '- Ver `Docs/_meta/contradiction-resolution-log.md`.'
$out += ''
$out += '## Pendientes de salud documental'
$out += '- Auditoria completa de owner/estado por documento queda como seguimiento no bloqueante.'
$out | Set-Content -Path $Output -Encoding UTF8
Write-Host "Reporte generado en $Output"
