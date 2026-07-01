# Permisos

## Modelo

```text
recurso:accion:ambito
```

Ejemplos:

- `catalog:read:project`
- `pricing:update:tenant`
- `document:process:user`

## Reglas

- Todo permiso debe tener recurso y accion.
- Los permisos sensibles requieren auditoria.
- Costos y margenes no deben exponerse sin permiso explicito.

## Operacion por Gateway

La administracion reutilizable de permisos se expone a los frontends internos
por Gateway General, no por consumo directo de Auth:

```http
GET    /api/v1/admin/identity/users/
PATCH  /api/v1/admin/identity/users/{id}/
POST   /api/v1/admin/identity/users/{id}/roles/
DELETE /api/v1/admin/identity/users/{id}/roles/{roleId}/
GET    /api/v1/admin/identity/roles/
PATCH  /api/v1/admin/identity/roles/{id}/permissions/
GET    /api/v1/admin/identity/permissions/
```

El filtro `application_code` define el alcance operativo. Ejemplos:

- `application_code=JOBCRON`: administracion global de consola.
- `application_code=REFAPART`: roles y permisos de RefaPart.
- `application_code=MEXINGSOF`, `TECNOTELEC` o futuras aplicaciones:
  mismos contratos, distinto alcance.

Solo `JOBCRON_SUPER_ADMIN` puede operar sin limitaciones. Cualquier rol delegado
debe estar acotado por aplicacion y auditado.
