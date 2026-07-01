Sí. Basado en la estructura del repo Docs: lo reutilizable va en `01_core_erp`, lo específico de Refapart va en `02_projects/refapart`, y todas las webs deben consumir el Gateway General; las APIs especializadas solo aplican si tienen lógica exclusiva del dominio. ([GitHub][1])

## Perfiles Refapart recomendados

### MVP inmediato

| Perfil                             | Vive en                                             | Qué hace                                                                          |
| ---------------------------------- | --------------------------------------------------- | --------------------------------------------------------------------------------- |
| **Cliente / Buscador**             | Refapart + Auth común                               | Busca piezas, crea solicitud, guarda dirección, confirma compra/cotización.       |
| **Cotizador / Gestor de búsqueda** | Refapart                                            | Contacta proveedores, registra respuestas, compara precios, arma cotización.      |
| **Administrador Refapart**         | Refapart                                            | Gestiona solicitudes, proveedores, piezas, estados, usuarios internos y reportes. |
| **Proveedor**                      | Refapart ahora; luego JobCron si se vuelve multiweb | Recibe solicitudes, responde existencia, precio, condición, tiempo de entrega.    |

### Futuro cercano

| Perfil                                       | Cuándo agregarlo               | Qué hace                                                          |
| -------------------------------------------- | ------------------------------ | ----------------------------------------------------------------- |
| **Repartidor / Logística**                   | Cuando haya entregas propias   | Recibe orden de entrega, actualiza estado, evidencia entrega.     |
| **Soporte / Atención al cliente**            | Cuando aumenten clientes       | Atiende dudas, cambios, reclamos, seguimiento WhatsApp/correo.    |
| **Supervisor de cotizadores**                | Cuando haya varios cotizadores | Revisa tiempos, reasigna solicitudes, valida cotizaciones.        |
| **Administrador global MexIngSof / JobCron** | Desde arquitectura base        | Ve varias webs/proyectos, módulos compartidos, permisos globales. |

## Qué va en Refapart

Debe quedar en la API o módulo especializado de Refapart:

* Solicitudes de piezas.
* Compatibilidad pieza/marca/modelo/año.
* Estados de búsqueda de refacción.
* Cotizaciones de proveedores para una solicitud.
* Ranking o historial específico de proveedores de autopartes.
* Flujo “no encontré la pieza → crear solicitud”.
* Panel de cotizador Refapart.
* Panel admin Refapart.
* Reglas de negocio propias de autopartes: nueva/usada, deshuesadero, pieza equivalente, pieza compatible.

## Qué va en JobCron / Core ERP

Debe vivir como estructura compartida porque puede usarse en Refapart y otras webs:

* Usuarios, roles y permisos.
* Clientes.
* Direcciones.
* Empresas/proveedores base.
* Contactos.
* Cotización genérica.
* Órdenes.
* Pagos.
* Facturación.
* Notificaciones.
* Estados genéricos.
* Auditoría/eventos del sistema.
* Gateway General.
* Catálogo de módulos y permisos reutilizables.

## Estructura compartida con otras webs

Los eventos compartidos deberían quedar como **eventos de negocio reutilizables**, no amarrados solo a Refapart:

| Evento              | Compartido | Uso Refapart                          |
| ------------------- | ---------: | ------------------------------------- |
| `UserRegistered`    |         Sí | Cliente/proveedor se registra.        |
| `AddressCreated`    |         Sí | Cliente agrega dirección de envío.    |
| `QuoteRequested`    |         Sí | Cliente solicita pieza.               |
| `QuoteAssigned`     |         Sí | Admin asigna solicitud a cotizador.   |
| `ProviderContacted` |    Parcial | Es específico de búsqueda/proveedor.  |
| `ProviderQuoted`    |    Parcial | Proveedor responde precio/existencia. |
| `QuoteApproved`     |         Sí | Cliente acepta cotización.            |
| `OrderCreated`      |         Sí | Se crea orden.                        |
| `PaymentRegistered` |         Sí | Pago contra entrega o pago online.    |
| `DeliveryScheduled` |         Sí | Se agenda entrega.                    |
| `DeliveryCompleted` |         Sí | Se cierra entrega.                    |

## Roles mínimos para migración

```text
REFAPART_CUSTOMER
REFAPART_QUOTER
REFAPART_PROVIDER
REFAPART_ADMIN
JOBCRON_GLOBAL_ADMIN
```

Después:

```text
REFAPART_SUPPORT
REFAPART_LOGISTICS
REFAPART_QUOTER_SUPERVISOR
```

## Sintaxis para Codex

```text
TAREA CODEX — DEFINIR E IMPLEMENTAR PERFILES REFAPART + JOBCRON

Contexto:
Trabajar en rama general. No crear APIs duplicadas. Todas las webs consumen Gateway General. Lo reutilizable va en JobCron/Core ERP; lo exclusivo de autopartes va en Refapart.

Lectura obligatoria:
- Docs/README.md
- Docs/_meta/active-work-index.md
- Docs/01_core_erp/apis/reusable-api-contracts.md
- Docs/01_core_erp/apis/gateway-route-registry.md
- Docs/03_standards/architecture/api-gateway-standard.md
- Docs/03_standards/auth/web-auth-login-standard.md
- Docs/02_projects/refapart/*
- Docs/03_standards/database/sql-server-publication-standard.md

Objetivo:
Implementar el modelo de perfiles, permisos y migraciones para Refapart, separando correctamente lo específico de Refapart y lo reutilizable en JobCron/Core ERP.

Perfiles MVP:
1. REFAPART_CUSTOMER
   - Busca piezas.
   - Crea solicitudes.
   - Consulta sus cotizaciones.
   - Acepta cotizaciones.
   - Administra sus direcciones.

2. REFAPART_QUOTER
   - Ve solicitudes asignadas.
   - Contacta proveedores.
   - Registra respuestas.
   - Crea cotizaciones internas.
   - Cambia estados operativos de búsqueda.

3. REFAPART_PROVIDER
   - Recibe solicitudes enviadas por Refapart.
   - Responde existencia, precio, condición, garantía y tiempo de entrega.
   - Consulta historial propio.

4. REFAPART_ADMIN
   - Administra solicitudes, proveedores, cotizadores, estados, piezas y reportes.
   - Reasigna solicitudes.
   - Cancela o cierra procesos.

5. JOBCRON_GLOBAL_ADMIN
   - Administra módulos, permisos, usuarios globales y configuración compartida.

Perfiles futuro cercano:
- REFAPART_SUPPORT
- REFAPART_LOGISTICS
- REFAPART_QUOTER_SUPERVISOR

Regla de ubicación:
- JobCron/Core ERP:
  usuarios, roles, permisos, clientes, direcciones, proveedores base, contactos, cotización genérica, órdenes, pagos, facturación, notificaciones, estados genéricos y auditoría.
- Refapart:
  solicitudes de piezas, compatibilidad automotriz, cotizaciones de autopartes, contacto con proveedores, respuestas de proveedor, flujo de búsqueda de pieza y reglas específicas de autopartes.

Implementación requerida:
1. Crear/actualizar seeds o migraciones de roles.
2. Crear/actualizar permisos por módulo.
3. Asociar roles con permisos.
4. Documentar matriz rol-permiso.
5. Registrar rutas Gateway necesarias.
6. Validar que el frontend Refapart oculte/permita acciones según permisos.
7. No hardcodear permisos en componentes si ya existe sistema central.
8. No crear base de datos nueva salvo que ya esté documentada.
9. Usar nombres PascalCase en tablas/campos publicados.
10. Actualizar mapa de acciones de código.

Permisos sugeridos:
- RefapartRequest.Create
- RefapartRequest.ReadOwn
- RefapartRequest.ReadAll
- RefapartRequest.Assign
- RefapartRequest.UpdateStatus
- RefapartQuote.Create
- RefapartQuote.ReadOwn
- RefapartQuote.ReadAll
- RefapartQuote.Approve
- RefapartProvider.Read
- RefapartProvider.Create
- RefapartProvider.Update
- RefapartProvider.Contact
- RefapartProvider.ResponseCreate
- RefapartAdmin.Manage
- RefapartReports.Read

Criterio de cierre:
- Migraciones aplicadas o seeds preparados.
- Roles creados sin duplicados.
- Permisos documentados.
- Gateway actualizado.
- Frontend Refapart consume permisos reales.
- Refapart no duplica usuarios, direcciones, clientes, pagos ni notificaciones.
- JobCron/Core conserva lo reutilizable.
```

Mi recomendación: para salir rápido, implementa ahora **Cliente, Cotizador, Proveedor, Admin Refapart y Admin Global**. Los demás déjalos documentados, pero no los metas todavía al flujo si no hay reparto, soporte formal o varios cotizadores.

[1]: https://github.com/MexIngSoft/Docs/tree/general "GitHub - MexIngSoft/Docs at general · GitHub"



Confirmo lectura del repositorio `Docs/tree/general`. La documentación define separar **núcleo ERP reutilizable** en `01_core_erp`, **proyectos específicos** en `02_projects`, estándares en `03_standards`, y obliga a que todas las webs consuman el **Gateway General**, dejando APIs especializadas solo cuando exista lógica exclusiva del dominio. ([GitHub][1])

## Webs afectadas

| Web / Proyecto                                         | Afectación                                                                                                |
| ------------------------------------------------------ | --------------------------------------------------------------------------------------------------------- |
| **Refapart**                                           | Panel cliente, cotizador, proveedor y administrador Refapart.                                             |
| **JobCron**                                            | Panel administrador global, permisos, módulos, usuarios, auditoría y configuración compartida.            |
| **MexIngSof**                                          | Solo si muestra acceso comercial, login central o administración global.                                  |
| **TecnoTelec**                                         | Afectación futura por reutilizar clientes, direcciones, cotizaciones, órdenes y permisos.                 |
| **PhoneShop / Imagrafity / Innovation Engines Repair** | Afectación futura por compartir estructura de cliente, proveedor, cotización, pedido, pago y seguimiento. |

El repo lista estos proyectos dentro de `02_projects`, incluyendo `jobcron`, `mexingsof`, `refapart`, `phone-shop`, `imagrafity`, `innovation-engines-repair` y `tecnotelec`. ([GitHub][2])

# Documento propuesto

