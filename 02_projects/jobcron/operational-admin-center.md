# JobCron como centro administrativo operativo

## Objetivo

Definir JobCron como centro de gobierno operativo, financiero y comercial de los
proyectos, no solo como ejecutor de tareas programadas.

## Regla principal

JobCron administra reglas y visibilidad. No ejecuta procesamiento especializado
de productos como OCR, conversion documental, analisis legal o personalizacion
grafica.

## Responsabilidades

| Area | JobCron administra |
|---|---|
| Feature flags | Visibilidad por proyecto, pais, entorno y estado. |
| Jobs | Calendarios, reintentos, dependencias y auditoria. |
| Creditos | Reglas, saldos agregados, promociones y reportes. |
| Planes | Limites por plan, trial, freemium y enterprise. |
| Publicidad | Reglas de creditos recompensados y ubicaciones permitidas. |
| Auditoria | Cambios administrativos, aprobaciones y trazabilidad. |
| Operacion | Alertas, metricas, health checks y tableros. |
| Identity & Access | Consola operativa para consultar usuarios, asignar roles por aplicacion y revisar permisos efectivos sin duplicar Auth. |

## Limites

| No pertenece a JobCron | Responsable |
|---|---|
| Procesar PDF/OCR/conversion | DocuCore / Document API |
| Interpretar expedientes juridicos | LexNova |
| Parsear CFDI | Fiscora |
| Renderizar personalizador grafico | Imagrafity |
| Catalogo tecnico de Tecno Telec | Tecno Telec + Core Catalog |

## MVP administrativo recomendado

1. FeatureAvailability.
2. Catalogo de reglas de creditos.
3. Planes y limites.
4. Auditoria de cambios.
5. Dashboard operativo.
6. Reportes de consumo por proyecto.
7. Identity & Access sobre Auth/Gateway.

## Identity & Access

JobCron es la consola administrativa donde se debe operar la asignacion de
roles y permisos a usuarios registrados, pero **Auth sigue siendo la autoridad
real**.

## Acceso administrativo de desarrollo

Para validar JobCron localmente existe una semilla de desarrollo en Auth:

```text
ApplicationCode: JOBCRON
Rol: JOBCRON_SUPER_ADMIN
Usuario: super.admin.jobcron@yopmail.com
Contrasena temporal dev: JobCron.Temp#2026!
```

La contrasena temporal vive en la migracion de desarrollo
`API.PY.DJANGO.Auth/access/migrations/0022_jobcron_super_admin_real_email.py`.
El usuario queda marcado con `MustChangePassword=True`; despues de iniciar
sesion la web debe enviarlo a `/admin/cambiar-contrasena` y no debe permitir
operacion normal con la contrasena temporal.

Flujo implementado:

1. `WEB.NJ.NEXT.JobCron/app/login/page.tsx` muestra el login.
2. `WEB.NJ.NEXT.JobCron/app/login/LoginForm.tsx` envia credenciales al Gateway.
3. El Gateway llama Auth usando `X-Application-Code: JOBCRON`.
4. Auth crea cookies de sesion.
5. La web consulta `/auth/me/permissions/`.
6. Solo permite entrada administrativa si encuentra `JOBCRON_SUPER_ADMIN`,
   `JOBCRON_PLATFORM_ADMIN` o permiso `jobcron.overview.read`.
7. Si Auth responde `must_change_password=true`, la web muestra cambio
   obligatorio y al confirmar Auth deja `MustChangePassword=False`.

Este usuario es de desarrollo. En produccion debe crearse por flujo seguro de
alta de super admin, rotacion y auditoria.

Rutas web iniciales:

```text
WEB.NJ.NEXT.JobCron/app/admin/usuarios/page.tsx
WEB.NJ.NEXT.JobCron/app/admin/roles/page.tsx
WEB.NJ.NEXT.JobCron/app/admin/permisos/page.tsx
WEB.NJ.NEXT.JobCron/app/admin/cambiar-contrasena/page.tsx
```

Responsabilidades:

| Area | Responsable real | JobCron hace |
|---|---|---|
| Usuarios | Auth API | Consulta, filtra y muestra estado por aplicacion. |
| Roles | Auth API | Permite solicitar/asignar roles segun alcance del operador. |
| Permisos | Auth API | Muestra permisos efectivos y evita cambios fuera del mapa documentado. |
| Auditoria | Auth + JobCron | Registra quien asigno, suspendio o retiro permisos. |
| Aplicacion | Auth Applications | Filtra por `ApplicationCode`, por ejemplo `REFAPART`. |

Reglas:

- RefaPart no debe tener una pantalla propia para asignar permisos globales.
- `REFAPART_ADMIN` puede operar RefaPart, pero la asignacion formal del rol
  debe resolverse por Auth mediante la consola JobCron.
- `CanManageProducts` habilita alta, edicion, publicacion/ocultamiento y
  eliminacion de productos en RefaPart.
- No se deben asignar roles fuera del `ApplicationCode` autorizado.
- No se deben borrar usuarios productivos desde UI sin politica de retencion,
  doble confirmacion, auditoria y rollback.

Contratos Gateway requeridos:

```http
GET    /api/v1/admin/identity/users/
PATCH  /api/v1/admin/identity/users/{id}/
POST   /api/v1/admin/identity/users/{id}/roles/
DELETE /api/v1/admin/identity/users/{id}/roles/{roleId}/
GET    /api/v1/admin/identity/roles/
PATCH  /api/v1/admin/identity/roles/{id}/permissions/
GET    /api/v1/admin/identity/permissions/
```

Estado:

- UI JobCron creada como consola inicial.
- Login JobCron conectado a Auth/Gateway para desarrollo.
- Semilla Auth aplicada para `JOBCRON_SUPER_ADMIN` con correo real de
  desarrollo.
- Gateway versionado `/api/v1/admin/identity/*` implementado contra Auth.
- Los endpoints administrativos en Auth existen como
  `/api/access/identity/users/*`, `/api/access/roles/*` y
  `/api/access/permissions/*`.
- La UI consume usuarios, roles y permisos reales via Gateway, con filtro por
  `ApplicationCode`, busqueda de correo, asignacion y retiro de roles.

## Pendientes

- Crear flujo productivo para alta, baja y rotacion de super admins.
- Definir MFA obligatorio para `JOBCRON_SUPER_ADMIN` antes de produccion.
- Roles de aprobacion productivos.
- Ledger de creditos.
- Reportes financieros.
- Integracion Billing.
