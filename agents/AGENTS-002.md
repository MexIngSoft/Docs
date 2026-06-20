Aquí va ordenado para Codex, ya como instrucción limpia y ejecutable:

```text
OBJETIVO

Dejar el ecosistema listo para probar proyecto por proyecto, sin romper el stack compartido Docker oficial.

El trabajo debe seguir la documentación oficial de MexIngSoft/Docs.

FUENTES OBLIGATORIAS

Leer antes de modificar:

1. Docs/README.md
2. Docs/_meta/active-work-index.md
3. Docs/agents/AGENT_GLOBAL_RULES.md
4. Docs/03_standards/documentation-first-workflow.md
5. Docs/03_standards/operations/standard-request-prompts.md
6. Docs/03_standards/docker/jobcron-official-docker-architecture.md
7. Docs/03_standards/docker/grouped-containers-isolated-config.md
8. Docs/03_standards/docker/project-docker-execution-documents.md
9. Docs/03_standards/operations/local-port-registry.md
10. Runbook local de cada proyecto en Docs/02_projects/*

REGLA PRINCIPAL

La validación oficial sigue siendo sobre el stack compartido:

Stack profesional:
Comercial Platform

Nombre técnico Docker Compose:
comercial_platform

Red oficial:
jobcron_network

Composes master obligatorios:

Docker.DB.PG/docker-compose.master.db.yml
Docker.API.PY/docker-compose.master.api.yml
Docker.WEB.NJ/docker-compose.master.web.yml
Docker.SW.Nginx/docker-compose.master.nginx.yml

No crear Docker, Auth, Gateway, PostgreSQL ni Nginx por proyecto.

PROYECTOS A VALIDAR

Validar, como mínimo, estos proyectos documentados:

1. DocuCore
2. Fiscora
3. Imagrafity
4. JobCron
5. LeadHunter
6. LexNova
7. REFAPART
8. TecnoTelec

TAREA 1 — LIMPIEZA Y ALINEACIÓN DE RAMAS

Antes de tocar Docker o código:

1. Revisar ramas locales y remotas de cada repositorio.
2. Confirmar que solo queden como ramas principales:

- main
- dev
- pro

3. Si existen ramas feature, fix, hotfix, prueba o temporales:

- revisar si tienen cambios útiles;
- integrarlas primero hacia dev mediante PR;
- después alinear dev → main cuando proceda;
- después alinear main → pro solo si queda estable;
- no borrar ramas con cambios sin revisar;
- no hacer force push salvo que esté justificado y documentado.

4. Crear los pull requests necesarios.
5. Dejar documentado en el reporte:

- ramas encontradas;
- ramas integradas;
- ramas eliminadas;
- PR creados;
- ramas que no se pudieron eliminar y por qué.

TAREA 2 — SCRIPTS MANUALES POR PROYECTO

Crear scripts para levantar y apagar cada proyecto manualmente, sin romper dependencias compartidas.

Los scripts deben vivir en una ubicación estándar, por ejemplo:

scripts/docker/projects/

Crear scripts tipo:

start-docucore
stop-docucore
start-fiscora
stop-fiscora
start-imagrafity
stop-imagrafity
start-jobcron
stop-jobcron
start-leadhunter
stop-leadhunter
start-lexnova
stop-lexnova
start-refapart
stop-refapart
start-tecnotelec
stop-tecnotelec

Si el entorno usa Windows, crear versión PowerShell.
Si el entorno usa Linux/macOS, crear versión .sh.
Si aplica, crear ambas.

REGLAS DE LOS SCRIPTS START

Cada script start debe:

1. Crear la red si no existe:

docker network create jobcron_network

2. Tolerar que servicios ya estén arriba.
3. Levantar solo la web seleccionada y sus dependencias necesarias.
4. Usar siempre:

docker compose -p comercial_platform

5. Usar los compose master oficiales y overlays auxiliares del proyecto si existen.
6. No crear contenedores con nombres nuevos fuera del estándar.
7. No crear imágenes <none>.
8. No levantar una segunda copia de Auth, Gateway General, PostgreSQL o Nginx si ya existen.
9. Verificar healthchecks después de levantar.
10. Mostrar al final:

- proyecto levantado;
- puerto web;
- APIs requeridas;
- contenedores activos;
- URL local de prueba;
- estado de healthcheck.

REGLAS DE LOS SCRIPTS STOP

Cada script stop debe:

1. Apagar la web del proyecto seleccionado.
2. Apagar APIs exclusivas del proyecto solo si ningún otro proyecto activo depende de ellas.
3. No apagar dependencias compartidas si otro proyecto las usa.
4. No apagar PostgreSQL salvo que el script sea de apagado total.
5. No borrar volúmenes.
6. No ejecutar docker volume prune.
7. Mostrar al final:

- servicios apagados;
- servicios conservados por dependencia compartida;
- proyectos que siguen activos;
- contenedores restantes.

Crear también scripts globales:

start-all
stop-all
status-all
healthcheck-all
clean-safe

clean-safe solo puede ejecutar limpieza segura:

docker compose -p comercial_platform down --remove-orphans
docker container prune
docker image prune
docker network prune

Prohibido:

docker volume prune

TAREA 3 — MAPA DE DEPENDENCIAS

Crear o actualizar un archivo de dependencias por proyecto.

Debe indicar:

- proyecto;
- puerto web;
- web container;
- APIs core;
- APIs exclusivas;
- base de datos;
- schemas;
- dependencias compartidas;
- overlays usados;
- healthchecks;
- comando start;
- comando stop.

Respetar dependencias documentadas:

TecnoTelec:
Gateway General, Auth, Catalog, Supplier, Pricing, Inventory, Sales, TecnoTelec API, base comercial y base auth.

LexNova:
Gateway General, Auth, LexNova API, Document API, base auth y base LexNova.

JobCron:
Gateway General, JobCron API, Auth, APIs administrativas necesarias, base auth y base JobCron si aplica.

Para DocuCore, Fiscora, Imagrafity, LeadHunter y REFAPART:
leer sus runbooks oficiales y documentar dependencias reales.

TAREA 4 — PUERTOS Y WEBS QUE NO CARGAN

Problema detectado:
Las webs en puertos 3005 y 3006 no cargan.

Acciones:

1. Revisar Docs/03_standards/operations/local-port-registry.md.
2. Confirmar qué proyectos usan 3005 y 3006.
3. Revisar logs de esas webs.
4. Revisar si Next.js está escuchando en 0.0.0.0 y no solo localhost.
5. Revisar variables NEXT_PUBLIC_API_URL, Gateway URL, CORS y rutas internas.
6. Revisar que Nginx enrute correctamente.
7. Revisar que las APIs requeridas estén saludables.
8. Corregir el patrón común si el error afecta a varias webs.
9. Probar cada web por URL local.
10. Documentar resultado por puerto.

Criterio mínimo:
Cada web debe cargar su home o pantalla inicial sin error 500, sin pantalla en blanco y sin fallo de conexión a API base.

TAREA 5 — VALIDACIÓN DE ESTÁNDARES WEB

Para cada proyecto web:

1. Revisar que cumpla los estándares UI/documentales vigentes.
2. Revisar estructura de carpetas.
3. Revisar uso correcto del Gateway General.
4. Revisar variables de entorno.
5. Revisar rutas internas.
6. Revisar que no tenga dependencias duplicadas innecesarias.
7. Revisar que no use APIs por proyecto cuando debe usar API compartida.
8. Corregir lo necesario.
9. Probar build/lint/typecheck si el proyecto lo tiene disponible.
10. Documentar cualquier validación que no se pueda ejecutar.

TAREA 6 — MIGRACIONES Y BASES DE DATOS

Validar que todas las bases estén listas para trabajar.

Reglas:

1. PostgreSQL se administra desde Docker.DB.PG.
2. No usar usuario postgres como usuario de aplicación.
3. No usar base postgres para datos de negocio.
4. No borrar volúmenes.
5. No ejecutar docker volume prune.

Bases esperadas según documentación:

- auth
- comercial
- lexnova
- jobcron si aplica

Schemas comerciales esperados cuando apliquen:

- Catalog
- Inventory
- Pricing
- Procurement
- Sales
- Supplier
- TecnoTelec
- TecnoTelecGateway
- Customization
- LexNovaGateway

Acciones:

1. Revisar migrations de cada API.
2. Ejecutar migraciones pendientes.
3. Validar conexión por API.
4. Validar usuarios de aplicación.
5. Validar schemas.
6. Validar que no existan migraciones rotas.
7. Documentar estado de cada base/schema.

TAREA 7 — LIMPIEZA DE LO INÚTIL

Limpiar únicamente lo que esté confirmado como obsoleto.

Se puede limpiar:

- scripts duplicados;
- compose antiguos reemplazados;
- archivos temporales;
- referencias a dockerapipy;
- referencias a redes no oficiales;
- documentación vieja contradictoria;
- imágenes <none> generadas por builds anteriores, mediante limpieza segura.

No limpiar:

- volúmenes de PostgreSQL;
- ramas con cambios no integrados;
- archivos .env reales;
- migraciones necesarias;
- documentación canónica vigente.

TAREA 8 — VALIDACIÓN FINAL

Ejecutar:

docker network ls

docker compose -p comercial_platform \
  -f Docker.DB.PG/docker-compose.master.db.yml \
  -f Docker.API.PY/docker-compose.master.api.yml \
  -f Docker.WEB.NJ/docker-compose.master.web.yml \
  -f Docker.SW.Nginx/docker-compose.master.nginx.yml \
  config --quiet

docker compose -p comercial_platform ps

docker ps -a

docker images

docker network inspect jobcron_network

Después probar:

1. start de cada proyecto.
2. healthcheck de cada proyecto.
3. carga web de cada proyecto.
4. stop de cada proyecto.
5. validación de que no se apaguen dependencias compartidas si otro proyecto las usa.
6. status-all.
7. healthcheck-all.

TAREA 9 — REPORTE FINAL

Actualizar:

Docs/agents/EXECUTION_REPORT.md

Debe incluir:

1. resumen de ejecución;
2. ramas revisadas;
3. PR creados;
4. scripts creados;
5. proyectos validados;
6. puertos usados;
7. webs que cargan correctamente;
8. errores corregidos en puertos 3005 y 3006;
9. bases migradas;
10. APIs saludables;
11. dependencias compartidas detectadas;
12. archivos eliminados o marcados obsoletos;
13. comandos ejecutados;
14. pendientes reales, si existen.

CRITERIO DE TERMINACIÓN

No dar por terminado hasta que:

1. Solo existan ramas principales main, dev y pro, o quede documentado por qué alguna rama temporal no pudo cerrarse.
2. Existan scripts start/stop por proyecto.
3. Los scripts toleren servicios ya levantados.
4. Los scripts stop no apaguen dependencias compartidas usadas por otro proyecto.
5. Las webs de 3005 y 3006 carguen correctamente o quede documentado el bloqueo exacto.
6. Todas las webs documentadas hayan sido probadas.
7. Las bases estén migradas.
8. No se creen contenedores con nombres fuera del estándar.
9. No se creen imágenes <none> nuevas.
10. Todo quede reportado en EXECUTION_REPORT.md.
```

La clave es que Codex **no debe validar “aislado” como si cada proyecto tuviera su propio Docker**, porque la documentación dice que los proyectos usan overlays auxiliares, pero la ejecución real pertenece al stack compartido `comercial_platform` sobre `jobcron_network`. ([raw.githubusercontent.com][1])

[1]: https://raw.githubusercontent.com/MexIngSoft/Docs/main/03_standards/docker/jobcron-official-docker-architecture.md "raw.githubusercontent.com"
