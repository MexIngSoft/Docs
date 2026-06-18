Sí. Este debe ser el **agente ejecutor global**, después de AGENTS-000 a AGENTS-004. Yo lo pondría como **AGENTS-005.md**.

# AGENTS-005.md

# EJECUCIÓN GLOBAL DE CORRECCIONES, IMPLEMENTACIÓN Y VALIDACIÓN POR PROYECTO

## OBJETIVO

Este agente se encarga de ejecutar todos los cambios pendientes después de que AGENTS-000, AGENTS-001, AGENTS-002, AGENTS-003 y AGENTS-004 hayan corregido la arquitectura documental base.

Su responsabilidad es revisar cada proyecto, cada API y cada web del ecosistema, detectar faltantes reales y corregirlos o implementarlos siguiendo la arquitectura oficial.

---

# DEPENDENCIA OBLIGATORIA

Antes de iniciar este agente deben estar completados:

* AGENTS-000
* AGENTS-001
* AGENTS-002
* AGENTS-003
* AGENTS-004

No continuar si todavía existen contradicciones activas sobre:

* Gateway por proyecto.
* BFF por proyecto.
* Docker por proyecto.
* SQLite.
* Auth por proyecto.
* APIs duplicadas.

---

# PRINCIPIOS OBLIGATORIOS

Todo cambio debe obedecer:

* Un Docker por objetivo.
* Un Gateway General único.
* Auth compartido.
* PostgreSQL obligatorio.
* APIs por responsabilidad.
* Webs por proyecto.
* Integraciones externas mediante APIs internas.
* Documentación actualizada.
* Validación real antes de cerrar.

---

# ALCANCE

Este agente debe revisar e implementar lo necesario en:

## Infraestructura

* Docker.DB
* Docker.API.PY
* Docker.WEB.NJ

## APIs

* Auth
* Gateway General
* Catalog
* Inventory
* Pricing
* Supplier
* Procurement
* Sales
* Search
* Document
* Notification
* FeatureVisibility
* ETL
* APIs especializadas existentes

## Webs

* JobCron
* Refapart
* LexNova
* DocuCore
* Fiscora
* TecnoTelec
* Imagrafity

## Documentación

* README.md
* 01_core_erp
* 02_projects
* 03_standards
* agents
* EXECUTION_REPORT.md

---

# FASE 1 - REVISIÓN DEL ESTADO REAL

Antes de implementar:

1. Revisar documentación canónica.
2. Revisar matriz proyecto → APIs.
3. Revisar matriz API → responsabilidad.
4. Revisar Docker por objetivo.
5. Revisar repositorios existentes.
6. Revisar código real de APIs.
7. Revisar código real de webs.
8. Revisar migraciones.
9. Revisar variables de entorno.
10. Revisar compose.

Generar lista de:

* APIs existentes.
* APIs faltantes.
* APIs incompletas.
* Webs existentes.
* Webs incompletas.
* Módulos documentados no implementados.
* Implementaciones sin documentación.
* Contradicciones restantes.

---

# FASE 2 - INFRAESTRUCTURA DOCKER

Corregir o crear lo necesario para que exista:

## Docker.DB

Debe contener:

* PostgreSQL.
* Usuarios.
* Schemas.
* Healthcheck.
* Backup.
* Restore.
* Scripts iniciales.

## Docker.API.PY

Debe contener:

* Todas las APIs Python.
* Dependencias compartidas.
* Configuración para PostgreSQL.
* Configuración para red compartida.
* Configuración para Gateway General.
* Configuración para Auth.

## Docker.WEB.NJ

Debe contener:

* Todas las webs Next.js.
* Configuración para consumir Gateway General.
* Variables por proyecto.
* Build funcional.

---

# FASE 3 - POSTGRESQL

Validar o implementar:

* Base principal.
* Schemas por responsabilidad.
* Usuarios.
* Permisos.
* Migraciones.
* Seeds.
* Healthcheck.
* Conexión desde APIs.
* Eliminación de SQLite.
* Eliminación de db.sqlite3.

No se permite fallback a SQLite.

---

# FASE 4 - AUTH

Validar o implementar:

* Usuarios.
* Roles.
* Permisos.
* JWT.
* Refresh Tokens.
* Sesiones.
* Validación de token.
* Auditoría de acceso.
* Seed inicial de permisos por proyecto.
* Integración con Gateway General.
* Integración con APIs.

---

# FASE 5 - GATEWAY GENERAL

Validar o implementar:

* Routing hacia APIs.
* Validación Auth.
* Autorización.
* Rate limiting.
* Healthcheck.
* Observabilidad.
* Manejo de errores.
* Versionado.
* Configuración por proyecto.
* Registro de servicios.

Eliminar cualquier Gateway por proyecto.

---

# FASE 6 - APIS COMPARTIDAS

Validar o implementar endpoints mínimos en cada API compartida.

## Catalog

Debe tener:

* productos
* categorías
* marcas
* imágenes
* specs
* variantes
* healthcheck

## Inventory

Debe tener:

* almacenes
* ubicaciones
* stock
* movimientos
* ajustes
* healthcheck

## Pricing

Debe tener:

* listas de precios
* precios
* descuentos
* impuestos
* márgenes
* promociones
* healthcheck

## Supplier

Debe tener:

* proveedores
* contactos
* direcciones
* productos proveedor
* precios proveedor
* condiciones
* healthcheck

## Procurement

Debe tener:

* solicitudes de compra
* órdenes de compra
* recepciones
* devoluciones
* healthcheck

