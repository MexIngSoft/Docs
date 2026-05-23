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
