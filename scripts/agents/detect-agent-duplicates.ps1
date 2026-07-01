param([string]$Output = 'Docs/00_audit/agent-duplication-report.md')
$files = Get-ChildItem Docs\agents -Filter 'AGENTS-*.md' | Sort-Object Name
$groups = $files | ForEach-Object { [pscustomobject]@{Name=$_.Name; Hash=(Get-FileHash $_.FullName).Hash; Length=$_.Length} } | Group-Object Hash
$out = @('# Reporte de duplicidad de agents', '', ('Generado: ' + (Get-Date -Format s)), '')
foreach ($g in $groups) {
  if ($g.Count -gt 1) {
    $out += "## Hash $($g.Name.Substring(0,12))"
    foreach ($item in $g.Group) { $out += "- $($item.Name) ($($item.Length) bytes)" }
    $out += ''
  }
}
if ($out.Count -le 4) { $out += 'No se detectaron duplicados por hash exacto.' }
$out | Set-Content -Path $Output -Encoding UTF8
Write-Host "Reporte generado en $Output"
