# INSTRUCCIÓN PARA CODEX — AUDITORÍA MAESTRA DE APIS Y DOMINIOS DE JOBCRON

Trabaja exclusivamente sobre la rama `dev`.

Repositorio:

`https://github.com/MexIngSoft/Docs`

## Objetivo principal

Realizar una auditoría documental completa de JobCron para determinar qué APIs, servicios, módulos compartidos, contratos, catálogos y dominios funcionales hacen falta antes de continuar el desarrollo.

El objetivo NO es desarrollar código.

El objetivo NO es crear migraciones.

El objetivo NO es modificar proyectos funcionales.

El objetivo es detectar todo lo que pueda provocar en el futuro:

* migraciones estructurales;
* duplicación de lógica;
* duplicación de catálogos;
* duplicación de APIs;
* duplicación de direcciones;
* duplicación de clientes;
* duplicación de archivos;
* duplicación de permisos;
* duplicación de configuraciones;
* ruptura de contratos;
* rediseños costosos;
* cambio de ownership de servicios;
* separación tardía de APIs;
* fusión tardía de APIs;
* cambios innecesarios en modelos, IDs, tablas o módulos.

La auditoría debe asumir que JobCron será el Core ERP corporativo de MexIngSof durante muchos años y que debe soportar Refapart, Universal POS, Facturación, DocuCore, Lex Nova, Marketplace Manager, LeadHunter, MexIngSof y futuros productos.

---

# FASE 0 — REGLAS ESTRICTAS

Antes de iniciar:

1. Cambiar o confirmar la rama `dev`.
2. No trabajar sobre `main`, `pro`, ramas temporales ni ramas no solicitadas.
3. No desarrollar código.
4. No crear migraciones.
5. No modificar modelos.
6. No modificar APIs reales.
7. No modificar frontend.
8. No ejecutar agents masivos.
9. No leer `_archive` salvo trazabilidad justificada.
10. No inventar documentación oficial.
11. No asumir información fuera de la documentación existente.
12. No crear APIs propuestas sin justificar:

    * motivo;
    * consumidores;
    * beneficio;
    * riesgo evitado;
    * prioridad;
    * ubicación documental recomendada;
    * ownership recomendado.
13. Si una información no existe en la documentación, marcarla como:
    `NO CONFIRMADO EN DOCUMENTACIÓN`.
14. Si una API existe parcialmente, marcarla como:
    `PARCIAL`.
15. Si una API no existe, marcarla como:
    `NO EXISTE DOCUMENTALMENTE`.
16. Si una API existe claramente, marcarla como:
    `EXISTE`.
17. No duplicar documentos si ya existe un documento canónico.
18. Si se requiere actualizar documentación, primero identificar el documento dueño correcto.
19. Todo hallazgo debe apuntar a la ruta documental exacta revisada.
20. Toda propuesta debe respetar la estructura canónica del repositorio.

---

# FASE 1 — LECTURA OBLIGATORIA

Leer primero y por completo los siguientes documentos base:

1. `Docs/README.md`
2. `Docs/_meta/active-work-index.md`
3. `Docs/agents/`
4. `Docs/agents/AGENT_GLOBAL_RULES.md`
5. `Docs/agents/RUN_AGENTS_INSTRUCTIONS.md`
6. `Docs/agents/EXECUTION_REPORT.md`

Después de leerlos, generar un resumen breve con:

* reglas globales aplicables;
* estructura canónica real;
* documentos que gobiernan auditorías;
* documentos que gobiernan APIs reutilizables;
* documentos que gobiernan ejecución de Codex;
* restricciones detectadas;
* agents existentes y propósito general de cada uno.

No avanzar a conclusiones hasta terminar esta lectura.

---

# FASE 2 — LECTURA DOCUMENTAL COMPLEMENTARIA OBLIGATORIA

Con base en el README y el índice activo, leer los documentos canónicos relacionados con:

## Auditoría

* `Docs/00_audit/10_development_gap_analysis.md`
* `Docs/00_audit/codex-context-map.md`
* `Docs/00_audit/document-ownership-map.md`
* `Docs/00_audit/reusable-api-map.md`
* `Docs/00_audit/reusable-api-audit.md`

## Core ERP

