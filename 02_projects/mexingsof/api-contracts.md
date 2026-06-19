# Contratos API MexIngSof

## Estado

MVP_FUNCIONAL_EN_AGENT_WORKSPACE

## Alcance

La web MexIngSof usa APIs Next.js locales para productos corporativos y leads.
No se crea API core nueva ni API especializada Django porque el alcance actual
es landing corporativa con administracion basica.

## Endpoints

| Metodo | Ruta | Uso | Estado |
|---|---|---|---|
| `GET` | `/api/products` | Lista productos activos ordenados por `sortOrder`. | IMPLEMENTADO |
| `PATCH` | `/api/products/{id}` | Actualiza `status`, `isActive`, `isOnline`, `publicUrl`, `sortOrder`. | IMPLEMENTADO |
| `POST` | `/api/contact` | Valida y guarda lead publico. | IMPLEMENTADO |
| `GET` | `/api/contact-leads` | Lista leads de contacto. | IMPLEMENTADO_SIN_AUTH |
| `PATCH` | `/api/contact-leads/{id}` | Cambia estado de lead. | IMPLEMENTADO_SIN_AUTH |

## Modelos Prisma

| Modelo | Uso |
|---|---|
| `Product` | Soluciones visibles en landing. |
| `ContactLead` | Leads capturados por formulario. |

## Estados

Producto:

- `PENDING`
- `READY`
- `ONLINE`
- `PAUSED`
- `ARCHIVED`

Lead:

- `NEW`
- `CONTACTED`
- `QUALIFIED`
- `DISCARDED`

## Reglas

- Si `Product.status=ONLINE`, `isActive=true`, `isOnline=true` y existe
  `publicUrl`, la tarjeta muestra link publico.
- Si `Product.status=READY`, muestra `Listo proximamente`.
- Si `Product.status=PENDING`, muestra `En desarrollo`.
- Si `Product.isActive=false`, no se muestra en la landing publica.

## Pendientes

- PENDIENTE_DE_DEFINIR: Auth/Gateway para admin.
- PENDIENTE_DE_DEFINIR: repositorio runtime oficial.
- PENDIENTE_DE_DEFINIR: si los leads se integran a un CRM core futuro o quedan
  como tabla local de MexIngSof.
