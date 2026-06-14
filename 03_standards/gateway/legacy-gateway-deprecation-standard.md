---
title: Deprecacion de Gateways legacy
domain: standards
status: active
priority: p1
owner: Equipo de plataforma
last_reviewed: 2026-06-14
---

# Deprecacion de Gateways legacy

## Estados

```text
active -> deprecated -> disabled -> archived
```

- `active`: es la ruta principal.
- `deprecated`: existe fallback, pero el frontend usa el Gateway central.
- `disabled`: no arranca por defecto; existe rollback documentado.
- `archived`: no hay consumidores ni referencias operativas.

No se salta ningun estado. La transicion exige evidencia de frontend, Auth,
health, rutas de negocio y rollback.

La unica excepcion es un retiro final autorizado por el responsable de la
arquitectura cuando la capa legacy ya no forma parte del diseno vigente. Debe
quedar un registro fechado con consumidores revisados, configuracion retirada,
respaldo de trabajo sin commit y validaciones ejecutadas.
