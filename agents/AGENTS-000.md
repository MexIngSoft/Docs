Sí. Aquí la instrucción completa para Codex, enfocada en **desarrollar ya**, unificar en `dev`, no pasar a `main/pro`, y dejar como autor de nuevos commits a `1CASH1`.

La documentación confirma que toda web debe pasar por `Gateway`, luego API del proyecto y después Core/Shared; también confirma APIs activas como Auth, Gateway, Catalog, Inventory, Pricing, Supplier, Sales, Document, Fiscal, Address, JobCron, TecnoTelec y RefaPart. ([GitHub][1])

# INSTRUCCIÓN CODEX — CIERRE DEV PRODUCTIVO REFAPART, MEXINGSOF, TECNO TELEC Y JOBCron

## OBJETIVO

Desarrollar todo lo necesario para dejar en rama `dev` los proyectos principales listos para validación manual:

1. `MexIngSof`
2. `Refapart`
3. `TecnoTelec`
4. `JobCron`

No pasar cambios a `main` ni `pro`.

La documentación ya fue actualizada; ahora se debe implementar en código lo que falte en webs, APIs, Gateway, Docker, migraciones, seeds, permisos, formularios, búsqueda, cotizaciones, leads y administración.

---

## REGLAS GIT OBLIGATORIAS

1. Trabajar únicamente sobre rama `dev`.
2. Integrar en `dev` todo lo útil de ramas feature existentes.
3. No pasar a `main`.
4. No pasar a `pro`.
5. No borrar ramas remotas sin validar que ya fueron integradas en `dev`.
6. El único autor de nuevos commits debe ser:

```bash
git config user.name "1CASH1"
git config user.email "1CASH1@users.noreply.github.com"
```

7. Antes de borrar ramas locales:

   * verificar que sus cambios estén fusionados en `dev`;
   * guardar evidencia en reporte;
   * no eliminar ramas con cambios no integrados.

8. No reescribir historial remoto ya publicado salvo instrucción explícita posterior.

---

## LECTURA OBLIGATORIA

Antes de modificar código, leer:

```text
Docs/README.md
Docs/_meta/active-work-index.md
Docs/00_audit/10_development_gap_analysis.md
Docs/01_core_erp/apis/00_api_index.md
Docs/01_core_erp/architecture/07_project_api_pattern.md
Docs/03_standards/architecture/api-gateway-standard.md
Docs/03_standards/operations/git-repository-map.md
Docs/02_projects/_ecosystem/04_process_convergence_and_conflicts.md
```

Leer documentación específica de:

```text
Refapart
MexIngSof
TecnoTelec
JobCron
Gateway
Auth
Catalog
Supplier
Pricing
Inventory
Sales
Address
Document
Search
```

Si falta documentación específica, no inventar reglas; usar el patrón documentado y registrar el faltante.

---

## ARQUITECTURA OBLIGATORIA

Todo frontend debe consumir únicamente Gateway.

Flujo permitido:

```text
WEB.NJ.NEXT.<Proyecto>
→ API.PY.DJANGO.Gateway
→ API.PY.DJANGO.<Proyecto>
→ APIs Core ERP / Shared Modules
```

Prohibido:

```text
WEB → API Core directa
WEB → Auth directa
WEB → Search directa
WEB → Base de datos directa
Gateway con reglas permanentes de negocio
Proyecto A consultando base de Proyecto B
```

---

# APIs INDISPENSABLES P0

Estas APIs deben quedar conectadas o validadas para salida inicial:

```text
API.PY.DJANGO.Gateway
API.PY.DJANGO.Auth
API.PY.DJANGO.JobCron
API.PY.DJANGO.RefaPart
API.PY.DJANGO.TecnoTelec
API.PY.DJANGO.Catalog
API.PY.DJANGO.Supplier
API.PY.DJANGO.Pricing
API.PY.DJANGO.Inventory
API.PY.DJANGO.Sales
API.PY.DJANGO.Address
API.PY.DJANGO.Document
API.PY.DJANGO.Search
```

No crear nuevas APIs si ya existe una activa documentada.

No separar Quote API todavía si Sales puede cubrir cotizaciones MVP.

No implementar POS, Cart, Billing completo, Logistics completo ni Rules Engine avanzado salvo que ya exista contrato funcional.

---

# PRIORIDAD 1 — MexIngSof

## Objetivo

MexIngSof debe quedar como web corporativa productiva y capturadora de leads.

## Desarrollar

1. Home igual al diseño aprobado.
2. Secciones:

   * servicios;
   * productos;
   * Refapart;
   * TecnoTelec;
   * JobCron;
   * contacto.
3. Formulario de contacto real.
4. Envío del formulario:

```text
WEB.NJ.NEXT.MexIngSof
→ Gateway
→ JobCron API
→ Lead/Customer/Prospect module
```

5. Crear lead en JobCron.
6. Indexar lead en Search.
7. Mostrar lead en panel JobCron.
8. Validación de errores de formulario.
9. Estados de carga.
10. Manejo de error normalizado desde Gateway.
11. Variables `.env.example`.
12. Quitar mocks si ya existe API real.

