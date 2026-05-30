# Analisis global de pendientes de desarrollo

## Estado

ACTIVE

## Objetivo

Consolidar, desde la documentacion canonica vigente, que falta por desarrollar
en el ecosistema y que informacion se necesita para terminar los desarrollos
sin inventar reglas de negocio, APIs o flujos.

Este documento no reemplaza los documentos de cada proyecto. Funciona como mapa
de cierre para priorizar implementacion.

## Lectura base obligatoria aplicada

Se revisaron primero:

- `Docs/_meta/master-index.md`
- `Docs/_meta/master-index.yaml`
- `Docs/_meta/navigation-map.md`
- `Docs/README.md`

Despues se revisaron documentos canonicos de auditoria, core, proyectos,
estandares e integraciones relacionados con pendientes de desarrollo.

## Resumen ejecutivo

El repositorio ya tiene una base documental amplia y varios MVPs creados. Lo que
falta no es "un solo modulo", sino cerrar brechas de integracion entre APIs,
frontends, gateways, datos reales, seguridad, jobs y flujos productivos.

Prioridad inmediata:

1. Cerrar cambios no publicados y validar repositorios por responsabilidad.
2. Terminar Fiscora: Web -> Gateway -> Fiscal, parser CFDI productivo, PDF y
   seguridad fiscal.
3. Terminar DocuCore como motor documental productivo: workers, OCR real,
   logs, retencion y validacion de archivos.
4. Terminar LexNova productivo: revision documental legal por secciones,
   permisos, cadena de custodia y flujo humano.
5. Cerrar Tecno Telec/JobCron: gateway real, datos reales, permisos, catalogo,
   pricing, cotizador y administracion.

## Pendientes transversales P0

| Pendiente | Responsable | Que falta | Necesario para cerrarlo |
|---|---|---|---|
| Publicar cambios por repositorio | Docs, Fiscal, LexNova, Webs afectadas | Hay cambios locales previos y actuales que deben commit/push por repo separado. | Confirmar rama objetivo (`dev`, `pro`, `main` o feature), estrategia de PR y si se suben cambios directos. |
| Ejecutar migraciones reales | APIs Django modificadas | Varias APIs tienen modelos/migraciones MVP; falta aplicarlas en PostgreSQL local/productivo. | Base objetivo, credenciales locales, politica de migracion por ambiente. |
| Matriz final de permisos | Auth + proyectos | La documentacion marca RBAC/ABAC final como pendiente. | Roles por app, permisos por modulo, permisos por cliente interno/externo y acciones sensibles. |
| Datos reales de prueba | Todos los MVP | Muchos flujos compilan pero no tienen dataset completo real. | XML CFDI reales anonimizados, documentos legales anonimizados, catalogo/productos, precios, stock y clientes de prueba. |
| Observabilidad y logs operativos | Infraestructura + APIs | Hay auditoria base, pero faltan metricas, alertas, trazas y logs por jobs. | Decidir stack de observabilidad, retencion y responsables de incidentes. |

## Fiscora y Fiscal

Estado documentado:

- `API.PY.DJANGO.Fiscal`: MVP fiscal creado y extendido para CFDI
  multiversion.
- `API.PY.DJANGO.Fiscora`: MVP producto creado.
- `API.PY.DJANGO.Fiscora.Gateway`: MVP gateway creado.
- `WEB.NJ.NEXT.Fiscora`: preview visual creado, no conectado a backend real.

Pendientes de desarrollo:

