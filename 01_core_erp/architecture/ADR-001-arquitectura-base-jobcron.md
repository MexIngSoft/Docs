# ADR-001 - Arquitectura base JobCron

## Estado

Aceptado.

## Contexto

El ecosistema JobCron administra multiples webs, APIs, integraciones, modulos comerciales, modulos documentales y proyectos especializados.

Para evitar duplicidad, contradicciones y costos innecesarios, se adopta una arquitectura centralizada por objetivo.

## Decision

Se establece como arquitectura oficial:

```text
Cliente
-> Web/App
-> Gateway General
-> APIs de Dominio
-> PostgreSQL
```

## Decisiones Obligatorias

1. Existe un solo Docker.DB.
2. Existe un solo Docker.API.PY.
3. Existe un solo Docker.WEB.NJ.
4. Existe un solo Gateway General.
5. Existe un solo Auth compartido.
6. PostgreSQL es la base operativa obligatoria.
7. Las APIs se organizan por responsabilidad.
8. Las webs se organizan por proyecto.
9. Los compose por proyecto solo seleccionan servicios existentes.
10. Ninguna web consume integraciones externas directamente.

## Rechazado

- Docker por proyecto como infraestructura separada.
- Gateway por proyecto.
- Adaptador de frontend dedicado por proyecto.
- Auth por proyecto.
- Bases temporales embebidas para runtime.
- APIs duplicadas.
- Integraciones externas consumidas desde frontend.

## Consecuencias

Todo documento, agent o implementacion futura debe seguir esta decision.

Si existe contradiccion, este ADR prevalece junto con AGENTS-000 y la documentacion canonica mas actual.

Si una funcionalidad requiere excepcion, debe crearse un nuevo ADR antes de implementarla.
