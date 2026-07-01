# AGENTS-030 — Backlog activo concentrado

## Estado

BACKLOG_ACTIVO.

## Objetivo

Conservar los pendientes P0-P5 que no deben perderse mientras el orquestador
`AGENTS-031.md` ejecuta el cierre preproduccion.

Este archivo ya no debe usarse como guia operativa principal. Para clasificar y
ejecutar nuevas tareas usar:

```text
Docs/agents/_index.md
Docs/agents/instructions/classifier.md
Docs/agents/instructions/routing-matrix.md
Docs/agents/AGENTS-031.md
```

## Rama obligatoria

```text
general
```

`general` debe extender de `dev`. No modificar `main` ni `pro` desde este
agent.

## Lectura minima obligatoria

Antes de ejecutar cualquier pendiente de este concentrador leer:

```text
Docs/README.md
Docs/_meta/active-work-index.md
Docs/agents/RUN_AGENTS_INSTRUCTIONS.md
Docs/agents/AGENT_GLOBAL_RULES.md
Docs/agents/EXECUTION_REPORT.md
Docs/00_audit/10_development_gap_analysis.md
Docs/agents/_index.md
```

Despues leer solo el Context Pack y la documentacion canonica del proyecto o API
afectada.

## Fuente de reagrupacion

| Origen | Nuevo tratamiento |
|---|---|
| `AGENTS-000.md` | Absorbido en P0 REFAPART/Auth/Gateway. |
| `AGENTS-001.md` | Absorbido por `AGENTS-000.md`; queda cerrado y limpio. |
| `AGENTS-002.md` | P5 Payments/futuro comercial; no ejecutar sin contrato. |
| `AGENTS-003.md` | P5 Document/Image/DocuCore futuro; no ejecutar sin alcance. |
| `AGENTS-004.md` | P2 MexIngSof. |
| `AGENTS-005.md` | P1 JobCron/POS sobre Core. |
| `AGENTS-006.md` | Absorbido por `AGENTS-005.md`; sin instrucciones activas. |
| `AGENTS-007.md` | Roadmap; no prioritario para salida actual. |
| `AGENTS-008.md` | Roadmap compartido/Search/operacion; usar solo si impacta JobCron/Search. |
| `AGENTS-009.md` | Roadmap Buildora; fuera de salida actual. |
| `AGENTS-010.md` | Roadmap Trading/Radar; fuera de salida actual. |
| `AGENTS-011.md` | Roadmap ContentHub; fuera de salida actual. |
| `AGENTS-012.md` | Absorbido en P0 REFAPART/Auth/SES. |
| `AGENTS-013.md` | Soporte Docker/operacion; ejecutar solo si se toca Docker/scripts. |
| `AGENTS-014.md` | Absorbido en P0 REFAPART/Auth/SES. |
| `AGENTS-015.md` | Plantillas/correos REFAPART; pendiente solo si falla correo/template. |
| `AGENTS-016.md` | Correos REFAPART; pendiente solo si falla entrega/template. |
| `AGENTS-017.md` | Paginas Auth web; aplicar solo por proyecto solicitado. |
| `AGENTS-018.md` | Mapa de acciones de codigo; estandar ya creado, mantener mapas. |
| `AGENTS-019.md` | Orquestador absorbido por este concentrador. |
| `AGENTS-020.md` | Referencia tecnica MexIngSoft; usar como apoyo, no como agent activo. |
| `AGENTS-021.md` | Incidencia REFAPART/Gateway/Auth absorbida en P0. |
| `AGENTS-022.md` | Roadmap Innovation Engines Repair; fuera de salida actual. |
| `AGENTS-023.md` | Roadmap Marketplace Manager; fuera de salida actual. |
| `AGENTS-024.md` | Roadmap Comerzy; fuera de salida actual. |
| `AGENTS-025.md` a `AGENTS-029.md` | Sin instrucciones. |

## P0 — REFAPART + Auth + Gateway

Prioridad mas alta.

### Cerrable por Codex

1. Completar en mapas REFAPART los `PENDIENTE_DE_DEFINIR` que puedan resolverse
   revisando codigo real.
2. Validar rutas documentadas de:
   - busqueda;
   - solicitud de pieza;
   - checkout;
   - admin REFAPART;
   - proveedores;
   - Address;
   - Auth.
3. Ejecutar validaciones disponibles:
   - `npm run lint` en `WEB.NJ.NEXT.RefaPart`;
   - `npm run build` en `WEB.NJ.NEXT.RefaPart`;
   - `python manage.py check` en Gateway/Auth/RefaPart API si aplica;
   - endpoints basicos por Gateway si Docker esta arriba.
