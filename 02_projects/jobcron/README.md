# JobCron

## Rol

ERP central del ecosistema.

## Dominios

- jobcron.com
- jobcron.mx

## Que hace

Orquesta modulos de ventas, inventario, logistica, pagos, analitica, reglas y operacion para conectar todos los negocios.

## Necesidades basicas

- Multi-empresa / multi-proyecto.
- Auth y permisos.
- Catalogo.
- Pricing.
- Cotizaciones y ventas.
- Inventario.
- Logistica.
- Pagos.
- Reglas.
- Reportes.

## MVP sugerido

1. Auth.
2. Catalog.
3. Pricing.
4. Quote/Sales.
5. Rules Engine basico.
6. Gateway.

## Arquitectura Docker oficial

JobCron define la regla general de ejecucion Docker del ecosistema:

```txt
../../03_standards/docker/jobcron-official-docker-architecture.md
```

La arquitectura debe soportar corrida completa por archivos `master` y corrida
focalizada por proyecto web. Las APIs compartidas como Auth, Catalog, Supplier
o Pricing no pertenecen a una web especifica y no deben duplicarse por proyecto.
La red oficial vigente para compose master, base y overlays es
`jobcron_network`.

## LeadHunter retirado

LeadHunter fue retirado como proyecto y como modulo operativo activo de
JobCron. Su documentacion fuente se conserva solo como referencia historica en:

```txt
Docs/_archive/projects/2026-06-26-leadhunter-retired
```

Reglas:

- No crear repositorios activos separados para `API.PY.DJANGO.LeadHunter` ni
  `WEB.NJ.NEXT.LeadHunter`.
- No arrancar LeadHunter como proyecto Docker separado.
- No registrar `LEADHUNTER` en Gateway General, Auth Applications ni matrices
  activas salvo nueva decision canonica.
- Si se requiere prospecting/CRM en el futuro, debe definirse como capacidad de
  JobCron con contrato nuevo, sin reutilizar la API/Web retiradas.

## Pendientes

- Definir marca visual.
- Definir si JobCron sera producto SaaS publico o ERP interno.
- Integrar Auth real al panel de `FeatureAvailability`.

## Continuidad Auth y frontend local

JobCron queda alineado al estandar:

```txt
../../03_standards/frontend/account-continuity-standard.md
```

Impacto vigente:

- `WEB.NJ.NEXT.JobCron/next.config.ts` declara `allowedDevOrigins` para
  `localhost`, `127.0.0.1` y puerto `3000`.
- Las rutas admin deben mantener continuidad de sesion mediante Gateway General
  cuando se cierre Auth real.
- No se debe duplicar un flujo Auth propio fuera de Gateway/Auth.

Pendientes reales:

- Definir si el panel `/admin` pertenece a ERP interno o SaaS publico.
- Definir matriz final de permisos del panel administrativo.

## FeatureAvailability

Documento canonico:

```txt
feature-availability.md
```

Estado: MVP funcional con API Django, migraciones, semilla inicial DocuCore,
auditoria y panel administrativo en la web JobCron.

Contratos y datos:

```txt
api-contracts.md
database.md
operational-admin-center.md
productive-operations-roadmap.md
technical/code-actions-map.md
frontend/code-actions-map.md
api/code-actions-map.md
```

## Regla de base de datos publicada

Las tablas y campos publicados de JobCron deben documentarse con nombres PascalCase estilo SQL Server.

Documento canonico:

```txt
../../03_standards/database/sql-server-publication-standard.md
```

## Tecno Telec

Proceso administrativo relacionado:

```txt
01_tecnotelec_admin_process.md
```

Boceto funcional:

```txt
ui/00_jobcron_mockup_analysis.md
```

Revision y propuesta mejorada:

```txt
ui/04_web_review_and_better_proposal.md
```

Extraccion visual del PDF:

```txt
ui/05_pdf_visual_extraction.md
```

Investigacion y maqueta publica:

```txt
ui/06_public_website_structure_research.md
```
