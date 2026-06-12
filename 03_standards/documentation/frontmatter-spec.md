---
title: Front Matter Specification
domain: standards
status: active
priority: p1
owner: Equipo documental
---

# Front Matter Specification

## Objective

Define the minimum metadata for new documentation so indexes and quality checks
can be generated instead of maintained only by hand.

## Required Fields

```yaml
---
title: Document title
domain: standards
status: active
priority: p1
owner: Equipo documental
---
```

## Allowed Domains

```text
audit
core
business
standards
integration
meta
agents
templates
future
other
```

## Allowed Statuses

```text
active
future_or_pending
archive_reference
template
deprecated
unknown
```

## Optional Fields

```yaml
subdomain: operations
last_reviewed: 2026-06-12
source_of_truth: true
related_paths:
  - Docs/03_standards/documentation/naming-conventions.md
tags:
  - documentation
```

## Rule

Existing documents can be migrated gradually. New documents should include the
required front matter unless they are generated reports or temporary agent
instructions.
