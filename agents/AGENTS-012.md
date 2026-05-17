
# 12_events_scheduler_agent.md

## Propósito

Agregar documentación faltante sobre arquitectura de eventos y scheduler.

## Responsabilidad

* Definir eventos del sistema.
* Definir jobs programados.
* Definir colas.
* Definir reintentos.
* Definir dead letter queue futura si aplica.
* Definir comunicación síncrona y asíncrona.

## Estructura recomendada

```text
/docs/architecture/events
  event-driven-architecture.md
  event-catalog.md
  event-naming.md
  event-payloads.md

/docs/architecture/scheduling
  scheduler-architecture.md
  scheduler-rules.md
  job-dependencies.md
```

## Prompt para Codex

```text
Actúa como arquitecto de eventos y scheduler.

Revisa si existe documentación sobre:
- eventos de dominio
- jobs programados
- scheduler
- workers
- colas
- reintentos
- ejecución automática
- tolerancia a fallos

Si falta, crea documentación mínima para MVP.

Debe incluir:
1. Qué eventos existen.
2. Qué jobs existen.
3. Qué API emite eventos.
4. Qué API consume eventos.
5. Qué jobs son síncronos.
6. Qué jobs son asíncronos.
7. Qué pasa si falla un job.
8. Cómo se reintenta.
9. Cómo se evita doble ejecución.
10. Qué queda para futuro.

Crea:
/docs/architecture/events/event-catalog.md
/docs/architecture/scheduling/scheduler-architecture.md
/docs/architecture/scheduling/job-dependencies.md
```

---
