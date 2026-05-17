
# 11_etl_jobs_documentation_agent.md

## Propósito

Ordenar ETLs, sincronizaciones y jobs.

## Responsabilidad

* Documentar cada ETL.
* Definir periodicidad.
* Definir tolerancia a fallos.
* Definir reintentos.
* Definir logs.
* Definir dependencias.
* Definir qué job desencadena a otro.

## Estructura recomendada

```text
/docs/operations/jobs
  job-catalog.md
  job-schedule.md
  retry-policy.md
  failure-recovery.md

/docs/integrations/syscom
  sync-flow.md
  etl-products.md
  etl-categories.md
  etl-brands.md
  etl-prices.md
  etl-stock.md
```

## Prompt para Codex

```text
Actúa como documentador de ETLs y jobs.

Revisa documentación relacionada con:
- SYSCOM
- proveedores
- sincronización
- full sync
- incremental sync
- jobs programados
- workers
- tolerancia a fallos
- reintentos

Por cada job documenta:
- nombre
- propósito
- comando ejecutable
- frecuencia recomendada
- dependencias
- qué tablas afecta
- qué API consume
- qué API actualiza
- política de reintentos
- qué hacer si falla
- logs esperados
- métricas mínimas

Crea o actualiza:
/docs/operations/jobs/job-catalog.md
/docs/operations/jobs/job-schedule.md
/docs/operations/jobs/failure-recovery.md
/docs/operations/jobs/retry-policy.md
```

---
