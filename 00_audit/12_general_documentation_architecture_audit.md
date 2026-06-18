# Auditoria general de documentacion y arquitectura

## Objetivo

Registrar el resultado seguro de la auditoria solicitada por `AGENTS-000.md`
sin ejecutar reestructuras destructivas ni mover carpetas grandes.

## Alcance revisado

- Gobernanza documental.
- Indices maestros.
- Estructura de proyectos.
- Docker y redes.
- Observabilidad.
- ETL e integraciones.
- Gateways.
- Auth.
- Web global.
- Seguridad.
- Base de datos.
- Eventos.
- Separacion ERP vs proyecto web.

## Estado general

| Area | Estado | Resultado |
|---|---|---|
| Gobernanza | Parcial | Ya existen `.github`, `CONTRIBUTING.md`, `CHANGELOG.md`, politicas y scripts documentales. `LICENSE` sigue pendiente por decision legal. |
| Indices | Activo | Existen `master-index.md`, `master-index.yaml`, `navigation-map.md` y `_meta/generated/master-index.json`. |
| Front matter | Parcial | Existe especificacion, pero la migracion masiva de documentos historicos queda pendiente. |
| Estructura de proyectos | Parcial | La estructura canonica existe; no se fuerza migracion masiva a subcarpetas profundas para evitar romper referencias. |
| Docker | Activo | Existe arquitectura oficial JobCron y compose por capas; la migracion completa de `jobcron_network` a `jobcron_network` sigue pendiente. |
| Observabilidad | Activo | `03_standards/operations/observability.md` define logs JSON, campos base, propagacion y seguridad. |
| ETL | Activo | La plantilla ETL y el estandar de proveedores cubren fuente, destino, frecuencia, reintentos, checkpoint, rollback y observabilidad. |
| Gateways | Activo | El patron vigente usa Gateway General unico; se refuerza Auth via Gateway en esta corrida. |
| Auth | Activo | Auth se documenta como infraestructura compartida; se agregan estandares de login/versionado. |
| Web global | Parcial | Existen estandares Next.js y proyecto completo; falta homogeneizar todas las webs existentes. |
| Seguridad | Activo parcial | Hay politicas base; MFA y rotacion avanzada siguen como pendientes. |
| Base de datos | Parcial | Hay modelos y publicacion PascalCase; faltan ERD/diccionarios completos por API. |
| Eventos | Activo parcial | Existe catalogo base; falta completar publisher/subscriber por todos los eventos reales. |
| ERP vs Web | Activo | La regla `Frontend -> Gateway -> API -> Core/ERP` queda como fuente de verdad. |
| Control de desarrollo | Activo | Se formalizan estados de modulo y su relacion con FeatureAvailability. |
| Feature flags | Activo | JobCron conserva la fuente central y se documentan scopes por proyecto, tenant, pais, region y entorno. |

## Decisiones aplicadas

- No se archiva documentacion antigua en masa sin una comparacion documento por
  documento.
- No se renombra `Docker.WEB.NJ` ni `Docker.API.PY`; los nombres actuales
  siguen como repositorios operativos.
- No se crea `LICENSE`; requiere decision legal del owner.
- No se migra toda la estructura de `02_projects/<project>` a carpetas profundas
  porque hay referencias activas en indices, runbooks y repos.
- Se prioriza crear fuentes de verdad nuevas y matrices antes de tocar codigo.

## Pendientes priorizados

1. Definir `LICENSE`.
2. Completar front matter gradualmente en documentos historicos.
3. Aplicar gradualmente el estandar de observabilidad a cada API activa.
4. Completar ERD y diccionarios por API activa.
5. Completar mapa real publisher/subscriber de eventos.
6. Planificar migracion coordinada de red `jobcron_network` a `jobcron_network`, si se
   decide ejecutarla.

## Resultado

La auditoria documental queda `Completada`: cada punto del agent fue
verificado, corregido, adoptado, rechazado con justificacion o convertido en
pendiente controlado. Esto no significa que todas las migraciones tecnicas ya
esten implementadas; front matter historico, ERD, eventos reales, red Docker y
licencia conservan responsables y decisiones pendientes.

## Validacion final por categoria

| Categoria | Resultado |
|---|---|
| Documentos correctos | Fuentes canonicas e indices existentes conservados. |
| Documentos corregidos | Observabilidad, proveedor/ETL, estandares Web/Auth y arquitectura de proyecto. |
| Documentos creados | Auditoria, Auth/versionado, matrices, plantillas y ciclo de vida/feature flags. |
| Documentos obsoletos | Ninguno eliminado; la obsolescencia requiere comparacion individual. |
| Documentos archivados | Agents completados copiados a `_archive/agents`. |
| Pendientes identificados | LICENSE, front matter historico, ERD, eventos, red Docker y adopcion por API. |
| Riesgos arquitectonicos | Reestructuras masivas, migracion de red sin coordinacion y flags usados como autorizacion. |