```markdown
# Refapart — Documentación de Paneles por Perfil, APIs, Tablas y Responsabilidades

## 1. Objetivo

Definir los paneles activos de Refapart para MVP, indicando:

- qué ve cada perfil;
- qué acciones puede realizar;
- qué datos consume;
- qué tablas utiliza;
- qué APIs consume por Gateway;
- qué vive en Refapart;
- qué vive en JobCron/Core ERP;
- qué estructura se comparte con otras webs del ecosistema MexIngSof.

## 2. Regla arquitectónica

Refapart no debe duplicar módulos reutilizables.

### Va en JobCron/Core ERP

- usuarios;
- roles;
- permisos;
- módulos;
- clientes;
- direcciones;
- proveedores base;
- contactos;
- cotización genérica;
- órdenes;
- pagos;
- facturación;
- notificaciones;
- auditoría;
- eventos globales;
- configuración por sistema/proyecto.

### Va en Refapart

- solicitudes de piezas;
- búsqueda de autopartes;
- compatibilidad marca/modelo/año;
- cotizaciones específicas de refacciones;
- contacto operativo con proveedores;
- respuestas de proveedores sobre piezas;
- estados propios de búsqueda de refacción;
- reglas de piezas nuevas/usadas/deshuesadero;
- paneles operativos Refapart.

## 3. Perfiles activos MVP

### 3.1 Cliente / Buscador

Rol técnico:

- REFAPART_CUSTOMER

Objetivo:

Permitir que una persona busque una pieza, cree una solicitud, consulte cotizaciones, acepte una opción y dé seguimiento a su pedido.

Secciones del panel:

1. Inicio
2. Buscar pieza
3. Mis solicitudes
4. Mis cotizaciones
5. Mis pedidos
6. Direcciones
7. Favoritos
8. Mensajes
9. Perfil

Contenido por sección:

### Inicio

Debe mostrar:

- saludo personalizado;
- buscador rápido de pieza;
- botón “No encontré mi pieza”;
- resumen de solicitudes activas;
- cotizaciones recibidas;
- pedidos activos;
- favoritos;
- últimas solicitudes;
- estado de la última solicitud.

Datos:

- usuario autenticado;
- conteo de solicitudes;
- conteo de cotizaciones;
- conteo de pedidos;
- última solicitud;
- últimas respuestas de proveedores.

APIs Gateway:

- GET /gateway/auth/me
- GET /gateway/refapart/customer/dashboard
- GET /gateway/refapart/requests?owner=me
- GET /gateway/refapart/quotes?owner=me
- GET /gateway/refapart/orders?owner=me

Tablas JobCron/Core:

- Auth.UserAccounts
- Auth.UserRoles
- Auth.Roles
- Auth.Permissions
- Core.Customers
- Core.CustomerContacts
- Address.Addresses
- Core.Notifications

Tablas Refapart:

- Refapart.PartRequests
- Refapart.PartRequestStatuses
- Refapart.PartQuotes
- Refapart.VehicleModels
- Refapart.VehicleBrands
- Refapart.Parts
- Refapart.CustomerFavoriteParts

Acciones permitidas:

- crear solicitud;
- consultar solicitudes propias;
- consultar cotizaciones propias;
- aceptar cotización;
- agregar dirección;
- marcar favorito;
- enviar mensaje.

Permisos:

- RefapartRequest.Create
- RefapartRequest.ReadOwn
- RefapartQuote.ReadOwn
- RefapartQuote.Approve
- RefapartOrder.ReadOwn
- Address.CreateOwn
- Address.ReadOwn
- Notification.ReadOwn

---

### 3.2 Cotizador / Gestor de búsqueda

Rol técnico:

- REFAPART_QUOTER

Objetivo:

Gestionar solicitudes asignadas, contactar proveedores, registrar respuestas, preparar cotizaciones y dar seguimiento hasta que el cliente acepte o rechace.

Secciones del panel:

1. Panel cotizador
2. Solicitudes asignadas
3. Buscar proveedores
4. Proveedores contactados
5. Cotizaciones
6. Mensajes
7. Reportes
8. Perfil

Contenido por sección:

### Panel cotizador

Debe mostrar:

- solicitudes asignadas;
- solicitudes en búsqueda;
- cotizaciones listas;
- solicitudes pendientes por cliente;
- tabla de solicitudes asignadas;
- acciones rápidas.

Datos:

- total asignadas;
- total en búsqueda;
- total con cotización lista;
- total pendientes del cliente;
- solicitudes vencidas o próximas a vencer;
- proveedores contactados por solicitud.

APIs Gateway:

- GET /gateway/refapart/quoter/dashboard
- GET /gateway/refapart/requests?assignedTo=me
- PATCH /gateway/refapart/requests/{id}/status
- POST /gateway/refapart/requests/{id}/provider-contacts
- POST /gateway/refapart/quotes
- GET /gateway/refapart/providers/search

Tablas JobCron/Core:

- Auth.UserAccounts
- Auth.UserRoles
- Core.Employees
- Core.Notifications
- Core.Messages
- Core.BusinessContacts

Tablas Refapart:

- Refapart.PartRequests
- Refapart.PartRequestAssignments
- Refapart.PartRequestProviderContacts
- Refapart.PartProviderResponses
- Refapart.PartQuotes
- Refapart.RefapartProviders
- Refapart.ProviderPartCapabilities
- Refapart.PartRequestStatusHistory

Acciones permitidas:

- ver solicitudes asignadas;
- cambiar estado operativo;
- contactar proveedores;
- registrar respuesta;
- crear cotización;
- enviar mensaje interno;
- solicitar revisión de administrador.

Permisos:

- RefapartRequest.ReadAssigned
- RefapartRequest.UpdateStatusAssigned
- RefapartProvider.Search
- RefapartProvider.Contact
- RefapartProvider.ResponseCreate
- RefapartQuote.Create
- RefapartMessage.Create
- RefapartReport.ReadOwn

Estados visibles:

- Nueva
- Asignada
- En búsqueda
- Proveedores contactados
- Cotización lista
- Pendiente cliente
- Aceptada
- Rechazada
- Cancelada
- Cerrada

---

### 3.3 Proveedor

Rol técnico:

- REFAPART_PROVIDER

Objetivo:

Permitir que proveedores respondan solicitudes de piezas con existencia, precio, condición, garantía, ubicación y tiempo estimado de entrega.

Secciones del panel:

1. Panel proveedor
2. Solicitudes recibidas
3. Respuestas enviadas
4. Catálogo de piezas
5. Mensajes
6. Perfil
7. Configuración

Contenido por sección:

### Panel proveedor

Debe mostrar:

- solicitudes nuevas;
- pendientes de respuesta;
- respondidas hoy;
- índice de respuesta;
- tabla de solicitudes recibidas;
- estadísticas de desempeño.

Datos:

- solicitudes recibidas;
- solicitudes pendientes;
- respuestas enviadas;
- tasa de respuesta;
- tiempo promedio de respuesta;
- calificación promedio;
- historial de piezas cotizadas.

APIs Gateway:

- GET /gateway/refapart/provider/dashboard
- GET /gateway/refapart/provider/requests
- POST /gateway/refapart/provider/responses
- GET /gateway/refapart/provider/responses
- PATCH /gateway/refapart/provider/profile
- GET /gateway/refapart/provider/catalog

Tablas JobCron/Core:

- Auth.UserAccounts
- Core.Companies
- Core.BusinessContacts
- Core.SupplierProfiles
- Core.Notifications
- Core.Messages

Tablas Refapart:

- Refapart.RefapartProviders
- Refapart.ProviderPartCapabilities
- Refapart.PartRequestProviderContacts
- Refapart.PartProviderResponses
- Refapart.ProviderCatalogParts
- Refapart.ProviderRatings

Acciones permitidas:

- ver solicitudes recibidas;
- responder disponibilidad;
- indicar precio;
- indicar condición;
- indicar garantía;
- indicar tiempo de entrega;
- actualizar perfil;
- consultar desempeño.

Permisos:

- RefapartProviderPanel.Access
- RefapartProviderRequest.ReadOwn
- RefapartProviderResponse.Create
- RefapartProviderResponse.ReadOwn
- RefapartProviderCatalog.ManageOwn
- RefapartProviderProfile.UpdateOwn

Campos mínimos de respuesta del proveedor:

- PartRequestId
- ProviderId
- HasAvailability
- Price
- Currency
- Condition
- WarrantyDays
- EstimatedDeliveryTime
- Notes
- ResponseStatus
- CreatedAt

---

### 3.4 Administrador Refapart

Rol técnico:

- REFAPART_ADMIN

Objetivo:

Administrar la operación completa de Refapart: solicitudes, cotizadores, proveedores, piezas, categorías, estados, reportes y configuración operativa del proyecto.

Secciones del panel:

1. Panel admin
2. Solicitudes
3. Cotizadores
4. Proveedores
5. Usuarios Refapart
6. Piezas y categorías
7. Cotizaciones
8. Pedidos
9. Reportes
10. Configuración
11. Bitácora

Contenido por sección:

### Panel admin

Debe mostrar:

- total de solicitudes;
- solicitudes en proceso;
- cotizaciones listas;
- pedidos completados;
- gráfica de solicitudes por estado;
- gráfica de solicitudes por día;
- actividad reciente;
- acciones rápidas.

Datos:

- métricas generales;
- solicitudes por estado;
- cotizadores activos;
- proveedores activos;
- solicitudes vencidas;
- cotizaciones aprobadas;
- pedidos cerrados;
- tiempos promedio.

APIs Gateway:

- GET /gateway/refapart/admin/dashboard
- GET /gateway/refapart/admin/requests
- PATCH /gateway/refapart/admin/requests/{id}/assign
- PATCH /gateway/refapart/admin/requests/{id}/status
- GET /gateway/refapart/admin/providers
- POST /gateway/refapart/admin/providers
- PATCH /gateway/refapart/admin/providers/{id}
- GET /gateway/refapart/admin/reports
- GET /gateway/refapart/admin/audit

Tablas JobCron/Core:

- Auth.UserAccounts
- Auth.Roles
- Auth.UserRoles
- Auth.Permissions
- Core.Employees
- Core.Customers
- Core.Companies
- Core.Notifications
- Core.AuditLogs
- Core.SystemEvents

Tablas Refapart:

- Refapart.PartRequests
- Refapart.PartRequestAssignments
- Refapart.PartRequestStatusHistory
- Refapart.PartQuotes
- Refapart.RefapartProviders
- Refapart.ProviderRatings
- Refapart.VehicleBrands
- Refapart.VehicleModels
- Refapart.Parts
- Refapart.PartCategories
- Refapart.PartEquivalences
- Refapart.RefapartOrders

Acciones permitidas:

- ver todo;
- asignar solicitudes;
- reasignar cotizadores;
- administrar proveedores;
- administrar piezas;
- administrar estados;
- ver reportes;
- cerrar solicitudes;
- cancelar solicitudes;
- revisar bitácora.

Permisos:

- RefapartAdmin.Access
- RefapartRequest.ReadAll
- RefapartRequest.Assign
- RefapartRequest.Reassign
- RefapartRequest.UpdateStatusAll
- RefapartProvider.Create
- RefapartProvider.Update
- RefapartProvider.Disable
- RefapartParts.Manage
- RefapartReports.ReadAll
- RefapartAudit.Read

---

### 3.5 Administrador Global JobCron

Rol técnico:

- JOBCRON_GLOBAL_ADMIN

Objetivo:

Controlar la plataforma compartida: sistemas, módulos, usuarios globales, permisos, roles, Gateway, logs, eventos, configuración y salud general.

Secciones del panel:

1. Panel global
2. Módulos
3. Usuarios globales
4. Roles y permisos
5. Sistemas / proyectos
6. Configuración
7. Logs del sistema
8. Reportes
9. Eventos

Contenido por sección:

### Panel global

Debe mostrar:

- sistemas activos;
- usuarios totales;
- módulos activos;
- uptime;
- uso de recursos;
- actividad del sistema;
- proyectos registrados;
- acciones rápidas.

Datos:

- proyectos activos;
- usuarios por sistema;
- módulos por proyecto;
- errores recientes;
- permisos actualizados;
- eventos publicados;
- rutas Gateway activas.

APIs Gateway:

- GET /gateway/jobcron/admin/dashboard
- GET /gateway/jobcron/systems
- GET /gateway/jobcron/modules
- GET /gateway/jobcron/users
- GET /gateway/jobcron/roles
- GET /gateway/jobcron/permissions
- POST /gateway/jobcron/roles
- PATCH /gateway/jobcron/roles/{id}
- GET /gateway/jobcron/audit
- GET /gateway/jobcron/events

Tablas JobCron/Core:

- Core.Systems
- Core.Modules
- Core.ModuleActions
- Auth.UserAccounts
- Auth.Roles
- Auth.Permissions
- Auth.RolePermissions
- Auth.UserRoles
- Core.AuditLogs
- Core.SystemEvents
- Core.GatewayRoutes
- Core.ProjectSettings

Tablas Refapart:

No debe depender directamente de tablas Refapart, salvo reportes federados a través del Gateway.

Acciones permitidas:

- crear sistema;
- activar/desactivar módulo;
- crear roles;
- asignar permisos;
- revisar usuarios;
- revisar auditoría;
- revisar eventos;
- configurar rutas y módulos.

Permisos:

- JobCronAdmin.Access
- JobCronSystem.Manage
- JobCronModule.Manage
- JobCronUser.ReadAll
- JobCronRole.Manage
- JobCronPermission.Manage
- JobCronAudit.Read
- JobCronGateway.Read
- JobCronEvent.Read

## 4. Tablas propuestas

## 4.1 JobCron/Core ERP

### Auth.UserAccounts

Uso:

Usuarios autenticados de todo el ecosistema.

Campos mínimos:

- Id
- Email
- Password
- FirstName
- LastName
- IsActive
- IsStaff
- CreatedAt
- UpdatedAt

### Auth.Roles

Uso:

Roles reutilizables por sistema.

Campos:

- Id
- Code
- Name
- Description
- SystemCode
- IsActive
- CreatedAt
- UpdatedAt

### Auth.Permissions

Uso:

Permisos granulares por acción.

Campos:

- Id
- Code
- Name
- Description
- ModuleCode
- IsActive
- CreatedAt
- UpdatedAt

### Auth.RolePermissions

Uso:

Relación rol-permiso.

Campos:

- Id
- RoleId
- PermissionId
- CreatedAt

### Auth.UserRoles

Uso:

Relación usuario-rol.

Campos:

- Id
- UserId
- RoleId
- CreatedAt
- UpdatedAt

### Core.Systems

Uso:

Registrar Refapart, JobCron, MexIngSof, TecnoTelec y futuras webs.

Campos:

- Id
- Code
- Name
- Domain
- IsActive
- CreatedAt
- UpdatedAt

### Core.Modules

Uso:

Módulos por sistema.

Campos:

- Id
- SystemId
- Code
- Name
- Description
- IsActive
- CreatedAt
- UpdatedAt

### Core.ModuleActions

Uso:

Acciones funcionales trazables por módulo.

Campos:

- Id
- ModuleId
- Code
- Name
- PermissionCode
- RoutePath
- CreatedAt
- UpdatedAt

### Core.Customers

Uso:

Clientes reutilizables por varias webs.

Campos:

- Id
- UserId
- CustomerType
- DisplayName
- Phone
- Email
- CreatedAt
- UpdatedAt

### Core.Companies

Uso:

Empresas proveedoras o clientes empresa.

Campos:

- Id
- Name
- LegalName
- TaxId
- Phone
- Email
- Website
- CreatedAt
- UpdatedAt

### Address.Addresses

Uso:

Direcciones reutilizables por clientes, proveedores y entregas.

Campos:

- Id
- OwnerType
- OwnerId
- Street
- ExteriorNumber
- InteriorNumber
- Neighborhood
- City
- State
- PostalCode
- Country
- Reference
- Latitude
- Longitude
- CreatedAt
- UpdatedAt

### Core.Notifications

Uso:

Notificaciones internas y futuras integraciones.

Campos:

- Id
- UserId
- SystemCode
- Title
- Message
- NotificationType
- IsRead
- CreatedAt

### Core.AuditLogs

Uso:

Bitácora global.

Campos:

- Id
- SystemCode
- UserId
- ActionCode
- EntityName
- EntityId
- OldValue
- NewValue
- CreatedAt

### Core.SystemEvents

Uso:

Eventos reutilizables.

Campos:

- Id
- SystemCode
- EventCode
- EntityName
- EntityId
- PayloadJson
- CreatedAt
- ProcessedAt

---

## 4.2 Refapart

### Refapart.PartRequests

Uso:

Solicitud principal de búsqueda de pieza.

Campos:

- Id
- CustomerId
- VehicleBrandId
- VehicleModelId
- VehicleYear
- PartId
- PartNameText
- Description
- StatusCode
- Priority
- ShippingAddressId
- CreatedAt
- UpdatedAt
- ClosedAt

### Refapart.PartRequestAssignments

Uso:

Asignación de solicitud a cotizador.

Campos:

- Id
- PartRequestId
- QuoterUserId
- AssignedByUserId
- AssignedAt
- IsActive

### Refapart.PartRequestStatuses

Uso:

Catálogo de estados específicos.

Campos:

- Id
- Code
- Name
- Description
- SortOrder
- IsFinal
- IsActive

### Refapart.PartRequestStatusHistory

Uso:

Historial de cambios de estado.

Campos:

- Id
- PartRequestId
- PreviousStatusCode
- NewStatusCode
- ChangedByUserId
- Notes
- CreatedAt

### Refapart.RefapartProviders

Uso:

Proveedor específico de autopartes.

Campos:

- Id
- CompanyId
- ProviderCode
- MainContactId
- City
- State
- Speciality
- IsActive
- RatingAverage
- CreatedAt
- UpdatedAt

### Refapart.PartRequestProviderContacts

Uso:

Registro de proveedor contactado para una solicitud.

Campos:

- Id
- PartRequestId
- ProviderId
- ContactedByUserId
- ContactMethod
- ContactStatus
- ContactedAt
- Notes

### Refapart.PartProviderResponses

Uso:

Respuesta del proveedor.

Campos:

- Id
- PartRequestProviderContactId
- ProviderId
- HasAvailability
- Price
- Currency
- Condition
- WarrantyDays
- EstimatedDeliveryTime
- Notes
- ResponseStatus
- CreatedAt

### Refapart.PartQuotes

Uso:

Cotización presentada al cliente.

Campos:

- Id
- PartRequestId
- ProviderResponseId
- CreatedByUserId
- CustomerId
- Price
- ShippingCost
- ServiceFee
- Total
- Currency
- QuoteStatus
- ValidUntil
- CreatedAt
- AcceptedAt
- RejectedAt

### Refapart.Parts

Uso:

Catálogo base de piezas.

Campos:

- Id
- Code
- Name
- CategoryId
- Description
- IsActive
- CreatedAt
- UpdatedAt

### Refapart.PartCategories

Uso:

Categorías de piezas.

Campos:

- Id
- Code
- Name
- ParentId
- IsActive

### Refapart.VehicleBrands

Uso:

Marcas vehiculares.

Campos:

- Id
- Code
- Name
- IsActive

### Refapart.VehicleModels

Uso:

Modelos vehiculares.

Campos:

- Id
- BrandId
- Code
- Name
- StartYear
- EndYear
- IsActive

### Refapart.PartEquivalences

Uso:

Compatibilidad o equivalencia entre piezas.

Campos:

- Id
- SourcePartId
- EquivalentPartId
- VehicleBrandId
- VehicleModelId
- StartYear
- EndYear
- Notes
- IsActive

### Refapart.RefapartOrders

Uso:

Orden Refapart ligada a cotización aceptada.

Campos:

- Id
- QuoteId
- CustomerId
- ShippingAddressId
- OrderStatus
- PaymentStatus
- DeliveryStatus
- CreatedAt
- UpdatedAt
- CompletedAt

## 5. APIs por panel

## 5.1 Cliente

- GET /gateway/refapart/customer/dashboard
- GET /gateway/refapart/requests?owner=me
- POST /gateway/refapart/requests
- GET /gateway/refapart/requests/{id}
- GET /gateway/refapart/quotes?owner=me
- POST /gateway/refapart/quotes/{id}/approve
- GET /gateway/refapart/orders?owner=me
- GET /gateway/address/my
- POST /gateway/address

## 5.2 Cotizador

- GET /gateway/refapart/quoter/dashboard
- GET /gateway/refapart/requests?assignedTo=me
- PATCH /gateway/refapart/requests/{id}/status
- POST /gateway/refapart/requests/{id}/provider-contacts
- GET /gateway/refapart/providers/search
- POST /gateway/refapart/provider-responses
- POST /gateway/refapart/quotes
- GET /gateway/refapart/reports/quoter

## 5.3 Proveedor

- GET /gateway/refapart/provider/dashboard
- GET /gateway/refapart/provider/requests
- POST /gateway/refapart/provider/responses
- GET /gateway/refapart/provider/responses
- GET /gateway/refapart/provider/catalog
- POST /gateway/refapart/provider/catalog
- PATCH /gateway/refapart/provider/profile

## 5.4 Admin Refapart

- GET /gateway/refapart/admin/dashboard
- GET /gateway/refapart/admin/requests
- PATCH /gateway/refapart/admin/requests/{id}/assign
- PATCH /gateway/refapart/admin/requests/{id}/status
- GET /gateway/refapart/admin/providers
- POST /gateway/refapart/admin/providers
- PATCH /gateway/refapart/admin/providers/{id}
- GET /gateway/refapart/admin/parts
- POST /gateway/refapart/admin/parts
- GET /gateway/refapart/admin/reports
- GET /gateway/refapart/admin/audit

## 5.5 Admin Global JobCron

- GET /gateway/jobcron/admin/dashboard
- GET /gateway/jobcron/systems
- GET /gateway/jobcron/modules
- GET /gateway/jobcron/users
- GET /gateway/jobcron/roles
- POST /gateway/jobcron/roles
- GET /gateway/jobcron/permissions
- PATCH /gateway/jobcron/roles/{id}/permissions
- GET /gateway/jobcron/audit
- GET /gateway/jobcron/events

## 6. Webs y secciones a diseñar

## 6.1 WEB.NJ.NEXT.RefaPart

Secciones a implementar:

### Públicas

- Home
- Buscador de pieza
- Resultado de búsqueda
- Crear solicitud sin encontrar pieza
- Login
- Registro
- Activación de cuenta
- Recuperar contraseña

### Cliente

- /panel
- /panel/buscar
- /panel/solicitudes
- /panel/cotizaciones
- /panel/pedidos
- /panel/direcciones
- /panel/favoritos
- /panel/mensajes
- /panel/perfil

### Cotizador

- /cotizador
- /cotizador/solicitudes
- /cotizador/proveedores
- /cotizador/contactos
- /cotizador/cotizaciones
- /cotizador/mensajes
- /cotizador/reportes

### Proveedor

- /proveedor
- /proveedor/solicitudes
- /proveedor/respuestas
- /proveedor/catalogo
- /proveedor/mensajes
- /proveedor/perfil
- /proveedor/configuracion

### Admin Refapart

- /admin
- /admin/solicitudes
- /admin/cotizadores
- /admin/proveedores
- /admin/usuarios
- /admin/piezas
- /admin/categorias
- /admin/cotizaciones
- /admin/pedidos
- /admin/reportes
- /admin/configuracion
- /admin/bitacora

## 6.2 WEB.NJ.NEXT.JobCron

Secciones:

- /admin-global
- /admin-global/sistemas
- /admin-global/modulos
- /admin-global/usuarios
- /admin-global/roles
- /admin-global/permisos
- /admin-global/gateway
- /admin-global/logs
- /admin-global/eventos
- /admin-global/reportes

Contenido:

- administración de sistemas;
- módulos activos;
- usuarios globales;
- roles por proyecto;
- permisos por módulo;
- rutas Gateway;
- eventos publicados;
- bitácora;
- configuración base.

## 6.3 WEB.NJ.NEXT.MexIngSof

Afectación mínima:

- acceso a login central;
- enlace a JobCron;
- página comercial de soluciones;
- posible panel interno corporativo futuro.

No debe duplicar paneles Refapart.

## 6.4 WEB.NJ.NEXT.TecnoTelec

Afectación futura:

- reutilizar clientes;
- reutilizar direcciones;
- reutilizar cotizaciones;
- reutilizar pedidos;
- reutilizar proveedores;
- reutilizar permisos.

No implementar todavía panel Refapart.

## 6.5 PhoneShop / Imagrafity / Innovation Engines Repair

Afectación futura:

Estas webs deberán compartir:

- clientes;
- direcciones;
- cotizaciones;
- pedidos;
- pagos;
- mensajes;
- notificaciones;
- eventos;
- roles base.

Cada una tendrá módulos específicos solo si su negocio lo requiere.

## 7. Eventos compartidos

Eventos globales:

- UserRegistered
- UserActivated
- AddressCreated
- QuoteRequested
- QuoteApproved
- OrderCreated
- PaymentRegistered
- DeliveryScheduled
- DeliveryCompleted
- NotificationSent

Eventos específicos Refapart:

- PartRequestCreated
- PartRequestAssigned
- ProviderContacted
- ProviderResponded
- RefapartQuoteCreated
- RefapartQuoteAccepted
- PartRequestClosed

## 8. Matriz rol-sección

| Sección | Cliente | Cotizador | Proveedor | Admin Refapart | Admin Global |
|---|---|---|---|---|---|
| Buscar pieza | Sí | No | No | Sí | No |
| Mis solicitudes | Sí | No | No | Sí | No |
| Solicitudes asignadas | No | Sí | No | Sí | No |
| Solicitudes recibidas | No | No | Sí | Sí | No |
| Cotizaciones | Sí | Sí | No | Sí | No |
| Proveedores | No | Sí | No | Sí | No |
| Catálogo proveedor | No | No | Sí | Sí | No |
| Usuarios | No | No | No | Sí, Refapart | Sí, global |
| Roles y permisos | No | No | No | No | Sí |
| Reportes | Limitado | Propios | Propios | Refapart | Global |
| Bitácora | No | No | No | Refapart | Global |

## 9. Criterios UX/UI

Todos los paneles deben usar:

- menú lateral por perfil;
- tarjetas de métricas;
- tabla principal;
- acciones rápidas;
- estados con etiquetas visuales;
- filtros por estado, fecha y prioridad;
- diseño responsive;
- permisos reales para ocultar acciones;
- mensajes claros de error;
- estados vacíos útiles;
- carga progresiva;
- confirmación antes de acciones destructivas.

## 10. Criterios de implementación

1. No hardcodear roles en componentes.
2. Usar permisos desde sesión o endpoint `/me/permissions`.
3. Toda llamada debe pasar por Gateway General.
4. Refapart no debe consumir directamente Auth, Address ni Core sin Gateway.
5. Las tablas reutilizables deben quedarse en JobCron/Core.
6. Las tablas específicas de autopartes deben quedarse en Refapart.
7. Cada acción importante debe registrar evento o auditoría.
8. Cada módulo debe tener mapa de acciones de código.
9. No crear bases de datos nuevas si no están documentadas.
10. Mantener nombres PascalCase en tablas/campos publicados.

## 11. Instrucción Codex

TAREA CODEX — IMPLEMENTAR DOCUMENTACIÓN Y BASE DE PANELES REFAPART

Rama:
general

Objetivo:
Crear e implementar la documentación técnica de paneles por perfil de Refapart y JobCron, dejando preparada la estructura de frontend, APIs, permisos, rutas Gateway, tablas y eventos.

Lectura obligatoria:
- Docs/README.md
- Docs/_meta/active-work-index.md
- Docs/01_core_erp/apis/reusable-api-contracts.md
- Docs/01_core_erp/apis/gateway-route-registry.md
- Docs/01_core_erp/apis/endpoint-ui-consumption-matrix.md
- Docs/03_standards/architecture/api-gateway-standard.md
- Docs/03_standards/frontend/ui-ux-standard.md
- Docs/03_standards/frontend/nextjs-project-standard.md
- Docs/03_standards/auth/web-auth-login-standard.md
- Docs/03_standards/database/sql-server-publication-standard.md
- Docs/02_projects/refapart/*
- Docs/02_projects/jobcron/*

Crear documento:
Docs/02_projects/refapart/frontend/20_role_dashboard_spec.md

Actualizar si existen:
- Docs/02_projects/refapart/frontend/00_frontend_overview.md
- Docs/02_projects/refapart/tasks/*
- Docs/01_core_erp/apis/gateway-route-registry.md
- Docs/01_core_erp/apis/endpoint-ui-consumption-matrix.md
- Docs/02_projects/_ecosystem/02_jobcron_shared_modules.md
- Docs/03_standards/product/module-catalog.md

Perfiles activos:
- REFAPART_CUSTOMER
- REFAPART_QUOTER
- REFAPART_PROVIDER
- REFAPART_ADMIN
- JOBCRON_GLOBAL_ADMIN

Implementar diseño base para:
- panel cliente;
- panel cotizador;
- panel proveedor;
- panel administrador Refapart;
- panel administrador global JobCron.

No implementar todavía:
- soporte;
- logística;
- supervisor de cotizadores.

Dejarlos solo documentados como futuro cercano.

Validaciones:
- No duplicar usuarios.
- No duplicar direcciones.
- No duplicar clientes.
- No duplicar proveedores base.
- No duplicar pagos.
- No duplicar notificaciones.
- Toda web consume Gateway General.
- Las APIs especializadas solo contienen lógica exclusiva de Refapart.
- Los permisos controlan navegación, botones y acciones.
- Los eventos quedan documentados.

Criterio de cierre:
- Documento creado.
- Webs afectadas enlistadas.
- Paneles definidos.
- Tablas documentadas.
- APIs documentadas.
- Eventos documentados.
- Permisos documentados.
- Rutas frontend documentadas.
- Pendientes futuros separados del MVP.
```

