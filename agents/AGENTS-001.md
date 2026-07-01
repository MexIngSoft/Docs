Confirmo lectura del repositorio `MexIngSoft/Docs` en rama `general`.

Documentos leídos y base usada:

* `README.md`: estructura canónica del repo.
* `_meta/active-work-index.md`: ruta para trabajar REFAPART y Auth.
* `01_core_erp/auth/README.md`: Auth maneja usuarios, roles, permisos, sesiones, dispositivos y tokens.
* `01_core_erp/auth/user-application-traceability.md`: cada usuario pertenece a una aplicación por `ApplicationId` y `ApplicationCode`.
* `03_standards/auth/web-auth-login-standard.md`: todo frontend debe usar Gateway → Auth y permisos backend.
* `02_projects/jobcron/README.md`: JobCron es ERP central, multiempresa/multiproyecto, con Auth y permisos.
* `02_projects/jobcron/operational-admin-center.md`: JobCron administra reglas, visibilidad, auditoría, operación y tableros.
* `02_projects/refapart/security/00_permissions_matrix.md`: roles activos REFAPART.
* `03_standards/auth/auth-email-delivery-diagnostics-standard.md`: trazabilidad, reenvío, SES, estados y diagnóstico de correos.

## Punto clave

La documentación **sí tiene base para usuarios, roles, permisos, Auth, Gateway, JobCron y trazabilidad de correos**, pero **no puedo confirmar que ya exista documentada la política de eliminación con retención de 90 días, doble confirmación y rollback**. De hecho, el documento actual marca como pendiente definir la política productiva de borrado y retención por proyecto.

## Puntos a desarrollar

1. **Panel maestro de administración en JobCron**

   * Usuarios por empresa/proyecto.
   * Roles por aplicación.
   * Permisos por rol.
   * Suspensión/reactivación.
   * Eliminación lógica con retención 90 días.
   * Eliminación inmediata solo con permiso crítico.
   * Auditoría de cada cambio.
   * Diagnóstico y reenvío de correos Auth.

2. **Usuario Super Admin semilla**

   * Debe nacer por seed/migración o comando seguro.
   * No debe crearse desde registro público.
   * Debe tener control global sobre aplicaciones incubadas.
   * No debe poder eliminarse desde UI.
   * Debe requerir contraseña fuerte y, preferentemente, MFA.
   * Debe poder crear admins por empresa/proyecto.

3. **Jerarquía de administración**

   * `JOBCRON_SUPER_ADMIN`: controla todo el ecosistema.
   * `JOBCRON_PLATFORM_ADMIN`: soporte operativo global limitado.
   * `COMPANY_OWNER`: dueño de una empresa/tenant.
   * `APPLICATION_ADMIN`: administra usuarios de una aplicación, ejemplo REFAPART.
   * Roles internos REFAPART: `REFAPART_ADMIN`, `REFAPART_QUOTER`, `REFAPART_SUPPLIER_MANAGER`, `REFAPART_LOGISTICS`, `REFAPART_FINANCE`, `REFAPART_SUPPORT`, `CUSTOMER`.

4. **Eliminación segura**

   * Primer aviso: “vas a eliminar/suspender este recurso”.
   * Segunda confirmación: ventana modal con resumen de impacto.
   * Captura obligatoria de motivo.
   * Soft delete por 90 días.
   * Estado `PendingDeletion`.
   * Opción `Restore` antes de 90 días.
   * Opción `DeleteNow` solo para Super Admin o permiso especial.
   * Auditoría obligatoria.

5. **Correos y soporte**

   * JobCron debe permitir ver si el correo fue `PENDING`, `SENT`, `ACCEPTED_BY_PROVIDER`, `DELIVERED`, `BOUNCED`, `FAILED`, etc.
   * Debe poder reenviar activación/reset por Gateway.
   * Debe mostrar `ApplicationCode`, proveedor, `RequestId`, `MessageId`, estado y error sanitizado.

## Mapa de flujo

```text
JobCron Super Admin
  -> crea aplicación / empresa / tenant
  -> crea Company Owner o Application Admin
  -> asigna roles y permisos
  -> monitorea correos, sesiones, auditoría y errores
  -> puede suspender, restaurar o eliminar según política

Application Admin / REFAPART_ADMIN
  -> administra usuarios de REFAPART
  -> asigna roles REFAPART permitidos
  -> suspende usuarios propios
  -> solicita eliminación
  -> no puede tocar otras empresas

Usuario operativo REFAPART
  -> usa solo permisos asignados
  -> no administra Auth global
```

