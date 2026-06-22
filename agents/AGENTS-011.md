# INSTRUCCIÓN PARA CODEX — OPTIMIZAR AGENTS-011

Trabaja únicamente en la rama `dev`.

No ejecutes todos los agents.
No implementes código.
No modifiques otros `AGENTS-*.md`.

Optimiza únicamente:

`Docs/agents/AGENTS-011.md`

---

# AGENTS-011 — ContentHub y Publishing API

## Objetivo

Optimizar `AGENTS-011.md` para documentar **ContentHub** como app de presencia digital + agencia asistida, y `Publishing` como motor reutilizable de publicación, sin perder la intención original ni duplicar APIs existentes.

## Alcance

Puede tocar:

* `Docs/agents/AGENTS-011.md`

Debe revisar:

* separación entre `ContentHub` y `Publishing`;
* uso obligatorio de `API.PY.DJANGO.Gateway`;
* consumo de APIs reutilizables;
* módulos web;
* contratos conceptuales;
* datos requeridos de empresas y productos;
* documentos canónicos futuros;
* reporte de ejecución.

Debe dejar:

* agente más claro;
* lectura mínima;
* tareas verificables;
* validaciones;
* criterio de cierre;
* reporte en `Docs/agents/EXECUTION_REPORT.md`.

## Lectura mínima obligatoria

* `Docs/README.md`
* `Docs/_meta/active-work-index.md`
* `Docs/agents/AGENT_GLOBAL_RULES.md`
* `Docs/agents/EXECUTION_REPORT.md`
* `Docs/03_standards/architecture/api-gateway-standard.md`
* `Docs/03_standards/frontend/nextjs-project-standard.md`
* `Docs/03_standards/product/module-catalog.md`
* `Docs/01_core_erp/apis/00_api_index.md`
* `Docs/01_core_erp/apis/reusable-api-contracts.md`
* `Docs/03_standards/codex/codex-output-report-standard.md`
* `Docs/agents/AGENTS-011.md`

## Fuera de alcance

* No ejecutar otros agents.
* No implementar frontend.
* No implementar backend.
* No crear Gateway propio.
* No crear Auth propio.
* No crear APIs nuevas sin contrato.
* No crear schemas, modelos ni migraciones sin decisión documentada.
* No conectar redes sociales reales sin contrato, tokens, permisos y política documentada.
* No modificar `main` ni `pro`.
* No leer todo `Docs`.
* No tocar proyectos no relacionados.
* No duplicar Auth, Catalog, Pricing, Inventory, Sales, Document, Address, Fiscal, Notification ni ETL.

## Clasificación documental obligatoria

Clasificar así:

```text
ContentHub = Independent Product / app de presencia digital + agencia asistida
Publishing = Shared Module / motor reutilizable de publicación
WEB.NJ.NEXT.ContentHub = frontend oficial
API.PY.DJANGO.ContentHub = API propia del producto, solo para lógica de agencia y workspace
API.PY.DJANGO.Publishing = API reutilizable para publicación multicanal
API.PY.DJANGO.Gateway = entrada única del frontend
```

No crear gateway por proyecto.

Flujo obligatorio:

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

## Tareas

1. Reescribir `AGENTS-011.md` conservando toda la intención actual:

   * ContentHub como app de presencia digital;
   * modo autoservicio;
   * modo asistido;
   * modo administrado;
   * agencia asistida;
   * publicación de productos;
   * campañas;
   * calendario editorial;
   * solicitudes de diseño/foto/video;
   * panel de agencia;
   * soporte;
   * planes comerciales.

2. Separar responsabilidades:

`API.PY.DJANGO.Publishing` debe manejar:

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
conectar canales
guardar tokens
programar publicaciones
publicar ahora
reintentar errores
guardar historial
registrar resultado por red social
```

No debe manejar:

```text
campañas de agencia
clientes de agencia
planes comerciales
workspaces comerciales
solicitudes creativas
soporte
```

3. Definir responsabilidades de `API.PY.DJANGO.ContentHub`:

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
modo autoservicio
modo asistido
modo administrado
campañas
calendario editorial
relación cliente-agencia
solicitudes de diseño/foto/video
gestión de empresas cliente
```

4. Documentar módulos web:

```text
Landing pública
Registro/login
Onboarding de empresa
Conexión de redes sociales
Biblioteca de contenido
Productos importados desde empresas
Crear publicación
Auto-publicar producto
Calendario
Campañas
Solicitar diseño/foto/video
Panel de agencia
Soporte
Planes: autoservicio, asistido, administrado
```

5. Documentar datos que ContentHub debe leer de empresas y productos:

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

Origen:

```text
Auth → usuarios, permisos, empresa
Catalog → productos, categorías, marcas
Pricing → precios publicables
Inventory → disponibilidad
Document → imágenes, videos, archivos
Sales → promociones/ofertas futuras
Address → sucursales/ubicaciones
Fiscal → datos fiscales si después se factura el servicio
```

6. Documentar rutas Gateway conceptuales, sin marcarlas como activas:

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

7. Documentar endpoints conceptuales de ContentHub:

```text
POST /contenthub/workspaces
GET /contenthub/workspaces
POST /contenthub/companies
GET /contenthub/companies
POST /contenthub/campaigns
GET /contenthub/campaigns
POST /contenthub/content-requests
GET /contenthub/content-requests
POST /contenthub/creative-tasks
GET /contenthub/agency/dashboard
POST /contenthub/support-tickets
```

8. Documentar endpoints conceptuales de Publishing:

```text
POST /publishing/accounts/connect
GET /publishing/accounts
POST /publishing/posts
GET /publishing/posts
POST /publishing/posts/{id}/publish-now
POST /publishing/posts/{id}/schedule
GET /publishing/schedules
GET /publishing/queue
GET /publishing/logs
POST /publishing/templates
GET /publishing/templates
```

9. Documentar archivos canónicos futuros:

```text
Docs/02_projects/contenthub/00_overview.md
Docs/02_projects/contenthub/01_product_scope.md
Docs/02_projects/contenthub/02_user_flows.md
Docs/02_projects/contenthub/03_modules.md
Docs/02_projects/contenthub/04_data_requirements.md
Docs/02_projects/contenthub/05_api_contracts.md
Docs/02_projects/contenthub/06_mvp_checklist.md
```

Crear en Core solo si aplica y queda justificado:

```text
Docs/01_core_erp/apis/publishing-api.md
Docs/01_core_erp/erp/25_publishing_model.md
```

Actualizar solo si aplica:

```text
Docs/01_core_erp/apis/00_api_index.md
Docs/01_core_erp/erp/01_modules.md
Docs/02_projects/_ecosystem/00_ecosystem_overview.md
Docs/03_standards/operations/git-repository-map.md
```

10. Documentar MVP inicial:

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

11. Actualizar `Docs/agents/EXECUTION_REPORT.md` registrando:

* agent revisado;
* documentos leídos;
* Context Pack usado;
* cambios realizados;
* validaciones;
* pendientes reales;
* bloqueos;
* decisiones documentales;
* APIs reutilizadas;
* APIs no creadas y motivo.

## Validaciones

Ejecutar solo validaciones documentales aplicables:

* validar que solo se modificó `Docs/agents/AGENTS-011.md`;
* validar que no se modificaron otros agents;
* validar que no se creó Gateway propio;
* validar que no se creó Auth propio;
* validar que no se crearon migraciones;
* validar que `ContentHub` no duplica `Publishing`;
* validar que `Publishing` no maneja clientes, campañas comerciales ni planes de agencia;
* validar que todo frontend consume únicamente `API.PY.DJANGO.Gateway`;
* validar que las APIs conceptuales no se marcan como activas sin evidencia;
* validar rutas y enlaces modificados;
* registrar documentos leídos;
* ejecutar `git diff --check` si el entorno lo permite.

No declarar validaciones no ejecutadas.

Si una validación no puede ejecutarse, registrar causa exacta.

## Reporte obligatorio

Actualizar:

`Docs/agents/EXECUTION_REPORT.md`

Debe registrar:

* `AGENTS-011.md`;
* documentos leídos;
* Context Pack elegido;
* documentos fuera de alcance;
* cambios realizados;
* validaciones ejecutadas;
* resultado de validaciones;
* pendientes reales con `PENDIENTE_DE_DEFINIR`;
* bloqueos;
* decisiones documentales;
* estado final del agent.

## Criterio de cierre

El agent queda listo solo si:

* la instrucción es más clara y ejecutable;
* no pierde ninguna decisión del agente actual;
* conserva ContentHub como app de presencia digital + agencia asistida;
* conserva Publishing como motor reutilizable;
* no crea Gateway propio;
* no duplica APIs reutilizables;
* define lectura mínima;
* define alcance;
* define fuera de alcance;
* define tareas verificables;
* define validaciones;
* define dónde reportar;
* deja trazabilidad en `EXECUTION_REPORT.md`.

## Reglas finales

Si `AGENTS-011.md` está vacío, no inventar tareas; dejarlo como `Sin instrucciones`.

Si el agent ya fue ejecutado y no hay cambios nuevos, documentar que está cerrado.

Si falta información esencial, marcar `Bloqueado` y dejar preguntas concretas.

No eliminar, mover ni renombrar `Docs/agents/AGENTS-011.md`.

No limpiar el contenido del agent.

Esta tarea solo optimiza la instrucción del agent; no ejecuta ContentHub ni crea su implementación.