| Prioridad | Pendiente | API/modulo | Necesario para cerrarlo |
|---|---|---|---|
| Alta | Conectar `WEB.NJ.NEXT.Fiscora` con `API.PY.DJANGO.Fiscora.Gateway`. | Fiscora Web + Gateway | Contrato final de endpoints, auth, tenant activo y pantallas de carga/listado/detalle CFDI. |
| Alta | Exponer carga XML por Gateway hacia Fiscal. | Fiscora Gateway -> Fiscal | Endpoint gateway, validacion de sesion, tenant, limites de plan y manejo de errores. |
| Alta | Completar parser CFDI productivo. | Fiscal API | Validacion XSD, cadena original, sello, reglas SAT por version y errores normalizados. |
| Alta | Importar catalogos SAT versionables. | Fiscal API | Fuente oficial, periodicidad, versionado, job de actualizacion y responsable fiscal. |
| Alta | Normalizar complementos prioritarios. | Fiscal API | Definir estructura para Pagos, Nomina, Carta Porte y Comercio Exterior. |
| Media | Generar PDF visual. | Fiscal/Fiscora -> Document API | Plantilla fiscal, branding, almacenamiento, descarga y permisos. |
| Media | Implementar jobs SAT reales. | Fiscal API | Estrategia de conexion SAT, consentimiento, credenciales, colas, reintentos y limites. |
| Media | Planes, creditos y cuotas. | Fiscora API | Limites por plan, precio de creditos, consumo por SAT/PDF/IA/storage/reportes. |
| Alta | Seguridad fiscal y legal. | Fiscora + Fiscal | Aviso de privacidad, consentimiento SAT, retencion, eliminacion de cuenta y cifrado. |

Preguntas necesarias:

- El MVP inicia solo con carga manual XML o tambien con descarga SAT real?
- Cliente prioritario: contador, PyME, persona fisica o multiempresa?
- Limites reales del plan gratis: CFDI, empresas, PDFs, storage y reportes?
- Que complementos entran primero: Pagos, Nomina, Carta Porte, Comercio Exterior?
- Que proveedor/storage se usara para XML/PDF productivo?

## DocuCore y Document API

Estado documentado:

- Upload, jobs MVP, artefactos, catalogo y UI estan implementados como MVP.
- OCR esta parcial: Tesseract se usa si existe.
- El procesamiento pesado sigue sin worker aislado productivo.

Pendientes de desarrollo:

| Prioridad | Pendiente | API/modulo | Necesario para cerrarlo |
|---|---|---|---|
| Alta | Worker aislado para procesamiento pesado. | Document API / infraestructura | Cola, contenedor worker, timeouts, limites por archivo y reintentos. |
| Alta | Validacion MIME real y archivos peligrosos. | Document API + Gateway | Lista permitida, deteccion por contenido, antivirus/sandbox y rechazo seguro. |
| Alta | OCR productivo. | Document API | Motor inicial confirmado, instalacion, salida TXT/JSON/HOCR, errores y costos. |
| Alta | Logs por job. | Document API | Eventos por etapa, duracion, tamano original/resultado, errores tecnicos y auditoria. |
| Media | Retencion y limpieza programada. | Document API + scheduler | TTL por archivo/artefacto, cuotas, job de cleanup y politica por plan. |
| Media | Batch upload y pipelines. | DocuCore Gateway/Web + Document API | UI multiarchivo, job batch, resultados por archivo y recuperacion parcial. |
| Media | PDF buscable con capa OCR real. | Document API | Motor OCR, escritura de capa texto, validacion visual y descarga por Gateway. |
| Media | Segmentacion documental avanzada. | Document API | Deteccion de cortes por paginas, encabezados, confianza y revision humana. |

Preguntas necesarias:

- Se usara Tesseract como motor productivo inicial o proveedor cloud?
- Tamano maximo por archivo y formatos permitidos por plan?
- Donde se guardaran archivos/artefactos productivos?
- Cuanto tiempo deben vivir archivos temporales y resultados?
- Que herramientas deben estar visibles como `enabled` en catalogo y cuales quedan ocultas?

## LexNova

Estado documentado:

- La integracion base Web -> Gateway -> Document API esta conectada como MVP.
- El dominio legal existe en `API.PY.DJANGO.LexNova`.
- El estado productivo sigue incompleto para revision legal por secciones,
  cadena de custodia y visibilidad fina.

Pendientes de desarrollo:

