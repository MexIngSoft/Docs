# INSTRUCCIÓN PARA CODEX — OPTIMIZAR AGENTS-008

Trabaja únicamente en la rama `dev`.

No ejecutes todos los agents.

No implementes código.

No modifiques otros archivos `AGENTS-*.md`.

Optimiza únicamente:

`Docs/agents/AGENTS-008.md`

---

# Resumen del agente actual

`AGENTS-008.md` define la arquitectura correcta entre:

* SatWi
* Network Control / Network Controller
* JobCron ERP
* Universal POS

La decisión principal es:

```txt
SatWi = empresa ISP
Network Control = producto técnico de operación ISP
JobCron = ERP administrativo
Universal POS = punto de venta independiente
```

SatWi no debe ser tratado como software ni como dueño técnico de la red.

Network Control debe ser producto independiente y comercializable para ISP, WISP, FTTH, hoteles, restaurantes, cafeterías, plazas comerciales, escuelas y empresas.

JobCron debe administrar el negocio, no la red.

Universal POS debe operar como producto independiente, pero puede integrarse opcionalmente con Network Control para generar vouchers, QR, promociones e internet por compra.

---

# AGENTS-008 — Network Control, SatWi, JobCron y POS

## Objetivo

Optimizar la documentación arquitectónica que separa SatWi, Network Control, JobCron ERP y Universal POS, conservando la decisión actual: Network Control es el producto técnico de red; SatWi solo es empresa ISP consumidora.

## Alcance

Puede tocar:

* `Docs/agents/AGENTS-008.md`

Debe revisar:

* separación de responsabilidades entre SatWi, Network Control, JobCron y Universal POS;
* ubicación documental correcta en `02_projects`;
* frontera Gateway/API;
* APIs existentes y pendientes;
* reglas para no duplicar funciones ERP, POS o red.

Debe dejar:

* instrucción clara para documentar la arquitectura;
* responsabilidades por producto;
* límites de integración;
* documentos canónicos sugeridos;
* validaciones;
* actualización de `Docs/agents/EXECUTION_REPORT.md`.

## Lectura mínima obligatoria

* `Docs/README.md`
* `Docs/_meta/active-work-index.md`
* `Docs/agents/AGENT_GLOBAL_RULES.md`
* `Docs/agents/EXECUTION_REPORT.md`
* `Docs/03_standards/architecture/api-gateway-standard.md`
* `Docs/03_standards/product/product-strategy.md`
* `Docs/03_standards/product/module-catalog.md`
* `Docs/01_core_erp/apis/00_api_index.md`
* `Docs/agents/AGENTS-008.md`

## Fuera de alcance

* No ejecutar otros agents.
* No implementar software.
* No crear APIs nuevas sin contrato.
* No crear schemas, modelos ni migraciones sin decisión documentada.
* No modificar `main` ni `pro`.
* No leer todo `Docs`.
* No tocar proyectos no relacionados.
* No mover funciones técnicas de red a SatWi.
* No mover funciones administrativas ERP a Network Control.
* No meter POS dentro de Network Control.
* No convertir SatWi en plataforma técnica.
* No usar `_archive/` como fuente vigente salvo trazabilidad.

## Clasificación documental obligatoria

Clasificar así:

```txt
SatWi = Independent Business / ISP Operator
Network Control = Independent Product / Network Operations Platform
JobCron = Core ERP / Administrative ERP
Universal POS = Independent Product / POS
```

Ubicación documental esperada:

```txt
Docs/02_projects/satwi/
Docs/02_projects/network-control/
Docs/02_projects/jobcron/
Docs/02_projects/pos/
```

Network Control debe documentarse como producto vendible a terceros, no como módulo interno de SatWi.

SatWi debe documentarse como cliente/operador que consume Network Control, JobCron y, si aplica, Universal POS.

## Tareas

1. Reescribir `AGENTS-008.md` preservando toda la decisión actual:

   * SatWi es empresa ISP;
   * Network Control es producto técnico;
   * JobCron es ERP administrativo;
   * Universal POS es punto de venta independiente;
   * POS y Network Control se integran opcionalmente, pero ninguno depende del otro.

2. Documentar responsabilidades definitivas de Network Control:

   * GIS;
   * mapeo;
   * topología;
   * cobertura;
   * torres;
   * antenas;
   * radios;
   * MikroTik;
   * switches;
   * OLT;
   * ONU;
   * ONT;
   * NAP;
   * splitters;
   * fibra;
   * backhaul;
   * FTTH;
   * GPON;
   * hotspot;
   * PPPoE;
   * Radius;
   * DHCP;
   * vouchers;
   * portal cautivo;
   * control de ancho de banda;
   * sesiones activas;
   * consumo;
   * cortes técnicos;
   * reactivaciones técnicas;
   * monitoreo;
   * planeación inalámbrica;
   * planeación FTTH;
   * expansión;
   * ROI estimado;
   * costos estimados;
   * captura GPS;
   * encuestas;
   * prospección;
   * detección de demanda;
   * multi tenant / multi ISP.