## Dónde pondría el documento

Ruta principal:

```text
Docs/02_projects/refapart/frontend/20_role_dashboard_spec.md
```

Y actualizaría índices/rutas en:

```text
Docs/01_core_erp/apis/gateway-route-registry.md
Docs/01_core_erp/apis/endpoint-ui-consumption-matrix.md
Docs/02_projects/_ecosystem/02_jobcron_shared_modules.md
Docs/03_standards/product/module-catalog.md
```

La base correcta para activar ahorita es: **Cliente, Cotizador, Proveedor, Admin Refapart y Admin Global JobCron**.

[1]: https://github.com/MexIngSoft/Docs/tree/general "GitHub - MexIngSoft/Docs at general · GitHub"
[2]: https://github.com/MexIngSoft/Docs/tree/general/02_projects "Docs/02_projects at general · MexIngSoft/Docs · GitHub"



Confirmo lectura del repo `Docs/general`: estructura canónica `01_core_erp`, `02_projects`, `03_standards`; todas las webs consumen **Gateway General** y las APIs especializadas solo aplican si tienen lógica exclusiva del dominio. ([GitHub][1])

## Webs que voy a diseñar en el boceto

| Web                                                                 | Paneles / áreas                                                                                                       |
| ------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------- |
| **WEB.NJ.NEXT.RefaPart**                                            | Cliente, Cotizador, Proveedor, Admin Refapart                                                                         |
| **WEB.NJ.NEXT.JobCron**                                             | Admin Global                                                                                                          |
| **MexIngSof**                                                       | Solo acceso/launcher corporativo hacia JobCron y proyectos                                                            |
| **TecnoTelec / PhoneShop / Imagrafity / Innovation Engines Repair** | No paneles ahora; solo preparadas para reutilizar Auth, clientes, direcciones, cotizaciones, pedidos, pagos y eventos |

