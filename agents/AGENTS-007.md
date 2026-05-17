
# 07_business_documentation_agent.md

## Propósito

Crear y ordenar la documentación única de cada empresa.

## Empresas iniciales

```text
Tecno Telec
LexNova
SAT Portal
JobCron
```

## Estructura por empresa

```text
/docs/business/{empresa}
  /identity
  /business-model
  /rules
  /workflows
  /frontend
  /integrations
  /operations
  /roadmap
  README.md
```

## Responsabilidad

* Crear documentación específica por empresa.
* Evitar repetir Core.
* Referenciar los módulos compartidos.
* Documentar reglas únicas.

## Ejemplo Tecno Telec

Debe documentar:

* venta de soluciones tecnológicas,
* cotizaciones,
* catálogo público,
* proveedores,
* SYSCOM,
* marketplace,
* proyectos de redes, cámaras, solar, WiFi,
* flujo de cliente,
* reglas comerciales.

## Ejemplo LexNova

Debe documentar:

* expedientes,
* causas penales,
* amparos,
* apelaciones,
* documentos jurídicos,
* evidencias,
* análisis legal,
* IA jurídica.

## Ejemplo SAT Portal

Debe documentar:

* descarga CFDI,
* consulta de facturas,
* créditos,
* pagos,
* monetización,
* usuarios fiscales,
* uso de APIs SAT si aplica.

## Ejemplo JobCron

Debe documentar:

* ejecución de jobs,
* workers,
* programación,
* monitoreo,
* reintentos,
* fallos,
* dashboard administrativo.

## Prompt para Codex

```text
Actúa como documentador por empresa.

Crea o corrige la documentación de cada empresa/proyecto en /docs/business.

Empresas iniciales:
- tecnotelec
- lexnova
- satportal
- jobcron

Para cada empresa documenta:
1. Propósito.
2. Modelo de negocio.
3. Módulos Core que utiliza.
4. Módulos Shared que utiliza.
5. Reglas únicas.
6. Flujos únicos.
7. Frontend propio.
8. Integraciones propias.
9. Roadmap propio.
10. Qué NO debe repetirse porque ya vive en Core.

No copies documentación del Core.
Solo enlaza al documento Core correspondiente.
```

---
