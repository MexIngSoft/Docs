# Estandares

## Objetivo

Guardar reglas de trabajo, operacion, seguridad, pruebas y cierre de proyectos.

## Contenido

- `operations`: runbook, reglas Codex, recuperacion Docker, registro de puertos locales, flujo Git/entornos, observabilidad, ciclo de vida/feature flags, cierre, seguridad operativa y calidad.
- `operations/context-packs.md`: Context Packs oficiales para reducir lectura innecesaria de Codex.
- `operations/codex-execution-standard.md`: flujo estandar de ejecucion Codex.
- `operations/codex-anti-patterns.md`: anti-patrones prohibidos para Codex.
- `codex`: estandares de lectura minima y checklist anti-vicios.
- `api`: estandares contract first de APIs.
- `frontend`: estandares Next.js, Docker frontend compartido, checklist previo y visibilidad comercial.
- `architecture`: estandares de API/Gateway, limites, comunicacion entre proyectos, decision de APIs reutilizables y librerias compartidas.
- `auth`: login web obligatorio via Gateway General, versionado de Auth y compatibilidad entre proyectos.
- `gateway`: entrada central, routing, migracion gradual y deprecacion de Gateways legacy.
- `product`: estrategia de producto, monetizacion y catalogo global de modulos.
- `database`: estandar de publicacion de tablas y campos con nombres PascalCase estilo SQL Server.
- `security`: manejo de secretos.
- `testing`: estrategia de pruebas.
- `docker.md`: Docker local y enlace a la arquitectura Docker oficial JobCron.
- `docker/jobcron-official-docker-architecture.md`: corrida master,
  overlays auxiliares, red compartida, variables y reutilizacion de servicios Docker.
- `docker/project-docker-execution-documents.md`: documentos y overlays
  auxiliares por proyecto dentro del stack `comercial_platform`.
- `global-governance.md`: gobierno global del ecosistema.
- `documentation-first-workflow.md`: flujo para tareas sin agents, basado en indices y documentacion canonica.
- `operations/standard-request-prompts.md`: prompts cortos estandar para pedir trabajo con agents, sin agents y modernizacion visual.
- `documentation/documentation-cleanup-standard.md`: limpieza obligatoria de
  contradicciones activas despues de cambios canonicos.

## Regla

Si el documento dice como trabajar, operar, validar o cerrar un proyecto, pertenece aqui.