* `Docs/01_core_erp/`
* `Docs/01_core_erp/apis/`
* `Docs/01_core_erp/apis/00_api_index.md`
* `Docs/01_core_erp/apis/reusable-api-contracts.md`
* `Docs/01_core_erp/apis/api-decision-matrix.md`
* `Docs/01_core_erp/apis/gateway-route-registry.md`
* `Docs/01_core_erp/apis/endpoint-ui-consumption-matrix.md`

## Estándares

* `Docs/03_standards/operations/codex-execution-standard.md`
* `Docs/03_standards/operations/codex-anti-patterns.md`
* `Docs/03_standards/operations/context-packs.md`
* `Docs/03_standards/codex/codex-minimal-reading-standard.md`
* `Docs/03_standards/codex/codex-anti-vices-checklist.md`
* `Docs/03_standards/codex/codex-skills-standard.md`
* `Docs/03_standards/api/api-decision-record-standard.md`
* `Docs/03_standards/api/api-contract-first-standard.md`
* `Docs/03_standards/architecture/reusable-api-decision-standard.md`
* `Docs/03_standards/architecture/shared-libraries-standard.md`
* `Docs/03_standards/architecture/shared-library-registry.md`
* `Docs/03_standards/codex/codex-output-report-standard.md`

## Templates

* `Docs/templates/api-contract-template.md`
* `Docs/templates/api-specialized-justification-template.md`
* `Docs/templates/etl-contract-template.md`
* `Docs/templates/frontend-module-template.md`

## Proyectos obligatorios

Leer documentación existente de:

* `Docs/02_projects/jobcron/`
* `Docs/02_projects/refapart/`
* `Docs/02_projects/universal-pos/`
* `Docs/02_projects/docucore/`
* `Docs/02_projects/lexnova/`
* `Docs/02_projects/mexingsof/`

Buscar también documentación existente relacionada con:

* Facturación
* Marketplace Manager
* LeadHunter
* Fiscora
* TecnoTelec
* PhoneShop
* Imagrafity
* Innovation Engines Repair
* Radar Empresarial
* saTwi

Si alguno no tiene carpeta o documento claro, reportar:
`NO CONFIRMADO EN DOCUMENTACIÓN`.

---

# FASE 3 — IDENTIFICACIÓN DE DOMINIOS ERP

Determinar todos los dominios funcionales existentes y reutilizables.

No limitarse a proyectos actuales.

Validar como mínimo los siguientes dominios:

## Identidad

* usuarios;
* roles;
* permisos;
* sesiones;
* autenticación;
* autorización;
* auditoría de acceso;
* perfiles;
* recuperación de cuenta;
* tokens;
* ownership de identidad.

## Empresas

* empresas;
* sucursales;
* unidades de negocio;
* marcas;
* configuraciones;
* multiempresa;
* multisucursal;
* razón social;
* nombre comercial;
* dominios web;
* ownership corporativo.

## Clientes

* clientes;
* prospectos;
* leads;
* contactos;
* personas;
* direcciones;
* perfiles fiscales;
* historial comercial;
* historial documental.

## Proveedores

* proveedores;
* fabricantes;
* distribuidores;
* mayoristas;
* dropshipping;
* contactos proveedor;
* condiciones comerciales;
* direcciones proveedor;
* catálogos proveedor.

## Productos

* productos;
* servicios;
* combos;
* variantes;
* atributos;
* categorías;
* marcas;
* equivalencias;
* unidades de medida;
* imágenes;
* fichas técnicas.

## Inventarios

* almacenes;
* existencias;
* movimientos;
* transferencias;
* series;
* lotes;
* ubicaciones;
* apartados;
* disponibilidad;
* inventario por sucursal.

## Compras

* órdenes de compra;
* recepciones;
* facturas proveedor;
* costos;
* pagos proveedor;
* devoluciones proveedor.

## Ventas

* cotizaciones;
* pedidos;
* ventas;
* facturación;
* pagos;
* devoluciones;
* cancelaciones;
* descuentos;
* promociones.

## Finanzas

* cuentas;
* movimientos;
* conciliaciones;
* ingresos;
* egresos;
* cuentas por cobrar;
* cuentas por pagar;
* cortes;
* arqueos.

## CRM

* leads;
* seguimiento;
* embudos;
* campañas;
* oportunidades;
* actividades;
* origen de lead;
* scoring;
* asignación.

## Marketplace

* Amazon;
* Mercado Libre;
* Walmart;
* eBay;
* Shopify;
* publicación;
* sincronización;
* precio por canal;
* inventario por canal;
* órdenes externas;
* comisiones;
* conectores.