## Flujo de eliminación

```text
Seleccionar usuario/rol/permiso
  -> Validar permisos del operador
  -> Mostrar impacto
  -> Confirmación 1
  -> Confirmación 2 con texto obligatorio
  -> Capturar motivo
  -> Soft delete / PendingDeletion
  -> Bloquear login o uso
  -> Guardar auditoría
  -> Esperar 90 días
      -> Restaurar si aplica
      -> Eliminar definitivo al vencer retención
      -> DeleteNow solo con permiso crítico
```

## Agente de Codex

# AGENTE CODEX — JobCron Auth Admin Center, usuarios, roles, permisos, eliminación segura y soporte de correos

## Objetivo

Diseñar, documentar e implementar el módulo administrativo de usuarios, roles, permisos, suspensión, eliminación segura, rollback y diagnóstico de correos Auth desde JobCron, respetando la arquitectura del ecosistema MexIngSoft.

JobCron debe funcionar como centro administrativo operativo para empresas/proyectos incubados, incluyendo REFAPART, sin duplicar Auth ni romper el flujo Web -> Gateway General -> Auth.

## Rama de trabajo

Trabajar en la rama:

```text
general
```

No trabajar sobre `main` ni `pro`.

## Repositorio documental obligatorio

Leer primero:

```text
Docs/README.md
Docs/_meta/active-work-index.md
Docs/03_standards/global-governance.md
Docs/01_core_erp/auth/README.md
Docs/01_core_erp/auth/user-application-traceability.md
Docs/03_standards/auth/web-auth-login-standard.md
Docs/03_standards/auth/auth-email-delivery-diagnostics-standard.md
Docs/03_standards/gateway/central-gateway-standard.md
Docs/02_projects/jobcron/README.md
Docs/02_projects/jobcron/operational-admin-center.md
Docs/02_projects/refapart/security/00_permissions_matrix.md
```

## Principios obligatorios

1. Auth es la autoridad real de usuarios, roles, permisos, sesiones, tokens y auditoría.
2. JobCron no debe duplicar Auth.
3. JobCron administra, consulta y orquesta mediante Gateway/Auth.
4. El frontend nunca debe consumir Auth directo.
5. Todo usuario debe estar asociado a una aplicación mediante `ApplicationCode`.
6. Todo cambio administrativo debe tener auditoría.
7. Toda eliminación debe ser segura, reversible y trazable.
8. No eliminar físicamente usuarios productivos de forma inmediata salvo permiso crítico explícito.
9. No permitir eliminar superusuarios ni cuentas semilla desde UI.
10. REFAPART debe usar sus roles ya documentados.

## Roles globales a definir

Crear o documentar estos roles globales JobCron/Auth:

```text
JOBCRON_SUPER_ADMIN
JOBCRON_PLATFORM_ADMIN
JOBCRON_SUPPORT_ADMIN
JOBCRON_AUDITOR
COMPANY_OWNER
COMPANY_ADMIN
APPLICATION_ADMIN
APPLICATION_SUPPORT
```

## Usuario Super Admin semilla

Definir cómo nace el usuario maestro del ecosistema.

Debe crearse mediante seed/migración/comando administrativo, nunca desde registro público.

Debe tener:

```text
IsSuperuser = true
IsStaff = true
ApplicationCode = JOBCRON
Role = JOBCRON_SUPER_ADMIN
```

Reglas:

1. No puede eliminarse desde UI.
2. No puede suspenderse desde UI común.
3. Solo puede rotar credenciales por flujo controlado.
4. Debe tener contraseña fuerte.
5. Debe quedar documentado en auditoría como usuario semilla.
6. Debe poder crear administradores globales, administradores de empresa y administradores de aplicación.
7. Debe poder revisar soporte de correos, logs, estados y aplicaciones.
8. Debe poder administrar cualquier empresa incubada.
9. Debe poder administrar REFAPART como aplicación interna de JobCron.

## Jerarquía de alcance

### JOBCRON_SUPER_ADMIN

Puede:

* Ver todas las aplicaciones.
* Ver todas las empresas/tenants.
* Crear usuarios administrativos.
* Asignar roles globales.
* Asignar roles por aplicación.
* Suspender usuarios.
* Reactivar usuarios.
* Iniciar eliminación segura.
* Restaurar eliminaciones dentro de 90 días.
* Ejecutar eliminación inmediata solo con doble confirmación.
* Ver auditoría completa.
* Ver diagnóstico de correos.
* Reenviar correos transaccionales.
* Ver estados de SES/SMTP sanitizados.
* Ver errores técnicos sanitizados.

