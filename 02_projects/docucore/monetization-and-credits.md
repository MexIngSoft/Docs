# Monetizacion y creditos DocuCore

## Objetivo

Definir el modelo base para cobrar o limitar operaciones documentales segun
recursos consumidos, sin reducir DocuCore a un pago fijo por documento.

## Unidad base propuesta

```text
1 Credito DocuCore (DC) = PENDIENTE_DE_DEFINIR MXN
```

El valor exacto requiere analisis financiero y no queda cerrado por este agent.

## Factores de costo

| Factor | Uso |
|---|---|
| MB/GB | Transferencia, almacenamiento temporal y memoria. |
| Paginas | Procesamiento PDF, OCR y preview. |
| OCR | CPU, motor externo o modelo especializado. |
| IA | Clasificacion, resumen, extraccion o segmentacion. |
| Conversion | Costo de librerias, CPU y artefactos. |
| Retencion | Tiempo de almacenamiento temporal o historico. |
| Prioridad | Jobs inmediatos o colas preferentes. |

## Tipos de creditos

| Tipo | Regla |
|---|---|
| Comprados | No deben expirar sin politica clara. |
| Promocionales | Pueden expirar y tener limites. |
| Recompensados | Se obtienen por acciones opcionales como anuncios o campañas. |
| Enterprise | Asignados por contrato, equipo o bolsa mensual. |

## Flujo recomendado

```text
Usuario sube archivos
-> DocuCore estima paginas, MB y complejidad
-> muestra costo estimado
-> usuario confirma
-> Gateway registra consumo
-> JobCron audita reglas, promociones y saldos
```

## Responsabilidades

| Sistema | Responsabilidad |
|---|---|
| DocuCore | Estimar costo operativo y ejecutar procesamiento. |
| Gateway DocuCore | Validar saldo, registrar consumo y normalizar errores. |
| JobCron | Administrar reglas, planes, promociones, auditoria y reportes. |
| ERP/Billing | Facturacion, pagos, clientes y cortes contables cuando aplique. |

## Reglas de producto

- Mostrar costo antes de procesar.
- No procesar si el saldo es insuficiente, salvo plan enterprise autorizado.
- Registrar estimado y consumo real cuando el backend lo permita.
- Distinguir creditos comprados, promocionales y recompensados.
- Documentar limites para archivos enormes, OCR avanzado e IA.
- Los creditos cobrados al usuario no cambian automaticamente por ejecutar en
  cliente, servidor o modo hibrido. El ahorro por procesamiento local se mide
  internamente y solo puede convertirse en beneficios mediante reglas
  comerciales explicitas.
- Si una tarea usa fallback de cliente a servidor, no debe cobrarse dos veces;
  el evento tecnico puede tener varios intentos, pero el cargo comercial debe
  mantenerse ligado a una sola solicitud confirmada.

## Relacion con costo interno

DocuCore separa tres conceptos:

| Concepto | Responsable | Regla |
|---|---|---|
| Creditos visibles | Producto/Billing/ERP | Define lo que paga el usuario por herramienta o plan. |
| Costo interno | Administrador de Ejecucion y Recursos | Mide CPU, memoria, storage, transferencia, fallback y ahorro. |
| Ahorro operativo | ERP | Sirve para decisiones comerciales, capacidad o infraestructura. |

La politica canonica de ejecucion vive en:

```text
execution-policy.md
```

## Pendientes

- Definir valor real de credito.
- Definir tabla de costos por herramienta.
- Definir expiracion y reglas fiscales.
- Implementar ledger de creditos.
- Integrar Billing/ERP.
