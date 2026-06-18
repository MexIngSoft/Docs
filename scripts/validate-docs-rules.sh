#!/usr/bin/env sh
set -eu

pattern='crejo|Gateway por proyecto|BFF por proyecto|Docker por proyecto|Auth por proyecto|SQLite|db\.sqlite3|API propia por proyecto|Crear API especializada si'

tmp_file="$(mktemp)"
trap 'rm -f "$tmp_file"' EXIT

if rg -n "$pattern" Docs \
  -g '!Docs/_archive/**' \
  -g '!Docs/agents/_archive/**' \
  -g '!Docs/agents/EXECUTION_REPORT.md' \
  -g '!Docs/agents/AGENTS-*.md' > "$tmp_file"; then
  if rg -v 'OBSOLETO|RECHAZADO|NO USAR|No se debe|No se permite|prohibid|Anti-patron|anti-vicios|cleanup|limpieza' "$tmp_file"; then
    echo "Found active forbidden documentation rules." >&2
    exit 1
  fi
fi

echo "Documentation rules validation passed."
