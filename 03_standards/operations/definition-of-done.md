# Definition Of Done Del Ecosistema JobCron

Un cambio solo puede considerarse terminado si cumple estos criterios.

## Documentacion

- Documentacion actualizada.
- Indices actualizados si cambia superficie publica.
- ADR actualizado si cambia arquitectura.
- `Docs/agents/EXECUTION_REPORT.md` actualizado cuando proviene de un agent.

## Arquitectura

- No contradice `AGENTS-000`.
- No contradice `ADR-001`.
- No crea entrada publica dedicada por proyecto.
- No crea infraestructura Docker dedicada por proyecto.
- No crea Auth dedicado por proyecto.
- No consume integraciones externas desde frontend.

## Backend

- Usa PostgreSQL para runtime operativo.
- Tiene migraciones cuando cambia modelo.
- Tiene healthcheck o endpoint equivalente.
- Tiene permisos cuando expone datos protegidos.
- Usa respuestas y errores consistentes.
- Ejecuta tests o `manage.py check` disponible.

## Frontend

- Consume Gateway General.
- No consume PostgreSQL.
- No consume APIs core directamente si existe ruta Gateway.
- No conserva mocks cuando existe API real.
- Compila con `npm run build`.

## Docker

- Usa Docker por objetivo.
- Usa red compartida `jobcron_network`.
- No crea infraestructura paralela.
- `docker compose config` valida.

## Validacion

Debe ejecutarse al menos lo aplicable:

- `docker compose config`
- migraciones
- tests disponibles
- build frontend
- healthchecks
- prueba HTTP del flujo afectado

## Bloqueo

No cerrar si hay contradicciones activas, documentacion pendiente, codigo sin
validar, mocks falsos, entrada publica dedicada por proyecto o infraestructura
Docker dedicada por proyecto.