## Áreas por perfil

| Perfil               | Áreas                                                                                                                                    |
| -------------------- | ---------------------------------------------------------------------------------------------------------------------------------------- |
| Cliente              | Inicio, Buscar pieza, Mis solicitudes, Cotizaciones, Pedidos, Direcciones, Favoritos, Mensajes, Perfil                                   |
| Cotizador            | Panel cotizador, Solicitudes asignadas, Proveedores, Contactos, Cotizaciones, Mensajes, Reportes, Perfil                                 |
| Proveedor            | Panel proveedor, Solicitudes recibidas, Respuestas enviadas, Catálogo, Mensajes, Perfil, Configuración                                   |
| Admin Refapart       | Dashboard, Solicitudes, Cotizadores, Proveedores, Usuarios, Piezas, Categorías, Cotizaciones, Pedidos, Reportes, Configuración, Bitácora |
| Admin Global JobCron | Dashboard global, Sistemas, Módulos, Usuarios, Roles, Permisos, Gateway, Logs, Eventos, Reportes                                         |

## Boceto base en código para Codex

```text
TAREA CODEX — DISEÑAR E IMPLEMENTAR PANELES REFAPART + JOBCron

Rama:
general

Objetivo:
Crear la base frontend completa de paneles por perfil según la imagen de referencia:
1. Cliente / Buscador
2. Cotizador / Gestor de búsqueda
3. Proveedor
4. Administrador Refapart
5. Administrador Global JobCron

Reglas:
- No hardcodear roles.
- Usar permisos reales desde Auth/Gateway.
- Toda API se consume por Gateway General.
- Refapart contiene solo lógica exclusiva de autopartes.
- JobCron/Core contiene usuarios, roles, permisos, módulos, clientes, direcciones, proveedores base, eventos, auditoría y configuración.
- Mantener diseño responsive.
- Usar componentes reutilizables.
```

