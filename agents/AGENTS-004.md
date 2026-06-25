# AGENTS-004 - MexIngSof Software Control

## Estado

ACTIVE

## Objetivo

Definir la instruccion operativa para MexIngSof Software Control como consola tecnica interna de control de software del ecosistema MexIngSoft.

MexIngSof Software Control debe administrar, auditar y visualizar software, APIs, webs, repositorios, despliegues, ambientes, accesos por cliente, usuarios por plataforma, health checks e incidentes.

## Alcance

Incluye:

- Inventario de productos de software.
- Inventario de APIs y webs por producto.
- Repositorios Git asociados.
- Ambientes y despliegues.
- Estado operativo y health checks.
- Relacion cliente-software.
- Usuarios por plataforma y permisos operativos.
- Incidentes tecnicos.
- Dependencias entre software, APIs, webs y servicios compartidos.

No incluye:

- ERP central.
- CRM comercial.
- POS.
- Facturacion.
- Ventas.
- Billing.
- Reemplazo de JobCron.
- Reemplazo de Gateway General.
- Reemplazo de APIs core o compartidas.

## Proyecto afectado

```text
Docs/02_projects/mexingsof/
```

## Frontend afectado

```text
WEB.NJ.NEXT.MexIngSof
```

## API afectada

```text
API.PY.DJANGO.MexIngSof = PENDIENTE_DE_DEFINIR
```

Mientras la API propia no exista como contrato canonico, MexIngSof debe reutilizar:

- Gateway General.
- Auth.
- JobCron API cuando el dato pertenezca al control central del ecosistema.
- Search cuando se requiera busqueda transversal ya documentada.

## Documentacion canonica a leer

Antes de ejecutar desarrollo derivado de este agent, leer:

```text
Docs/README.md
Docs/_meta/active-work-index.md
Docs/02_projects/mexingsof/README.md
Docs/02_projects/_ecosystem/00_ecosystem_overview.md
Docs/02_projects/_ecosystem/api-version-matrix.md
Docs/01_core_erp/apis/00_api_index.md
Docs/03_standards/product/module-catalog.md
Docs/03_standards/operations/git-repository-map.md
```

Si existe documentacion especifica nueva para MexIngSof Software Control, debe prevalecer sobre esta instruccion y registrarse en el reporte.

## Modelo funcional MVP

### Software

Registrar productos internos o comerciales del ecosistema.

Entidad sugerida:

```text
SoftwareProduct
```

Campos minimos sugeridos:

- Code.
- Name.
- Type.
- Status.
- OwnerArea.
- PrimaryRepository.
- DefaultEnvironment.
- Notes.

### APIs

Registrar APIs disponibles por producto o compartidas.

Entidad sugerida:

```text
SoftwareApi
```

Campos minimos sugeridos:

- SoftwareProductId.
- ApiCode.
- ApiName.
- BasePath.
- GatewayRoute.
- Repository.
- Status.
- Version.
- HealthUrl.

### Webs

Registrar frontends y puertos/documentacion de ejecucion.

Entidad sugerida:

```text
SoftwareWeb
```

Campos minimos sugeridos:

- SoftwareProductId.
- WebCode.
- WebName.
- Repository.
- LocalUrl.
- PublicDomain.
- Status.
- Environment.

### Deployments

Registrar despliegues por ambiente.

Entidad sugerida:

```text
SoftwareDeployment
```

Campos minimos sugeridos:

- SoftwareProductId.
- Environment.
- DockerStack.
- ContainerName.
- ImageName.
- ImageVersion.
- Branch.
- CommitSha.
- DeployedAt.
- Status.

### Cliente-software

Registrar que cliente tiene acceso a que software.

Entidad sugerida:

```text
ClientSoftwareAccess
```

Campos minimos sugeridos:

- ClientId.
- SoftwareProductId.
- Plan.
- Status.
- StartsAt.
- EndsAt.
- Notes.

### Usuarios por plataforma

Registrar usuarios operativos por plataforma sin duplicar Auth.

Entidad sugerida:

```text
PlatformUserAccess
```

Campos minimos sugeridos:

- AuthUserId.
- SoftwareProductId.
- ClientId.
- Role.
- Status.
- GrantedAt.
- RevokedAt.

### Health checks

Registrar resultados de salud por API, web o servicio.

Entidad sugerida:

```text
HealthCheckLog
```

Campos minimos sugeridos:

- TargetType.
- TargetCode.
- Url.
- StatusCode.
- IsHealthy.
- ResponseTimeMs.
- CheckedAt.
- ErrorMessage.

### Incidentes

Registrar incidentes tecnicos por producto, API, web o despliegue.

Entidad sugerida:

```text
IncidentLog
```

Campos minimos sugeridos:

- Severity.
- Status.
- SoftwareProductId.
- TargetType.
- TargetCode.
- Summary.
- Description.
- OpenedAt.
- ClosedAt.
- Owner.

## Endpoints MVP sugeridos

Estos endpoints no deben crearse si una API core, shared, Gateway o JobCron ya cubre el caso.

```text
/software/
/apis/
/webs/
/deployments/
/client-software/
/platform-users/
/health-checks/
/incidents/
```

## Reglas obligatorias

- No mezclar MexIngSof Software Control con ERP central.
- No duplicar Auth.
- No duplicar Gateway General.
- No duplicar Search.
- No crear API propia si JobCron o una API reutilizable cubre el dato.
- No crear tablas definitivas sin contrato canonico aprobado.
- Si falta definicion real, usar `PENDIENTE_DE_DEFINIR`.
- Documentar decisiones nuevas en `Docs/02_projects/mexingsof/`.
- Si se detecta impacto transversal, documentarlo en estandares o audit, no dentro del documento de proyecto.

## Validacion requerida

Si solo se optimiza esta instruccion:

- Validar existencia de rutas documentales citadas.
- Actualizar `Docs/agents/EXECUTION_REPORT.md`.
- No limpiar este archivo.

Si se ejecuta desarrollo derivado en una fase posterior:

- Web: `npm run lint`, `npm run build` y pruebas disponibles.
- API Django: `python manage.py check`, compilacion Python y migraciones si aplica.
- Docker: `docker compose config --quiet` si cambia infraestructura.

## Cierre

Este agent queda listo cuando su instruccion sea clara, no contradictoria y no mezcle MexIngSof con responsabilidades de JobCron, ERP, POS, Billing, CRM o integraciones externas.

No limpiar este agent por esta optimizacion; su contenido debe conservarse para una ejecucion posterior de desarrollo.
