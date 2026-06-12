---
title: Security Policy
domain: other
status: active
priority: p1
owner: Equipo documental
---

# Security Policy

## Supported Scope

This repository stores documentation, standards, templates, metadata, and
automation scripts for the MexIngSoft workspace.

## Reporting

Do not open public issues for secrets, credential exposure, or sensitive
customer data.

Report security concerns to the repository owner through the approved internal
channel.

## Secrets

Never commit:

- `.env` or `.env.local`;
- real API tokens;
- database passwords;
- private dumps;
- customer data;
- production credentials.

Use documented example files such as `.env.example` or `.env.local.example`
with non-real placeholder values.
