# Inventario de endpoints API

## Estado

ACTUALIZADO_PARCIAL.

## Gateway General

| Ruta | Responsable | Estado |
|---|---|---|
| `POST /api/v1/auth/login/` | Gateway -> Auth | Validado en JobCron. |
| `GET /api/v1/auth/me/permissions/` | Gateway -> Auth | Usado por webs protegidas. |
| `GET /api/v1/admin/identity/users/` | Gateway -> Auth | Validado; lista todos los usuarios cuando no hay filtro. |
| `GET /api/v1/admin/identity/users/?application_code=REFAPART` | Gateway -> Auth | Validado; filtra RefaPart. |
| `POST /api/v1/admin/identity/users/{id}/roles/?application_code=<APP>` | Gateway -> Auth | Validado con rol RefaPart. |
| `DELETE /api/v1/admin/identity/users/{id}/roles/{roleId}/?application_code=<APP>` | Gateway -> Auth | Validado con rol RefaPart. |
| `POST /api/v1/admin/identity/users/{id}/permissions/?application_code=<APP>` | Gateway -> Auth | Validado con permiso especial RefaPart. |
| `DELETE /api/v1/admin/identity/users/{id}/permissions/{permissionId}/?application_code=<APP>` | Gateway -> Auth | Validado con permiso especial RefaPart. |
| `GET/PATCH /api/v1/admin/identity/roles/{id}/` | Gateway -> Auth | Validado para `DisplayName`/`Description`. |

## Riesgo documental

DocuCore mantiene contratos escritos como `/api/gateway/*`. Debe migrarse o
marcarse legacy antes de implementar consumo nuevo.
