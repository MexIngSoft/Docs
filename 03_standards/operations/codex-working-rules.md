# Reglas de trabajo para Codex

> Estado: base vigente.

## Objetivo

Definir como debe trabajar Codex dentro del repositorio `Docs` y el ecosistema comercial.

Este documento reemplaza el uso de `AGENTS.md` como archivo maestro de instrucciones.

## Regla principal

`AGENTS.md` debe quedar vacio salvo que el owner indique lo contrario.

Las instrucciones amplias deben vivir en documentos especificos dentro de `Docs`.

## Documentos de referencia

| Tema | Documento |
|---|---|
| Prompts estandar con agents, sin agents y modernizacion visual | `03_standards/operations/standard-request-prompts.md` |
| Flujo documentation-first sin agents | `03_standards/documentation-first-workflow.md` |
| Modernizacion visual sin documentacion especifica | `03_standards/frontend/undocumented-modernization-standard.md` |
| Reglas globales para agents | `agents/AGENT_GLOBAL_RULES.md` |
| Flujo Git, ramas, commits y validacion | `03_standards/operations/git-environments-and-release-flow.md` |
| Cierre y estructura de APIs Django | `03_standards/operations/project-closure-standard.md` |
| Separacion futura de APIs y bases | `01_core_erp/architecture/08_data_isolation_and_reference_tables.md` |
| Tablas publicadas con nombres PascalCase estilo SQL Server | `03_standards/database/sql-server-publication-standard.md` |
| Patron Gateway/API propia por proyecto | `01_core_erp/architecture/07_project_api_pattern.md` |
| Plan operativo Tecno Telec | `02_projects/tecnotelec/AGENTE.md` |
| Runbook operativo | `03_standards/operations/runbook.md` |

## Auditoria de documentacion

Cuando el owner pida revisar la documentacion, Codex debe analizar:

- Arquitectura general.
- APIs existentes.
- Frontends existentes.
- Aplicaciones moviles existentes.
- Bases de datos existentes.
- Integraciones externas existentes.
- Reglas de negocio documentadas.
- Flujos documentados.
- Roadmaps o pendientes existentes.

Debe determinar:

1. Que APIs ya existen.
2. Que APIs estan incompletas.
3. Que APIs faltan por crear.
4. Que proyectos frontend existen.
5. Que proyectos moviles existen.
6. Que proyectos faltan.
7. Que integraciones externas ya estan contempladas.
8. Que partes del sistema no tienen documentacion.
9. Que documentacion esta desactualizada.
10. Que documentacion se contradice.

## Reglas de clasificacion

- No inventar informacion.
- Si algo no existe en la documentacion, marcarlo como:

```txt
No encontrado en la documentacion actual.
```

- Si una regla sirve para varios proyectos, pertenece al nucleo ERP.
- Si una regla solo aplica a una empresa, marca, canal o vertical, pertenece al proyecto correspondiente.
- Si una integracion depende de un proveedor externo, pertenece a `04_integrations`.

## Separacion futura de APIs y bases

Las APIs deben estar preparadas para trabajar por separado.

Si una API debe separarse por carga, seguridad o crecimiento, debe poder moverse a:

- Proyecto/repositorio propio.
- Base de datos propia.
- Contratos de comunicacion explicitos.
- Integracion con otras APIs sin depender de tablas internas ajenas.

Tambien debe evaluarse el uso de tablas referenciadas entre bases, cuando sea util para lectura controlada de datos maestros.

Toda tabla que se publique como contrato documental debe usar nombres PascalCase estilo SQL Server.

Documento canonico:

```txt
01_core_erp/architecture/08_data_isolation_and_reference_tables.md
```

## Tecno Telec

Cuando el owner pida trabajar en Tecno Telec, Codex debe usar como documento canonico:

```txt
02_projects/tecnotelec/AGENTE.md
```

Debe revisar:

- Procesos ya realizados.
- Puntos pendientes.
- Orden recomendado de desarrollo.
- APIs requeridas.
- Tablas requeridas.
- Frontend requerido.
- Decisiones ya tomadas.

## Flujo de validacion y Git

Antes de subir cambios a GitHub se debe seguir:

```txt
03_standards/operations/git-environments-and-release-flow.md
```

Reglas operativas:

- Primero implementar en local.
- Ejecutar validaciones minimas proporcionales al cambio.
- Informar al owner que esta listo para validar.
- No hacer commit ni push funcional sin aprobacion del owner.
- Separar commits por repositorio y responsabilidad.
- Usar solamente `dev`, `pro` y `main` como ramas persistentes.
- No dejar ramas temporales publicadas ni vivas al cerrar la tarea.
