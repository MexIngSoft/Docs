# AGENTS-002.md

# ARQUITECTURA OFICIAL DEL ECOSISTEMA JOBCRON

## OBJETIVO

Este agente tiene la responsabilidad de consolidar la arquitectura oficial del ecosistema y eliminar cualquier arquitectura paralela, experimental, obsoleta o contradictoria.

Debe garantizar que todas las APIs, webs, aplicaciones, ETLs, módulos y proyectos utilicen la misma estructura arquitectónica.

Ningún proyecto puede definir una arquitectura diferente sin un ADR aprobado.

---

# OBJETIVO PRINCIPAL

Construir un ecosistema escalable basado en:

* Reutilización.
* Modularidad.
* Responsabilidad única.
* APIs compartidas.
* PostgreSQL.
* Docker.
* Gateway General.
* Auth Centralizado.
* JobCron ERP.

---

# ARQUITECTURA OFICIAL

La arquitectura oficial es:

Cliente
→ Web / Aplicación
→ Gateway General
→ APIs de Dominio
→ PostgreSQL

Todos los proyectos deben seguir esta estructura.

---

# COMPONENTES DEL ECOSISTEMA

## Cliente

Puede ser:

* Navegador Web
* Aplicación Android
* Aplicación iOS
* Aplicación Desktop
* Integración Externa
* API Externa

Nunca accede directamente a PostgreSQL.

Nunca accede directamente a tablas.

Nunca accede directamente a servicios internos.

---

## Webs

Ejemplos:

* Refapart
* TecnoTelec
* LexNova
* DocuCore
* Fiscora
* Imagrafity

Responsabilidades:

* Presentación.
* Navegación.
* Experiencia de usuario.
* Captura de información.
* Visualización de datos.

No contienen lógica de negocio crítica.

No realizan consultas directas a PostgreSQL.

---

## Aplicaciones Móviles

Ejemplos:

* Android
* iOS

Responsabilidades:

* Interfaz móvil.
* Notificaciones.
* Consumo de APIs.

No contienen lógica de negocio central.

---

# GATEWAY GENERAL

Existe únicamente un Gateway General.

Responsabilidades:

* Enrutamiento.
* Autenticación.
* Autorización.
* Rate Limiting.
* Agregación.
* Observabilidad.
* Auditoría.
* Versionado.

Debe ser reutilizable para todos los proyectos.

---

# PROHIBICIONES DE GATEWAY

No se permite:

* Gateway Refapart.
* Gateway LexNova.
* Gateway Fiscora.
* Gateway TecnoTelec.
* Gateway DocuCore.
* Gateway Imagrafity.
* BFF por proyecto.
* BFF por cliente.

Toda referencia a estos conceptos debe eliminarse.

---

# AUTH CENTRAL

Existe una sola API Auth.

Responsabilidades:

* Usuarios.
* Roles.
* Permisos.
* JWT.
* Refresh Tokens.
* Sesiones.
* Auditoría.

Todas las APIs utilizan Auth.

Todas las webs utilizan Auth.

---

# APIS DE DOMINIO

Las APIs deben tener responsabilidad única.

---

## Catalog API

Responsable de:

* Productos.
* Categorías.
* Marcas.
* Imágenes.
* Características.

No maneja inventario.

No maneja precios.

---

## Inventory API

Responsable de:

* Existencias.
* Almacenes.
* Movimientos.
* Ajustes.
* Ubicaciones.

No maneja productos.

---

## Pricing API

Responsable de:

* Precios.
* Promociones.
* Descuentos.
* Impuestos.
* Márgenes.

No maneja inventario.

---

## Procurement API

Responsable de:

* Compras.
* Órdenes de compra.
* Recepciones.
* Abastecimiento.

---

## Supplier API

Responsable de:

* Proveedores.
* Contactos.
* Convenios.
* Catálogos proveedor.

---

## Sales API

Responsable de:

* Cotizaciones.
* Ventas.
* Facturación.
* Cobranza.

---

## Search API

Responsable de:

* Búsquedas.
* Indexación.
* Sugerencias.
* Ranking.

Debe ser compartida.

---

## Notification API

Responsable de:

* Correos.
* WhatsApp.
* SMS.
* Notificaciones Push.

---

## Document API

Responsable de:

* PDF.
* Word.
* Excel.
* Conversión documental.
* Workspace documental.

---

# JOBCRON ERP

JobCron es el administrador del ecosistema.

Responsabilidades:

* Gestión de proyectos.
* Gestión de APIs.
* Gestión de módulos.
* Gestión de configuraciones.
* Gestión de permisos.
* Gestión de despliegues.
* Gestión documental.
* Gestión comercial.

No reemplaza las APIs de dominio.

---

# POSTGRESQL

PostgreSQL es la única base de datos oficial.

Todos los servicios deben utilizar PostgreSQL.

---

# PROHIBICIONES DE BASE DE DATOS

Eliminar cualquier referencia a:

* SQLite
* sqlite
* db.sqlite3
* embedded database
* file database
* fallback database

No existen excepciones.

---

# ESTRUCTURA DE BASE DE DATOS

Cada API debe tener:

Schema propio.

Ejemplos:

auth
catalog
inventory
pricing
supplier
procurement
sales
search
document
notification

Debe evitarse compartir tablas entre dominios.

---

# DOCKER OFICIAL

Infraestructura:

Docker.DB
Docker.API.PY
Docker.WEB.NJ

---

# REDES

Debe existir una red compartida.

Objetivos:

* Comunicación entre APIs.
* Comunicación con PostgreSQL.
* Comunicación con Gateway.
* Comunicación con Auth.

No crear redes aisladas innecesarias.

---

# ETLS

Los ETLs deben:

* Esperar PostgreSQL saludable.
* Esperar APIs requeridas.
* Ser tolerantes a fallos.
* Reanudar procesos.
* Evitar duplicados.
* Mantener auditoría.

---

# PROYECTOS DEL ECOSISTEMA

Todos los proyectos deben consumir:

Gateway General
+
Auth
+
APIs necesarias

Nunca deben reinventar componentes existentes.

---

# VALIDACIONES OBLIGATORIAS

Verificar:

* Arquitectura.
* Dependencias.
* APIs.
* Docker.
* PostgreSQL.
* Seguridad.
* Permisos.
* Integraciones.

---

# ENTREGABLES

Actualizar:

* Diagramas.
* Arquitectura.
* README.
* ADRs.
* Índices de APIs.
* Mapa de repositorios.

---

# RESULTADO ESPERADO

Al finalizar:

* Existirá una sola arquitectura oficial.
* Existirá un solo Gateway General.
* Existirá una sola estrategia PostgreSQL.
* Existirá una sola integración Auth.
* Todas las APIs tendrán responsabilidad única.
* Todos los proyectos estarán alineados con la arquitectura del ecosistema.