## Estructura frontend sugerida

```txt
WEB.NJ.NEXT.RefaPart/
├─ app/
│  ├─ panel/
│  │  ├─ page.tsx
│  │  ├─ buscar/page.tsx
│  │  ├─ solicitudes/page.tsx
│  │  ├─ cotizaciones/page.tsx
│  │  ├─ pedidos/page.tsx
│  │  ├─ direcciones/page.tsx
│  │  ├─ favoritos/page.tsx
│  │  ├─ mensajes/page.tsx
│  │  └─ perfil/page.tsx
│  ├─ cotizador/
│  │  ├─ page.tsx
│  │  ├─ solicitudes/page.tsx
│  │  ├─ proveedores/page.tsx
│  │  ├─ contactos/page.tsx
│  │  ├─ cotizaciones/page.tsx
│  │  ├─ mensajes/page.tsx
│  │  └─ reportes/page.tsx
│  ├─ proveedor/
│  │  ├─ page.tsx
│  │  ├─ solicitudes/page.tsx
│  │  ├─ respuestas/page.tsx
│  │  ├─ catalogo/page.tsx
│  │  ├─ mensajes/page.tsx
│  │  ├─ perfil/page.tsx
│  │  └─ configuracion/page.tsx
│  └─ admin/
│     ├─ page.tsx
│     ├─ solicitudes/page.tsx
│     ├─ cotizadores/page.tsx
│     ├─ proveedores/page.tsx
│     ├─ usuarios/page.tsx
│     ├─ piezas/page.tsx
│     ├─ categorias/page.tsx
│     ├─ cotizaciones/page.tsx
│     ├─ pedidos/page.tsx
│     ├─ reportes/page.tsx
│     ├─ configuracion/page.tsx
│     └─ bitacora/page.tsx
├─ features/
│  ├─ dashboard/
│  ├─ refapart-requests/
│  ├─ refapart-quotes/
│  ├─ refapart-providers/
│  ├─ refapart-orders/
│  └─ permissions/
├─ components/
│  ├─ dashboards/
│  ├─ layout/
│  ├─ tables/
│  ├─ cards/
│  └─ ui/
└─ lib/
   └─ api/
      ├─ gateway-client.ts
      ├─ refapart-dashboard.ts
      ├─ refapart-requests.ts
      ├─ refapart-quotes.ts
      ├─ refapart-providers.ts
      └─ permissions.ts
```

## Componente base del layout

```tsx
// components/layout/RoleDashboardLayout.tsx

import Link from "next/link";

type MenuItem = {
  label: string;
  href: string;
  permission?: string;
};

type Props = {
  title: string;
  subtitle: string;
  menu: MenuItem[];
  children: React.ReactNode;
};

export function RoleDashboardLayout({ title, subtitle, menu, children }: Props) {
  return (
    <main className="min-h-screen bg-slate-50 text-slate-900">
      <div className="mx-auto grid max-w-7xl grid-cols-[240px_1fr] gap-6 p-6">
        <aside className="rounded-2xl border bg-white p-4 shadow-sm">
          <div className="mb-8 font-bold text-red-700">Refapart</div>

          <nav className="space-y-1">
            {menu.map((item) => (
              <Link
                key={item.href}
                href={item.href}
                className="block rounded-xl px-3 py-2 text-sm text-slate-700 hover:bg-blue-50 hover:text-blue-700"
              >
                {item.label}
              </Link>
            ))}
          </nav>
        </aside>

        <section>
          <header className="mb-6 flex items-center justify-between rounded-2xl border bg-white p-5 shadow-sm">
            <div>
              <h1 className="text-xl font-bold">{title}</h1>
              <p className="text-sm text-slate-500">{subtitle}</p>
            </div>

            <div className="flex items-center gap-3">
              <button className="rounded-xl border px-3 py-2 text-sm">🔔</button>
              <div className="h-10 w-10 rounded-full bg-slate-200" />
            </div>
          </header>

          {children}
        </section>
      </div>
    </main>
  );
}
```

## Componentes reutilizables

```tsx
// components/cards/MetricCard.tsx

type Props = {
  label: string;
  value: string | number;
  description?: string;
};

export function MetricCard({ label, value, description }: Props) {
  return (
    <article className="rounded-2xl border bg-white p-5 shadow-sm">
      <p className="text-sm text-slate-500">{label}</p>
      <strong className="mt-2 block text-2xl">{value}</strong>
      {description && <p className="mt-1 text-xs text-slate-400">{description}</p>}
    </article>
  );
}
```

```tsx
// components/ui/StatusBadge.tsx

export function StatusBadge({ status }: { status: string }) {
  return (
    <span className="rounded-full bg-blue-50 px-3 py-1 text-xs font-medium text-blue-700">
      {status}
    </span>
  );
}
```

## Panel Cliente

```tsx
// app/panel/page.tsx

import { RoleDashboardLayout } from "@/components/layout/RoleDashboardLayout";
import { MetricCard } from "@/components/cards/MetricCard";
import { StatusBadge } from "@/components/ui/StatusBadge";

const menu = [
  { label: "Inicio", href: "/panel" },
  { label: "Mis solicitudes", href: "/panel/solicitudes" },
  { label: "Mis cotizaciones", href: "/panel/cotizaciones" },
  { label: "Mis pedidos", href: "/panel/pedidos" },
  { label: "Direcciones", href: "/panel/direcciones" },
  { label: "Favoritos", href: "/panel/favoritos" },
  { label: "Mensajes", href: "/panel/mensajes" },
  { label: "Perfil", href: "/panel/perfil" },
];

export default function CustomerDashboardPage() {
  return (
    <RoleDashboardLayout
      title="¡Hola, Juan!"
      subtitle="Busca piezas, crea solicitudes y da seguimiento a tus cotizaciones."
      menu={menu}
    >
      <div className="grid gap-6">
        <section className="grid grid-cols-[1fr_220px] gap-4">
          <input
            placeholder="Ej. Filtro de aceite Ford F-150 2018"
            className="rounded-2xl border bg-white px-4 py-3 shadow-sm"
          />
          <button className="rounded-2xl bg-blue-700 px-4 py-3 font-medium text-white">
            Buscar pieza
          </button>
        </section>

        <section className="grid grid-cols-4 gap-4">
          <MetricCard label="Mis solicitudes" value={3} description="En proceso" />
          <MetricCard label="Cotizaciones" value={5} description="Recibidas" />
          <MetricCard label="Pedidos" value={2} description="Completados" />
          <MetricCard label="Favoritos" value={12} description="Guardados" />
        </section>

        <section className="grid grid-cols-2 gap-6">
          <div className="rounded-2xl border bg-white p-5 shadow-sm">
            <h2 className="mb-4 font-bold">Mis solicitudes recientes</h2>

            {[
              ["Faro delantero izquierdo", "Toyota Corolla 2016", "En búsqueda"],
              ["Alternador", "Nissan Sentra 2018", "Cotizaciones listas"],
              ["Parachoques trasero", "Honda Civic 2017", "En evaluación"],
            ].map(([pieza, vehiculo, estado]) => (
              <div key={pieza} className="flex items-center justify-between border-b py-3">
                <div>
                  <p className="font-medium">{pieza}</p>
                  <p className="text-sm text-slate-500">{vehiculo}</p>
                </div>
                <StatusBadge status={estado} />
              </div>
            ))}
          </div>

          <div className="rounded-2xl border bg-white p-5 shadow-sm">
            <h2 className="mb-4 font-bold">Estado de mi última solicitud</h2>
            <ol className="space-y-4 text-sm">
              <li>✅ Solicitud creada</li>
              <li>✅ En búsqueda con proveedores</li>
              <li>⏳ Cotizaciones en proceso</li>
              <li>○ Esperando evaluación</li>
            </ol>
          </div>
        </section>
      </div>
    </RoleDashboardLayout>
  );
}
```

