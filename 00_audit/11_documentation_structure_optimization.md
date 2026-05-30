# Optimizacion de estructura documental

## Estado

ACTIVE

## Objetivo

Evaluar la propuesta del agent sobre reorganizar la documentacion para trabajar
mas rapido y definir que se adopta, que se adapta y que se descarta.

## Agent evaluado

Se reviso `Docs/agents/AGENTS-000.md`.

El agent propone consolidar primero:

```text
Core
Shared
Meta
Agents
Templates
```

y despues documentar por prioridad:

```text
1. Fiscora
2. DocuCore
3. LexNova
4. TecnoTelec
5. JobCron
```

Tambien recomienda no documentar profundamente todavia:

- POS;
- GovernmentTender;
- APS;
- HRM;
- EAM;
- QMS;
- BI avanzado;
- CRM empresarial completo;
- TMS complejo;
- event bus distribuido empresarial.

## Decision

La propuesta es correcta como estrategia de trabajo, pero no debe aplicarse
creando carpetas nuevas como `/docs/core` o `/docs/shared`, porque la estructura
canonica vigente ya existe y esta documentada en `Docs/README.md`.

Se adopta como capa operativa, no como reestructura fisica.

## Adaptacion a la estructura actual

| Agent propone | Decision | Ruta real |
|---|---|---|
| Core | Adoptado | `Docs/01_core_erp` |
| Shared | Adoptado como conjunto | `Docs/03_standards`, `Docs/_meta`, `Docs/templates` |
| Meta | Adoptado | `Docs/_meta` |
| Agents | Adoptado | `Docs/agents` |
| Templates | Adoptado | `Docs/templates` |
| Documentar Fiscora primero | Adoptado | `Docs/02_projects/fiscora` |
| Documentar DocuCore despues | Adoptado | `Docs/02_projects/docucore` |
| Documentar LexNova despues | Adoptado | `Docs/02_projects/lexnova` |
| Documentar TecnoTelec despues | Adoptado | `Docs/02_projects/tecnotelec` |
| Documentar JobCron despues | Adoptado | `Docs/02_projects/jobcron` |
| Documentar todo el ecosistema de golpe | Rechazado | Riesgo de duplicacion y reescritura |

## Cambios aplicados

Se crea un indice operativo:

```text
Docs/_meta/active-work-index.md
```

Ese documento funciona como entrada rapida para:

- saber que leer antes de trabajar;
- mapear Core/Shared/Meta a carpetas reales;
- priorizar proyectos activos;
- evitar leer todo `Docs`;
- evitar crear APIs o documentos de proyectos futuros sin MVP.

Tambien se actualizan:

- `Docs/README.md`;
- `Docs/_meta/master-index.md`;
- `Docs/_meta/master-index.yaml`;
- `Docs/_meta/navigation-map.md`;
- `Docs/_meta/document-relations.md`;
- `Docs/agents/EXECUTION_REPORT.md`.

## Orden operativo recomendado

Para nuevas tareas:

1. Leer `Docs/README.md`.
2. Leer `Docs/_meta/active-work-index.md`.
3. Revisar `Docs/00_audit/10_development_gap_analysis.md` si la tarea toca
   pendientes o desarrollo.
4. Leer solo el README y documentos canonicos del proyecto/API afectado.
5. Actualizar indices si se crea documento nuevo.
6. Reportar en `Docs/agents/EXECUTION_REPORT.md` si vino de un agent.

## Lo que queda fuera

No se movieron carpetas ni documentos existentes.

No se crearon rutas paralelas:

- `Docs/core`;
- `Docs/shared`;
- `Docs/business`;
- `Docs/standards`.

No se profundizo documentacion de modulos futuros sin owner y MVP.

## Informacion faltante

- Owners reales por dominio y proyecto.
- Confirmacion de ramas de trabajo para publicar cambios documentales.
- Decision final sobre si los proyectos futuros tendran APIs propias o seran
  modulos internos de JobCron.
- Priorizacion humana final entre Fiscora, DocuCore, LexNova, Tecno Telec y
  JobCron cuando haya conflicto de recursos.

## Resultado

La estructura fisica actual se conserva. La mejora es una capa de navegacion y
priorizacion que permite trabajar mas rapido sin romper enlaces ni duplicar
documentacion.
