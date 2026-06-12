---
title: Documentation Naming Conventions
domain: standards
status: active
priority: p1
owner: Equipo documental
---

# Documentation Naming Conventions

## Files

- Use lowercase and hyphens for standards and operational documents.
- Use numeric prefixes only when there is a real reading or execution order.
- Use `README.md` as the entry point for a folder.
- Use `adr-0001-topic.md` for architecture decisions.
- Avoid dates in canonical filenames unless the file is a historical report.

## Folders

- Canonical domain folders remain:
  - `00_audit`
  - `01_core_erp`
  - `02_projects`
  - `03_standards`
  - `04_integrations`
- Platform-support folders remain:
  - `.github`
  - `_archive`
  - `_meta`
  - `agents`
  - `scripts`
  - `templates`
  - `pendientes`

## Generated Files

Generated files should live under `_meta/generated/` or a clearly named report
folder. Generated archives such as `docs.zip` must not be committed.