3. Documentar responsabilidades definitivas de SatWi:

   * marca comercial ISP;
   * venta de internet;
   * atención a clientes;
   * estrategia comercial;
   * instalación de servicios;
   * operación como ISP;
   * cobranza comercial si se decide en el negocio;
   * consumo de Network Control, JobCron y POS.

SatWi no debe contener:

* configuración de routers;
* MikroTik;
* PPPoE;
* Hotspot;
* Radius;
* portal cautivo;
* diseño técnico de red;
* mapeo técnico;
* inventario ERP;
* facturación ERP;
* lógica de POS.

4. Documentar responsabilidades definitivas de JobCron:

   * clientes;
   * prospectos;
   * contratos;
   * historial;
   * inventario administrativo;
   * compras;
   * ventas;
   * cobranza;
   * mensualidades;
   * suspensiones comerciales;
   * técnicos;
   * órdenes de trabajo;
   * instalaciones;
   * mantenimiento;
   * evidencias;
   * facturación;
   * reportes.

JobCron puede solicitar a Network Control:

```txt
activar servicio
suspender servicio
reactivar servicio
consultar consumo
consultar estado
```

JobCron no debe administrar configuración técnica de red.

5. Documentar responsabilidades definitivas de Universal POS:

   * ventas;
   * productos;
   * recargas;
   * pagos;
   * cortes de caja;
   * tickets;
   * promociones;
   * inventario local de tienda;
   * facturación si aplica por estándar fiscal.

Universal POS no debe vivir dentro de Network Control.

Universal POS puede integrarse con Network Control para este flujo:

```txt
Cliente compra en tienda/restaurante
↓
POS valida promoción o compra mínima
↓
POS solicita voucher al Gateway
↓
Gateway enruta a Network Control
↓
Network Control genera voucher/QR
↓
POS imprime ticket
↓
Cliente usa portal cautivo
```

6. Documentar integración obligatoria mediante Gateway:

```txt
Frontend SatWi / Network Control / JobCron / POS
↓
API.PY.DJANGO.Gateway
↓
API especializada si aplica
↓
Core ERP / Shared Modules / Integraciones
```

Prohibido:

```txt
Frontend -> API interna directa
Frontend -> base de datos
POS -> Network Control directo sin Gateway
JobCron -> base de datos de Network Control
Network Control -> base de datos de JobCron
```

7. Definir APIs conceptuales sin marcarlas como activas si no existe contrato, repo, migraciones, seguridad, compose y pruebas:

Network Control API:

```txt
GET /network/sites
POST /network/sites
GET /network/towers
POST /network/towers
GET /network/links
POST /network/links
GET /network/ftth/routes
POST /network/ftth/routes
GET /network/nap
POST /network/nap
GET /network/splitters
POST /network/splitters
GET /network/customers/map
GET /network/coverage
GET /network/topology
POST /network/vouchers
GET /network/vouchers/{id}
POST /network/hotspot/sessions
GET /network/hotspot/sessions
POST /network/services/activate
POST /network/services/suspend
POST /network/services/reactivate
GET /network/services/{id}/status
GET /network/services/{id}/usage
```

Integración POS → Network Control vía Gateway:

```txt
POST /pos/network-voucher-request
POST /network/vouchers
GET /network/vouchers/{id}/qr
```

Integración JobCron → Network Control vía Gateway:

```txt
POST /jobcron/network/service-activation
POST /jobcron/network/service-suspension
POST /jobcron/network/service-reactivation
GET /jobcron/network/service-status
GET /jobcron/network/service-usage
```

8. Definir tablas conceptuales de Network Control sin crear migraciones:

```txt
Tenants
NetworkSites
Towers
Radios
Antennas
Routers
Switches
Olts
Onus
Onts
Naps
Splitters
FiberRoutes
FiberSegments
BackhaulLinks
WirelessLinks
CoverageZones
TopologyNodes
TopologyEdges
NetworkCustomers
CustomerServiceLinks
HotspotProfiles
HotspotSessions
PppoeAccounts
RadiusProfiles
BandwidthProfiles
CaptivePortals
PortalCampaigns
Vouchers
VoucherBatches
VoucherRedemptions
ServiceActivations
ServiceSuspensions
NetworkIncidents
NetworkMaintenanceOrders
NetworkMonitoringSnapshots
GpsSurveys
DemandClusters
ExpansionPlans
RoiEstimates
AuditLogs
```