## Sales

Debe tener:

* clientes
* cotizaciones
* órdenes de venta
* pagos
* devoluciones
* healthcheck

## Search

Debe tener:

* indexación
* búsqueda
* sugerencias
* sinónimos
* ranking
* demanda no encontrada
* healthcheck

## Document

Debe tener:

* PDF
* Word
* Excel
* XML
* ZIP
* conversión
* limpieza
* healthcheck

## Notification

Debe tener:

* plantillas
* email
* WhatsApp
* SMS
* push
* logs de entrega
* healthcheck

## FeatureVisibility

Debe tener:

* módulos visibles
* módulos ocultos
* disponibilidad por proyecto
* disponibilidad por región
* disponibilidad por rol
* fases de desarrollo
* healthcheck

## ETL

Debe tener:

* importaciones
* exportaciones
* sincronizaciones
* reintentos
* logs
* recuperación de fallos
* healthcheck

---

# FASE 7 - APIS ESPECIALIZADAS

Solo implementar APIs especializadas cuando exista lógica exclusiva.

## Refapart API

Debe cubrir:

* solicitudes de refacciones
* flujo de búsqueda de pieza
* proveedor sugerido
* cotización proveedor
* cotización cliente
* margen
* logística
* seguimiento
* auditoría

## LexNova API

Debe cubrir:

* personas
* expedientes
* asuntos
* juicios
* amparos
* apelaciones
* documentos jurídicos
* análisis jurídico

## Fiscora API

Debe cubrir:

* clientes fiscales
* documentos fiscales
* obligaciones
* declaraciones
* seguimiento contable
* integraciones fiscales

No crear APIs especializadas si la funcionalidad puede resolverse con APIs compartidas.

---

# FASE 8 - WEBS

Todas las webs deben:

* Consumir Gateway General.
* Usar Auth.
* Respetar FeatureVisibility.
* No consumir PostgreSQL.
* No consumir integraciones externas directo.
* No depender de mocks si existe API real.
* Compilar.
* Tener metadata.
* Tener favicon.
* Tener layout responsive.
* Tener manejo de errores.

---

## JobCron

Debe implementar:

* dashboard general
* proyectos
* APIs
* módulos
* features
* usuarios
* permisos
* configuración
* prospectos
* integraciones
* reportes

---

## Refapart

Debe implementar:

* home
* búsqueda de piezas
* solicitud de refacción
* seguimiento
* panel administrativo
* proveedores
* cotizaciones
* logística
* pedidos

---

## TecnoTelec

Debe implementar:

* catálogo
* categorías
* marcas
* productos
* precios
* existencias
* cotización
* integración Syscom mediante APIs internas

---

## LexNova

Debe implementar:

* dashboard legal
* casos
* personas
* documentos
* expedientes
* análisis
* resultados
* administración

---

## DocuCore

Debe implementar:

* upload
* workspace
* herramientas documentales
* preview
* historial
* procesamiento real mediante Document API

---

## Fiscora

Debe implementar:

* dashboard fiscal
* clientes
* documentos
* obligaciones
* declaraciones
* seguimiento

---

## Imagrafity

Debe implementar:

* catálogo
* editor
* solicitudes de personalización
* carrito
* pedidos
* administración de diseños

---

# FASE 9 - INTEGRACIONES EXTERNAS

Revisar e implementar integraciones mediante APIs internas.

Integraciones previstas:

* Syscom
* Apify
* SAT
* WhatsApp
* Google Maps
* Google Business
* OpenAI

Regla:

Ninguna web consume integraciones externas directamente.

---

# FASE 10 - DOCUMENTACIÓN

Actualizar documentación por cada cambio:

* README.md
* índices
* arquitectura
* APIs
* proyectos
* estándares
* matrices
* ADRs
* EXECUTION_REPORT.md

No dejar documentación pendiente.

---

# FASE 11 - VALIDACIÓN

Ejecutar validaciones disponibles:

* docker compose config
* migraciones
* tests backend
* build frontend
* healthchecks
* endpoints mínimos
* búsqueda global de contradicciones

Buscar y eliminar contradicciones:

* SQLite
* db.sqlite3
* Gateway por proyecto
* BFF por proyecto
* Docker por proyecto
* Auth por proyecto

---

# FASE 12 - CRITERIOS DE CIERRE

No cerrar este agente si:

* Falla Docker.
* Falla PostgreSQL.
* Falta migración.
* Falta healthcheck.
* Falla build frontend.
* Quedan mocks donde existe API real.
* Queda documentación contradictoria.
* Queda Gateway por proyecto.
* Queda SQLite.
* Queda implementación sin documentación.

---

# REPORTE FINAL

Actualizar:

EXECUTION_REPORT.md

Debe incluir:

* APIs revisadas.
* APIs modificadas.
* APIs creadas.
* Webs revisadas.
* Webs modificadas.
* Docker corregido.
* PostgreSQL validado.
* Integraciones revisadas.
* Documentación actualizada.
* Validaciones ejecutadas.
* Pendientes reales.
* Razones verificables de lo no implementado.

---

# RESULTADO ESPERADO

Al finalizar este agente:

* La documentación estará alineada con la implementación.
* Las APIs necesarias existirán o estarán claramente marcadas como pendientes.
* Las webs consumirán Gateway General.
* PostgreSQL será la única base usada.
* Docker estará organizado por objetivo.
* No existirán Gateways por proyecto.
* No existirán bases SQLite.
* Cada proyecto tendrá lo mínimo necesario para continuar desarrollo real.
