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
  if rg -v 'OBSOLETO|RECHAZADO|NO USAR|No crear|No usar|No se crea|No se debe|No se permite|no crear|no usar|prohibid|Anti-patron|anti-patron|anti-vicios|cleanup|limpieza|codex-anti-patterns|codex-anti-vices-checklist|AGENT_GLOBAL_RULES|AGENTS.md|context-packs|api-gateway-standard|reusable-api-contracts|documentation-cleanup-standard|docker-compose-project-standard|docker.md|shared-docker-frontend-architecture|contradiction-resolution-report|validate-docs-rules.sh' "$tmp_file"; then
    echo "Found active forbidden documentation rules." >&2
    exit 1
  fi
fi

echo "Documentation rules validation passed."
