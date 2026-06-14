Sí, **sí es necesario**.

Auth ya existe como API compartida y ya tiene base técnica: usuarios, roles, permisos, aplicaciones, sesiones, refresh tokens, auditoría y `X-Application-Code`. También Docs ya define que los frontends deben pasar por Gateway/BFF y no consumir APIs core directamente.  

Lo que falta es que **Docs lo declare como estándar obligatorio** para:

```text
Proyectos nuevos:
Auth se implementa por defecto.

Proyectos existentes:
Auth se implementa solo mediante plan de migración documentado.
```

Debe quedar documentado así:

```text
03_standards/auth/web-auth-login-standard.md
03_standards/auth/auth-versioning-standard.md
02_projects/_ecosystem/api-version-matrix.md
02_projects/_templates/auth-migration-template.md
02_projects/_templates/api-dependencies-template.md
```

Regla principal:

```text
Todo proyecto WEB.NJ.NEXT.<Proyecto> debe nacer con Auth estándar,
salvo que su documentación diga explícitamente auth_required: false.
```

Y para proyectos existentes:

```text
No reemplazar login viejo directamente.
Primero crear auth-migration.md.
Después conectar Frontend → Gateway → Auth.
Finalmente retirar login viejo solo cuando el nuevo esté probado.
```

Conclusión: **sí debe quedar definido en Docs antes de seguir creando o migrando proyectos**, para que LexNova, TecnoTelec, DocuCore, Refapart, Imagrafity y los nuevos no implementen login de formas distintas.
