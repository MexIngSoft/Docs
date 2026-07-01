Confirmo lectura del repositorio `MexIngSoft/Docs` en rama `general`.

La documentación ya tiene base para esto: existe un estándar de **mapa de acciones de código** que obliga a conectar documentación, frontend, Gateway, APIs, permisos y base de datos . También exige documentar rutas visuales, servicios frontend, Gateway, API destino, permisos, modelos/tablas, errores y validaciones .

## Proceso propuesto

1. **Inventariar código existente**

   * Repositorios.
   * APIs Django.
   * Webs Next.js.
   * Docker.
   * Nginx.
   * Bases/schemas/tablas.
   * Scripts.
   * Jobs.
   * Endpoints.
   * Rutas Gateway.
   * Variables `.env.example`.

2. **Crear mapa por proyecto**

   * `Docs/02_projects/<proyecto>/technical/code-actions-map.md`
   * `Docs/02_projects/<proyecto>/frontend/code-actions-map.md`
   * `Docs/02_projects/<proyecto>/api/code-actions-map.md`

3. **Crear mapa por API compartida**

   * `Docs/01_core_erp/apis/<api>/code-actions-map.md`
   * O actualizar `01_core_erp/apis/reusable-api-contracts.md`.

4. **Crear diccionario de base de datos**

   * Base.
   * Schema.
   * Tabla.
   * Columnas.
   * Relaciones.
   * API dueña.
   * Endpoint que escribe.
   * Endpoint que lee.
   * Proyecto consumidor.
   * Riesgo de duplicidad.

5. **Crear mapa Nginx**

   * Dominios.
   * Server blocks.
   * Upstreams.
   * Rutas proxy.
   * Web destino.
   * Gateway/API destino.
   * Certificados.
   * Puertos.
   * Variables.
   * Riesgos de rutas duplicadas.

6. **Detectar duplicidades**

   * Tablas con mismo propósito.
   * Modelos Django duplicados.
   * Endpoints repetidos.
   * Rutas Gateway repetidas.
   * Servicios frontend que consumen APIs directas.
   * Formularios duplicados.
   * Procesos que no pasan por Gateway.
   * Variables `.env` repetidas o contradictorias.
   * Nginx apuntando a servicios equivocados.

---

# Agente propuesto

