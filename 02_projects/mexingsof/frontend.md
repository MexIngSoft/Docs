# Frontend MexIngSof

## Estado

MVP_FUNCIONAL_EN_AGENT_WORKSPACE

## Proyecto actual

```text
Docs/agents/mexingsof-page/mexingsof-page
```

## Stack

- Next.js.
- React.
- TypeScript.
- Prisma.
- PostgreSQL.
- CSS propio.
- `lucide-react`.

## Rutas publicas

| Ruta | Uso | Estado |
|---|---|---|
| `/` | Landing corporativa MexIngSof. | IMPLEMENTADO |
| `#inicio` | Header + hero principal. | IMPLEMENTADO |
| `#nosotros` | Barra de valor. | IMPLEMENTADO |
| `#soluciones` | Tarjetas de productos. | IMPLEMENTADO |
| `#productos` | Ancla equivalente de productos. | IMPLEMENTADO |
| `#tecnologias` | Cobertura, metricas y tecnologia. | IMPLEMENTADO |
| `#contacto` | CTA y datos de contacto. | IMPLEMENTADO |

## Rutas admin

| Ruta | Uso | Estado |
|---|---|---|
| `/admin/products` | Cambiar estado, activacion, online, URL y orden. | IMPLEMENTADO_SIN_AUTH |
| `/admin/leads` | Ver leads y cambiar estado. | IMPLEMENTADO_SIN_AUTH |

## Regla visual

La pagina debe replicar la referencia visual recibida:

```text
Docs/agents/MexIngSof.png
```

El panel explicativo derecho de la imagen es referencia de requisitos y no se
maqueta como parte de la pagina publica.

## Assets

Assets publicos usados por el proyecto:

```text
public/brand/mexingsof-reference.png
public/brand/mexingsof-banner.png
public/brand/mexingsof-boceto.png
public/brand/mexingsof-significado.png
```

Las fuentes originales del agent se conservan en `Docs/agents` por regla de no
borrar fuentes.

## Pendientes

- PENDIENTE_DE_DEFINIR: mover/promover el MVP a repositorio web oficial.
- PENDIENTE_DE_DEFINIR: integrar Auth via Gateway General para rutas admin.
- PENDIENTE_DE_DEFINIR: datos reales de telefono, direccion y horario.