9. Definir documentación canónica futura para Network Control:

```txt
Docs/02_projects/network-control/README.md
Docs/02_projects/network-control/product-vision.md
Docs/02_projects/network-control/architecture.md
Docs/02_projects/network-control/api-contracts.md
Docs/02_projects/network-control/database.md
Docs/02_projects/network-control/gis-and-mapping.md
Docs/02_projects/network-control/topology.md
Docs/02_projects/network-control/ftth-gpon.md
Docs/02_projects/network-control/wireless-network.md
Docs/02_projects/network-control/hotspot-pppoe-radius.md
Docs/02_projects/network-control/captive-portal.md
Docs/02_projects/network-control/vouchers.md
Docs/02_projects/network-control/multi-tenant.md
Docs/02_projects/network-control/monitoring.md
Docs/02_projects/network-control/network-planning.md
Docs/02_projects/network-control/integrations.md
Docs/02_projects/network-control/security.md
Docs/02_projects/network-control/roadmap.md
```

10. Definir documentación canónica futura para SatWi:

```txt
Docs/02_projects/satwi/README.md
Docs/02_projects/satwi/business-model.md
Docs/02_projects/satwi/commercial-strategy.md
Docs/02_projects/satwi/service-offering.md
Docs/02_projects/satwi/customer-operations.md
Docs/02_projects/satwi/technology-consumption.md
Docs/02_projects/satwi/roadmap.md
```

11. Definir documentación de integración:

```txt
Docs/02_projects/network-control/integrations/jobcron.md
Docs/02_projects/network-control/integrations/universal-pos.md
Docs/02_projects/pos/integrations/network-control-vouchers.md
Docs/02_projects/jobcron/integrations/network-control-services.md
```

12. Registrar en `Docs/agents/EXECUTION_REPORT.md`:

* agent revisado;
* documentos leídos;
* Context Pack usado;
* cambios realizados;
* validaciones;
* pendientes reales;
* bloqueos;
* decisiones documentales;
* APIs reutilizadas;
* APIs no creadas y motivo.

## Validaciones

Ejecutar solo validaciones documentales aplicables:

* validar que solo se modificó `Docs/agents/AGENTS-008.md`;
* validar que no se modificaron otros agents;
* validar que no se creó API nueva;
* validar que no se crearon migraciones;
* validar que no se movió SatWi a producto técnico;
* validar que Network Control conserva mapeo, GIS, red, FTTH, GPON, Hotspot, PPPoE, Radius y portal cautivo;
* validar que JobCron conserva ERP administrativo;
* validar que POS conserva punto de venta independiente;
* validar que toda integración pasa por Gateway;
* validar rutas y enlaces modificados;
* registrar documentos leídos;
* ejecutar `git diff --check` si el entorno lo permite.

No declarar validaciones no ejecutadas.

Si una validación no puede ejecutarse, registrar causa exacta.

## Reporte obligatorio

Actualizar:

`Docs/agents/EXECUTION_REPORT.md`

Debe registrar:

* `AGENTS-008.md`;
* documentos leídos;
* Context Pack elegido;
* documentos fuera de alcance;
* cambios realizados;
* validaciones ejecutadas;
* resultado de validaciones;
* pendientes reales con `PENDIENTE_DE_DEFINIR`;
* bloqueos;
* decisiones documentales;
* estado final del agent.

## Criterio de cierre

El agent queda listo solo si:

* la instrucción es más clara y ejecutable;
* no pierde ninguna decisión del agente actual;
* separa SatWi, Network Control, JobCron y POS;
* no duplica reglas globales;
* tiene lectura mínima;
* tiene alcance claro;
* tiene tareas verificables;
* define qué queda fuera;
* define validaciones;
* define dónde reportar;
* no crea APIs sin contrato;
* no inventa schemas ni migraciones;
* no marca Network Control API como activa sin evidencia;
* conserva Network Control como producto independiente vendible;
* conserva SatWi como ISP consumidor;
* conserva JobCron como ERP;
* conserva Universal POS como POS independiente.

## Reglas finales

Si `AGENTS-008.md` está vacío, no inventar tareas; dejarlo como `Sin instrucciones`.

Si el agent ya fue ejecutado y no hay cambios nuevos, documentar que está cerrado.

Si falta información esencial, marcar `Bloqueado` y dejar preguntas concretas.

No eliminar, mover ni renombrar `Docs/agents/AGENTS-008.md`.

No limpiar el contenido del agent.

Esta tarea solo optimiza la instrucción del agent; no ejecuta Network Control, SatWi, JobCron ni POS.
