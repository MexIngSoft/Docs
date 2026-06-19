# MexIngSof Web

Landing corporativa de MexIngSof creada con Next.js, React, TypeScript, Prisma
y PostgreSQL. Replica la maqueta de referencia del agent con header, hero,
barra de valor, soluciones, tecnologia/cobertura, contacto y footer.

## Rutas

| Ruta | Uso |
|---|---|
| `/` | Pagina publica corporativa. |
| `/admin/products` | Admin basico de productos y estados. |
| `/admin/leads` | Admin basico de leads de contacto. |
| `/api/products` | Lista productos activos ordenados por `sortOrder`. |
| `/api/products/[id]` | Actualiza estado, visibilidad, URL publica y orden. |
| `/api/contact` | Guarda leads publicos. |
| `/api/contact-leads` | Lista leads. |
| `/api/contact-leads/[id]` | Actualiza estado de lead. |

## Variables de entorno

Crear `.env` desde `.env.example`:

```bash
cp .env.example .env
```

Variable principal:

```text
DATABASE_URL="postgresql://user:password@localhost:5432/mexingsof"
```

## Instalacion local

```bash
npm install
npx prisma generate
npx prisma migrate dev --name init
npm run seed
npm run dev
```

Abrir:

```text
http://localhost:3000
```

## Validacion

```bash
npm run lint
npm run build
```

## Prisma

Modelos principales:

- `Product`: soluciones visibles en la pagina publica.
- `ContactLead`: solicitudes capturadas por el formulario.

Estados de producto:

- `PENDING`
- `READY`
- `ONLINE`
- `PAUSED`
- `ARCHIVED`

Reglas:

- `ONLINE` + `isActive=true` + `isOnline=true` muestra link a `publicUrl`.
- `READY` muestra `Listo proximamente`.
- `PENDING` muestra `En desarrollo`.
- `isActive=false` oculta el producto en la pagina publica.

Estados de lead:

- `NEW`
- `CONTACTED`
- `QUALIFIED`
- `DISCARDED`

## Seguridad pendiente

Los paneles `/admin/products` y `/admin/leads` no tienen autenticacion porque el
agent pidio dejar Auth para despues. Antes de produccion se debe integrar Auth
mediante Gateway General.

## Assets

Los assets de referencia fueron copiados a:

```text
public/brand/
```

Las fuentes originales del agent no se eliminan por regla documental del
repositorio: no borrar fuentes; conservar trazabilidad.