## No crear API propia MexIngSof

MexIngSof solo debe usar JobCron vía Gateway, salvo que ya exista documentación que justifique API propia.

---

# PRIORIDAD 2 — Refapart

## Objetivo

Refapart debe recibir solicitudes reales de refacciones y permitir administrarlas desde JobCron.

## Desarrollar en Web Refapart

1. Buscador público de refacciones.
2. Formulario de solicitud:

   * pieza;
   * marca;
   * modelo;
   * año;
   * motor;
   * tipo: nueva/usada/indistinta;
   * fotos;
   * ciudad;
   * teléfono/WhatsApp;
   * urgencia;
   * notas.
3. Guardado real por Gateway.
4. Subida de fotos vía Document API.
5. Estados de carga/error.
6. Confirmación visual al usuario.
7. Sin consumo directo a APIs internas.

## Desarrollar en API Refapart

1. Endpoint para crear solicitud.
2. Endpoint para listar solicitudes.
3. Endpoint para detalle de solicitud.
4. Endpoint para actualizar estado.
5. Endpoint para asignar cotizador.
6. Endpoint para asignar proveedor.
7. Endpoint para registrar respuesta de proveedor.
8. Endpoint para generar cotización.
9. Integración con:

   * Catalog;
   * Supplier;
   * Pricing;
   * Sales;
   * Address;
   * Document;
   * Search.

## Desarrollar en JobCron

Panel Refapart con:

```text
Solicitudes recibidas
Detalle de solicitud
Fotos/evidencias
Estado
Cotizador asignado
Proveedor asignado
Costo proveedor
Precio cliente
Margen
Historial
Cotización
Respuesta al cliente
```

## Search Refapart

Indexar:

```text
solicitudes
piezas buscadas
marcas
modelos
códigos OEM
proveedores
cotizaciones
```

Usar siempre:

```text
project_code=REFAPART
```

---

# PRIORIDAD 3 — TecnoTelec

## Objetivo

TecnoTelec debe quedar como web consultiva/cotizadora, no marketplace genérico.

## Desarrollar en Web TecnoTelec

1. Catálogo visible.
2. Soluciones o paquetes.
3. Fichas de producto.
4. Formulario de cotización.
5. Solicitud de contacto.
6. Envío real vía Gateway.
7. Sin mocks si hay API real.
8. Estados de carga/error.

## Desarrollar en API TecnoTelec

1. Productos visibles por canal.
2. Soluciones consultivas.
3. Leads.
4. Cotizaciones.
5. Reglas de publicación:

   * `SELLABLE`;
   * `QUOTE_ONLY`;
   * `COMPONENT_ONLY`;
   * `BLOCKED`.
6. Integración con:

   * Catalog;
   * Pricing;
   * Inventory;
   * Supplier;
   * Sales;
   * Search;
   * Document, si hay fichas o archivos.

## Desarrollar en JobCron

Panel TecnoTelec con:

```text
Leads
Solicitudes de cotización
Productos publicados
Productos bloqueados
Soluciones
Precios
Proveedores
Stock
Margen
Estado comercial
```

---

# PRIORIDAD 4 — JobCron

## Objetivo

JobCron debe operar MexIngSof, Refapart y TecnoTelec.

## Desarrollar módulos mínimos

```text
Clientes
Leads
Prospectos
Productos
Catálogo
Proveedores
Cotizaciones
Solicitudes Refapart
Cotizaciones TecnoTelec
Usuarios
Roles
Permisos
Search Sync
Errores de integración
```

## Feature Availability

Configurar módulos activos:

```text
MEXINGSOF_LEADS
REFAPART_REQUESTS
REFAPART_QUOTES
TECNOTELEC_PRODUCTS
TECNOTELEC_QUOTES
CATALOG_ADMIN
SUPPLIER_ADMIN
PRICING_ADMIN
SEARCH_ADMIN
```

---

# SEARCH

Search debe operar como API compartida, no como dueño del dato.

## Implementar

1. `search_index`.
2. `search_outbox` en APIs dueñas.
3. Worker de sincronización.
4. Reintentos.
5. Reindexación manual.
6. Reindexación por dominio.
7. Pantalla JobCron `Search Sync`.

## Search debe soportar

```text
CREATE
UPDATE
DELETE lógico
RESTORE
REINDEX
BULK_REINDEX
```

## Si Search cae

El dato real debe guardarse de todos modos.

Flujo correcto:

```text
API dueña guarda dato real
→ crea evento en search_outbox
→ worker intenta indexar
→ si falla, queda pendiente
→ reintenta
→ si es necesario, reindexa desde tabla real
```

---

# PERMISOS MÍNIMOS

Crear o validar roles:

```text
SUPER_ADMIN
ADMIN
SALES
QUOTER
CATALOG_MANAGER
SUPPLIER_MANAGER
REFAPART_OPERATOR
TECNOTELEC_OPERATOR
VIEWER
```

Permisos mínimos:

```text
leads.view
leads.create
leads.update
customers.view
customers.create
customers.update
catalog.view
catalog.create
catalog.update
catalog.publish
supplier.view
supplier.create
supplier.update
pricing.view
pricing.update
sales.quote.create
sales.quote.update
sales.quote.approve
refapart.request.view
refapart.request.create
refapart.request.assign
refapart.quote.create
tecnotelec.product.view
tecnotelec.product.publish
tecnotelec.quote.create
search.query
search.reindex
```

---

# DOCKER Y BASE DE DATOS

1. Usar PostgreSQL.
2. No usar SQLite.
3. Cada API con `.env.example`.
4. Cada API con migraciones.
5. Cada web con `.env.example`.
6. Validar que todo corra en Docker conforme al estándar.
7. No crear contenedores fuera de la estructura oficial.
8. No mezclar código de proyectos en un mismo repo.
9. No versionar APIs dentro del repo Docker orquestador.

---

# SEEDS MÍNIMOS

Crear seeds para:

## MexIngSof

```text
productos visibles
servicios
tipos de lead
estados de lead
```

## Refapart

```text
marcas de autos
categorías de refacciones
tipos de pieza
estados de solicitud
proveedores iniciales
estados de cotización
```

## TecnoTelec

```text
categorías
marcas
productos
soluciones
proveedores
listas de precio
reglas ChannelAssortment
```

## JobCron

```text
usuarios
roles
permisos
proyectos activos
módulos activos
estados comerciales
```

---

# VALIDACIONES OBLIGATORIAS

Antes de cerrar:

1. MexIngSof captura lead real.
2. Refapart crea solicitud real.
3. TecnoTelec crea solicitud de cotización real.
4. JobCron muestra leads reales.
5. JobCron muestra solicitudes Refapart.
6. JobCron muestra cotizaciones TecnoTelec.
7. Gateway está en medio de todas las webs.
8. Ninguna web llama APIs internas directo.
9. Auth protege paneles internos.
10. Search funciona.
11. Search no bloquea guardados si está caído.
12. Reindexación funciona.
13. Document API guarda fotos/evidencias.
14. Sales genera cotización MVP.
15. Catalog responde productos/categorías/marcas.
16. Pricing responde precios.
17. Supplier responde proveedores.
18. Inventory responde disponibilidad cuando aplique.
19. Address normaliza ubicación/dirección.
20. Errores normalizados.
21. Logs visibles.
22. Tests básicos pasan.
23. Migraciones aplicadas.
24. Seeds cargados.
25. Docker levanta correctamente.

---

# UNIFICACIÓN DE RAMAS

Por cada repo involucrado:

```bash
git checkout dev
git pull origin dev
git branch
```

Luego revisar ramas locales y remotas.

Para cada rama feature:

```bash
git checkout dev
git merge <rama-feature>
```

Si hay conflicto:

1. Resolver respetando documentación.
2. No eliminar código funcional sin justificación.
3. Registrar conflicto y resolución.

Después de integrar:

```bash
npm run lint
npm run build
```

o en Django:

```bash
python manage.py check
python manage.py test
python manage.py makemigrations --check
python manage.py migrate
```

Eliminar ramas locales solo si ya están integradas:

```bash
git branch --merged dev
git branch -d <rama>
```

No eliminar ramas remotas sin confirmación manual.

---

# COMMITS

Todos los commits nuevos deben salir con:

```bash
git config user.name "1CASH1"
git config user.email "1CASH1@users.noreply.github.com"
```

Formato:

```text
feat(refapart): complete request flow through gateway
feat(mexingsof): connect lead form to jobcron
feat(tecnotelec): connect quote flow to sales
feat(jobcron): add admin panels for priority projects
feat(search): add outbox sync and reindex support
fix(gateway): normalize project API errors
docs: update production readiness report
```

---

# REPORTE FINAL

Crear o actualizar:

```text
Docs/agents/EXECUTION_REPORT.md
```

Debe incluir:

```text
Repos modificados
Ramas integradas a dev
Ramas locales eliminadas
Ramas pendientes
APIs conectadas
Webs conectadas
Migraciones aplicadas
Seeds cargados
Tests ejecutados
Errores encontrados
Errores corregidos
Pendientes que requieren validación manual
Confirmación de que no se tocó main/pro
Confirmación de commits con autor 1CASH1
```

---

# CRITERIO DE CIERRE

La tarea solo puede cerrarse si:

```text
MexIngSof funciona con leads reales.
Refapart funciona con solicitudes reales.
TecnoTelec funciona con cotizaciones reales.
JobCron administra los tres proyectos.
Gateway conecta todo.
Auth protege lo interno.
Search indexa sin ser fuente oficial.
Catalog, Pricing, Supplier, Sales, Address y Document están conectadas donde aplica.
Todo queda en dev.
No se pasa a main.
No se pasa a pro.
```

Si algo no puede completarse por falta de credenciales, datos reales o contrato, dejarlo documentado como bloqueo real, no como tarea concluida.

Punto importante: **sí puedes exigir que los nuevos commits salgan como `1CASH1`**, pero no conviene pedir reescritura de historial ya publicado sin validación manual.

[1]: https://raw.githubusercontent.com/MexIngSoft/Docs/main/03_standards/architecture/api-gateway-standard.md "raw.githubusercontent.com"