No puede:

* Saltarse auditoría.
* Exponer secretos.
* Ver tokens completos.
* Ver passwords.
* Borrar su propia cuenta desde UI.

### JOBCRON_PLATFORM_ADMIN

Puede administrar operación global limitada.

No puede eliminar usuarios semilla ni ejecutar eliminación inmediata.

### COMPANY_OWNER

Puede administrar su empresa o tenant.

Puede:

* Crear usuarios de su empresa.
* Asignar roles permitidos.
* Suspender usuarios de su empresa.
* Solicitar eliminación segura.

No puede:

* Administrar otras empresas.
* Ver costos internos de JobCron.
* Ver usuarios globales.
* Cambiar roles globales.

### APPLICATION_ADMIN

Ejemplo: `REFAPART_ADMIN`.

Puede:

* Administrar usuarios de su aplicación.
* Asignar roles propios de la aplicación.
* Suspender usuarios de su aplicación.
* Ver logs de correo de usuarios de su aplicación.
* Reenviar activación o reset si tiene permiso.

No puede:

* Administrar otras aplicaciones.
* Crear superusuarios.
* Ver secretos.
* Ejecutar eliminación inmediata salvo permiso especial.

## Roles REFAPART activos

Usar exactamente los roles documentados:

```text
CUSTOMER
REFAPART_ADMIN
REFAPART_QUOTER
REFAPART_SUPPLIER_MANAGER
REFAPART_LOGISTICS
REFAPART_FINANCE
REFAPART_SUPPORT
```

Completar seeds productivos pendientes para:

```text
REFAPART_QUOTER
REFAPART_SUPPLIER_MANAGER
REFAPART_LOGISTICS
REFAPART_FINANCE
REFAPART_SUPPORT
```

Validar si `REFAPART_ADMIN` ya existe por seed anterior.

## Panel administrativo JobCron

Crear o documentar el módulo:

```text
JobCron / Admin / Identity & Access
```

Secciones:

```text
Usuarios
Roles
Permisos
Aplicaciones
Empresas/Tenants
Sesiones
Dispositivos
Correos transaccionales
Auditoría
Papelera / Eliminaciones pendientes
```

## Funciones de usuarios

### Crear usuario

Flujo:

```text
Admin abre Crear usuario
-> selecciona empresa/tenant
-> selecciona ApplicationCode
-> captura nombre, apellidos, correo
-> selecciona rol inicial
-> define si debe enviar activación
-> Gateway llama Auth
-> Auth crea usuario
-> Auth registra ApplicationId
-> Auth registra auditoría
-> Auth envía correo si aplica
-> JobCron muestra resultado y estado del correo
```

Validaciones:

* Email único por aplicación o regla documentada.
* ApplicationCode obligatorio.
* Rol obligatorio.
* No permitir asignar roles fuera del alcance del operador.
* No permitir crear superuser desde UI común.

### Actualizar usuario

Permitir:

* Nombre.
* Apellidos.
* Estado.
* Roles.
* Permisos excepcionales si están permitidos.
* Aplicación solo si no rompe trazabilidad.
* Empresa/tenant si aplica.

Guardar auditoría antes/después.

### Suspender usuario

Flujo:

```text
Seleccionar usuario
-> botón Suspender
-> modal de impacto
-> motivo obligatorio
-> confirmar
-> IsActive = false o estado Suspended
-> invalidar sesiones
-> revocar refresh tokens
-> guardar auditoría
-> notificar si aplica
```

### Reactivar usuario

Flujo:

```text
Seleccionar usuario suspendido
-> validar permisos
-> motivo obligatorio
-> activar usuario
-> opcional reenviar activación o reset
-> guardar auditoría
```

## Eliminación segura

Toda eliminación debe tener doble notificación y ventana modal.

### Estados propuestos

```text
Active
Suspended
PendingDeletion
Deleted
Restored
DeletionCancelled
HardDeleted
```

### Flujo normal de eliminación

```text
Admin selecciona eliminar
-> sistema muestra impacto: roles, permisos, sesiones, pedidos, logs, empresa, aplicación
-> Confirmación 1: advertencia clara
-> Confirmación 2: escribir email o nombre del recurso
-> motivo obligatorio
-> marcar PendingDeletion
-> bloquear login
-> invalidar sesiones
-> conservar registros por 90 días
-> mostrar en Papelera
-> permitir Restore antes de 90 días
-> job programado ejecuta hard delete o anonimización al vencer plazo, si la política lo permite
```

