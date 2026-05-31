# Prompts estandar para pedir trabajo

## Objetivo

Evitar repetir instrucciones largas en cada solicitud. Este documento define
dos formas oficiales de pedir trabajo:

- con agents;
- sin agents.

Ambas usan la documentacion canonica, reglas globales, estandares UI/UX,
arquitectura API/Gateway y reporte de decisiones.

## Prompt corto con agents

Usar cuando existan instrucciones temporales en `Docs/agents/AGENTS-*.md`.

```text
Ejecuta los agents activos de Docs/agents en orden numerico, siguiendo el
estandar del repositorio.

Antes de implementar, lee:
- Docs/agents/RUN_AGENTS_INSTRUCTIONS.md
- Docs/agents/AGENT_GLOBAL_RULES.md
- Docs/README.md
- Docs/_meta/active-work-index.md
- la documentacion canonica relacionada con cada agent

Ejecuta solo tareas no completadas. No reviertas cambios existentes. No
modifiques fuera del alcance. Documenta resultados, decisiones, validaciones,
pendientes, riesgos e informacion faltante en:

Docs/agents/EXECUTION_REPORT.md

Valida con los comandos disponibles. Al finalizar, archiva o limpia los agents
completados segun el estandar y dime: completados, parciales, bloqueados,
pendientes, validaciones y reporte.
```

## Prompt corto sin agents

Usar cuando no quieres crear `AGENTS-*.md` y solo necesitas que se ejecute una
tarea directa.

```text
Ejecuta esta tarea siguiendo el estandar del repositorio y sin usar agents:
[DESCRIBE LA TAREA]

Antes de implementar, revisa:
- Docs/README.md
- Docs/_meta/master-index.md
- Docs/_meta/master-index.yaml
- Docs/_meta/navigation-map.md
- Docs/_meta/active-work-index.md
- Docs/agents/AGENT_GLOBAL_RULES.md
- los estandares y documentos canonicos relacionados

Lee solo la documentacion relacionada con la tarea. Si no existe documentacion
canonica, indicarlo explicitamente, usar patrones existentes del codigo y
documentar la decision.

No reviertas cambios existentes. No modifiques funcionalidad fuera del alcance.
Valida con build, lint, test o checks disponibles. Al finalizar dime:
documentos revisados, documentos fuera de alcance, cambios realizados,
validaciones, informacion faltante y decisiones tomadas.
```

## Prompt para modernizacion visual sin documentacion especifica

Usar para pantallas antiguas o no documentadas como login, registro,
activacion, recuperacion de contrasena o links secundarios.

```text
Moderniza esta pantalla siguiendo el estandar UI/UX del repositorio:
[PANTALLA O RUTA]

Primero verifica si existe documentacion canonica en los indices. Si no existe,
declara que no encontraste documentacion especifica y usa como referencia los
patrones actuales ya implementados, especialmente inicio, dashboard y pantallas
modernas del mismo proyecto.

Mantén consistencia visual, componentes, espaciado, navegacion, estados y
experiencia mobile first. No introduzcas cambios funcionales innecesarios. No
reviertas cambios existentes. Valida con build/lint/checks disponibles y
documenta decisiones e informacion faltante en el reporte correspondiente.
```

## Regla de seleccion

| Caso | Usar |
|---|---|
| Hay backlog temporal o varias instrucciones `AGENTS-*.md` | Prompt con agents |
| Hay una tarea directa y clara | Prompt sin agents |
| Hay pantalla vieja sin especificacion | Prompt de modernizacion visual |
| Falta informacion critica | Documentar bloqueo y preguntas |

## Reporte esperado sin agents

Cuando no se usan agents, no es obligatorio actualizar
`Docs/agents/EXECUTION_REPORT.md`, salvo que el usuario lo pida o la tarea afecte
directamente a agents. El cierre debe incluir:

- documentos revisados;
- documentos fuera de alcance;
- cambios realizados;
- validaciones;
- informacion faltante;
- decisiones tomadas.

## Reporte esperado con agents

Cuando se usan agents, siempre actualizar:

```text
Docs/agents/EXECUTION_REPORT.md
```

Y cerrar con:

```text
Agents ejecutados: N-M.
Completados: ...
Parciales: ...
Bloqueados: ...
Sin instrucciones: ...
Validaciones: ...
Reporte: Docs/agents/EXECUTION_REPORT.md
```
