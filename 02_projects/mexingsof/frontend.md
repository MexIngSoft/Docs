# Frontend MexIngSof

## Estado

MVP_FUNCIONAL_EN_REPOSITORIO_WEB_LOCAL

## Proyecto canonico

```text
Docker.WEB.NJ/WEB.NJ.NEXT.MexIngSof
```

Repositorio esperado:

```text
https://github.com/MexIngSoft/WEB.NJ.NEXT.MexIngSof.git
```

El remoto no esta accesible desde esta maquina al 2026-06-18; GitHub responde
`Repository not found`.

## Stack

- Next.js.
- React.
- TypeScript.
- Prisma para el MVP local.
- PostgreSQL mediante `Docker.DB.PG` cuando se defina la base `mexingsof`.
- CSS propio.
- `lucide-react`.

## Runtime Docker

| Elemento | Valor canonico |
|---|---|
| Orquestador web | `Docker.WEB.NJ` |
| Compose compartido | `comercial_platform` |
| Red Docker | `jobcron_network` |
| Servicio | `web-frontend-node` |
| Proyecto en contenedor | `/usr/src/web/mexingsof` |
| Puerto local | `3009` |

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
Docs/_archive/PENDIENTE_DE_DEFINIR
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

Las fuentes visuales originales deben conservarse como archivo historico si se
retiran de ubicaciones activas. No deben usarse como runtime web.

## Pendientes

- PENDIENTE_DE_DEFINIR: acceso o creacion del remoto
  `MexIngSoft/WEB.NJ.NEXT.MexIngSof`.
- PENDIENTE_DE_DEFINIR: integrar Auth via Gateway General para rutas admin.
- PENDIENTE_DE_DEFINIR: datos reales de telefono, direccion y horario.