## Logística

* paqueterías;
* rutas;
* guías;
* costos;
* cobertura;
* entregas locales;
* tracking;
* direcciones de envío;
* reglas de envío.

## Facturación

* SAT;
* CFDI;
* regímenes;
* impuestos;
* uso CFDI;
* forma de pago;
* método de pago;
* cancelaciones;
* complementos;
* certificados;
* timbrado.

## Documentos

* PDF;
* Word;
* Excel;
* imagen;
* XML;
* ZIP;
* RAR;
* storage;
* previews;
* procesamiento;
* limpieza;
* extracción;
* clasificación.

## IA

* prompts;
* embeddings;
* vectores;
* análisis;
* modelos;
* proveedores IA;
* jobs IA;
* datasets;
* trazabilidad de respuesta;
* evaluación.

## Notificaciones

* email;
* SMS;
* WhatsApp;
* push;
* plantillas;
* eventos disparadores;
* preferencias;
* bitácora de envío.

## Configuración

* catálogos;
* parámetros;
* preferencias;
* feature flags;
* reglas;
* plantillas;
* variables por empresa;
* variables por proyecto.

## Integraciones

* proveedores externos;
* tokens;
* credenciales;
* webhooks;
* colas;
* eventos;
* ETL;
* API Gateway;
* API Registry;
* API Discovery.

---

# FASE 4 — REVISIÓN POR PROYECTO

Analizar cada proyecto y generar una tabla por proyecto con:

1. APIs que reutiliza.
2. APIs que duplica.
3. APIs que debería reutilizar.
4. APIs ausentes.
5. contratos que todavía no existen.
6. catálogos que necesita.
7. dependencias con Core ERP.
8. dependencias con `04_integrations`.
9. riesgos de migración.
10. prioridad de corrección documental.

Proyectos obligatorios:

## JobCron

Determinar si está documentado como Core ERP, plataforma corporativa, ERP maestro o proyecto específico.

Validar que no mezcle lógica de proyectos especializados dentro del Core.

## Refapart

Validar:

* clientes;
* direcciones;
* proveedores;
* piezas;
* equivalencias;
* cotizaciones;
* ventas;
* pagos;
* logística;
* LeadHunter;
* Marketplace;
* catálogos de marcas/modelos/autopartes;
* integración con Facturación;
* integración con POS;
* consumo de Gateway.

## Universal POS

Validar:

* ventas;
* caja;
* pagos;
* inventario;
* productos;
* clientes;
* facturación;
* sucursales;
* usuarios;
* permisos;
* cortes;
* tickets;
* devoluciones.

## DocuCore

Validar:

* archivos;
* documentos;
* storage;
* procesamiento;
* PDF;
* Word;
* Excel;
* imagen;
* XML;
* ZIP/RAR;
* jobs;
* OCR si está documentado o no;
* consumo por LexNova, Facturación y otros proyectos.

## Facturación

Validar:

* SAT;
* CFDI;
* impuestos;
* clientes;
* perfiles fiscales;
* productos/servicios;
* pagos;
* documentos;
* XML/PDF;
* cancelaciones;
* certificados;
* timbrado;
* relación con Sales, Fiscal y Billing.

## Lex Nova

Validar:

* usuarios;
* personas;
* clientes;
* casos;
* documentos;
* análisis IA;
* prompts;
* permisos;
* roles;
* almacenamiento;
* consumo de DocuCore;
* consumo de Gateway.

## Marketplace Manager

Validar:

* productos;
* inventario;
* precios;
* publicaciones;
* canales;
* conectores externos;
* órdenes externas;
* comisiones;
* sincronización;
* integración con Sales, Catalog, Inventory y Pricing.

## LeadHunter

Validar:

* leads;
* fuentes externas;
* Apify;
* Google Places;
* scoring;
* contactos;
* direcciones;
* deduplicación;
* CRM;
* asignación;
* seguimiento;
* integración con Refapart y Marketplace.

## MexIngSof

Validar:

* administración corporativa;
* productos internos;
* clientes;
* usuarios;
* proyectos;
* dominios;
* despliegues;
* APIs activas;
* servicios publicados;
* clientes por producto;
* ownership de productos.

---

# FASE 5 — DETECCIÓN DE APIS MAESTRAS FALTANTES

Determinar si JobCron necesita una API única para cada una de las siguientes capacidades.

Para cada API, indicar:

