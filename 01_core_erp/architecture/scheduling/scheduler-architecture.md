# Arquitectura de scheduler

## Objetivo

Definir como se ejecutan jobs programados, procesos por evento y tareas de mantenimiento.

## Tipos

| Tipo | Ejemplo | Ejecucion |
|---|---|---|
| Programado | Sync proveedor | Intervalo |
| Por evento | Procesar documento | Request/cola |
| Manual | Reparacion de encoding | Operador |
| Mantenimiento | Limpieza temporales | Cron |

## Reglas

- Cada job debe tener estado y logs.
- Cada job debe declarar si es idempotente.
- Jobs pesados no deben bloquear requests de usuario.
