# Reglas globales para Agents

## Objetivo

Dar a cualquier agent un marco comun de arquitectura, documentacion, UI,
autonomia, validacion y cierre. Estas reglas se leen antes de ejecutar cualquier
`AGENTS-*.md`.

## Lectura obligatoria

Antes de modificar archivos, leer:

```text
Docs/agents/RUN_AGENTS_INSTRUCTIONS.md
Docs/README.md
Docs/agents/AGENT_GLOBAL_RULES.md
Docs/_meta/active-work-index.md
```

Despues leer solo la documentacion canonica del dominio afectado.

## Prompts estandar

Las instrucciones largas para pedir trabajo no deben repetirse en cada
conversacion. Usar:

```text
Docs/03_standards/operations/standard-request-prompts.md
```

Ese documento define el prompt corto con agents, sin agents y para
modernizacion visual no documentada.

## Reglas de arquitectura

- Todo proyecto web productivo usa `Frontend`, Gateway General y APIs
  compartidas por responsabilidad.
- Solo se permite API especializada cuando exista logica exclusiva del dominio,
  datos propios, reglas propias, formularios propios o integracion exclusiva
  que no pertenezca a una API compartida.
- No se debe crear una API por proyecto como patron general.
- No se debe crear Gateway/BFF por proyecto.
- No se debe crear Auth por proyecto.
- No se debe crear Docker por proyecto.
- El frontend no consume APIs internas ni Gateways legacy por proyecto.
- El ERP conserva capacidades reutilizables; los proyectos conservan identidad,
  negocio, UX, permisos y datos especificos.
- Las integraciones de proveedor viven en `Docs/04_integrations`.
- Las reglas de trabajo, UI, testing, Docker, seguridad y operacion viven en
  `Docs/03_standards`.
- Si una capacidad puede venderse como SaaS o modulo independiente, debe
  clasificarse en la estrategia de producto antes de implementarse.

## Reglas UI/UX

- Todas las webs nuevas son mobile first y responsive.
- El primer viewport debe mostrar la experiencia util, no una landing vacia.
- Cada proyecto debe respetar su identidad visual documentada.
- Cuando exista mockup aprobado, la desviacion visual debe ser minima y
  justificada.
- Las herramientas operativas deben priorizar flujos, contexto, estados,
  preview, acciones siguientes y recuperacion ante error.
- No se deben mostrar como disponibles funciones sin backend real; deben
  marcarse como `mvp`, `development`, `internal` o `disabled`.
- Si una pantalla no tiene documentacion canonica, declarar la ausencia,
  revisar patrones modernos ya implementados y aplicar
  `Docs/03_standards/frontend/undocumented-modernization-standard.md`.

## Autonomia permitida

El agent puede resolver sin preguntar:

- Ajustes menores de documentacion.
- Normalizacion de nombres y enlaces.
- Creacion de indices, checklists, reportes y documentos canónicos.
- Clasificacion de contenido segun estructura existente.
- Registro de pendientes, riesgos y preguntas.
- Validaciones locales disponibles.

## Limites de autonomia

No decidir sin evidencia suficiente:

- Cambios de seguridad, permisos, facturacion, cobro o datos sensibles.
- Eliminacion de documentos o codigo relevante.
- Cambios de arquitectura entre ERP, API, Gateway y frontend.
- Promesas comerciales o estados de disponibilidad que no existan.
- Migraciones productivas o cambios destructivos.

Si falta informacion esencial, documentar bloqueo y preguntas concretas.

## Estados de cierre

Cada agent debe terminar como:

| Estado | Uso |
|---|---|
| `Completado` | Implementado/documentado y validado. |
| `Parcialmente completado` | Se cerro un MVP o documento, pero quedan dependencias claras. |
| `Bloqueado` | Falta informacion o infraestructura esencial. |
| `No aplicable` | No corresponde al estado actual del proyecto. |
| `Sin instrucciones` | Archivo vacio o sin tarea ejecutable. |

## Validacion

- Web: `npm run build` y `npm run lint` si existe.
- API Django: `python manage.py check` y compilacion Python disponible.
- Docker: `docker compose config --quiet` si se modifican compose o Dockerfile.
- Documentacion: validar existencia de enlaces/rutas tocadas con busqueda local.

## Reporte

Actualizar siempre:

```text
Docs/agents/EXECUTION_REPORT.md
```

Registrar:

- agents ejecutados;
- archivos modificados;
- validaciones;
- decisiones;
- informacion faltante;
- pendientes reales;
- limpieza aplicada. Los archivos `Docs/agents/AGENTS-*.md` nunca se eliminan,
  nunca se mueven y nunca se reemplazan; limpiar/cerrar/quitar/archivar un
  agent significa vaciar su contenido y conservar el archivo original.

## Cuando no se usan agents

Si el usuario pide una tarea directa sin `AGENTS-*.md`, aplicar el flujo:

```text
Docs/03_standards/documentation-first-workflow.md
```

En ese caso no es obligatorio actualizar `EXECUTION_REPORT.md`, salvo que la
tarea afecte agents o el usuario lo pida.