* existe / parcial / no existe;
* documento donde aparece;
* consumidores;
* motivo;
* beneficio;
* riesgo evitado;
* prioridad;
* ubicación recomendada;
* ownership recomendado;
* si debe ser Core ERP, Integration, Shared Service o Project-specific.

APIs a validar:

1. Identity API
2. Auth API
3. User API
4. Role API
5. Permission API
6. Session API
7. Tenant API
8. Multiempresa API
9. Multisucursal API
10. Company API
11. Branch API
12. Business Unit API
13. Brand API
14. Person API
15. Contact API
16. Customer API
17. Prospect API
18. Lead API
19. Address API
20. Geography API
21. Country API
22. State API
23. Municipality API
24. Colony API
25. Postal Code API
26. Supplier API
27. Manufacturer API
28. Distributor API
29. Dropshipping API
30. Catalog API
31. Product API
32. Service API
33. Combo API
34. Variant API
35. Attribute API
36. Inventory API
37. Warehouse API
38. Stock Movement API
39. Transfer API
40. Serial Number API
41. Lot API
42. Procurement API
43. Purchase Order API
44. Supplier Invoice API
45. Sales API
46. Quote API
47. Order API
48. Cart API
49. Payment API
50. Pricing API
51. Discount API
52. Promotion API
53. Fiscal API
54. Billing API
55. CFDI API
56. Tax API
57. SAT Catalog API
58. Currency API
59. Finance API
60. Account API
61. Reconciliation API
62. CRM API
63. Funnel API
64. Campaign API
65. Marketplace API
66. Marketplace Channel API
67. Marketplace Publication API
68. Marketplace Sync API
69. Amazon Integration API
70. Mercado Libre Integration API
71. Walmart Integration API
72. eBay Integration API
73. Shopify Integration API
74. Logistics API
75. Carrier API
76. Shipping Rate API
77. Route API
78. Tracking API
79. File API
80. Storage API
81. Document API
82. PDF API
83. Word API
84. Excel API
85. Image API
86. XML API
87. ZIP/RAR API
88. OCR API
89. AI API
90. Prompt API
91. Embedding API
92. Vector API
93. Analysis API
94. Notification API
95. Email API
96. SMS API
97. WhatsApp API
98. Push API
99. Configuration API
100. Parameter API
101. Feature Flags API
102. Audit API
103. Log API
104. Global Search API
105. ETL API
106. Integration API
107. Webhook API
108. Event API
109. Queue API
110. Workflow API
111. Rule Engine API
112. API Gateway
113. API Registry
114. API Discovery
115. Observability API
116. Project Registry API
117. Deployment Registry API
118. Module Registry API
119. License / Subscription API
120. Credit / Usage API

No crear APIs de esta lista automáticamente. Solo proponerlas si existe consumidor real o riesgo documentado.

---

# FASE 6 — DETECCIÓN DE MIGRACIONES FUTURAS

Buscar cualquier diseño actual que pueda obligar a:

* renombrar tablas;
* cambiar IDs;
* mover modelos;
* separar APIs;
* fusionar APIs;
* mover módulos;
* duplicar catálogos;
* duplicar direcciones;
* duplicar clientes;
* duplicar contactos;
* duplicar leads;
* duplicar proveedores;
* duplicar productos;
* duplicar archivos;
* duplicar documentos;
* duplicar configuraciones;
* duplicar permisos;
* duplicar auditoría;
* duplicar almacenamiento;
* duplicar integraciones;
* duplicar lógica de pagos;
* duplicar lógica fiscal;
* duplicar lógica de facturación;
* duplicar lógica de marketplace;
* duplicar lógica de inventario;
* duplicar lógica de ventas.

Cada riesgo debe documentarse con:

* descripción;
* ruta documental donde se detecta;
* proyectos afectados;
* APIs afectadas;
* severidad;
* probabilidad;
* impacto;
* propuesta de prevención;
* documento que debe actualizarse;
* si requiere ADR;
* si requiere contrato API;
* si requiere matriz de consumo.

---

# FASE 7 — MATRIZ DE REUTILIZACIÓN

Generar una matriz con las siguientes columnas:

* API
* Descripción
* Ubicación recomendada
* Ownership recomendado
* Consumidores
* Refapart
* Universal POS
* Facturación
* DocuCore
* Lex Nova
* Marketplace Manager
* LeadHunter
* MexIngSof
* Prioridad
* Estado
* Contrato existente
* Riesgo si no se define
* Documento actual
* Documento a actualizar

