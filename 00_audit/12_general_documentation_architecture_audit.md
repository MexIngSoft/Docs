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
| Docker | Activo | Existe arquitectura oficial JobCron y compose por capas; la migracion completa de `crejo` a `jobcron_network` sigue pendiente. |
| Observabilidad | Parcial | Hay runbooks y estandares operativos, pero falta especificacion unica de logs JSON por API. |
| ETL | Parcial | Syscom tiene documentacion amplia; falta plantilla uniforme obligatoria por proveedor nuevo. |
| Gateways | Activo | Existe patron Project Gateway/BFF; se refuerza Auth via Gateway en esta corrida. |
| Auth | Activo | Auth se documenta como infraestructura compartida; se agregan estandares de login/versionado. |
| Web global | Parcial | Existen estandares Next.js y proyecto completo; falta homogeneizar todas las webs existentes. |
| Seguridad | Activo parcial | Hay politicas base; MFA y rotacion avanzada siguen como pendientes. |
| Base de datos | Parcial | Hay modelos y publicacion PascalCase; faltan ERD/diccionarios completos por API. |
| Eventos | Activo parcial | Existe catalogo base; falta completar publisher/subscriber por todos los eventos reales. |
| ERP vs Web | Activo | La regla `Frontend -> Gateway -> API -> Core/ERP` queda como fuente de verdad. |

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
3. Crear estandar unico de observabilidad con logs JSON por API.
4. Crear plantilla ETL/proveedor obligatoria para integraciones nuevas.
5. Completar ERD y diccionarios por API activa.
6. Completar mapa real publisher/subscriber de eventos.
7. Planificar migracion coordinada de red `crejo` a `jobcron_network`, si se
   decide ejecutarla.

## Resultado

La auditoria queda `Parcialmente completada`: se corrigieron y agregaron
fuentes de verdad de bajo riesgo, pero las reestructuras grandes quedan como
pendientes controlados.
