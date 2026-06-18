Aquí tienes el **AGENTS-004 completo** para copiarlo y pegarlo en Codex.

# AGENTS-004.md

# ADR, MATRIZ DE DEPENDENCIAS Y CRITERIOS DE CIERRE DEL ECOSISTEMA

## OBJETIVO

Este agente tiene la responsabilidad de crear y reforzar las decisiones arquitectónicas oficiales del ecosistema JobCron.

Debe evitar que Codex, agentes futuros o desarrolladores vuelvan a crear contradicciones sobre Docker, Gateway, Auth, PostgreSQL, APIs, proyectos o criterios de cierre.

Este agente no implementa nuevas funcionalidades de negocio hasta dejar cerrada la base documental y operativa.

---

# OBJETIVO PRINCIPAL

Garantizar que el repositorio tenga:

* ADRs oficiales.
* Matriz proyecto → APIs.
* Matriz API → responsabilidades.
* Matriz Docker → objetivo.
* Criterios de terminado.
* Reglas de eliminación documental.
* Reglas de validación.
* Cierre correcto de agentes.

---

# REGLAS ARQUITECTÓNICAS OBLIGATORIAS

Todo el repositorio debe obedecer estas decisiones:

1. Un Docker por objetivo.
2. Un Gateway General único.
3. Un Auth compartido.
4. PostgreSQL obligatorio.
5. APIs por responsabilidad.
6. Webs separadas por proyecto.
7. JobCron como ERP administrador.
8. Integraciones externas mediante APIs internas.
9. Documentación contradictoria eliminada o archivada.
10. Agents cerrados solo con validación real.

---

# ADR OBLIGATORIO

Crear el archivo:

```text
01_core_erp/architecture/ADR-001-arquitectura-base-jobcron.md
```

Contenido mínimo obligatorio:

```text
# ADR-001 - Arquitectura base JobCron

## Estado

Aceptado.

## Contexto

El ecosistema JobCron administra múltiples webs, APIs, integraciones, módulos comerciales, módulos documentales y proyectos especializados.

Para evitar duplicidad, contradicciones y costos innecesarios, se adopta una arquitectura centralizada por objetivo.

## Decisión

Se establece como arquitectura oficial:

Cliente
→ Web/App
→ Gateway General
→ APIs de Dominio
→ PostgreSQL

## Decisiones obligatorias

1. Existe un solo Docker.DB.
2. Existe un solo Docker.API.PY.
3. Existe un solo Docker.WEB.NJ.
4. Existe un solo Gateway General.
5. Existe un solo Auth compartido.
6. PostgreSQL es la única base de datos permitida.
7. Las APIs se organizan por responsabilidad.
8. Las webs se organizan por proyecto.
9. Los compose por proyecto solo seleccionan servicios existentes.
10. Ninguna web consume integraciones externas directamente.

## Rechazado

Queda rechazado:

- Docker por proyecto.
- Gateway por proyecto.
- BFF por proyecto.
- Auth por proyecto.
- SQLite.
- db.sqlite3.
- Bases temporales embebidas.
- APIs duplicadas.
- Integraciones externas consumidas desde frontend.

## Consecuencias

Todo documento, agent o implementación futura debe seguir esta decisión.

Si existe contradicción, este ADR prevalece.

Si una funcionalidad requiere excepción, debe crearse un nuevo ADR antes de implementarla.
```

---

# MATRIZ DOCKER POR OBJETIVO

Crear o actualizar:

```text
01_core_erp/architecture/docker-objective-matrix.md
```

Contenido obligatorio:

```text
# Matriz Docker por objetivo

## Regla principal

El ecosistema no usa un Docker por proyecto.

El ecosistema usa un Docker por objetivo.

## Docker.DB

Responsabilidad:

- PostgreSQL.
- Bases.
- Schemas.
- Usuarios.
- Backups.
- Restore.
- Healthchecks.

No contiene:

- APIs.
- Webs.
- ETLs.
- Código de negocio.

## Docker.API.PY

Responsabilidad:

- APIs Django.
- APIs FastAPI si existen.
- Auth.
- Gateway General.
- APIs compartidas.
- APIs especializadas.
- Integraciones internas.
- ETLs cuando correspondan.

No contiene:

- Webs Next.js.
- PostgreSQL.
- Frontend.

## Docker.WEB.NJ

Responsabilidad:

- Webs Next.js.
- JobCron.
- Refapart.
- LexNova.
- DocuCore.
- Fiscora.
- TecnoTelec.
- Imagrafity.

No contiene:

- PostgreSQL.
- APIs Django.
- Integraciones externas directas.

## Compose por proyecto

Los compose por proyecto son opcionales.

Solo pueden:

- Seleccionar servicios existentes.
- Levantar dependencias necesarias.
- Facilitar desarrollo local.
- Configurar variables de entorno.

Nunca pueden:

- Crear otro Docker por proyecto.
- Crear otro Gateway.
- Crear otro Auth.
- Crear otra base.
- Crear APIs duplicadas.
```

