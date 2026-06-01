# Orden de ejecucion documental por Agents

## Objetivo

Definir como deben usarse los archivos `Docs/agents/AGENTS-*.md` cuando el
owner pida ordenar, limpiar o ampliar documentacion. Este documento adapta el
agent nuevo de orden documental a la estructura real del repositorio.

## Regla base

Antes de ejecutar cualquier agent se debe leer:

```text
Docs/agents/RUN_AGENTS_INSTRUCTIONS.md
Docs/README.md
Docs/agents/EXECUTION_REPORT.md
Docs/_meta/master-index.md
Docs/_meta/master-index.yaml
Docs/_meta/navigation-map.md
```

Despues se leen solo los documentos canonicos relacionados con el agent.

## Formato obligatorio de un agent

Todo archivo `Docs/agents/AGENTS-*.md` con instrucciones ejecutables debe
declarar o permitir inferir:

| Campo | Obligatorio | Regla |
|---|---|---|
| Titulo | Si | Nombre claro de la tarea o fase. |
| Proyecto afectado | Si | Ejemplo: DocuCore, LexNova, Imagrafity, ERP. |
| Tipo | Si | Documentacion, frontend, API, Gateway, datos, operacion o planeacion. |
| Prioridad | Si | P0, P1, P2 o P3. |
| Estado | Si | Pendiente, en progreso, completado, bloqueado o archivado. |
| Dependencias | Si | Agents, documentos, APIs, backend o decisiones requeridas. |
| Alcance permitido | Si | Archivos, modulos o rutas que puede modificar. |
| Fuera de alcance | Si | Funcionalidad o proyectos que no debe tocar. |
| Documentacion canonica | Si | Documentos que debe leer antes de implementar. |
| Criterios de aceptacion | Si | Condiciones para marcar completado. |
| Validaciones | Si | Build, lint, checks, pruebas o validacion documental. |
| Reporte esperado | Si | Que debe registrar en `EXECUTION_REPORT.md`. |

Si un agent no incluye estos campos, Codex debe inferirlos desde la
documentacion canonica y registrar la informacion faltante.

## Estados oficiales

| Estado | Uso |
|---|---|
| Pendiente | Existe tarea clara aun no ejecutada. |
| En progreso | La tarea se esta ejecutando en la corrida actual. |
| Completado | Implementado o documentado, validado y reportado. |
| Parcialmente completado | Hay MVP o documento, pero quedan dependencias reales. |
| Bloqueado | Falta informacion, backend, contrato, permiso o decision critica. |
| No aplicable | El estado actual del proyecto hace que la tarea no corresponda. |
| Sin instrucciones | Archivo vacio o sin tarea accionable. |
| Archivado | Agent completado y movido a `_archive` para trazabilidad. |

## Criterios de prioridad

| Prioridad | Uso |
|---|---|
| P0 | Bloquea desarrollo, seguridad, datos o ejecucion local. |
| P1 | Necesario para cerrar MVP, arquitectura o flujo principal. |
| P2 | Mejora importante pero no bloqueante. |
| P3 | Limpieza, investigacion o referencia futura. |

## Archivos permitidos y prohibidos

Antes de editar, cada agent debe clasificar:

- archivos permitidos por el alcance;
- archivos prohibidos por riesgo o proyecto distinto;
- documentos canonicos que deben actualizarse;
- reportes o indices que deben sincronizarse;
- codigo productivo que no debe tocarse si el agent es solo de planeacion.

Regla critica:

```text
Un agent de planeacion no debe implementar logica productiva.
```

## Criterios para completar

Un agent queda completado si:

- las tareas no completadas fueron ejecutadas o documentadas como no aplicables;
- los criterios de aceptacion se cumplieron;
- las validaciones disponibles fueron ejecutadas;
- `EXECUTION_REPORT.md` registra resultado, decisiones y pendientes;
- si creo documento canonico, se actualizaron indices o referencias necesarias;
- no quedan bloqueos esenciales dentro del alcance declarado.

## Criterios para bloquear

Bloquear y no inventar cuando falte:

- contrato API requerido;
- decision de negocio o precio;
- permiso de seguridad;
- motor backend real;
- criterio de aceptacion verificable;
- definicion de datos sensibles;
- repositorio o infraestructura indispensable.

## Criterios para archivar

Un agent puede archivarse si:

- esta completado, no aplicable o sin instrucciones;
- el resultado ya esta en documentacion canonica;
- la validacion quedo registrada;
- no quedan tareas pendientes dentro del archivo;
- el archivo archivado conserva trazabilidad en `_archive/agents/<fecha>-<tema>/`.

No se archiva si contiene tareas pendientes o bloqueos que el usuario todavia
debe resolver.

## Secuencia oficial

1. Identificar agents activos con `AGENTS-*.md` ordenados numericamente.
2. Revisar `EXECUTION_REPORT.md` para no repetir tareas ya completadas.
3. Clasificar cada agent como `completado`, `pendiente`, `sin instrucciones` o
   `bloqueado`.
4. Identificar dominio documental: Core, Proyecto, Estandar, Integracion,
   Meta, Agents o Templates.
5. Leer el documento canonico del dominio antes de editar.
6. Decidir si la informacion se agrega a documento existente o requiere uno
   nuevo.
7. Editar solo el alcance del agent.
8. Actualizar indices y relaciones si se crea o cambia documentacion canonica.
9. Ejecutar validaciones proporcionales.
10. Registrar resultado en `EXECUTION_REPORT.md`.
11. Limpiar o archivar agents solo si ya no queda tarea pendiente.

## Orden documental recomendado

Cuando el usuario pida ordenar documentacion, la secuencia debe ser:

```text
Inventariar
-> Clasificar
-> Detectar duplicados
-> Definir canonicos
-> Separar Core/Proyecto/Estandar/Integracion
-> Actualizar indices
-> Documentar pendientes
-> Validar
-> Reportar
-> Limpiar agents completados
```

## Criterios para crear documento nuevo

Crear documento nuevo solo cuando:

- el tema no exista en `master-index`;
- tenga owner y audiencia claros;
- no duplique documento canonico;
- vaya a ser consultado como referencia estable.

Si ya existe documento canonico, se debe actualizar ese documento.

## Criterios para no implementar

Un agent debe quedar documentado como pendiente, no implementado, cuando:

- pide una fase productiva demasiado grande;
- depende de informacion de negocio no definida;
- requiere proveedor externo no seleccionado;
- requiere infraestructura no disponible;
- puede romper contratos existentes.

## Validaciones

| Cambio | Validacion minima |
|---|---|
| Solo documentacion | `git diff --check` y busqueda `rg` de rutas nuevas. |
| API Django | `python manage.py check` y `python -m compileall .`. |
| Web Next.js | `npm run build`. |
| Docker | `docker compose config`. |

## Limpieza de agents

Si todos los agents con contenido quedaron completados o convertidos en
documentacion canonica, se deben limpiar para dejarlos listos para la siguiente
corrida.

Si queda alguna tarea real pendiente, no se limpian los agents pendientes; se
registra la razon en `EXECUTION_REPORT.md`.

## Reporte obligatorio

Cada corrida debe terminar con:

- documents revisados;
- agents completados;
- agents pendientes y motivo;
- documentos creados o modificados;
- documentos fuera de alcance;
- informacion faltante o ambigua;
- validaciones ejecutadas;
- decision de limpieza o no limpieza.
