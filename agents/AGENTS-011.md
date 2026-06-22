Sí. Para hacerlo bien y no rehacer después, el producto debe quedar como **una app de presencia digital + agencia asistida**, no como simple publicador.

# Decisión base

Nombre funcional recomendado:

```text
ContentHub
```

Repositorios:

```text
WEB.NJ.NEXT.ContentHub
API.PY.DJANGO.ContentHub
API.PY.DJANGO.Publishing
```

No crear Gateway propia. Docs ya establece que el frontend debe ir por `API.PY.DJANGO.Gateway` y no por gateways por proyecto . También dice que no se debe crear Gateway propio por defecto salvo excepción documentada .

# Flujo correcto

```text
WEB.NJ.NEXT.ContentHub
↓
API.PY.DJANGO.Gateway
↓
API.PY.DJANGO.ContentHub
↓
API.PY.DJANGO.Publishing
↓
Auth / Catalog / Pricing / Inventory / Sales / Document / Address / Fiscal
```

Docs confirma que `Gateway`, `Auth`, `Catalog`, `Inventory`, `Pricing`, `Sales`, `Document`, `Fiscal` y `Address` ya están activas .

# Qué APIs se necesitan

## 1. `API.PY.DJANGO.Publishing`

Motor reutilizable de publicación.

Debe manejar:

```text
social_accounts
publishing_channels
content_items
media_assets
posts
post_variants
post_schedules
post_queue
post_attempts
publishing_logs
templates
hashtags
approval_status
```

Responsabilidad:

```text
Conectar canales
Guardar tokens
Programar publicaciones
Publicar ahora
Reintentar errores
Guardar historial
Registrar resultado por red social
```

No debe manejar campañas, clientes de agencia ni planes comerciales.

---

## 2. `API.PY.DJANGO.ContentHub`

API propia del producto.

Debe manejar:

```text
workspaces
client_companies
service_levels
managed_accounts
content_requests
creative_tasks
campaigns
campaign_calendar
brand_profiles
publishing_preferences
agency_assignments
support_tickets
```

Responsabilidad:

```text
Modo autoservicio
Modo asistido
Modo administrado
Solicitudes de diseño/foto/video
Campañas
Calendario editorial
Relación cliente-agencia
```

---

## 3. `API.PY.DJANGO.Gateway`

Ya existe y debe exponer rutas para la web:

```text
/contenthub/session
/contenthub/workspaces
/contenthub/companies
/contenthub/products
/contenthub/media
/contenthub/posts
/contenthub/schedules
/contenthub/campaigns
/contenthub/requests
/contenthub/agency
```

El frontend no debe consumir APIs internas directamente; Docs lo prohíbe y exige `Frontend -> API.PY.DJANGO.Gateway -> Project API + Core ERP APIs` .

# Datos que debe consumir de empresas y productos

Para autopublicar productos de TecnoTelec, RefaPart, Imagrafity u otras empresas, ContentHub necesita leer:

```text
company_id
project_code
brand_name
logo
colors
contact_phone
website_url
social_accounts
product_id
product_name
description
price
discount_price
stock_status
category
brand
images
product_url
availability
campaign_tags
publishable_status
```

De dónde sale:

```text
Auth        → usuarios, permisos, empresa
Catalog     → productos, categorías, marcas
Pricing     → precios publicables
Inventory   → disponibilidad
Document    → imágenes, videos, archivos
Sales       → promociones/ofertas futuras
Address     → sucursales/ubicaciones
Fiscal      → datos fiscales si después se factura el servicio
```

# Módulos de la web

```text
1. Landing pública
2. Registro/login
3. Onboarding de empresa
4. Conexión de redes sociales
5. Biblioteca de contenido
6. Productos importados desde empresas
7. Crear publicación
8. Auto-publicar producto
9. Calendario
10. Campañas
11. Solicitar diseño/foto/video
12. Panel de agencia
13. Soporte
14. Planes: autoservicio, asistido, administrado
```

La web debe llamarse bajo el estándar:

```text
WEB.NJ.NEXT.ContentHub
```

porque Docs exige `WEB.NJ.NEXT.NombreProyecto` para proyectos Next.js  y repositorio independiente para cada frontend .

# Dónde documentarlo en Docs

Crear:

```text
02_projects/contenthub/00_overview.md
02_projects/contenthub/01_product_scope.md
02_projects/contenthub/02_user_flows.md
02_projects/contenthub/03_modules.md
02_projects/contenthub/04_data_requirements.md
02_projects/contenthub/05_api_contracts.md
02_projects/contenthub/06_mvp_checklist.md
```

Crear en core:

```text
01_core_erp/apis/publishing-api.md
01_core_erp/erp/25_publishing_model.md
```

Actualizar:

```text
01_core_erp/apis/00_api_index.md
01_core_erp/erp/01_modules.md
02_projects/_ecosystem/00_ecosystem_overview.md
03_standards/operations/git-repository-map.md
```

# MVP para arrancar

Primera entrega:

```text
Login
Crear workspace
Conectar empresa existente
Leer productos publicables
Subir imagen
Crear post
Programar post
Publicar ahora
Calendario mensual
Estado publicado/error
Solicitud de ayuda: diseño/foto/video
```

Con eso ya puedes atraer clientes con la app y luego convertirlos a servicio administrado.