---

# MATRIZ PROYECTO → APIS

Crear o actualizar:

```text
01_core_erp/architecture/project-api-dependency-matrix.md
```

Contenido mínimo obligatorio:

```text
# Matriz Proyecto → APIs

## Regla principal

Los proyectos consumen APIs existentes mediante Gateway General.

No deben crear APIs nuevas si ya existe una API compartida que cubra la responsabilidad.

---

## JobCron

Consume:

- Gateway General
- Auth
- FeatureVisibility
- Catalog
- Inventory
- Pricing
- Supplier
- Procurement
- Sales
- Search
- Notification
- Document
- ETL

Responsabilidad:

ERP administrador del ecosistema.

---

## Refapart

Consume:

- Gateway General
- Auth
- Search
- Supplier
- Catalog
- Pricing
- Sales
- Notification
- FeatureVisibility
- Refapart API

Refapart API solo debe contener lógica exclusiva de refacciones.

---

## TecnoTelec

Consume:

- Gateway General
- Auth
- Catalog
- Inventory
- Pricing
- Supplier
- Sales
- Search
- Notification
- FeatureVisibility
- ETL

No debe tener Gateway propio.

No debe consumir Syscom directo desde frontend.

---

## LexNova

Consume:

- Gateway General
- Auth
- Document
- Search
- Notification
- FeatureVisibility
- LexNova API

LexNova API solo debe contener lógica jurídica.

---

## DocuCore

Consume:

- Gateway General
- Auth
- Document
- Search
- Notification
- FeatureVisibility

No debe tener Gateway propio.

---

## Fiscora

Consume:

- Gateway General
- Auth
- Document
- Search
- Notification
- FeatureVisibility
- Fiscora API

Fiscora API solo debe contener lógica fiscal/contable.

---

## Imagrafity

Consume:

- Gateway General
- Auth
- Catalog
- Pricing
- Sales
- Document
- Notification
- FeatureVisibility

No debe tener Gateway propio.
```

---

# MATRIZ API → RESPONSABILIDAD

Crear o actualizar:

```text
01_core_erp/apis/api-responsibility-matrix.md
```

Contenido obligatorio:

```text
# Matriz API → Responsabilidad

## Auth

Responsable de:

- Usuarios.
- Roles.
- Permisos.
- JWT.
- Refresh Tokens.
- Sesiones.
- Auditoría de acceso.

No maneja negocio.

---

## Gateway General

Responsable de:

- Routing.
- Autenticación.
- Autorización.
- Rate limiting.
- Agregación.
- Observabilidad.
- Auditoría.
- Versionado.

No contiene lógica de negocio específica.

---

## Catalog

Responsable de:

- Productos.
- Categorías.
- Marcas.
- Imágenes.
- Specs.
- Variantes.

No maneja inventario.
No maneja ventas.
No maneja compras.

---

## Inventory

Responsable de:

- Stock.
- Almacenes.
- Ubicaciones.
- Movimientos.
- Ajustes.
- Lotes.
- Series.

No define productos.
No define precios.

---

## Pricing

Responsable de:

- Precios.
- Márgenes.
- Descuentos.
- Impuestos.
- Promociones.
- Históricos.

No mueve inventario.
No vende.

---

## Supplier

Responsable de:

- Proveedores.
- Contactos.
- Condiciones.
- Productos proveedor.
- Precios proveedor.
- Documentos proveedor.

---

## Procurement

Responsable de:

- Solicitudes de compra.
- Órdenes de compra.
- Recepciones.
- Devoluciones proveedor.
- Abastecimiento.

---

## Sales

Responsable de:

- Clientes.
- Cotizaciones.
- Órdenes de venta.
- Pagos.
- Facturación.
- Devoluciones cliente.

---

## Search

Responsable de:

- Indexación.
- Búsqueda.
- Sugerencias.
- Sinónimos.
- Ranking.
- Demanda no encontrada.

---

## Document

Responsable de:

- PDF.
- Word.
- Excel.
- XML.
- ZIP.
- Conversión documental.
- Limpieza documental.
- Workspace documental.

---

## Notification

Responsable de:

- Email.
- WhatsApp.
- SMS.
- Push.
- Plantillas.
- Cola de envío.
- Registro de entregas.

---

## FeatureVisibility

Responsable de:

- Módulos visibles.
- Módulos ocultos.
- Disponibilidad por proyecto.
- Disponibilidad por país/estado/ciudad.
- Activación progresiva.
- Fases de desarrollo.

---

## ETL

Responsable de:

- Importaciones.
- Exportaciones.
- Sincronizaciones.
- Reintentos.
- Recuperación de fallos.
- Logs de carga.
```

