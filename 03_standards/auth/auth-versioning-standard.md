# Estandar de versionado Auth

## Objetivo

Evitar que cambios en Auth rompan proyectos web, gateways o APIs activas.

## Versiones

Auth debe declarar version de contrato con este esquema:

```text
v1
v1.1
v1.2
v2
```

Reglas:

- cambios compatibles: misma version mayor;
- cambios que rompen contrato: nueva version mayor;
- endpoints viejos no se eliminan sin periodo de deprecacion;
- cada proyecto declara que version consume.

## Endpoints versionados

Preferido:

```text
/api/v1/auth/login/
/api/v1/auth/logout/
/api/v1/auth/refresh/
/api/v1/auth/me/
/api/v1/auth/me/permissions/
```

Si existen endpoints sin version, se mantienen como compatibilidad temporal
hasta documentar migracion.

## Compatibilidad

Un proyecto activo puede permanecer en `Auth v1` mientras otro migra a `Auth v2`.
El Gateway del proyecto decide que version consume.

No se debe migrar todos los proyectos automaticamente por un cambio de Auth.

## Deprecacion

Antes de retirar una version:

1. marcarla como `deprecated`;
2. listar proyectos afectados;
3. crear plan de migracion;
4. validar login, refresh, permisos y logout;
5. mantener periodo de convivencia;
6. confirmar que ningun proyecto activo depende de la version vieja.

## Matriz obligatoria

La compatibilidad vive en:

```text
Docs/02_projects/_ecosystem/api-version-matrix.md
```

Cada cambio mayor de Auth debe actualizar esa matriz.

## Checklist de cambio Auth

- [ ] Version anterior documentada.
- [ ] Version nueva documentada.
- [ ] Endpoints compatibles identificados.
- [ ] Gateways afectados identificados.
- [ ] Proyectos afectados listados.
- [ ] Rollback documentado.
- [ ] Periodo de deprecacion definido.
- [ ] `api-version-matrix.md` actualizado.
