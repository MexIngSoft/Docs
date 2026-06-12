---
title: Repository Structure Standard
domain: standards
status: active
priority: p1
owner: Equipo documental
---

# Repository Structure Standard

## Objective

Separate business documentation from platform-support files so the repository
can stay understandable as projects, standards, and integrations grow.

## Canonical Domain Structure

| Folder | Responsibility |
|---|---|
| `00_audit` | Inventories, consistency checks, quality reports, and gaps. |
| `01_core_erp` | Reusable ERP architecture, APIs, data models, flows, and auth. |
| `02_projects` | Project-specific business, frontend, backend, decisions, and tasks. |
| `03_standards` | Documentation, Docker, frontend, operations, security, and testing standards. |
| `04_integrations` | External providers, API references, ETL, mappings, and operations. |

## Platform-Support Structure

| Folder | Responsibility |
|---|---|
| `.github` | Repository governance, PR templates, issue templates, and CI. |
| `_archive` | Historical sources and evidence retained for traceability. |
| `_meta` | Indexes, generated metadata, quality reports, and relation maps. |
| `agents` | Temporary execution instructions and execution reports. |
| `scripts` | Local and CI automation for documentation validation. |
| `templates` | Reusable document templates. |
| `pendientes` | Ideas or future work without a closed MVP. |

## Rule

Do not move large folders or historical sources without updating references and
recording the decision in the relevant report.
