---
title: Documentation Cleanup Standard
domain: standards
status: active
priority: p1
owner: Equipo documental
---

# Documentation Cleanup Standard

## Objective

Prevent obsolete architecture, Docker, frontend, API, database or agent rules
from remaining active after a standard changes.

## Mandatory Rule

When a canonical decision changes, cleanup is part of the implementation. The
change is not complete until active documentation, templates, scripts and
indexes stop recommending the previous pattern.

## Cleanup Scope

Review at least these locations when a standard changes:

- `Docs/README.md`
- `Docs/_meta/active-work-index.md`
- `Docs/_meta/navigation-map.md`
- `Docs/_meta/master-index.md`
- `Docs/03_standards/`
- affected project documents in `Docs/02_projects/<project>/`
- scripts or templates that generate new projects or documentation
- `Docs/agents/EXECUTION_REPORT.md` for current execution notes

Historical notes in `Docs/_archive` are not rewritten unless they are being
used as active source material. If historical material conflicts with the
current rule, keep it archived and ensure active documents point to the current
standard.

## Required Checks

For every cleanup, search for obsolete wording and record the result. Keep the
term list in the execution report for the current cleanup so this standard does
not preserve deprecated phrases as active guidance. Example scopes:

```powershell
rg -n "crejo|jobcron_network" Docs Docker.DB.PG Docker.API.PY Docker.WEB.NJ Docker.SW.Nginx
```

The gateway cleanup search should return no active recommendation of deprecated
per-project gateway patterns. The Docker network search must not return active
instructions that use `crejo` as an accepted network.

The only official Docker network is:

```text
jobcron_network
```

`crejo` may appear only as `OBSOLETO / RECHAZADO / NO USAR`, historical content
in `Docs/_archive`, or in `Docs/agents/EXECUTION_REPORT.md` explaining that it
was removed.

## Agent Cleanup

Files matching `Docs/agents/AGENTS-*.md` are never deleted, moved, renamed or
replaced. When an agent is completed, cleanup means:

1. record the execution in `Docs/agents/EXECUTION_REPORT.md`;
2. empty the completed agent file;
3. keep the original placeholder in `Docs/agents`.

Blocked, partial or pending agents must keep their content until they are
resolved or explicitly superseded by canonical documentation.

## Contradictions

If an agent, archived note or older standard contradicts current canonical
documentation:

1. follow the newest canonical active document;
2. document the contradiction in the execution report or decision log;
3. update active standards so the old instruction cannot be selected again;
4. use `PENDIENTE_DE_DEFINIR` only for real missing information, not for rules
   already decided.

## Completion Criteria

A cleanup is complete when:

- active docs no longer recommend the deprecated pattern;
- generated templates or scripts no longer create the deprecated wording;
- indexes reference the new or updated standard;
- validation commands and searches are recorded;
- completed agent placeholders are empty and preserved.