### Eliminación inmediata

Solo para:

```text
JOBCRON_SUPER_ADMIN
permiso: CanHardDeleteIdentityResource
```

Requiere:

* Doble confirmación.
* Motivo obligatorio.
* Confirmación escrita.
* Auditoría crítica.
* Validación de que no sea superuser semilla.
* Validación de que no tenga actividad productiva bloqueante.
* Registro de impacto.

## Rollback / restauración

Flujo:

```text
Ir a Papelera
-> seleccionar usuario/rol/permiso
-> revisar impacto
-> Restore
-> motivo obligatorio
-> restaurar estado anterior
-> restaurar roles/permisos si aplica
-> guardar auditoría
```

## Administración de roles

Funciones:

* Crear rol.
* Actualizar rol.
* Suspender rol.
* Soft delete de rol.
* Restaurar rol.
* Eliminar inmediato solo con permiso crítico.
* Asignar permisos.
* Clonar rol.

Reglas:

* No eliminar rol si tiene usuarios activos sin reasignación.
* No modificar roles del sistema sin permiso global.
* Roles de proyecto viven en documentación del proyecto.
* Roles globales viven en Auth/Core/JobCron.

## Administración de permisos

Funciones:

* Crear permiso.
* Actualizar descripción.
* Asociar a rol.
* Desasociar de rol.
* Desactivar permiso.
* Soft delete.
* Restaurar.

Reglas:

* No borrar permisos usados por código sin mapa de acciones.
* Todo permiso debe estar relacionado con endpoint, acción UI o proceso backend.
* Actualizar mapa de acciones si cambia permiso.

## Diagnóstico y reenvío de correos

Crear panel:

```text
JobCron / Admin / Auth Emails
```

Debe permitir:

* Buscar por email.
* Buscar por usuario.
* Buscar por ApplicationCode.
* Ver `ActionCode`.
* Ver `Status`.
* Ver proveedor.
* Ver RequestId.
* Ver ProviderMessageId.
* Ver FailureReason.
* Ver RetryCount.
* Ver NextRetryAt.
* Reenviar verificación.
* Reenviar reset.
* Ver si SES está en sandbox.
* Ver si dominio está verificado.
* No mostrar tokens ni secretos.

Estados obligatorios:

```text
PENDING
PROCESSING
SENT
ACCEPTED_BY_PROVIDER
DELIVERED
OPENED
BOUNCED
COMPLAINED
FAILED
RETRY_SCHEDULED
RETRY_EXHAUSTED
```

## Endpoints requeridos vía Gateway

Documentar y/o implementar rutas administrativas versionadas.

Propuesta:

```text
GET    /api/v1/admin/identity/users/
POST   /api/v1/admin/identity/users/
GET    /api/v1/admin/identity/users/{id}/
PATCH  /api/v1/admin/identity/users/{id}/
POST   /api/v1/admin/identity/users/{id}/suspend/
POST   /api/v1/admin/identity/users/{id}/reactivate/
POST   /api/v1/admin/identity/users/{id}/delete-request/
POST   /api/v1/admin/identity/users/{id}/restore/
POST   /api/v1/admin/identity/users/{id}/hard-delete/

GET    /api/v1/admin/identity/roles/
POST   /api/v1/admin/identity/roles/
PATCH  /api/v1/admin/identity/roles/{id}/
POST   /api/v1/admin/identity/roles/{id}/delete-request/
POST   /api/v1/admin/identity/roles/{id}/restore/

GET    /api/v1/admin/identity/permissions/
POST   /api/v1/admin/identity/permissions/
PATCH  /api/v1/admin/identity/permissions/{id}/

GET    /api/v1/admin/auth/emails/
GET    /api/v1/admin/auth/emails/{id}/
POST   /api/v1/admin/auth/emails/{id}/resend/
POST   /api/v1/admin/auth/users/{id}/resend-activation/
POST   /api/v1/admin/auth/users/{id}/password-reset/
```

El Gateway debe validar `X-Application-Code`, permisos, scope de empresa y scope de aplicación.

## Modelos o campos requeridos

Revisar si existen antes de crear.

Propuesta mínima:

```text
DeletionStatus
DeletionRequestedAt
DeletionScheduledHardDeleteAt
DeletionRequestedById
DeletionReason
DeletedAt
DeletedById
RestoredAt
RestoredById
RestoreReason
SuspendedAt
SuspendedById
SuspensionReason
LastAdminActionAt
```

