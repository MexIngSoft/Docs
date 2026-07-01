# Roles

## Roles base

| Rol | Proposito |
|---|---|
| `Owner` | Control total de tenant/proyecto. |
| `Admin` | Administracion operativa. |
| `Operator` | Ejecucion diaria. |
| `Viewer` | Consulta. |

## Regla

Los roles definen grupos de permisos, no excepciones por pantalla.

## Gobierno JobCron reutilizable

JobCron es la consola operativa para consultar usuarios y asignar roles por
aplicacion, pero Auth conserva la autoridad de datos.

| Rol | Alcance | Uso |
|---|---|---|
| `JOBCRON_SUPER_ADMIN` | Global | Puede consultar, asignar y retirar roles/permisos de cualquier aplicacion conectada. |
| `JOBCRON_PLATFORM_ADMIN` | Global limitado | Administra operacion y feature flags sin ser super admin total. |
| `JOBCRON_SUPPORT_ADMIN` | Soporte | Consulta usuarios, roles y permisos para soporte. |
| `APPLICATION_ADMIN` | Aplicacion | Administra usuarios de una aplicacion delegada. |

Reglas:

- Los roles globales solo se asignan desde JobCron/Auth.
- Los roles por proyecto deben estar vinculados a `ApplicationCode` mediante
  Auth `ApplicationRoles`.
- Una web de proyecto, por ejemplo RefaPart, no debe tener una pantalla propia
  para asignar roles globales.
- Los cambios sensibles deben auditarse en Auth `AccessAuditEvents`.
- El primer super admin de desarrollo puede existir con contrasena temporal,
  pero debe quedar con `MustChangePassword=True` y forzar cambio en UI.
