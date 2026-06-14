# Estandares

## Objetivo

Guardar reglas de trabajo, operacion, seguridad, pruebas y cierre de proyectos.

## Contenido

- `operations`: runbook, reglas Codex, recuperacion Docker, registro de puertos locales, flujo Git/entornos, observabilidad, ciclo de vida/feature flags, cierre, seguridad operativa y calidad.
- `frontend`: estandares Next.js, Docker frontend compartido, checklist previo y visibilidad comercial.
- `architecture`: estandares de API/Gateway, limites y comunicacion entre proyectos.
- `auth`: login web obligatorio via Gateway/BFF, versionado de Auth y compatibilidad entre proyectos.
- `gateway`: entrada central, routing, migracion gradual y deprecacion de Gateways legacy.
- `product`: estrategia de producto, monetizacion y catalogo global de modulos.
- `database`: estandar de publicacion de tablas y campos con nombres PascalCase estilo SQL Server.
- `security`: manejo de secretos.
- `testing`: estrategia de pruebas.
- `docker.md`: Docker local y enlace a la arquitectura Docker oficial JobCron.
- `docker/jobcron-official-docker-architecture.md`: corridas master, corridas
  por proyecto, red compartida, variables y reutilizacion de servicios Docker.
- `global-governance.md`: gobierno global del ecosistema.
- `documentation-first-workflow.md`: flujo para tareas sin agents, basado en indices y documentacion canonica.
- `operations/standard-request-prompts.md`: prompts cortos estandar para pedir trabajo con agents, sin agents y modernizacion visual.

## Regla

Si el documento dice como trabajar, operar, validar o cerrar un proyecto, pertenece aqui.