Usar prioridad:

* Crítica
* Alta
* Media
* Baja

Usar estado:

* Existe
* Parcial
* No existe
* No confirmado en documentación

---

# FASE 8 — ARQUITECTURA FUTURA

Determinar qué APIs deben vivir en:

## `Docs/01_core_erp`

Aquí deben vivir APIs reutilizables del ERP:

* identidad;
* usuarios;
* roles;
* permisos;
* tenant;
* multiempresa;
* empresas;
* sucursales;
* personas;
* contactos;
* clientes;
* direcciones;
* catálogos;
* productos;
* inventarios;
* compras;
* ventas;
* pagos;
* fiscal;
* facturación;
* pricing;
* proveedores;
* logística base;
* documentos base;
* auditoría;
* configuración;
* workflow;
* reglas;
* eventos internos;
* feature flags;
* búsqueda global.

## `Docs/04_integrations`

Aquí deben vivir integraciones externas:

* SAT;
* PAC/timbrado;
* Mercado Pago;
* BBVA;
* WhatsApp provider;
* Email provider;
* SMS provider;
* Amazon;
* Mercado Libre;
* Walmart;
* eBay;
* Shopify;
* Apify;
* Google Places;
* paqueterías;
* proveedores externos de OCR;
* proveedores externos de IA;
* conectores ETL.

## Servicios compartidos

Determinar qué debe ser servicio compartido corporativo:

* API Gateway;
* Storage;
* Queue;
* Event Bus;
* Notification Engine;
* Workflow Engine;
* API Registry;
* API Discovery;
* Observability;
* Feature Flags;
* Tenant Management;
* File Processing;
* Search Engine.

## APIs que jamás deben pertenecer a un proyecto específico

Validar y documentar que nunca deben quedar dentro de Refapart, POS, LexNova, DocuCore, Marketplace Manager o LeadHunter:

* Auth;
* Users;
* Roles;
* Permissions;
* Address;
* Person;
* Contact;
* Customer base;
* Company;
* Branch;
* Catalog base;
* Product base;
* Inventory base;
* Pricing base;
* Supplier base;
* Fiscal base;
* Billing base;
* Payment base;
* Document base;
* File base;
* Storage;
* Notification;
* Audit;
* Configuration;
* Gateway;
* Marketplace connector base;
* Logistics base;
* Workflow;
* Events;
* Webhooks;
* Feature Flags.

---

# FASE 9 — ENTREGABLES OBLIGATORIOS

Generar únicamente documentación de auditoría.

Crear o actualizar solo el documento dueño correcto según `document-ownership-map.md`.

Si no existe documento dueño claro, proponer ruta nueva, pero no crearla sin justificar.

Entregables:

1. Inventario completo de APIs actuales.
2. Inventario completo de APIs faltantes.
3. Inventario de APIs parciales.
4. Inventario de contratos inexistentes.
5. Inventario de catálogos maestros requeridos.
6. Riesgos de migración.
7. Riesgos de duplicidad.
8. Mapa de dependencias.
9. Matriz de reutilización.
10. Propuesta de arquitectura definitiva.
11. Separación recomendada entre `01_core_erp`, `04_integrations`, servicios compartidos y proyectos.
12. Roadmap de implementación.
13. Orden recomendado de construcción.
14. Lista de documentos que deben actualizarse después.
15. Lista de ADRs requeridos.
16. Lista de contratos API requeridos.
17. Lista de decisiones bloqueantes antes de seguir desarrollando.
18. Resumen ejecutivo para dueño de negocio.
19. Resumen técnico para Codex.
20. Checklist final de no duplicidad.

---

# FASE 10 — ORDEN RECOMENDADO DE CONSTRUCCIÓN

Proponer orden final de construcción usando esta prioridad base, ajustándola solo si la documentación lo justifica:

1. Gateway General.
2. Auth / Identity.
3. Users / Roles / Permissions.
4. Tenant / Multiempresa / Multisucursal.
5. Company / Branch / Business Unit / Brand.
6. Person / Contact / Customer / Prospect / Lead.
7. Address / Geography.
8. Catalog / Product / Service / Variant / Attribute.
9. Supplier / Manufacturer / Distributor.
10. Inventory / Warehouse / Stock Movement.
11. Pricing / Discounts / Promotions.
12. Sales / Quotes / Orders / Cart.
13. Payments.
14. Fiscal / Taxes / SAT Catalogs.
15. Billing / CFDI.
16. Document / File / Storage.
17. Notification.
18. Logistics.
19. CRM.
20. Workflow.
21. Rule Engine.
22. Events / Webhooks / Queue.
23. Marketplace base.
24. Marketplace external integrations.
25. ETL.
26. Reporting / BI.
27. IA / Prompts / Embeddings / Vectors / Analysis.
28. Observability.
29. API Registry / Discovery.
30. Feature Flags.
31. Project Registry / Deployment Registry / Module Registry.