| Prioridad | Pendiente | API/modulo | Necesario para cerrarlo |
|---|---|---|---|
| Alta | Cerrar escritura de assets documentales en LexNova API. | LexNova API | Confirmar endpoint de intake, payload final y politicas por caso. |
| Alta | Pantalla interna de revision documental por secciones. | LexNova Web + Gateway + API | UI de revision, aprobacion/correccion/rechazo, escritura en modelos legales. |
| Alta | Orquestacion automatica OCR -> clasificacion -> segmentacion -> indice. | Document API + LexNova Gateway | Pipeline asincrono, estados, reintentos, errores y callback/webhook o polling. |
| Alta | Deteccion real multi-seccion. | Document API | Algoritmo por contenido/pagina, confianza, razon de corte y revision humana. |
| Alta | Politicas de acceso por documento y participante. | LexNova API + Auth | Roles definitivos, visibilidad cliente/interno, revocacion y auditoria. |
| Media | Cadena de custodia. | LexNova + Document API | Hash, eventos, responsables, retencion, exportacion y alertas de acceso. |
| Media | Catalogos juridicos iniciales. | LexNova API | Materias, procedimientos, documentos, autoridades, juzgados, plazos y jurisdiccion. |
| Media | Transcripcion audio/video. | LexNova + Document API | Motor de transcripcion, diarizacion, idiomas y costo. |

Preguntas necesarias:

- Materias iniciales: penal, familiar, amparo u otra combinacion?
- Catalogo inicial de tipos documentales legales?
- Que documentos puede ver/descargar el cliente?
- Que nivel de confianza permite aceptar una clasificacion sin revision humana?
- Que storage, retencion y cifrado aplican a expedientes legales?

## Tecno Telec y JobCron

Estado documentado:

- Tecno Telec esta documentado como proyecto consultivo, no marketplace
  generico.
- El Gateway Tecno Telec ya tiene rutas publicas de catalogo/soluciones.
- Catalog, Pricing, Inventory, Supplier y Sales tienen MVPs.
- Procurement solo tiene `admin/` y queda fuera del flujo publico MVP.

Pendientes de desarrollo:

| Prioridad | Pendiente | API/modulo | Necesario para cerrarlo |
|---|---|---|---|
| Alta | Confirmar alcance MVP final. | Tecno Telec | Decidir si MVP es consultivo, carrito, checkout o solo catalogo/cotizador. |
| Alta | Conectar Gateway con orquestacion real completa. | TecnoTelec Gateway | Contratos definitivos con Catalog, Pricing, Inventory, Supplier, Sales y TecnoTelec API. |
| Alta | Persistencia administrativa Tecno Telec. | TecnoTelec API | Configuracion propia, leads, soluciones, permisos internos y contratos finales. |
| Alta | ChannelAssortment. | Catalog/Proyecto | Reglas SELLABLE, QUOTE_ONLY, COMPONENT_ONLY, BLOCKED por canal/proyecto. |
| Alta | Matriz de permisos JobCron/Tecno Telec. | Auth + JobCron | Quien ve costos, margenes, precio interno, productos bloqueados y sync. |
| Alta | Datos reales suficientes. | Catalog, Pricing, Inventory, Supplier | Productos, imagenes, categorias, marcas, precios, stock, proveedor y fichas. |
| Alta | Cotizador consultivo estable. | Sales o Quote/Projects API | Confirmar si se queda en Sales MVP o se separa Quote/Projects. |
| Media | Rules Engine basico. | Rules Engine API | Reglas de visibilidad, compatibilidad, margen, aprobacion y bloqueos. |
| Media | Logistics/Rutexa. | Logistics API futuro | Costos, tiempos, tracking, cobertura y responsable de entrega. |
| Media | Cart/checkout. | Cart + Sales + Pagora | Decidir si entra en fase siguiente o queda fuera del MVP. |
| Media | Billing/CFDI comercial. | Billing/Fiscal/Fiscora | Politica de facturacion por empresa y proveedor fiscal. |
| Baja | POS y GovernmentTender. | POS/GovernmentTender API | Confirmar si son fases posteriores. |

