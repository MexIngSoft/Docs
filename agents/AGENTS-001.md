Sí, ahí hace falta un **agent de reparación de scripts**, porque el repo sí tiene los scripts en `Docs/03_standards/operations/scripts/docker/projects/`, incluyendo `Invoke-WorkspaceProjectDocker.ps1`, `start-*`, `stop-*`, `status-all` y `healthcheck-all`. ([GitHub][1])

Copia este agente como el siguiente activo:

```md
# AGENTS-004.md

# REPARACIÓN DE SCRIPTS DOCKER POR PROYECTO

## OBJETIVO

Corregir los scripts Docker para que cada proyecto levante, apague y valide exactamente sus servicios esperados, sin cargar proyectos equivocados, sin dejar webs invisibles y sin depender de orden aleatorio de ejecución.

## PROBLEMA

Los scripts existen, pero al ejecutarlos:

- siempre cargan solo ciertas APIs y webs;
- algunos proyectos no cargan aunque el script dice que sí;
- las webs levantadas no se ven en navegador;
- la ejecución aleatoria de scripts deja estados inconsistentes;
- puede haber mala relación entre script, puerto, Nginx, Gateway y dependencia real.

## LECTURA OBLIGATORIA

Leer antes de tocar código:

- Docs/README.md
- Docs/_meta/active-work-index.md
- Docs/_meta/project-operational-inventory.md
- Docs/03_standards/operations/project-docker-dependency-map.md
- Docs/03_standards/operations/local-port-registry.md
- Docs/03_standards/operations/scripts/docker/projects/
- Docs/03_standards/docker/jobcron-official-docker-architecture.md
- Docs/agents/EXECUTION_REPORT.md

## REGLAS

1. Trabajar solo en rama dev.
2. No crear contenedores nuevos fuera del estándar.
3. No crear imágenes nuevas sin tag.
4. No duplicar PostgreSQL, Gateway, Nginx ni contenedor web.
5. No usar docker volume prune.
6. No inventar puertos.
7. No asumir que un script funcionó solo porque el contenedor está healthy.
8. Cada script debe validar la URL real de la web y Gateway.
9. Cada script debe fallar claramente si la web no carga.
10. Cada script debe ser idempotente: si algo ya está arriba, no debe romperse.

## TAREA 1 — INVENTARIO REAL DE SCRIPTS

Revisar todos los scripts en:

Docs/03_standards/operations/scripts/docker/projects/

Validar:

- start-all.ps1
- stop-all.ps1
- status-all.ps1
- healthcheck-all.ps1
- clean-safe.ps1
- Invoke-WorkspaceProjectDocker.ps1
- start/stop por cada proyecto

Documentar qué hace cada uno realmente.

## TAREA 2 — DEFINIR COMPORTAMIENTO ESPERADO

Crear o actualizar:

Docs/03_standards/operations/project-script-behavior-matrix.md

Debe contener:

| Script | Proyecto | Debe levantar | Debe conservar | Debe apagar | URL Web esperada | URL Gateway esperada | Resultado esperado |
|---|---|---|---|---|---|---|---|

Cada proyecto debe tener una fila para start y stop.

## TAREA 3 — CORREGIR START

Cada start-*.ps1 debe:

1. Levantar baseline oficial si falta:
   - db-postgresql
   - api-multiproyecto
   - web-frontend-node
   - nginx

2. Activar/configurar solo el proyecto solicitado.
3. No activar otra web como proyecto principal.
4. Confirmar puerto correcto según local-port-registry.md.
5. Confirmar ruta Nginx correcta.
6. Confirmar Gateway correcto.
7. Probar URL real con Invoke-WebRequest.
8. Mostrar al final:

- proyecto;
- puerto;
- URL web;
- URL Gateway;
- contenedores usados;
- estado HTTP;
- comando para apagar.

## TAREA 4 — CORREGIR STOP

Cada stop-*.ps1 debe:

1. Apagar solo la web/proceso del proyecto solicitado.
2. No apagar baseline compartido si otro proyecto lo necesita.
3. No apagar db-postgresql salvo stop-all.
4. No apagar api-multiproyecto salvo stop-all.
5. No apagar nginx salvo stop-all.
6. Confirmar que la URL del proyecto ya no responda, excepto si comparte host/ruta con otro proyecto.
7. Mostrar servicios conservados.

## TAREA 5 — CORREGIR HEALTHCHECK

healthcheck-all.ps1 debe validar:

- contenedores Docker;
- URL web por proyecto;
- URL Gateway por proyecto;
- HTTP status;
- puerto esperado;
- ruta esperada;
- error visible si no carga.

No debe reportar OK si solo Docker está healthy pero la web no abre.

## TAREA 6 — PRUEBA ALEATORIA

Crear script:

test-random-project-scripts.ps1

Debe ejecutar una secuencia aleatoria de start/stop/status/healthcheck por proyecto.

Ejemplo:

1. start-refapart
2. start-jobcron
3. stop-refapart
4. start-lexnova
5. healthcheck-all
6. stop-jobcron
7. start-tecnotelec
8. status-all

Debe validar que:

- no se carguen proyectos equivocados;
- no se apaguen dependencias compartidas necesarias;
- cada web responda en su URL;
- no queden estados inconsistentes;
- no aparezcan contenedores fuera del estándar.

## TAREA 7 — VALIDAR WEBS QUE “NO SE VEN”

Para cada proyecto validar:

- DocuCore
- Fiscora
- Imagrafity
- JobCron
- LeadHunter
- LexNova
- MexIngSof
- REFAPART
- TecnoTelec

Validar:

1. URL local documentada.
2. Puerto correcto.
3. Ruta Nginx.
4. Ruta Next.js.
5. bind en 0.0.0.0 si aplica.
6. variables NEXT_PUBLIC_*.
7. Gateway URL.
8. errores JS/runtime.
9. logs de web-frontend-node.
10. logs de nginx.

## TAREA 8 — REPORTE

Actualizar:

Docs/agents/EXECUTION_REPORT.md

Incluir:

- scripts corregidos;
- matriz de comportamiento creada;
- proyectos probados;
- secuencia aleatoria ejecutada;
- URLs que cargan;
- URLs que fallan;
- causa real de cada falla;
- correcciones aplicadas;
- pendientes reales.

## CRITERIO DE CIERRE

No cerrar este agent hasta que:

1. Cada start levante el proyecto correcto.
2. Cada stop apague solo lo correcto.
3. healthcheck-all valide URLs reales, no solo contenedores.
4. test-random-project-scripts.ps1 pase sin estados inconsistentes.
5. Las webs documentadas carguen en navegador o quede causa exacta.
6. No se creen contenedores fuera del baseline.
7. EXECUTION_REPORT.md quede actualizado.
```

La falla principal es que el “healthy” de Docker no prueba que la web correcta se vea; por eso el agent debe obligar a validar **URL real + puerto + Gateway + Nginx**, no solo contenedores.

[1]: https://github.com/MexIngSoft/Docs/tree/dev/03_standards/operations/scripts/docker/projects "Docs/03_standards/operations/scripts/docker/projects at dev · MexIngSoft/Docs · GitHub"
 