Para auditoría:

```text
AdminAuditEvent
IdentityDeletionRequest
IdentityRestoreEvent
RolePermissionChangeEvent
EmailSupportEvent
```

## Documentación que debe agregarse o actualizarse

Crear o actualizar:

```text
Docs/01_core_erp/auth/admin-identity-management.md
Docs/01_core_erp/auth/deletion-retention-policy.md
Docs/01_core_erp/auth/super-admin-seed-policy.md
Docs/02_projects/jobcron/admin-identity-access-center.md
Docs/02_projects/jobcron/auth-email-support-panel.md
Docs/02_projects/refapart/security/admin-user-management.md
Docs/02_projects/refapart/security/00_permissions_matrix.md
Docs/01_core_erp/apis/gateway-route-registry.md
Docs/01_core_erp/apis/endpoint-ui-consumption-matrix.md
Docs/03_standards/code-actions/code-actions-map-standard.md
```

## Criterios de cierre

El trabajo se considera cerrado cuando:

1. La documentación define claramente el Super Admin semilla.
2. La documentación define jerarquía global y por aplicación.
3. REFAPART conserva sus roles activos documentados.
4. Los roles especializados REFAPART tienen seed productivo o tarea explícita.
5. El panel JobCron tiene flujo de usuarios, roles y permisos.
6. La eliminación tiene doble confirmación.
7. La eliminación usa retención de 90 días.
8. Existe rollback/restauración.
9. Existe eliminación inmediata controlada.
10. Existe auditoría obligatoria.
11. Existe diagnóstico de correos Auth.
12. Existe reenvío de correos vía Gateway/Auth.
13. No se exponen tokens, passwords ni secretos.
14. El frontend no consume Auth directo.
15. Todo queda vinculado a `ApplicationCode`.
16. Se actualizan mapas de Gateway/endpoints si se agregan rutas.
17. Se genera reporte de ejecución.

## Validaciones

No correr Docker ni pruebas pesadas salvo instrucción explícita.

Validar documentalmente:

```text
- Que no se duplique Auth en JobCron.
- Que no se creen permisos únicos de empresa en Auth Core.
- Que todo permiso específico REFAPART viva en Docs/02_projects/refapart.
- Que todo flujo administrativo pase por Gateway.
- Que toda eliminación tenga auditoría, retención y restore.
- Que el usuario semilla no pueda eliminarse.
```

## Reporte final esperado

Entregar:

```text
1. Documentos leídos.
2. Documentos creados/modificados.
3. Endpoints propuestos o implementados.
4. Modelos/campos propuestos o implementados.
5. Roles globales definidos.
6. Roles REFAPART validados.
7. Flujo Super Admin semilla.
8. Flujo eliminación 90 días.
9. Flujo soporte correos.
10. Pendientes que no se pudieron cerrar.
```

## Información faltante que debe documentarse

1. Política exacta de retención legal por tipo de dato.
2. Si el hard delete será borrado físico, anonimización o ambos según caso.
3. Si habrá tenants separados o solo `ApplicationCode`.
4. Nombre final del usuario semilla inicial.
5. Si MFA será obligatorio desde el primer MVP.
6. Si JobCron será solo interno o SaaS administrable por clientes externos.
7. Qué admins externos pueden ver logs de correo y hasta qué nivel.



Confirmo lectura del repositorio `MexIngSoft/Docs` en rama `general`.

La documentación actual **todavía deja pendiente** la política productiva de borrado/retención y el endpoint administrativo por Gateway para usuarios por `ApplicationCode`.

## Base que se debe respetar

JobCron ya está definido como centro operativo para auditoría, operación, reglas, visibilidad y tableros.
También la documentación exige definir datos compartidos/aislados, permisos, API responsable y rollback antes de implementación grande.

Legalmente, en México la cancelación de datos debe pasar por **bloqueo** y después supresión; el bloqueo conserva los datos solo para responsabilidades nacidas del tratamiento. ([Cámara de Diputados][1]) Además, no siempre procede cancelar si los datos son necesarios para contrato, obligación legal, actuaciones judiciales/administrativas, obligaciones fiscales o derechos de terceros. ([Cámara de Diputados][1])

## Puntos a tocar