---

# FASE 11 — FORMATO DEL REPORTE FINAL

El reporte final debe tener esta estructura exacta:

## 1. Resumen ejecutivo

Explicar en lenguaje claro si JobCron está listo o no para continuar desarrollo sin riesgo de migraciones futuras.

## 2. Documentos leídos

Tabla con:

* ruta;
* propósito;
* hallazgos;
* relevancia.

## 3. Dominios ERP detectados

Tabla con:

* dominio;
* descripción;
* documentos donde aparece;
* proyectos consumidores;
* estado.

## 4. APIs actuales

Tabla con:

* API;
* descripción;
* ubicación;
* consumidores;
* estado;
* contrato;
* observaciones.

## 5. APIs faltantes

Tabla con:

* API;
* motivo;
* consumidores;
* riesgo evitado;
* prioridad;
* ubicación recomendada.

## 6. APIs parciales

Tabla con:

* API;
* qué existe;
* qué falta;
* impacto;
* documento a actualizar.

## 7. Contratos faltantes

Tabla con:

* contrato;
* API;
* consumidores;
* endpoints esperados;
* eventos esperados;
* catálogos requeridos;
* prioridad.

## 8. Riesgos de migración

Tabla con:

* riesgo;
* causa;
* proyectos afectados;
* severidad;
* prevención.

## 9. Riesgos de duplicidad

Tabla con:

* duplicidad probable;
* dónde puede ocurrir;
* API maestra que debe evitarlo;
* acción recomendada.

## 10. Matriz de reutilización

Incluir la matriz completa definida en FASE 7.

## 11. Mapa de dependencias

Agrupar por:

* Core ERP;
* Proyectos;
* Integraciones;
* Servicios compartidos.

## 12. Arquitectura recomendada

Definir qué vive en:

* `01_core_erp`;
* `04_integrations`;
* servicios compartidos;
* proyectos específicos.

## 13. APIs que no deben vivir en proyectos

Lista justificada.

## 14. Roadmap

Separar en:

* inmediato;
* corto plazo;
* mediano plazo;
* largo plazo.

## 15. Orden recomendado de construcción

Lista priorizada.

## 16. Decisiones bloqueantes

Lista de decisiones que deben resolverse antes de seguir desarrollando.

## 17. Documentos a actualizar

Tabla con:

* documento;
* cambio requerido;
* motivo;
* prioridad.

## 18. ADRs requeridos

Tabla con:

* decisión;
* motivo;
* impacto;
* prioridad.

## 19. Checklist final

Validar:

* no se propuso código;
* no se crearon migraciones;
* no se modificaron proyectos;
* no se duplicaron documentos;
* cada API propuesta tiene consumidor;
* cada API propuesta tiene motivo;
* cada riesgo tiene prevención;
* cada documento recomendado tiene ownership;
* todo se basa en documentación existente.

---

# CRITERIO DE ÉXITO

La auditoría será correcta únicamente si permite que JobCron evolucione durante años sin requerir refactorizaciones estructurales por:

* duplicación de módulos;
* duplicación de catálogos;
* duplicación de contratos;
* duplicación de APIs;
* duplicación de ownership;
* cambios de arquitectura;
* cambios de dominio;
* cambios de ownership de servicios;
* separación tardía de APIs;
* fusión tardía de APIs;
* dependencia directa entre proyectos;
* integraciones externas metidas en proyectos;
* catálogos geográficos duplicados;
* clientes duplicados;
* direcciones duplicadas;
* archivos/documentos duplicados;
* permisos duplicados;
* auditoría duplicada.

No cerrar la tarea hasta dejar claro:

1. qué existe;
2. qué falta;
3. qué está parcial;
4. qué se debe construir primero;
5. qué no debe construirse dentro de proyectos;
6. qué contratos deben cerrarse antes de avanzar;
7. qué riesgos de migración se evitan con cada decisión.
