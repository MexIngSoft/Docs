---
title: ETL title
domain: integration
status: template
priority: p2
owner: PENDIENTE_DE_DEFINIR
last_reviewed: YYYY-MM-DD
---

# Titulo

## Proposito

PENDIENTE_DE_DEFINIR

## Alcance

PENDIENTE_DE_DEFINIR

## Audiencia

PENDIENTE_DE_DEFINIR

## Owner

PENDIENTE_DE_DEFINIR

## Documentos relacionados

- PENDIENTE_DE_DEFINIR

## Contrato operativo

| Campo | Valor |
|---|---|
| Fuente | PENDIENTE_DE_DEFINIR |
| Destino | PENDIENTE_DE_DEFINIR |
| Dependencias | PENDIENTE_DE_DEFINIR |
| Horario/frecuencia | PENDIENTE_DE_DEFINIR |
| Timeout | PENDIENTE_DE_DEFINIR |
| Reintentos/backoff | PENDIENTE_DE_DEFINIR |
| Checkpoint | PENDIENTE_DE_DEFINIR |
| Idempotency key | PENDIENTE_DE_DEFINIR |
| Rollback/compensacion | PENDIENTE_DE_DEFINIR |
| Owner operativo | PENDIENTE_DE_DEFINIR |

## Datos y mapeo

- Identificador externo estable: PENDIENTE_DE_DEFINIR.
- Entidades y campos normalizados: PENDIENTE_DE_DEFINIR.
- Conservacion de dato original: PENDIENTE_DE_DEFINIR.
- Reglas de calidad y descarte: PENDIENTE_DE_DEFINIR.

## Fallos y recuperacion

- La primera ejecucion debe declarar si necesita espera posterior al arranque;
  no se fija una espera global de cinco minutos sin evidencia tecnica.
- Los errores de red, timeout y `5xx` usan la politica canonica de reintentos.
- Los errores de autenticacion o validacion se bloquean hasta corregir causa.
- Cuando exista checkpoint, se reanuda desde el ultimo avance confirmado.
- Sin checkpoint seguro, se reinicia solo si el proceso es idempotente.

## Observabilidad

Registrar inicio, fin, duracion, creados, actualizados, omitidos, fallidos,
reintentos, `request_id` y `correlation_id` cuando aplique.

## Validacion

Comandos, pruebas, volumen de muestra y criterios de aceptacion:

PENDIENTE_DE_DEFINIR

## Checklist de completitud

- [ ] Tiene proposito claro.
- [ ] Tiene owner.
- [ ] Tiene estado y prioridad.
- [ ] No duplica documento canonico.
- [ ] Enlaza documentos relacionados.
- [ ] Documenta fuente, destino, frecuencia y dependencias.
- [ ] Define timeout, reintentos, checkpoint e idempotencia.
- [ ] Define rollback o compensacion.
- [ ] Define observabilidad y validacion.