1. **Retención por tipo de dato**

   * Cuenta/Auth: cancelar, bloquear y después suprimir.
   * Pedidos/facturación/pagos: bloquear o conservar por obligación legal.
   * Logs técnicos: anonimizar cuando sea posible.
   * Auditoría: conservar sin datos sensibles innecesarios.
   * Correos: conservar trazabilidad técnica, no contenido sensible.
   * Sesiones/tokens: eliminación inmediata al cancelar/suspender.

2. **Hard delete**

   * Caso simple: borrado físico.
   * Caso con operaciones legales/fiscales: anonimización + bloqueo.
   * Caso con auditoría necesaria: disociación del usuario, conservando evento.
   * Solicitud del usuario: atender derecho de cancelación, salvo excepción legal documentada.

3. **Tenants + ApplicationCode**

   * No basta solo `ApplicationCode`.
   * Debe existir modelo:

     * `Tenant`
     * `Application`
     * `TenantApplication`
     * `UserTenantMembership`
   * JobCron administra plataformas propias y empresas externas.
   * Empresas externas administran solo su tenant.
   * Soporte JobCron puede entrar con permisos controlados y auditados.

4. **Usuario semilla**

   * Nombre operativo: `JobCron`.
   * Email recomendado: `jobcron.master@<dominio-final>`.
   * Rol: `JOBCRON_SUPER_ADMIN`.
   * No nace por registro público.
   * No se elimina desde UI.
   * MFA preparado, pero no obligatorio en MVP inicial.

5. **JobCron como SaaS administrable**

   * Empresas externas se autoadministran.
   * JobCron conserva soporte interno.
   * Soporte puede ver errores, permisos, estado de usuario y logs técnicos.
   * Soporte no debe ver contraseñas, tokens, secretos ni información sensible innecesaria.

6. **Logs de correo**

   * Solo perfiles internos JobCron.
   * No empresas externas.
   * Niveles:

     * `JOBCRON_SUPER_ADMIN`: todo.
     * `JOBCRON_PLATFORM_ADMIN`: técnico/operativo.
     * `JOBCRON_SUPPORT_ADMIN`: reenvío y estado sanitizado.
     * `JOBCRON_AUDITOR`: solo lectura.
     * Empresas externas: sin acceso.

## Agente Codex

# AGENTE CODEX — Política de retención, tenants, usuario semilla JobCron y soporte interno Auth

## Objetivo

Definir, documentar e implementar la arquitectura administrativa para que JobCron pueda administrar plataformas propias y empresas externas, con soporte interno controlado, política de retención de datos, eliminación segura, anonimización, hard delete por caso, usuario semilla y visibilidad restringida de logs.

## Rama

Trabajar únicamente en:

```text
general
```

## Lectura obligatoria

Leer antes de modificar:

```text
Docs/README.md
Docs/_meta/active-work-index.md
Docs/03_standards/global-governance.md
Docs/01_core_erp/auth/README.md
Docs/01_core_erp/auth/user-application-traceability.md
Docs/03_standards/auth/web-auth-login-standard.md
Docs/03_standards/auth/auth-email-delivery-diagnostics-standard.md
Docs/03_standards/gateway/central-gateway-standard.md
Docs/02_projects/jobcron/README.md
Docs/02_projects/jobcron/operational-admin-center.md
Docs/02_projects/refapart/security/00_permissions_matrix.md
```

## Crear documentación nueva

Crear:

```text
Docs/01_core_erp/auth/data-retention-and-erasure-policy.md
Docs/01_core_erp/auth/super-admin-seed-policy.md
Docs/01_core_erp/auth/tenant-identity-scope-standard.md
Docs/02_projects/jobcron/identity-access-admin-center.md
Docs/02_projects/jobcron/internal-support-access-policy.md
Docs/02_projects/jobcron/auth-email-log-access-policy.md
```

Actualizar:

```text
Docs/01_core_erp/auth/user-application-traceability.md
Docs/02_projects/jobcron/operational-admin-center.md
Docs/03_standards/gateway/central-gateway-standard.md
Docs/01_core_erp/apis/gateway-route-registry.md
Docs/01_core_erp/apis/endpoint-ui-consumption-matrix.md
```

## Política de retención

Implementar matriz por tipo de dato:

```text
AUTH_ACCOUNT
AUTH_PROFILE
AUTH_ROLES
AUTH_PERMISSIONS
AUTH_SESSIONS
AUTH_TOKENS
EMAIL_DELIVERY_LOGS
AUDIT_EVENTS
ORDERS
PAYMENTS
INVOICES
SHIPPING_ADDRESSES
SUPPORT_TICKETS
TECHNICAL_LOGS
FILES
DOCUMENTS
SEARCH_HISTORY
```