Preguntas necesarias:

- Tecno Telec MVP vende directo o cotiza soluciones?
- Que productos se bloquean, se venden o solo se usan como componentes?
- Quote API se separa ahora o Sales sigue guardando cotizaciones MVP?
- Que permisos tendra JobCron para administrar catalogo, costos y margenes?
- Que datos reales de contacto, marca, imagenes y WhatsApp son definitivos?

## Core ERP

Pendientes marcados por la documentacion:

| Prioridad | Pendiente | API/modulo | Necesario para cerrarlo |
|---|---|---|---|
| Alta | `quote-api` o decision final Sales/Quote. | Quote/Sales | Frontera de responsabilidad, snapshots y conversion a orden. |
| Alta | `rules-engine-api`. | Rules Engine | Motor basico de decisiones, contratos, versionado y auditoria. |
| Alta | `projects-api`. | Projects | Soluciones consultivas, paquetes y relacion con cotizaciones. |
| Media | `logistics-api`. | Logistics/Rutexa | Envios, costos, tracking, cobertura y devoluciones logisticas. |
| Media | `billing-api`. | Billing/Fiscal | Datos fiscales, facturas, notas, cancelaciones y relacion con Sales. |
| Media | `notifications-api`. | Notifications | Eventos, plantillas, canales, reintentos y logs. |
| Media | `cart-api`. | Cart | Intencion de compra web, reservas, checkout y expiracion. |
| Baja | `pos-api`. | POS | Venta fisica, caja, cortes y devoluciones de mostrador. |
| Baja | `government-tender-api`. | Licitaciones | Licitaciones, documentos, aprobadores y seguimiento. |
| Media | Diccionario consolidado de base de datos. | Database docs + migraciones | Generar diccionario desde docs y migraciones reales. |
| Media | Multi-tenant real. | Core/Auth/APIs | Tenant, aislamiento, ownership y reglas de datos compartidos. |

Nota de consistencia:

La documentacion core todavia marca `documents-api` como faltante, pero el
workspace ya contiene `API.PY.DJANGO.Document` y DocuCore. La accion correcta
es actualizar la documentacion core o registrar que Document API ya existe como
capacidad transversal.

## Auth, seguridad y cumplimiento

Pendientes:

| Prioridad | Pendiente | Necesario |
|---|---|---|
| Alta | Modelo final RBAC/ABAC por tenant/app. | Roles, permisos, scopes y reglas de herencia. |
| Alta | Flujos publicos MFA. | Enrolamiento, verificacion, recovery codes y UI. |
| Alta | Bloqueo por intentos fallidos y rate limit. | Politica, umbrales, desbloqueo y alertas. |
| Media | Alertas por dispositivo/IP inusual. | Plantillas, canal y reglas de riesgo. |
| Media | Reautenticacion en acciones sensibles. | Lista de acciones y TTL de reautenticacion. |
| Media | Proveedor de secretos y CI/CD. | Secret manager, variables por repo y ambientes. |

## Integraciones externas

Pendientes:

| Prioridad | Pendiente | Necesario |
|---|---|---|
| Alta | Finalizar/monitorear sync Syscom. | Jobs, `full.last_success`, errores, stock/precio y encoding. |
| Media | `sync_syscom_exchange_rate`. | Frecuencia, fuente, tabla destino y uso en Pricing. |
| Media | CT Internacional. | Credenciales, catalogo, precios, stock y mapeo. |
| Media | DC Mayorista. | Credenciales, catalogo, precios, stock y mapeo. |
| Media | Proveedor de notificaciones. | Email/SMS/WhatsApp/push, costos y plantillas. |
| Media | Proveedores SAT/PAC. | Descarga, timbrado, cancelacion, carta porte y complementos. |

## Proyectos futuros del ecosistema