```md
# AGENT-XXX — Auditoría y documentación integral de código existente

## Estado
PENDIENTE

## Objetivo
Documentar el código existente y todo código nuevo del ecosistema para detectar duplicación de tablas, modelos, endpoints, rutas Gateway, servicios frontend, procesos, variables, Docker y Nginx.

El agente debe dejar trazabilidad entre:
- Web Next.js
- Gateway General
- APIs Django
- modelos/tablas PostgreSQL
- permisos Auth
- jobs/comandos
- Nginx
- Docker
- documentación canónica

## Lectura obligatoria

Leer primero:

- `Docs/README.md`
- `Docs/_meta/active-work-index.md`
- `Docs/03_standards/code-actions/code-actions-map-standard.md`
- `Docs/03_standards/architecture/api-gateway-standard.md`
- `Docs/03_standards/docker/jobcron-official-docker-architecture.md`
- `Docs/03_standards/database/postgresql-project-users-and-schemas.md`
- `Docs/01_core_erp/apis/00_api_index.md`
- `Docs/01_core_erp/apis/reusable-api-contracts.md`
- `Docs/01_core_erp/apis/gateway-route-registry.md`
- `Docs/01_core_erp/apis/endpoint-ui-consumption-matrix.md`
- `Docs/00_audit/reusable-api-map.md`
- `Docs/00_audit/reusable-api-audit.md`

## Repositorios/capas a revisar

### 1. Documentación
- `Docs`
- Índices.
- Estándares.
- Proyectos.
- APIs.
- Matrices.
- Agentes previos.

### 2. Base de datos
- `Docker.DB.PG`
- Migraciones Django.
- Schemas reales.
- Tablas reales.
- Usuarios.
- Variables.
- Scripts SQL.

### 3. APIs Django
- `Docker.API.PY`
- `API.PY.DJANGO.Auth`
- `API.PY.DJANGO.Gateway`
- `API.PY.DJANGO.Catalog`
- `API.PY.DJANGO.Inventory`
- `API.PY.DJANGO.Pricing`
- `API.PY.DJANGO.Supplier`
- `API.PY.DJANGO.Procurement`
- `API.PY.DJANGO.Sales`
- `API.PY.DJANGO.Address`
- `API.PY.DJANGO.Search`
- `API.PY.DJANGO.Document`
- `API.PY.DJANGO.Fiscal`
- `API.PY.DJANGO.JobCron`
- `API.PY.DJANGO.RefaPart`
- `API.PY.DJANGO.TecnoTelec`
- `API.PY.DJANGO.DocuCore`
- `API.PY.DJANGO.LexNova`
- `API.PY.DJANGO.Fiscora`
- `API.PY.DJANGO.Imagrafity`

### 4. Webs Next.js
- `Docker.WEB.NJ`
- Web Refapart.
- Web JobCron.
- Web TecnoTelec.
- Web DocuCore.
- Web LexNova.
- Web Fiscora.
- Web Imagrafity.
- Cualquier web activa o parcialmente activa.

### 5. Nginx
- `Docker.SW.Nginx`
- `docker-compose.master.nginx.yml`
- Configs por dominio.
- Upstreams.
- Rutas.
- Puertos.
- Proxy hacia webs.
- Proxy hacia Gateway.
- Certificados.
- Headers.
- CORS si aplica.

## Reglas obligatorias

1. No modificar código funcional en esta fase, salvo archivos de documentación.
2. No inventar APIs, tablas, endpoints ni permisos.
3. Si algo no se puede confirmar, registrar `PENDIENTE_DE_CONFIRMAR`.
4. Si algo existe en código pero no en documentación, registrar como `NO_DOCUMENTADO`.
5. Si algo existe en documentación pero no en código, registrar como `NO_IMPLEMENTADO`.
6. Si algo está duplicado, registrar como `DUPLICADO_CONFIRMADO` o `DUPLICADO_PROBABLE`.
7. El frontend no debe consumir APIs internas directo; debe pasar por Gateway General.
8. Proyecto A no debe acceder a base de datos de Proyecto B.
9. No crear bases, schemas ni usuarios nuevos sin contrato canónico.
10. Toda acción nueva debe registrarse en mapa de acciones antes de cerrarse.

## Entregables documentales

### A. Inventario global de código

Crear:

`Docs/00_audit/codebase-inventory.md`

Debe incluir:

- Repositorio.
- Capa.
- Proyecto/API.
- Ruta principal.
- Estado.
- Responsable documental.
- Base usada.
- Schema usado.
- Puerto.
- Docker service.
- Nginx route.
- Gateway route.
- Observaciones.

### B. Matriz de duplicidades

Crear:

`Docs/00_audit/code-duplication-risk-matrix.md`

Columnas:

- ID.
- Tipo de duplicidad.
- Proyecto/API A.
- Proyecto/API B.
- Archivo A.
- Archivo B.
- Tabla/modelo/endpoint/ruta afectada.
- Descripción.
- Riesgo.
- Severidad.
- Acción recomendada.
- Estado.

Tipos:

- `database-table`
- `django-model`
- `serializer`
- `view`
- `endpoint`
- `gateway-route`
- `frontend-service`
- `frontend-component`
- `form`
- `nginx-route`
- `docker-service`
- `env-variable`
- `business-process`
- `permission`
- `notification-template`
- `job-command`

### C. Diccionario de base de datos

Crear:

`Docs/00_audit/database-dictionary.md`

Debe documentar:

- Base.
- Schema.
- Tabla.
- API dueña.
- Modelo Django.
- Migración origen.
- Columnas principales.
- Llaves primarias.
- Llaves foráneas.
- Índices.
- Endpoints que leen.
- Endpoints que escriben.
- Proyecto consumidor.
- Riesgo de duplicidad.
- Estado.

### D. Mapa de APIs

Crear o actualizar:

`Docs/00_audit/api-endpoint-inventory.md`

Debe incluir:

- API.
- App Django.
- Archivo `urls.py`.
- View/ViewSet.
- Serializer.
- Método.
- Endpoint interno.
- Gateway route pública.
- Permiso.
- Modelos/tablas.
- Estado.
- Consumidores frontend.

### E. Mapa de Webs

Crear o actualizar por proyecto:

`Docs/02_projects/<proyecto>/frontend/code-actions-map.md`

Debe incluir:

- Ruta Next.js.
- Página.
- Componente.
- Formulario.
- Botón/acción.
- Servicio frontend.
- Hook/store.
- Gateway route.
- Estados UI.
- Errores esperados.
- Permisos.
- Tablas afectadas indirectamente.

### F. Mapa de Gateway

Actualizar:

`Docs/01_core_erp/apis/gateway-route-registry.md`

Debe incluir:

- Ruta Gateway.
- Método.
- API destino.
- Endpoint interno.
- Permiso.
- Proyecto consumidor.
- Request.
- Response.
- Errores normalizados.
- Estado.

### G. Mapa Nginx

Crear:

`Docs/00_audit/nginx-route-inventory.md`

Debe incluir:

- Dominio.
- Archivo config.
- Server block.
- Location.
- Upstream.
- Servicio Docker destino.
- Puerto interno.
- Web/API/Gateway destino.
- Headers.
- Certificado.
- Riesgo.
- Estado.

### H. Mapa Docker

Crear:

`Docs/00_audit/docker-service-inventory.md`

Debe incluir:

- Carpeta.
- Compose.
- Servicio.
- Imagen.
- Dockerfile.
- Puerto.
- Red.
- Variables.
- Volúmenes.
- Depends_on.
- Healthcheck.
- Proyecto/API relacionado.
- Estado.

### I. Reporte de malas prácticas

Crear:

`Docs/00_audit/codebase-bad-practices-report.md`

Debe separar:

- Consumo directo sin Gateway.
- Tablas duplicadas.
- Modelos duplicados.
- Endpoints duplicados.
- Procesos repetidos.
- Variables contradictorias.
- Nginx duplicado.
- Docker duplicado.
- Código muerto.
- Documentación obsoleta.
- APIs especializadas que duplican Core.
- Bases o schemas no autorizados.

## Proceso de trabajo

### Fase 1 — Inventario sin cambios de código
1. Listar repositorios y carpetas reales.
2. Listar APIs.
3. Listar webs.
4. Listar Docker compose.
5. Listar Nginx configs.
6. Listar bases/schemas según documentación y migraciones.
7. Crear `codebase-inventory.md`.

### Fase 2 — Mapeo de acciones
1. Por cada web, detectar páginas en `app/`.
2. Detectar servicios en `features/*/services` y `lib/api`.
3. Detectar formularios, botones y acciones críticas.
4. Relacionar cada acción con Gateway.
5. Relacionar Gateway con API destino.
6. Relacionar API con modelo/tabla.
7. Crear o actualizar `code-actions-map.md`.

### Fase 3 — Auditoría API
1. Revisar `urls.py`.
2. Revisar `views.py` o ViewSets.
3. Revisar serializers.
4. Revisar permissions.
5. Revisar services/tasks/commands.
6. Revisar modelos.
7. Revisar migraciones.
8. Documentar endpoints reales.
9. Marcar endpoints sin Gateway como riesgo.

### Fase 4 — Auditoría DB
1. Extraer modelos Django.
2. Extraer migraciones.
3. Comparar contra documentación.
4. Detectar tablas con nombres similares.
5. Detectar entidades duplicadas entre schemas.
6. Detectar campos repetidos por mala frontera.
7. Documentar ownership de cada tabla.
8. Marcar tablas sin API dueña.

### Fase 5 — Auditoría Web
1. Revisar rutas.
2. Revisar servicios API.
3. Detectar fetch directo a APIs internas.
4. Detectar formularios duplicados.
5. Detectar validaciones repetidas.
6. Detectar estados UI faltantes.
7. Documentar flujos usuario → Gateway → API → DB.

### Fase 6 — Auditoría Nginx
1. Listar dominios.
2. Listar upstreams.
3. Listar rutas proxy.
4. Detectar rutas duplicadas.
5. Detectar puertos hardcodeados.
6. Detectar servicios inexistentes.
7. Detectar configs por proyecto que deberían ser patrón común.
8. Documentar mapa Nginx.

### Fase 7 — Auditoría Docker
1. Comparar compose master contra overlays.
2. Detectar servicios duplicados.
3. Detectar Dockerfiles innecesarios.
4. Detectar redes incorrectas.
5. Validar uso de `jobcron_network`.
6. Validar variables `.env.example`.
7. Documentar diferencias.

### Fase 8 — Reporte final
1. Generar matriz de duplicidades.
2. Generar lista de correcciones recomendadas.
3. Separar correcciones P0, P1, P2.
4. Indicar qué puede corregirse de inmediato.
5. Indicar qué requiere decisión de arquitectura.
6. Indicar qué requiere nuevo contrato API.
7. Indicar qué debe eliminarse o marcarse obsoleto.

## Puntos de auditoría específicos

### Base de datos

Revisar:

- Bases permitidas.
- Schemas permitidos.
- Tablas reales.
- Modelos Django.
- Migraciones.
- Foreign keys.
- Índices.
- Tablas huérfanas.
- Tablas duplicadas.
- Tablas temporales.
- Tablas en schema incorrecto.
- Columnas repetidas.
- Campos de cliente duplicados.
- Campos fiscales duplicados.
- Campos de dirección duplicados.
- Campos de pago duplicados.

Salida esperada:

- Diccionario DB.
- Tabla → API dueña.
- Tabla → endpoints lectores/escritores.
- Tabla → proyecto consumidor.
- Riesgo de duplicidad.

### APIs

Revisar:

- Endpoints.
- Serializers.
- ViewSets.
- Permissions.
- Services.
- Tasks.
- Commands.
- Integraciones externas.
- Eventos.
- Errores.
- Contratos.
- Gateway routes.
- Modelos/tablas afectadas.

Salida esperada:

- Inventario de endpoints.
- Contratos faltantes.
- Endpoints duplicados.
- Endpoints sin Gateway.
- Endpoints sin permisos.
- Endpoints sin documentación.

### Webs

Revisar:

- Rutas `app/`.
- Componentes.
- Formularios.
- Botones.
- Hooks.
- Stores.
- Servicios API.
- Estados UI.
- Manejo de errores.
- Consumo Gateway.
- Auth route scope.
- Duplicación de formularios.
- Duplicación de clientes HTTP.

Salida esperada:

- Mapa de acciones frontend.
- Rutas públicas/protegidas.
- Servicios duplicados.
- Acciones sin endpoint documentado.
- Componentes con lógica de negocio escondida.

### Nginx

Revisar:

- Dominios.
- Server blocks.
- Locations.
- Upstreams.
- Proxy pass.
- Puertos.
- Certificados.
- Headers.
- CORS.
- Configs por proyecto.
- Configs master.

Salida esperada:

- Mapa Nginx.
- Rutas duplicadas.
- Upstreams huérfanos.
- Puertos inconsistentes.
- Proxy directo indebido a API interna.

### Docker

Revisar:

- Compose master.
- Compose por proyecto.
- Dockerfiles base.
- Dockerfiles específicos.
- Variables.
- Redes.
- Volúmenes.
- Puertos.
- Healthchecks.
- Depends_on.

Salida esperada:

- Inventario Docker.
- Servicios duplicados.
- Overlays demasiado pesados.
- Variables faltantes.
- Redes fuera de estándar.

## Criterios de cierre

El agente solo puede cerrarse cuando existan:

- `Docs/00_audit/codebase-inventory.md`
- `Docs/00_audit/code-duplication-risk-matrix.md`
- `Docs/00_audit/database-dictionary.md`
- `Docs/00_audit/api-endpoint-inventory.md`
- `Docs/00_audit/nginx-route-inventory.md`
- `Docs/00_audit/docker-service-inventory.md`
- `Docs/00_audit/codebase-bad-practices-report.md`
- Mapas `code-actions-map.md` por proyecto activo.
- Gateway routes actualizadas.
- Lista de pendientes priorizada.
- Lista de duplicidades confirmadas.
- Lista de duplicidades probables.
- Lista de elementos obsoletos.
- Lista de elementos sin documentación.
- Lista de documentación sin código real.

## Validaciones

No correr Docker ni pruebas pesadas salvo autorización.

Validaciones permitidas:

- Revisión documental.
- Búsqueda de archivos.
- Revisión de rutas.
- Revisión de migraciones.
- Revisión de imports.
- Revisión de endpoints.
- Revisión de `docker-compose`.
- Revisión de Nginx.
- Revisión de `.env.example`.

## Reporte final obligatorio

El agente debe responder con:

1. Repositorios revisados.
2. Documentos leídos.
3. Documentos creados/modificados.
4. Duplicidades detectadas.
5. Riesgos críticos.
6. Correcciones recomendadas.
7. Correcciones que requieren decisión.
8. Correcciones que puede ejecutar otro agente.
9. Pendientes por proyecto.
10. Criterio de cierre cumplido o pendiente.
```

## Plan de ejecución recomendado

**P0 — Documentar sin tocar código**

* Inventario global.
* Diccionario DB.
* Mapa APIs.
* Mapa Webs.
* Mapa Nginx.
* Mapa Docker.

**P1 — Detectar duplicidades**

* Tablas.
* Modelos.
* Endpoints.
* Gateway routes.
* Servicios frontend.
* Variables.
* Nginx.
* Docker.

**P2 — Corregir documentación**

* Actualizar matrices.
* Marcar obsoletos.
* Marcar no implementados.
* Marcar no documentados.
* Unificar ownership.

**P3 — Preparar agentes de corrección**

* Agente DB cleanup.
* Agente Gateway cleanup.
* Agente frontend cleanup.
* Agente Nginx cleanup.
* Agente Docker cleanup.
* Agente API contracts cleanup.

## Decisión importante

Este agente no debe desarrollar funcionalidad nueva. Su trabajo es dejar el ecosistema visible, trazable y auditable para que después se pueda corregir sin romper Refapart, JobCron, APIs compartidas ni las webs.
