# AGENTS-001 — Absorbido por AGENTS-000

## Estado

Cerrado por consolidación.

Este agente fue absorbido por:

```text
Docs/agents/AGENTS-000.md
```

## Motivo

`AGENTS-001` duplicaba el alcance de `AGENTS-000` en:

* Auth REFAPART;
* diagnóstico de `Failed to fetch`;
* Gateway como ruta obligatoria;
* correos por aplicación;
* Amazon SES;
* feedback visual;
* pantallas Auth;
* errores frontend;
* documentación Auth;
* actualización de `EXECUTION_REPORT.md`.

## Regla

No ejecutar este agente de forma independiente.

Cuando una tarea mencione Auth, correos, Gateway, UI Auth o registro REFAPART, ejecutar únicamente:

```text
Docs/agents/AGENTS-000.md
```

## Conservación de información

Toda la información vigente de este agente fue integrada en `AGENTS-000`.

No eliminar este archivo si el estándar del repositorio exige conservar trazabilidad histórica.

## Reporte

Registrar en `Docs/agents/EXECUTION_REPORT.md`:

```text
AGENTS-001 cerrado por duplicidad.
Información vigente absorbida por AGENTS-000.
No requiere ejecución independiente.
```