La documentacion registra muchos proyectos `FUTURE_OR_PENDING`. No deben
convertirse en APIs todavia salvo que exista necesidad real y owner claro.

| Proyecto | Pendiente principal |
|---|---|
| Clientix | Definir si sera app de clientes, tecnicos y administracion o modulo interno. |
| Cloudra | Definir hosting, nube, VPN, monitoreo y relacion con infraestructura. |
| Datara | Definir BI, dashboards, data warehouse y privacidad por empresa. |
| Nexora | Definir si cotiza como consultora o canaliza proyectos a Tecno Telec/otros. |
| Stockara | Definir si sera modulo interno de inventario o producto visible. |
| Rutexa | Definir logistica interna, externa o ambas. |
| Pagora | Definir pagos, financiamiento, conciliacion y relacion con Sales/Fiscora. |
| Buildora | Definir atributos tecnicos y compatibilidad por categoria. |
| Refakto | Definir calidad, garantia y compatibilidad de refacciones usadas. |
| Sekura Tech | Definir MVP de seguridad/camaras/control de acceso. |
| Innovation Engines Repair | Definir flujo ticket/cotizacion/venta y garantias. |
| Social Networks | Definir aprobacion por marca antes de publicar. |
| MockWander | Definir limites eticos/legales y no mezclar con tracking operativo real. |

## Modulos empresariales grandes todavia no formalizados

Desde `Docs/pendientes/pendientes.md`, los modulos grandes pendientes son:

| Modulo | Prioridad sugerida | Estado |
|---|---|---|
| CRM real | Alta | No existe como modulo empresarial completo. |
| WMS real | Alta | Inventory cubre base, falta operacion fisica de almacen. |
| CFDI/SAT productivo | Alta | Fiscal/Fiscora ya empezaron, falta cierre productivo. |
| BI/Datara | Alta | No existe data warehouse ni analitica predictiva. |
| TMS/Rutexa | Alta-media | Falta transporte, rutas, tracking y costos. |
| APS | Media | Planeacion avanzada futura. |
| EAM | Media | Activos, mantenimiento y ciclos de vida futuros. |
| HRM | Media-baja | Recursos humanos futuros. |
| QMS/QCS | Futuro | Calidad, auditorias e inspecciones. |
| Event bus/colas empresariales | Transversal | Hay arquitectura modular, falta bus productivo si se escala. |

## Orden recomendado de cierre

1. Publicar y estabilizar cambios actuales por repositorio.
2. Ejecutar migraciones locales en PostgreSQL para APIs modificadas.
3. Cerrar Fiscora Web -> Gateway -> Fiscal con carga XML manual.
4. Cerrar DocuCore worker/OCR/logs/retencion como motor transversal.
5. Cerrar LexNova revision documental por secciones sobre DocuCore.
6. Cerrar Tecno Telec Gateway con Catalog/Pricing/Inventory/Supplier/Sales.
7. Definir Quote/Sales/Projects para cotizador consultivo.
8. Implementar Rules Engine basico para visibilidad, margen y aprobaciones.
9. Sembrar datos reales y permisos JobCron.
10. Dejar Cart, POS, GovernmentTender, TMS, WMS, BI y CRM como fases separadas
    con documento de alcance antes de programar.

## Informacion faltante critica

| Tema | Informacion faltante |
|---|---|
| Ramas y publicacion | Confirmar si se trabaja en `dev`, `pro`, `main` o ramas feature por repo. |
| Ambientes | URLs, bases, variables y credenciales de desarrollo/staging/produccion. |
| Seguridad | RBAC/ABAC final, MFA publico, rate limit y secretos. |
| Storage | Proveedor para documentos legales/fiscales y politica de retencion. |
| OCR | Motor productivo, idioma, salida requerida y costo aceptable. |
| SAT/PAC | Estrategia de descarga, timbrado, cancelacion y consentimiento. |
| Catalogo real | Productos, categorias, imagenes, precios, stock y proveedor. |
| Legal LexNova | Materias iniciales, tipos documentales, jurisdiccion y visibilidad cliente. |
| Fiscal Fiscora | Planes, creditos, limites y complementos prioritarios. |
| Operacion Tecno Telec | Si el MVP cotiza, vende directo, captura leads o hace checkout. |

