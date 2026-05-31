# JobCron como centro administrativo operativo

## Objetivo

Definir JobCron como centro de gobierno operativo, financiero y comercial de los
proyectos, no solo como ejecutor de tareas programadas.

## Regla principal

JobCron administra reglas y visibilidad. No ejecuta procesamiento especializado
de productos como OCR, conversion documental, analisis legal o personalizacion
grafica.

## Responsabilidades

| Area | JobCron administra |
|---|---|
| Feature flags | Visibilidad por proyecto, pais, entorno y estado. |
| Jobs | Calendarios, reintentos, dependencias y auditoria. |
| Creditos | Reglas, saldos agregados, promociones y reportes. |
| Planes | Limites por plan, trial, freemium y enterprise. |
| Publicidad | Reglas de creditos recompensados y ubicaciones permitidas. |
| Auditoria | Cambios administrativos, aprobaciones y trazabilidad. |
| Operacion | Alertas, metricas, health checks y tableros. |

## Limites

| No pertenece a JobCron | Responsable |
|---|---|
| Procesar PDF/OCR/conversion | DocuCore / Document API |
| Interpretar expedientes juridicos | LexNova |
| Parsear CFDI | Fiscora |
| Renderizar personalizador grafico | Imagrafity |
| Catalogo tecnico de Tecno Telec | Tecno Telec + Core Catalog |

## MVP administrativo recomendado

1. FeatureAvailability.
2. Catalogo de reglas de creditos.
3. Planes y limites.
4. Auditoria de cambios.
5. Dashboard operativo.
6. Reportes de consumo por proyecto.

## Pendientes

- Auth real para administradores.
- Roles de aprobacion.
- Ledger de creditos.
- Reportes financieros.
- Integracion Billing.
