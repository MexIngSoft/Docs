# Estandares frontend

## Objetivo

Definir como se crean, organizan, operan y escalan los proyectos web o mobile del ecosistema.

## Documentos

- `nextjs-project-standard.md`: estandar base para proyectos Next.js.
- `shared-docker-frontend-architecture.md`: convivencia de varios frontends dentro de `Docker.WEB.NJ`.
- `nextjs-runtime-recovery-standard.md`: protocolo para recuperar webs Next.js cuando fallan estilos, cache o dev server.
- `pre-development-checklist.md`: validaciones obligatorias antes de iniciar desarrollo frontend.
- `catalog-visibility-rules.md`: reglas de visibilidad comercial para productos, precios y proveedor.
- `02_placeholder_strategy.md`: reglas de placeholders locales para imagenes, banners, usuarios y estados vacios.

## Regla

Todo frontend debe consumir el Gateway General. Ningun frontend debe consumir
directamente APIs core del ERP, APIs compartidas, APIs de proveedor ni bases de
datos.

Si el frontend requiere sesion, debe seguir:

```text
Docs/03_standards/auth/web-auth-login-standard.md
```