## Documentos revisados

Obligatorios:

- `Docs/_meta/master-index.md`
- `Docs/_meta/master-index.yaml`
- `Docs/_meta/navigation-map.md`
- `Docs/README.md`

Auditoria y metadatos:

- `Docs/00_audit/02_missing_documents.md`
- `Docs/00_audit/03_inconsistencies.md`
- `Docs/00_audit/04_document_status.md`
- `Docs/00_audit/08_new_architecture_review.md`
- `Docs/00_audit/09_api_routes_inventory.md`
- `Docs/_meta/api_documentation_report.md`
- `Docs/_meta/database_documentation_report.md`
- `Docs/_meta/frontend_documentation_report.md`
- `Docs/_meta/quality_gate_report.md`
- `Docs/pendientes/pendientes.md`

Ecosistema y proyectos:

- `Docs/02_projects/_ecosystem/00_ecosystem_overview.md`
- `Docs/02_projects/_ecosystem/03_development_strategy.md`
- `Docs/02_projects/_ecosystem/04_process_convergence_and_conflicts.md`
- `Docs/02_projects/_ecosystem/05_lexnova_docucore_fiscora_mvp_alignment.md`
- `Docs/02_projects/docucore/mvp-roadmap.md`
- `Docs/02_projects/docucore/api-contracts.md`
- `Docs/02_projects/fiscora/tasks/01_pending_tasks.md`
- `Docs/02_projects/fiscora/tasks/02_cfdi_multiversion_implementation.md`
- `Docs/02_projects/lexnova/document-intelligence.md`
- `Docs/02_projects/lexnova/document-api-integration-review.md`
- `Docs/02_projects/lexnova/legal-process-data-model.md`
- `Docs/02_projects/lexnova/tasks/definition-questionnaire.md`
- `Docs/02_projects/tecnotelec/AGENTE.md`
- `Docs/02_projects/tecnotelec/tasks/00_pending_tasks.md`
- `Docs/02_projects/tecnotelec/tasks/01_required_apis.md`
- `Docs/02_projects/tecnotelec/tasks/04_development_order.md`

Core y estandares:

- `Docs/01_core_erp/apis/00_api_index.md`
- `Docs/01_core_erp/apis/01_auth_api.md`
- `Docs/01_core_erp/apis/13_billing_api.md`
- `Docs/01_core_erp/architecture/04_security.md`
- `Docs/03_standards/operations/git-repository-map.md`

## Documentos fuera del analisis detallado

- Documentos `ARCHIVE_REFERENCE`, salvo que explicaran una decision vigente.
- Templates de `Docs/templates`.
- Archivos fuente archivados en `_archive`, salvo las referencias ya resumidas
  por documentos canonicos.
- Documentos de proyectos `FUTURE_OR_PENDING` muy tempranos se tomaron como
  lista de alcance futuro, no como especificacion implementable.

## Decisiones tomadas con base en la documentacion

- No crear APIs nuevas solo porque existan proyectos futuros; primero se exige
  owner, MVP y frontera de responsabilidad.
- Priorizar Fiscora, DocuCore, LexNova y Tecno Telec porque tienen MVPs y
  contratos ya empezados.
- Mantener gateways como frontera de frontend; las webs no deben consumir APIs
  core directamente.
- Mantener Document API/DocuCore como capacidad reusable para OCR, archivos e
  inteligencia documental.
- Mantener Fiscal como autoridad de XML/SAT/CFDI; Fiscora es producto SaaS y
  Gateway es frontera web.
- Mantener Sales como cotizacion MVP solo mientras Quote/Projects no se separe
  formalmente.