---

# REGLA DE ELIMINACIÓN DOCUMENTAL

Crear o actualizar:

```text
03_standards/documentation/documentation-cleanup-standard.md
```

Contenido obligatorio:

```text
# Estándar de limpieza documental

## Regla principal

La documentación contradictoria no puede permanecer activa.

Cuando una decisión cambia:

- Se elimina.
o
- Se mueve a archive.

No se permite conservar instrucciones antiguas dentro de documentación activa.

## Debe eliminarse documentación activa que indique:

- Docker por proyecto.
- Gateway por proyecto.
- BFF por proyecto.
- Auth por proyecto.
- SQLite.
- db.sqlite3.
- APIs duplicadas.
- Integraciones externas directas desde frontend.

## Permitido

Solo se permite mencionar decisiones rechazadas dentro de ADRs, con estado RECHAZADO.

## Validación

Antes de cerrar cualquier agent debe buscarse:

- SQLite
- sqlite
- db.sqlite3
- Gateway por proyecto
- BFF por proyecto
- Docker por proyecto
- Auth por proyecto
```

---

# CRITERIOS DE TERMINADO

Crear o actualizar:

```text
03_standards/operations/definition-of-done.md
```

Contenido obligatorio:

```text
# Definition of Done del ecosistema JobCron

Un cambio solo puede considerarse terminado si cumple:

## Documentación

- Documentación actualizada.
- Índices actualizados.
- ADR actualizado si cambia arquitectura.
- EXECUTION_REPORT.md actualizado.

## Arquitectura

- No contradice AGENTS-000.
- No contradice ADR-001.
- No crea Gateway por proyecto.
- No crea Docker por proyecto.
- No crea Auth por proyecto.
- No usa SQLite.

## Backend

- Usa PostgreSQL.
- Tiene migraciones.
- Tiene healthcheck.
- Tiene permisos.
- Tiene logs.
- Tiene manejo de errores.

## Frontend

- Consume Gateway General.
- No consume PostgreSQL.
- No consume integraciones externas directas.
- No usa datos mock si existe API real.
- Compila.

## Docker

- Usa Docker por objetivo.
- Usa red compartida.
- No crea infraestructura paralela.
- Compose valida correctamente.

## Validación

Debe ejecutarse al menos:

- docker compose config
- migraciones
- tests disponibles
- build frontend si aplica
- healthchecks disponibles

## Bloqueo

No cerrar si:

- Hay contradicciones activas.
- Hay documentación pendiente.
- Hay código sin validar.
- Hay mocks falsos.
- Hay SQLite.
- Hay Gateway por proyecto.
```

---

# ACTUALIZACIÓN DE AGENTS

Revisar todos los archivos:

```text
agents/AGENTS-*.md
```

Cada agent debe:

* Respetar AGENTS-000.
* Respetar ADR-001.
* Respetar Docker por objetivo.
* Respetar Gateway General.
* Respetar PostgreSQL.
* Respetar Auth compartido.
* Actualizar EXECUTION_REPORT.md.

Si un agent contradice estas reglas:

* Corregirlo si sigue activo.
* Archivarlo si quedó obsoleto.
* No dejar contradicciones activas.

---

# VALIDACIÓN FINAL OBLIGATORIA

Antes de cerrar este agent buscar en todo el repositorio:

```text
SQLite
sqlite
db.sqlite3
Gateway por proyecto
BFF por proyecto
Docker por proyecto
Auth por proyecto
API.PY.DJANGO.*.Gateway
```

Resultado esperado:

Solo pueden aparecer dentro de ADRs o documentos de decisiones rechazadas.

---

# REPORTE FINAL

Actualizar:

```text
EXECUTION_REPORT.md
```

Debe incluir:

* ADR creado.
* Matrices creadas.
* Estándares actualizados.
* Agents corregidos.
* Documentos archivados.
* Contradicciones eliminadas.
* Validaciones ejecutadas.
* Pendientes reales.

---

# CRITERIO DE CIERRE

Este agente solo puede cerrarse cuando:

* Existe ADR-001.
* Existe matriz Docker.
* Existe matriz proyecto → APIs.
* Existe matriz API → responsabilidad.
* Existe estándar de limpieza documental.
* Existe definition of done.
* No quedan contradicciones activas.
* EXECUTION_REPORT.md está actualizado.
