param([string]$Output='Docs/agents/_index.md')
$files = Get-ChildItem Docs\agents -Filter 'AGENTS-*.md' | Sort-Object Name
$out = @('# Indice de agents', '', 'Generado por `Docs/scripts/agents/build-agent-index.ps1`.', '', '| Agent | Estado | Tamano | Uso |', '|---|---|---:|---|')
foreach ($f in $files) {
  $raw = Get-Content -Raw $f.FullName -ErrorAction SilentlyContinue
  if ($null -eq $raw) { $raw = '' }
  $trim = $raw.Trim()
  $state = if ($trim.Length -eq 0) { 'SIN_INSTRUCCIONES' } elseif ($f.Name -eq 'AGENTS-030.md') { 'BACKLOG_ACTIVO' } elseif ($f.Name -eq 'AGENTS-031.md') { 'ORQUESTADOR_ACTIVO' } else { 'ACTIVO' }
  $use = if ($state -eq 'SIN_INSTRUCCIONES') { 'No ejecutar.' } elseif ($f.Name -eq 'AGENTS-030.md') { 'Backlog concentrado.' } elseif ($f.Name -eq 'AGENTS-031.md') { 'Orquestador.' } else { 'Ejecutar si no esta cerrado en reporte.' }
  $out += "| `$($f.Name)` | $state | $($trim.Length) | $use |"
}
$out += ''
$out += '## Rutas de apoyo'
$out += ''
$out += '- Entrada unica: `Docs/_meta/codex-entrypoint.md`'
$out += '- Clasificador: `Docs/agents/instructions/classifier.md`'
$out += '- Matriz: `Docs/agents/instructions/routing-matrix.md`'
$out += '- Especializados: `Docs/agents/specialized/`'
$out | Set-Content -Path $Output -Encoding UTF8
Write-Host "Indice generado en $Output"
