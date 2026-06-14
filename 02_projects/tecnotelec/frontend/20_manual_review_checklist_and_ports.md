# Checklist manual y puertos Tecno Telec

> Estado: vigente.

## Objetivo

Definir que enlaces, componentes, botones, banners y puertos deben revisarse al probar la web Tecno Telec.

## Puertos y hosts

| Proyecto web | Docker interno | Puerto local directo | Nginx/local host | Repo |
|---|---:|---:|---|---|
| JobCron | `web-frontend-node:3000` | `http://localhost:3000` | `http://localhost` | `WEB.NJ.NEXT.JobCron` |
| Tecno Telec | `web-frontend-node:3001` | `http://localhost:3001` | `http://tecnotelec.localhost` | `WEB.NJ.NEXT.TecnoTelec` |
| LexNova | `web-frontend-node:3002` | `http://localhost:3002` | `http://lexnova.localhost` | pendiente repo propio |

En Windows, `tecnotelec.localhost` y `lexnova.localhost` pueden no resolver sin configuracion local. Si no resuelven, probar por puerto directo:

```text
http://localhost:3001
http://localhost:3002
```

Tecno Telec dentro de Docker debe consumir Gateway por red interna:

```text
http://api-backend-python:8008
```

Cuando se pruebe sin Docker, puede usarse:

```text
http://localhost:8025/api/v1/projects/TECNOTELEC
```

## APIs de soporte para validar datos

Estas rutas son solo para validacion tecnica. No deben mostrarse como enlaces principales al cliente final.

| API | URL local |
|---|---|
| Gateway health | `http://localhost:8025/health/` |
| Soluciones publicas | `http://localhost:8025/api/v1/projects/TECNOTELEC/api/solutions/` |
| API de proyecto | `http://localhost:8025/api/v1/projects/TECNOTELEC/` |
| Catalog API | `http://localhost:8025/api/v1/core/catalog/` |

## Enlaces publicos a revisar

| Ruta | Que revisar |
|---|---|
| `/` | Hero, decision de camino, soluciones vacias/dinamicas, catalogo destacado dinamico, proyectos sin datos si no hay API. |
| `/soluciones` | Lista dinamica de soluciones o mensaje `Sin soluciones publicadas por el momento`. |
| `/soluciones/[slug]` | Breadcrumb, CTA a diagnostico, componentes reales o sin datos. |
| `/catalogo` | Productos dinamicos, filtros multiples, paginacion y estado vacio si Gateway no responde. |
| `/catalogo/[slug]` | Detalle desde Gateway, imagen real o placeholder, CTA correcto y breadcrumb. |
| `/cotizador` | Formulario, necesidades desde soluciones publicadas o mensaje sin datos. |
| `/contacto` | Formulario visual y mensajes de contacto sin datos falsos. |
| `/login` | Estado sin acceso disponible hasta Auth real. |
| `/portal` | Estado sin informacion disponible hasta datos reales. |
| `/admin` | Estado sin datos administrativos hasta permisos/modulos reales. |

## Componentes a verificar

| Componente | Verificacion |
|---|---|
| `SiteHeader` | Navegacion base, categorias dinamicas si existen, menu mobile abre/cierra. |
| `DecisionPaths` | Dos caminos claros: solucion completa o productos. |
| `CatalogBrowser` | Busqueda, multiseleccion de categorias, multiseleccion de marcas, precio maximo, limpiar filtros. |
| `ProductCard` | Imagen, marca, modelo, categoria, precio, existencia, CTA humano. |
| `SolutionCard` | Solo debe aparecer si Gateway devuelve soluciones reales. |
| `QuoteStepperPreview` | Debe orientar sin prometer resultado automatico real. |
| `SiteFooter` | No debe mostrar datos de contacto inventados. |

## Botones y CTAs

| Boton | Ruta esperada |
|---|---|
| `Comienza tu diagnostico` | `/cotizador` |
| `Necesito una solucion` | `/soluciones` |
| `Ver productos` | `/catalogo` |
| `Hablar por WhatsApp` | `https://wa.me/527711445514?...` con mensaje contextual. |
| `Aplicar filtros` | `/catalogo` con querystring. |
| `Limpiar filtros` | `/catalogo` |
| `Anterior/Siguiente` | `/catalogo?page=N` conservando filtros. |

## Banners y estados vacios

| Area | Estado correcto sin datos |
|---|---|
| Soluciones home | `Sin soluciones publicadas por el momento`. |
| Catalogo home | `Catalogo en preparacion`. |
| Proyectos tipo | `Sin proyectos publicados por el momento`. |
| Catalogo | `Sin productos para mostrar`. |
| Portal | `Sin informacion disponible`. |
| Admin | `Sin datos administrativos`. |

## Lentitud al navegar

La navegacion puede sentirse lenta cuando:

- El Gateway no esta levantado.
- La URL del Gateway apunta a `localhost` dentro del contenedor.
- Las APIs Core tardan en responder o no estan saludables.

Mitigacion implementada:

- Timeout corto para llamadas al Gateway desde la web.
- Timeout local recomendado: `1000 ms` para no bloquear la experiencia cuando Gateway no responde.
- URL interna Docker para Gateway: `http://api-backend-python:8008`.
- Estados vacios en lugar de esperar indefinidamente o inventar contenido.
- `next dev` se ejecuta con Turbopack en Docker para reducir la compilacion inicial de rutas.
- El Gateway consulta Pricing, Inventory y Supplier en paralelo para evitar que el listado espere producto por producto.

Riesgo vigente:

- El contenedor web actual corre en modo desarrollo; la primera visita a una ruta puede tardar mientras Next compila bajo demanda. Para pruebas de rendimiento reales se debe crear un modo Docker de produccion con `next build` + `next start` y sin montajes de codigo fuente.

## Comandos utiles

```bash
docker compose -f Docker.WEB.NJ/docker-compose.yml config
docker compose -f Docker.WEB.NJ/docker-compose.yml build web-frontend-node
docker compose -f Docker.WEB.NJ/docker-compose.yml up -d web-frontend-node
docker logs --tail=120 web-frontend-node
```