Cada tipo debe definir:

```text
RetentionCategory
RetentionReason
CanUserRequestDeletion
CanHardDelete
CanAnonymize
CanBlock
LegalHoldApplies
DefaultRetentionDays
DeletionStrategy
RestoreWindowDays
OwnerApi
```

## Regla general

La cancelación solicitada por el usuario debe ejecutarse salvo que exista razón legal, contractual, fiscal, judicial, auditoría obligatoria o derecho de tercero que lo impida.

Cuando no proceda borrar físicamente:

```text
1. Bloquear dato.
2. Detener tratamiento ordinario.
3. Conservar solo para responsabilidad legal/contractual.
4. Anonimizar lo que no sea necesario.
5. Documentar motivo.
6. Informar estado.
```

## Estrategias de eliminación

Usar estas estrategias:

```text
SOFT_DELETE_90_DAYS
BLOCK_THEN_DELETE
ANONYMIZE_THEN_KEEP
HARD_DELETE_NOW
LEGAL_HOLD
NO_DELETE_DEACTIVATE_ONLY
```

## Flujo de eliminación por usuario

```text
Usuario solicita eliminación
-> validar identidad
-> localizar Tenant + ApplicationCode
-> crear DataErasureRequest
-> clasificar datos por API
-> detectar bloqueos legales/fiscales/contractuales
-> desactivar cuenta
-> revocar sesiones y tokens
-> bloquear datos no eliminables
-> anonimizar datos operativos
-> borrar datos eliminables
-> conservar auditoría mínima
-> generar constancia interna
```

## Ventana de 90 días

La ventana de 90 días aplica como rollback operativo interno antes de eliminación definitiva cuando no exista solicitud explícita de eliminación inmediata validada.

Estados:

```text
ACTIVE
SUSPENDED
PENDING_DELETION
BLOCKED
ANONYMIZED
DELETED
HARD_DELETED
LEGAL_HOLD
RESTORED
```

## Hard delete

Permitir hard delete solo si:

```text
- no existe obligación legal/fiscal/contractual;
- no hay pedido, factura, pago o disputa activa;
- no hay legal hold;
- no es usuario semilla;
- no es superuser;
- fue solicitado por titular o autorizado por JOBCRON_SUPER_ADMIN;
- existe doble confirmación;
- existe motivo obligatorio;
- queda auditoría mínima sin datos sensibles.
```

## Tenants

No usar solo `ApplicationCode`.

Definir modelo conceptual:

```text
Tenant
Application
TenantApplication
UserTenantMembership
SupportAccessGrant
TenantRole
TenantPermission
```

Regla:

```text
ApplicationCode identifica la plataforma.
Tenant identifica la empresa dueña/cliente/operador.
UserTenantMembership define alcance real del usuario.
```

Ejemplos:

```text
Tenant: JobCron Internal
ApplicationCode: REFAPART
Usuario: REFAPART_ADMIN interno

Tenant: Empresa Externa ABC
ApplicationCode: JOBCRON_SAAS
Usuario: COMPANY_OWNER
```

## Soporte interno JobCron

JobCron puede dar soporte a empresas externas desde la misma plataforma, pero con acceso controlado.

Crear flujo:

```text
Empresa solicita soporte
-> JobCron crea SupportAccessGrant
-> define alcance: usuario, módulo, aplicación, tiempo
-> soporte entra con modo asistido
-> todo queda auditado
-> al vencer tiempo se revoca acceso
```

## Perfiles internos JobCron

Definir:

```text
JOBCRON_SUPER_ADMIN
JOBCRON_PLATFORM_ADMIN
JOBCRON_SUPPORT_ADMIN
JOBCRON_AUDITOR
JOBCRON_BILLING_ADMIN
JOBCRON_SECURITY_ADMIN
```

## Perfiles externos

Definir:

```text
COMPANY_OWNER
COMPANY_ADMIN
COMPANY_USER_MANAGER
COMPANY_BILLING_MANAGER
COMPANY_SUPPORT_CONTACT
APPLICATION_ADMIN
APPLICATION_OPERATOR
```

## Logs de correo

Regla estricta:

```text
Los logs de correo solo pueden ser vistos por perfiles internos JobCron.
Las empresas externas no pueden ver logs de correo.
```

Accesos:

```text
JOBCRON_SUPER_ADMIN:
- ve todo el log sanitizado
- puede reenviar
- puede marcar revisión técnica

JOBCRON_PLATFORM_ADMIN:
- ve estado, proveedor, request_id, message_id, errores sanitizados
- puede reenviar

JOBCRON_SUPPORT_ADMIN:
- ve email, usuario, application_code, status, failure_reason sanitizado
- puede reenviar activación/reset
- no ve payload técnico completo

JOBCRON_AUDITOR:
- solo lectura
- no reenvía

COMPANY_OWNER:
- no ve logs
- puede solicitar soporte
```

Nunca mostrar:

```text
passwords
tokens
access tokens
refresh tokens
links completos de activación con token
secretos AWS/SMTP
cookies
payloads crudos con credenciales
```

## Usuario semilla

Nombre operativo:

```text
JobCron
```

Crear como:

```text
FirstName = JobCron
LastName = System
Email = jobcron.master@<dominio-final>
ApplicationCode = JOBCRON
Role = JOBCRON_SUPER_ADMIN
IsStaff = true
IsSuperuser = true
```

Reglas:

```text
- No nace por registro público.
- Nace por seed o comando administrativo.
- No se elimina desde UI.
- No se suspende desde UI común.
- No puede degradarse sin procedimiento especial.
- Debe quedar documentado como cuenta raíz del ecosistema.
- MFA debe estar preparado, pero no obligatorio para MVP.
```

## MFA

MVP:

```text
Login normal con email/password.
MFA preparado a nivel modelo, endpoint y UI futura.
No bloquear salida al mercado por MFA.
```

Preparar:

```text
MfaEnabled
MfaMethod
MfaEnforcedAt
MfaRecoveryCodes
RequireMfaForRole
```

MFA futuro obligatorio para:

```text
JOBCRON_SUPER_ADMIN
JOBCRON_SECURITY_ADMIN
JOBCRON_PLATFORM_ADMIN
```

## Endpoints administrativos vía Gateway

Proponer/documentar:

```text
GET    /api/v1/admin/identity/tenants/
POST   /api/v1/admin/identity/tenants/
GET    /api/v1/admin/identity/applications/
GET    /api/v1/admin/identity/users/
POST   /api/v1/admin/identity/users/
PATCH  /api/v1/admin/identity/users/{id}/
POST   /api/v1/admin/identity/users/{id}/suspend/
POST   /api/v1/admin/identity/users/{id}/reactivate/
POST   /api/v1/admin/identity/users/{id}/delete-request/
POST   /api/v1/admin/identity/users/{id}/restore/
POST   /api/v1/admin/identity/users/{id}/hard-delete/

GET    /api/v1/admin/privacy/erasure-requests/
POST   /api/v1/admin/privacy/erasure-requests/
GET    /api/v1/admin/privacy/erasure-requests/{id}/
POST   /api/v1/admin/privacy/erasure-requests/{id}/approve/
POST   /api/v1/admin/privacy/erasure-requests/{id}/reject/
POST   /api/v1/admin/privacy/erasure-requests/{id}/execute/

GET    /api/v1/admin/support/access-grants/
POST   /api/v1/admin/support/access-grants/
POST   /api/v1/admin/support/access-grants/{id}/revoke/

GET    /api/v1/admin/auth/email-logs/
GET    /api/v1/admin/auth/email-logs/{id}/
POST   /api/v1/admin/auth/email-logs/{id}/resend/
```

## Criterios de cierre

Cerrar cuando quede documentado:

```text
1. Política de retención por tipo de dato.
2. Estrategia de hard delete, anonimización y bloqueo.
3. Modelo Tenant + ApplicationCode.
4. Soporte interno JobCron con acceso auditado.
5. Perfiles internos y externos.
6. Acceso restringido a logs de correo.
7. Usuario semilla JobCron.
8. MFA preparado pero no obligatorio en MVP.
9. Endpoints Gateway propuestos.
10. Matriz de permisos.
11. Flujo de eliminación y restauración.
12. Flujo de solicitud de soporte.
```

## Reporte final esperado

Entregar:

```text
- documentos leídos;
- documentos creados/modificados;
- decisiones tomadas;
- endpoints propuestos;
- modelos propuestos;
- perfiles definidos;
- pendientes no cerrados;
- riesgos detectados.
```

No puedo confirmar que esta política ya exista completa en el repo; lo correcto es que Codex la agregue con estos documentos y reglas.

[1]: https://www.diputados.gob.mx/LeyesBiblio/pdf/LFPDPPP.pdf "Ley Federal de Protección de Datos Personales en Posesión de los Particulares"