## Panel Cotizador

```tsx
// app/cotizador/page.tsx

import { RoleDashboardLayout } from "@/components/layout/RoleDashboardLayout";
import { MetricCard } from "@/components/cards/MetricCard";
import { StatusBadge } from "@/components/ui/StatusBadge";

const menu = [
  { label: "Panel cotizador", href: "/cotizador" },
  { label: "Solicitudes asignadas", href: "/cotizador/solicitudes" },
  { label: "Proveedores", href: "/cotizador/proveedores" },
  { label: "Cotizaciones", href: "/cotizador/cotizaciones" },
  { label: "Mensajes", href: "/cotizador/mensajes" },
  { label: "Reportes", href: "/cotizador/reportes" },
  { label: "Perfil", href: "/cotizador/perfil" },
];

export default function QuoterDashboardPage() {
  return (
    <RoleDashboardLayout
      title="¡Hola, Carlos!"
      subtitle="Gestiona solicitudes asignadas, contacta proveedores y registra cotizaciones."
      menu={menu}
    >
      <section className="grid grid-cols-4 gap-4">
        <MetricCard label="Asignadas" value={8} />
        <MetricCard label="En búsqueda" value={5} />
        <MetricCard label="Cotizaciones listas" value={3} />
        <MetricCard label="Pendientes cliente" value={2} />
      </section>

      <section className="mt-6 rounded-2xl border bg-white p-5 shadow-sm">
        <h2 className="mb-4 font-bold">Solicitudes asignadas</h2>

        <table className="w-full text-sm">
          <thead className="text-left text-slate-500">
            <tr>
              <th>Solicitud</th>
              <th>Vehículo</th>
              <th>Pieza</th>
              <th>Estado</th>
              <th>Proveedores</th>
              <th>Acción</th>
            </tr>
          </thead>
          <tbody>
            {[
              ["#R-2024-00125", "Toyota Corolla 2016", "Faro delantero", "En búsqueda", "3/8"],
              ["#R-2024-00124", "Nissan Sentra 2018", "Alternador", "Cotizaciones listas", "5/10"],
            ].map((row) => (
              <tr key={row[0]} className="border-t">
                <td className="py-3">{row[0]}</td>
                <td>{row[1]}</td>
                <td>{row[2]}</td>
                <td><StatusBadge status={row[3]} /></td>
                <td>{row[4]}</td>
                <td><button className="rounded-lg border px-3 py-1">Ver</button></td>
              </tr>
            ))}
          </tbody>
        </table>
      </section>
    </RoleDashboardLayout>
  );
}
```

## Panel Proveedor

```tsx
// app/proveedor/page.tsx

import { RoleDashboardLayout } from "@/components/layout/RoleDashboardLayout";
import { MetricCard } from "@/components/cards/MetricCard";

const menu = [
  { label: "Panel proveedor", href: "/proveedor" },
  { label: "Solicitudes recibidas", href: "/proveedor/solicitudes" },
  { label: "Respuestas enviadas", href: "/proveedor/respuestas" },
  { label: "Catálogo de piezas", href: "/proveedor/catalogo" },
  { label: "Mensajes", href: "/proveedor/mensajes" },
  { label: "Mi perfil", href: "/proveedor/perfil" },
  { label: "Configuración", href: "/proveedor/configuracion" },
];

export default function ProviderDashboardPage() {
  return (
    <RoleDashboardLayout
      title="¡Hola, Autopartes del Norte!"
      subtitle="Recibe solicitudes de piezas y responde con disponibilidad y precio."
      menu={menu}
    >
      <section className="grid grid-cols-4 gap-4">
        <MetricCard label="Solicitudes nuevas" value={12} />
        <MetricCard label="Pendientes respuesta" value={7} />
        <MetricCard label="Respondidas hoy" value={15} />
        <MetricCard label="Índice de respuesta" value="98%" />
      </section>

      <section className="mt-6 rounded-2xl border bg-white p-5 shadow-sm">
        <h2 className="mb-4 font-bold">Solicitudes recibidas</h2>

        <table className="w-full text-sm">
          <thead className="text-left text-slate-500">
            <tr>
              <th>Solicitud</th>
              <th>Pieza</th>
              <th>Vehículo</th>
              <th>Fecha límite</th>
              <th>Acción</th>
            </tr>
          </thead>
          <tbody>
            {[
              ["#R-2024-00125", "Faro delantero izquierdo", "Toyota Corolla 2016", "22/05/2024"],
              ["#R-2024-00124", "Alternador", "Nissan Sentra 2018", "21/05/2024"],
            ].map((row) => (
              <tr key={row[0]} className="border-t">
                <td className="py-3">{row[0]}</td>
                <td>{row[1]}</td>
                <td>{row[2]}</td>
                <td>{row[3]}</td>
                <td>
                  <button className="rounded-lg bg-blue-700 px-3 py-1 text-white">
                    Responder
                  </button>
                </td>
              </tr>
            ))}
          </tbody>
        </table>
      </section>
    </RoleDashboardLayout>
  );
}
```

## Panel Admin Refapart

```tsx
// app/admin/page.tsx

import { RoleDashboardLayout } from "@/components/layout/RoleDashboardLayout";
import { MetricCard } from "@/components/cards/MetricCard";

const menu = [
  { label: "Panel admin", href: "/admin" },
  { label: "Solicitudes", href: "/admin/solicitudes" },
  { label: "Cotizadores", href: "/admin/cotizadores" },
  { label: "Proveedores", href: "/admin/proveedores" },
  { label: "Usuarios", href: "/admin/usuarios" },
  { label: "Piezas y categorías", href: "/admin/piezas" },
  { label: "Reportes", href: "/admin/reportes" },
  { label: "Configuración", href: "/admin/configuracion" },
  { label: "Bitácora", href: "/admin/bitacora" },
];

export default function RefapartAdminDashboardPage() {
  return (
    <RoleDashboardLayout
      title="¡Hola, Administrador!"
      subtitle="Resumen general de la operación Refapart."
      menu={menu}
    >
      <section className="grid grid-cols-4 gap-4">
        <MetricCard label="Solicitudes totales" value={156} />
        <MetricCard label="En proceso" value={85} />
        <MetricCard label="Cotizaciones listas" value={42} />
        <MetricCard label="Pedidos completados" value={29} />
      </section>

      <section className="mt-6 grid grid-cols-2 gap-6">
        <div className="rounded-2xl border bg-white p-5 shadow-sm">
          <h2 className="mb-4 font-bold">Solicitudes por estado</h2>
          <div className="flex h-56 items-center justify-center rounded-xl bg-slate-50 text-slate-400">
            Gráfica por estado
          </div>
        </div>

        <div className="rounded-2xl border bg-white p-5 shadow-sm">
          <h2 className="mb-4 font-bold">Solicitudes por día</h2>
          <div className="flex h-56 items-center justify-center rounded-xl bg-slate-50 text-slate-400">
            Gráfica últimos 7 días
          </div>
        </div>
      </section>
    </RoleDashboardLayout>
  );
}
```

## Panel Admin Global JobCron

```tsx
// WEB.NJ.NEXT.JobCron/app/admin-global/page.tsx

import { MetricCard } from "@/components/cards/MetricCard";
import { RoleDashboardLayout } from "@/components/layout/RoleDashboardLayout";

const menu = [
  { label: "Panel global", href: "/admin-global" },
  { label: "Módulos", href: "/admin-global/modulos" },
  { label: "Usuarios globales", href: "/admin-global/usuarios" },
  { label: "Roles y permisos", href: "/admin-global/roles" },
  { label: "Sistemas / proyectos", href: "/admin-global/sistemas" },
  { label: "Configuración", href: "/admin-global/configuracion" },
  { label: "Logs del sistema", href: "/admin-global/logs" },
  { label: "Reportes", href: "/admin-global/reportes" },
];

export default function JobCronGlobalAdminPage() {
  return (
    <RoleDashboardLayout
      title="¡Hola, Admin Global!"
      subtitle="Control central de la plataforma JobCron."
      menu={menu}
    >
      <section className="grid grid-cols-4 gap-4">
        <MetricCard label="Sistemas activos" value={8} />
        <MetricCard label="Usuarios totales" value={342} />
        <MetricCard label="Módulos activos" value={24} />
        <MetricCard label="Uptime" value="99.9%" />
      </section>

      <section className="mt-6 grid grid-cols-2 gap-6">
        <div className="rounded-2xl border bg-white p-5 shadow-sm">
          <h2 className="mb-4 font-bold">Sistemas / proyectos</h2>

          <div className="grid grid-cols-2 gap-4">
            {["Refapart", "MexIngSof", "TecnoTelec", "JobCron Core"].map((name) => (
              <div key={name} className="rounded-xl border p-4">
                <p className="font-medium">{name}</p>
                <p className="text-sm text-green-600">Activo</p>
              </div>
            ))}
          </div>
        </div>

        <div className="rounded-2xl border bg-white p-5 shadow-sm">
          <h2 className="mb-4 font-bold">Actividad del sistema</h2>
          <ul className="space-y-3 text-sm">
            <li>Usuario nuevo registrado — hace 5 min</li>
            <li>Módulo actualizado — hace 15 min</li>
            <li>Respaldo completado — hace 1 hora</li>
            <li>Permiso actualizado — hace 3 horas</li>
          </ul>
        </div>
      </section>
    </RoleDashboardLayout>
  );
}
```

## APIs que debe conectar cada panel

```ts
// lib/api/refapart-dashboard.ts

import { gatewayRequest } from "./gateway-client";

export function getCustomerDashboard() {
  return gatewayRequest("/refapart/customer/dashboard");
}

export function getQuoterDashboard() {
  return gatewayRequest("/refapart/quoter/dashboard");
}

export function getProviderDashboard() {
  return gatewayRequest("/refapart/provider/dashboard");
}

export function getRefapartAdminDashboard() {
  return gatewayRequest("/refapart/admin/dashboard");
}

export function getJobCronGlobalDashboard() {
  return gatewayRequest("/jobcron/admin/dashboard");
}
```