4. Actualizar mapas:
   - `Docs/02_projects/refapart/technical/code-actions-map.md`;
   - `Docs/02_projects/refapart/frontend/code-actions-map.md`;
   - `Docs/02_projects/refapart/api/code-actions-map.md`.

### Requiere decision

1. Proveedor y contrato de Payments.
2. Matriz final de permisos/roles REFAPART si no se puede inferir de Auth.
3. Politica final de checkout si aplica usuario invitado o solo autenticado.

### Bloqueo externo

1. Entrega real AWS SES si depende de sandbox, dominio/remitente no verificado,
   permisos IAM o reputacion externa.
2. Credenciales/productivo no deben quedar en docs ni codigo.

## P1 — JobCron + Auth + Gateway

### Cerrable por Codex

1. Ejecutar `python manage.py check` en `API.PY.DJANGO.JobCron` si el repo esta
   disponible.
2. Ejecutar lint/build en `WEB.NJ.NEXT.JobCron` si aplica.
3. Eliminar cualquier uso o rastro versionado de SQLite/`db.sqlite3`. JobCron
   debe usar unicamente PostgreSQL conforme al estandar.
4. Documentar endpoint faltante `admin/overview`.
5. Confirmar consumo via Gateway General.
6. Mantener FeatureAvailability como dominio JobCron y no duplicarlo.

### Requiere decision

1. Si JobCron sera producto SaaS publico o ERP interno.
2. Roles/permisos finales del panel administrativo.

## P2 — MexIngSof

### Cerrable por Codex

1. Ejecutar `npm run lint` y `npm run build` en `WEB.NJ.NEXT.MexIngSof`.
2. Documentar con precision rutas internas `app/api/*`.
3. Marcar cada ruta interna como temporal o migrable a Gateway/JobCron/Catalog/Auth.
4. Validar que no exista necesidad real de `API.PY.DJANGO.MexIngSof`.

### Requiere decision

1. Si leads corporativos viven en JobCron CRM o en otra API comercial compartida.
2. Si servicios/productos publicados viven en Catalog o JobCron.
3. Auth final del panel admin.

## P3 — Tecno Telec

### Cerrable por Codex

1. Ejecutar lint/build web si aplica.
2. Ejecutar `python manage.py check` en `API.PY.DJANGO.TecnoTelec` si aplica.
3. Validar estructura web/API existente.
4. Confirmar rutas publicas de catalogo, soluciones y cotizador.
5. Mantener mapas de acciones actualizados.

### Requiere decision

1. Confirmar si el MVP es consultivo, cotizador, carrito o checkout.
2. Confirmar si cotizaciones van por Sales API o TecnoTelec API.
3. Confirmar si portal/login requiere Auth ahora o queda para fase posterior.

## P4 — Universal POS sobre JobCron Core

### Cerrable por Codex

1. Documentar POS como capacidad sobre JobCron Core.
2. Confirmar que `AGENTS-006` queda absorbido por el dominio de JobCron/POS.
3. Evitar POS como ERP separado.

### Requiere decision

1. Alcance MVP de POS.
2. Hardware/terminales/proveedor de pagos.
3. Recargas, WiFi Rewards y pagos reales quedan fuera sin contrato.

## P5 — Payments, Document, Image y roadmap futuro

No ejecutar como desarrollo activo hasta tener contrato, owner y MVP.

Incluye:

- Payments;
- POS avanzado;
- Sales/Fiscal avanzado;
- Document API;
- Image API;
- DocuCore;
- Search avanzado;
- Innovation Engines Repair;
- Buildora;
- Trading/Radar;
- ContentHub;
- Marketplace Manager;
- Comerzy.

## Reglas de ejecucion

- No crear APIs nuevas si Auth, Gateway, Catalog, Inventory, Pricing, Supplier,
  Procurement, Sales, Search, Notification, Document o JobCron cubren el caso.
- No consumir APIs internas desde frontend fuera del Gateway General.
- No declarar productivo lo que siga en mock, temporal o `PENDIENTE_DE_DEFINIR`.
- No limpiar este `AGENTS-030.md` hasta que todos los pendientes P0-P5 queden
  cerrados, bloqueados formalmente o convertidos en documentos canonicos.
- El orden real de ejecucion vive en `AGENTS-031.md`.

## Criterio de cierre de este agent

Este concentrador queda completado y se puede limpiar solo cuando:

1. P0 REFAPART no tenga pendientes resolubles por codigo/documentacion local.
2. P1 JobCron tenga Auth/Gateway/DB definidos o bloqueados formalmente.
3. P2 MexIngSof tenga rutas internas migradas o documentadas con decision.
4. P3 Tecno Telec tenga MVP decidido y contratos Gateway/API confirmados.
5. P4/P5 tengan ADR o decision de producto si se activan.
6. `EXECUTION_REPORT.md` tenga validaciones y estado final.
