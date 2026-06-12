---
title: Contributing
domain: other
status: active
priority: p1
owner: Equipo documental
---

# Contributing

## Before Editing

Read the entry points first:

```text
Docs/README.md
Docs/_meta/master-index.md
Docs/_meta/active-work-index.md
```

Then read only the canonical documents related to the affected domain.

## Rules

- Do not duplicate canonical content.
- Do not mix Core ERP rules with project-specific rules.
- Do not commit secrets, local env files, dumps, or generated archives.
- Move historical sources to `_archive` instead of deleting them.
- Use `PENDIENTE_DE_DEFINIR` when real information is missing.
- Update indexes or document why they were not changed.

## Validation

For documentation-only changes:

```powershell
python scripts/validate_frontmatter.py
python scripts/build_master_index.py
git diff --check
```

For agents, also update:

```text
Docs/agents/EXECUTION_REPORT.md
```

## Commits

Use short English messages and keep responsibilities separate by repository.

Examples:

```text
docs: add documentation governance
chore: add docs validation workflow
fix: correct project index metadata
```