## Siguiente paso correcto para Codex

```text
CODEX — IMPLEMENTAR BOCETO UI DE PANELES POR PERFIL

Crear las rutas, layouts y componentes indicados.

Prioridad:
1. Refapart Cliente
2. Refapart Cotizador
3. Refapart Proveedor
4. Refapart Admin
5. JobCron Admin Global

No conectar todavía datos reales si las APIs no existen.
Primero crear:
- layout;
- menús por perfil;
- tarjetas métricas;
- tablas;
- acciones rápidas;
- estados;
- placeholders controlados.

Después conectar:
- Gateway General;
- permisos reales;
- endpoints por panel;
- tablas reales;
- eventos y auditoría.

Criterio de cierre:
- Cada perfil tiene panel funcional visual.
- Cada sección existe como ruta.
- Cada acción está preparada para permiso.
- No hay rutas duplicadas.
- No se consume API directa fuera del Gateway.
- El código queda separado por features.
```

[1]: https://github.com/MexIngSoft/Docs/tree/general "GitHub - MexIngSoft/Docs at general · GitHub"



Confirmo lectura del repo `Docs/general`. La documentación marca como regla separar **Núcleo ERP reutilizable**, **Proyectos específicos**, **Estándares** e **Integraciones**; también indica usar `active-work-index.md`, contratos reutilizables, registro Gateway y matriz UI/API para evitar duplicar APIs o documentación. ([GitHub][1])

# 1. Mapa general de conexión entre áreas

```text
Usuario
  ↓
Web Refapart / Web JobCron
  ↓
Gateway General
  ↓
Auth / Core ERP / Address / Refapart API / JobCron API
  ↓
Base de datos correspondiente
  ↓
Eventos / Auditoría / Notificaciones
```

La regla principal debe ser:

```text
Refapart = operación específica de autopartes.
JobCron/Core = estructura reutilizable para todas las webs.
Gateway = única puerta de entrada.
```

# 2. Conexión por área de Refapart

## A. Panel Cliente / Buscador

Áreas:

```text
Inicio
Buscar pieza
Mis solicitudes
Mis cotizaciones
Mis pedidos
Direcciones
Favoritos
Mensajes
Perfil
```

Se conecta a:

| Área             | API principal                          | Tablas principales                                                        | Depende de                   |
| ---------------- | -------------------------------------- | ------------------------------------------------------------------------- | ---------------------------- |
| Inicio           | `/gateway/refapart/customer/dashboard` | `Refapart.PartRequests`, `Refapart.PartQuotes`, `Refapart.RefapartOrders` | Auth, Refapart               |
| Buscar pieza     | `/gateway/refapart/search`             | `Refapart.Parts`, `VehicleBrands`, `VehicleModels`, `PartEquivalences`    | Refapart                     |
| Crear solicitud  | `/gateway/refapart/requests`           | `Refapart.PartRequests`                                                   | Cliente, dirección, vehículo |
| Mis cotizaciones | `/gateway/refapart/quotes?owner=me`    | `Refapart.PartQuotes`                                                     | Solicitud, proveedor         |
| Mis pedidos      | `/gateway/refapart/orders?owner=me`    | `Refapart.RefapartOrders`                                                 | Cotización aceptada          |
| Direcciones      | `/gateway/address/my`                  | `Address.Addresses`                                                       | Address API                  |
| Mensajes         | `/gateway/messages`                    | `Core.Messages`                                                           | Core ERP                     |
| Perfil           | `/gateway/auth/me`                     | `Auth.UserAccounts`, `Core.Customers`                                     | Auth/Core                    |

Cómo funciona con otras áreas:

```text
Cliente crea solicitud
  ↓
Admin o sistema la asigna
  ↓
Cotizador busca proveedores
  ↓
Proveedor responde
  ↓
Cotizador crea cotización
  ↓
Cliente acepta cotización
  ↓
Se crea pedido
  ↓
Se activa pago / entrega / seguimiento
```

Áreas afectadas si modificas Cliente:

* Cotizador, porque cambia la información que recibe.
* Proveedor, porque cambia la solicitud enviada.
* Admin Refapart, porque cambia métricas, estados y reportes.
* Address, si cambias direcciones.
* JobCron/Core, si cambias usuario, cliente, mensajes o notificaciones.

---

## B. Panel Cotizador / Gestor de búsqueda

Áreas:

```text
Panel cotizador
Solicitudes asignadas
Proveedores
Contactos
Cotizaciones
Mensajes
Reportes
Perfil
```

Se conecta a:

| Área                  | API principal                                       | Tablas principales                             | Depende de          |
| --------------------- | --------------------------------------------------- | ---------------------------------------------- | ------------------- |
| Dashboard             | `/gateway/refapart/quoter/dashboard`                | `PartRequests`, `Assignments`, `PartQuotes`    | Refapart            |
| Solicitudes asignadas | `/gateway/refapart/requests?assignedTo=me`          | `PartRequestAssignments`                       | Admin/Asignación    |
| Proveedores           | `/gateway/refapart/providers/search`                | `Refapart.RefapartProviders`, `Core.Companies` | Core + Refapart     |
| Contactos proveedor   | `/gateway/refapart/requests/{id}/provider-contacts` | `PartRequestProviderContacts`                  | Solicitud           |
| Respuestas            | `/gateway/refapart/provider-responses`              | `PartProviderResponses`                        | Proveedor           |
| Cotizaciones          | `/gateway/refapart/quotes`                          | `PartQuotes`                                   | Respuesta proveedor |
| Mensajes              | `/gateway/messages`                                 | `Core.Messages`                                | Core                |
| Reportes              | `/gateway/refapart/reports/quoter`                  | varias                                         | Refapart            |

Cómo funciona con otras áreas:

```text
Admin asigna solicitud
  ↓
Cotizador revisa datos del cliente
  ↓
Cotizador busca proveedores
  ↓
Cotizador registra contacto
  ↓
Proveedor responde
  ↓
Cotizador genera cotización
  ↓
Cliente recibe cotización
```

Áreas afectadas si modificas Cotizador:

* Cliente, porque puede cambiar estados y cotizaciones visibles.
* Proveedor, porque cambia cómo se envían o registran contactos.
* Admin Refapart, porque sus reportes dependen de asignaciones y desempeño.
* JobCron/Core, si cambias mensajes, usuarios internos o empleados.
* Eventos/Auditoría, porque cada cambio de estado debe quedar registrado.

---

## C. Panel Proveedor

Áreas:

```text
Panel proveedor
Solicitudes recibidas
Respuestas enviadas
Catálogo de piezas
Mensajes
Perfil
Configuración
```

Se conecta a:

| Área                  | API principal                          | Tablas principales                                     | Depende de         |
| --------------------- | -------------------------------------- | ------------------------------------------------------ | ------------------ |
| Dashboard             | `/gateway/refapart/provider/dashboard` | `PartRequestProviderContacts`, `PartProviderResponses` | Refapart           |
| Solicitudes recibidas | `/gateway/refapart/provider/requests`  | `PartRequestProviderContacts`                          | Cotizador          |
| Responder solicitud   | `/gateway/refapart/provider/responses` | `PartProviderResponses`                                | Solicitud/contacto |
| Catálogo              | `/gateway/refapart/provider/catalog`   | `ProviderCatalogParts`                                 | Proveedor          |
| Perfil                | `/gateway/refapart/provider/profile`   | `RefapartProviders`, `Core.Companies`                  | Core + Refapart    |
| Mensajes              | `/gateway/messages`                    | `Core.Messages`                                        | Core               |

Cómo funciona con otras áreas:

```text
Cotizador contacta proveedor
  ↓
Proveedor recibe solicitud
  ↓
Proveedor responde disponibilidad/precio
  ↓
Cotizador convierte respuesta en cotización
  ↓
Cliente acepta o rechaza
  ↓
Admin mide desempeño del proveedor
```

Áreas afectadas si modificas Proveedor:

* Cotizador, porque depende de las respuestas.
* Cliente, porque sus cotizaciones nacen de esas respuestas.
* Admin Refapart, porque afecta calificaciones, métricas y reportes.
* Core/Companies, si modificas datos empresariales del proveedor.
* Catálogo Refapart, si agregas inventario o piezas propias.

---

## D. Panel Administrador Refapart

Áreas:

```text
Dashboard
Solicitudes
Cotizadores
Proveedores
Usuarios Refapart
Piezas
Categorías
Cotizaciones
Pedidos
Reportes
Configuración
Bitácora
```

Se conecta a:

| Área         | API principal                                  | Tablas principales                    | Depende de          |
| ------------ | ---------------------------------------------- | ------------------------------------- | ------------------- |
| Dashboard    | `/gateway/refapart/admin/dashboard`            | todas las tablas Refapart             | Refapart            |
| Solicitudes  | `/gateway/refapart/admin/requests`             | `PartRequests`, `StatusHistory`       | Cliente/Cotizador   |
| Asignaciones | `/gateway/refapart/admin/requests/{id}/assign` | `PartRequestAssignments`              | Cotizadores         |
| Proveedores  | `/gateway/refapart/admin/providers`            | `RefapartProviders`, `Core.Companies` | Core + Refapart     |
| Usuarios     | `/gateway/jobcron/users?system=refapart`       | `Auth.UserAccounts`, `Auth.UserRoles` | JobCron/Auth        |
| Piezas       | `/gateway/refapart/admin/parts`                | `Parts`, `PartCategories`             | Refapart            |
| Cotizaciones | `/gateway/refapart/admin/quotes`               | `PartQuotes`                          | Cotizador/proveedor |
| Pedidos      | `/gateway/refapart/admin/orders`               | `RefapartOrders`                      | Cliente/cotización  |
| Reportes     | `/gateway/refapart/admin/reports`              | agregados                             | Todo Refapart       |
| Bitácora     | `/gateway/refapart/admin/audit`                | `Core.AuditLogs`                      | Core                |

Cómo funciona con otras áreas:

```text
Admin controla operación
  ↓
Admin crea o valida proveedores
  ↓
Admin asigna solicitudes a cotizadores
  ↓
Admin supervisa cotizaciones
  ↓
Admin revisa pedidos y reportes
  ↓
Admin corrige incidencias
```

Áreas afectadas si modificas Admin Refapart:

* Todas las áreas Refapart.
* JobCron/Auth, si cambias usuarios, roles o permisos.
* Core/Audit, si cambias bitácora.
* Gateway, si cambias rutas administrativas.
* Reportes, porque dependen de todos los estados y eventos.

---

# 3. Conexión por área de JobCron

## Panel Admin Global JobCron

Áreas:

```text
Dashboard global
Sistemas / proyectos
Módulos
Usuarios globales
Roles
Permisos
Gateway
Logs
Eventos
Reportes
Configuración
```

Se conecta a:

| Área             | API principal                      | Tablas principales                                  | Afecta                |
| ---------------- | ---------------------------------- | --------------------------------------------------- | --------------------- |
| Dashboard global | `/gateway/jobcron/admin/dashboard` | `Core.Systems`, `Core.Modules`, `Auth.UserAccounts` | Todas las webs        |
| Sistemas         | `/gateway/jobcron/systems`         | `Core.Systems`                                      | Registro de proyectos |
| Módulos          | `/gateway/jobcron/modules`         | `Core.Modules`, `Core.ModuleActions`                | Menús/permisos        |
| Usuarios         | `/gateway/jobcron/users`           | `Auth.UserAccounts`                                 | Login global          |
| Roles            | `/gateway/jobcron/roles`           | `Auth.Roles`, `Auth.UserRoles`                      | Accesos               |
| Permisos         | `/gateway/jobcron/permissions`     | `Auth.Permissions`, `RolePermissions`               | Botones/rutas         |
| Gateway          | `/gateway/jobcron/gateway-routes`  | `Core.GatewayRoutes`                                | APIs                  |
| Logs             | `/gateway/jobcron/logs`            | `Core.AuditLogs`                                    | Auditoría             |
| Eventos          | `/gateway/jobcron/events`          | `Core.SystemEvents`                                 | Automatizaciones      |
| Configuración    | `/gateway/jobcron/settings`        | `Core.ProjectSettings`                              | Proyecto/web          |

Cómo funciona con Refapart:

```text
JobCron define sistemas, módulos, roles y permisos
  ↓
Refapart consulta permisos por usuario
  ↓
Refapart muestra u oculta paneles y acciones
  ↓
Cada acción importante de Refapart genera eventos/auditoría
  ↓
JobCron puede auditar y administrar globalmente
```

Áreas afectadas si modificas JobCron:

* Todas las webs.
* Login/Auth.
* Menús.
* Acceso a rutas.
* Botones visibles.
* Gateway.
* Auditoría.
* Reportes globales.
* Eventos compartidos.

# 4. Flujo completo entre áreas

## Flujo 1 — Cliente crea solicitud

```text
Cliente / Buscar pieza
  ↓
Refapart.PartRequests
  ↓
Evento: PartRequestCreated
  ↓
Admin Refapart ve nueva solicitud
  ↓
Cotizador recibe asignación
```

Afecta:

```text
Cliente
Admin Refapart
Cotizador
Reportes
Eventos
Auditoría
Notificaciones
```

---

## Flujo 2 — Admin asigna solicitud

```text
Admin Refapart / Solicitudes
  ↓
PartRequestAssignments
  ↓
Cambio de estado: Asignada
  ↓
Cotizador / Solicitudes asignadas
  ↓
Notificación al cotizador
```

Afecta:

```text
Admin
Cotizador
Cliente
Reportes
Auditoría
```

---

## Flujo 3 — Cotizador contacta proveedor

```text
Cotizador / Proveedores
  ↓
PartRequestProviderContacts
  ↓
Proveedor / Solicitudes recibidas
  ↓
Evento: ProviderContacted
```

Afecta:

```text
Cotizador
Proveedor
Admin
Reportes proveedor
Bitácora
```

---

## Flujo 4 — Proveedor responde

```text
Proveedor / Responder solicitud
  ↓
PartProviderResponses
  ↓
Cotizador / Respuestas recibidas
  ↓
Evento: ProviderResponded
```

Afecta:

```text
Proveedor
Cotizador
Admin
Cotizaciones
Reportes
```

---

## Flujo 5 — Cotizador crea cotización

```text
Cotizador / Crear cotización
  ↓
PartQuotes
  ↓
Cliente / Mis cotizaciones
  ↓
Evento: RefapartQuoteCreated
```

Afecta:

```text
Cotizador
Cliente
Admin
Proveedor
Pedidos futuros
Reportes financieros
```

---

## Flujo 6 — Cliente acepta cotización

```text
Cliente / Aceptar cotización
  ↓
PartQuotes.QuoteStatus = Accepted
  ↓
RefapartOrders
  ↓
Payment / Delivery
  ↓
Evento: RefapartQuoteAccepted + OrderCreated
```

Afecta:

```text
Cliente
Admin
Cotizador
Proveedor
Pedidos
Pagos
Entregas
Notificaciones
Reportes
```

# 5. Matriz de impacto por modificación

## Si modificas Cliente

Puede afectar:

```text
Solicitudes
Cotizaciones
Pedidos
Direcciones
Notificaciones
Mensajes
Reportes
```

Riesgo principal:

```text
Que el cotizador o admin reciban datos incompletos.
```

Validar:

```text
- PartRequest sigue guardando CustomerId.
- ShippingAddressId sigue siendo válido.
- El cliente solo ve datos propios.
```

---

## Si modificas Solicitudes

Puede afectar:

```text
Cliente
Cotizador
Proveedor
Admin
Reportes
Estados
Eventos
Auditoría
Pedidos
```

Riesgo principal:

```text
Romper el flujo completo de búsqueda.
```

Validar:

```text
- Estados permitidos.
- Historial de estado.
- Asignaciones.
- Proveedores contactados.
- Cotizaciones relacionadas.
```

---

## Si modificas Cotizaciones

Puede afectar:

```text
Cliente
Cotizador
Proveedor
Pedidos
Pagos
Reportes
```

Riesgo principal:

```text
Crear pedidos con totales incorrectos.
```

Validar:

```text
- Price
- ShippingCost
- ServiceFee
- Total
- QuoteStatus
- ValidUntil
```

---

## Si modificas Proveedores

Puede afectar:

```text
Cotizador
Admin
Proveedor
Cotizaciones
Catálogo
Reportes
```

Riesgo principal:

```text
Perder relación entre proveedor Core y proveedor Refapart.
```

Validar:

```text
- Core.Companies
- Refapart.RefapartProviders
- ProviderId
- CompanyId
```

---

## Si modificas Roles o Permisos

Puede afectar:

```text
Todas las webs
Todos los paneles
Todos los botones
Todas las rutas protegidas
```

Riesgo principal:

```text
Usuarios sin acceso o usuarios con acceso indebido.
```

Validar:

```text
- /gateway/auth/me
- /gateway/auth/me/permissions
- navegación por perfil
- protección backend
- protección frontend
```

---

## Si modificas Gateway

Puede afectar:

```text
Refapart
JobCron
MexIngSof
TecnoTelec
PhoneShop
Imagrafity
Innovation Engines Repair
```

Riesgo principal:

```text
Romper consumo de APIs en varias webs.
```

Validar:

```text
- rutas registradas
- CORS
- tokens JWT
- refresh session
- errores normalizados
- timeout
```

# 6. Reglas para evitar romper otras áreas

```text
1. No cambiar contratos API sin actualizar matriz UI/API.
2. No cambiar nombres de permisos sin migración.
3. No mover tablas reutilizables a Refapart.
4. No crear APIs directas fuera del Gateway.
5. No cambiar estados sin actualizar reportes.
6. No cambiar cotización sin revisar pedido y pago.
7. No cambiar proveedor sin revisar Core.Companies.
8. No cambiar dirección sin revisar checkout/pedido.
9. No cambiar usuario/rol sin revisar todos los paneles.
10. Todo cambio importante debe registrar auditoría/evento.
```

# 7. Sección lista para documentar

Ruta sugerida:

```text
Docs/02_projects/refapart/frontend/21_dashboard_area_connections_and_impact.md
```

También actualizar:

```text
Docs/01_core_erp/apis/endpoint-ui-consumption-matrix.md
Docs/01_core_erp/apis/gateway-route-registry.md
Docs/02_projects/refapart/frontend/20_role_dashboard_spec.md
Docs/02_projects/_ecosystem/02_jobcron_shared_modules.md
```

# 8. Instrucción para Codex

```text
TAREA CODEX — DOCUMENTAR CONEXIONES E IMPACTO DE PANELES REFAPART

Rama:
general

Objetivo:
Crear la documentación de conexión entre áreas de los paneles Refapart y JobCron, indicando APIs, tablas, dependencias, eventos, auditoría y áreas afectadas por modificación.

Crear:
Docs/02_projects/refapart/frontend/21_dashboard_area_connections_and_impact.md

Leer antes:
- Docs/README.md
- Docs/_meta/active-work-index.md
- Docs/01_core_erp/apis/gateway-route-registry.md
- Docs/01_core_erp/apis/endpoint-ui-consumption-matrix.md
- Docs/01_core_erp/apis/reusable-api-contracts.md
- Docs/03_standards/architecture/api-gateway-standard.md
- Docs/03_standards/frontend/ui-ux-standard.md
- Docs/02_projects/refapart/frontend/20_role_dashboard_spec.md

Documentar:
1. Panel Cliente.
2. Panel Cotizador.
3. Panel Proveedor.
4. Panel Admin Refapart.
5. Panel Admin Global JobCron.
6. Flujo entre áreas.
7. APIs por área.
8. Tablas por área.
9. Eventos generados.
10. Auditoría requerida.
11. Riesgos de modificación.
12. Matriz de impacto.
13. Validaciones obligatorias.

Reglas:
- Toda conexión debe pasar por Gateway General.
- Refapart solo documenta lógica de autopartes.
- Core/JobCron documenta usuarios, roles, permisos, clientes, direcciones, proveedores base, notificaciones, eventos y auditoría.
- No duplicar APIs.
- No duplicar tablas reutilizables.
- No inventar nuevas bases de datos.
- Toda modificación debe indicar áreas afectadas.

Criterio de cierre:
- Documento creado.
- Matriz de impacto completa.
- APIs conectadas por área.
- Tablas conectadas por área.
- Eventos documentados.
- Riesgos documentados.
- Archivos índice actualizados.
```

[1]: https://github.com/MexIngSoft/Docs/tree/general "GitHub - MexIngSoft/Docs at general · GitHub"
