# Agent especializado Backend/API

## Alcance

Django APIs, modelos, serializers, views, permisos, migraciones, services y
commands.

## Lectura canonica

- `Docs/03_standards/operations/django-api-project-compliance.md`
- `Docs/03_standards/backend/reusable-api-consumption-standard.md`
- `Docs/01_core_erp/apis/api-decision-matrix.md`

## Reglas

- Revisar APIs reutilizables antes de crear API nueva.
- No duplicar responsabilidad entre APIs.
- Todo endpoint usado por UI debe documentarse en mapa de acciones.

## Validacion

- `python manage.py check`.
- `python -m compileall .`.
