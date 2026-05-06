# Revision final documental

## Resumen

Se reorganizo la documentacion para separar claramente:

- Nucleo ERP reutilizable.
- Proyecto Tecno Telec.
- Estandares.
- Integraciones.
- Archivo historico.

## Estructura activa

```text
docs/
  00_audit/
  01_core_erp/
  02_projects/
  03_standards/
  04_integrations/
  _archive/
```

## Documentos revisados

Se revisaron:

- Instrucciones `docs/AGENTS.md`.
- Documentacion canonica creada previamente.
- Documentacion tecnica previa.
- Documentos entrantes integrados y depurados.
- PDF visual detectado, extraido y documentado.

## Documentos creados o reorganizados

- `01_core_erp`: nucleo ERP.
- `02_projects/tecnotelec`: proyecto Tecno Telec.
- `02_projects/_ecosystem`: portafolio completo de empresas y proyectos.
- `03_standards`: estandares operativos y tecnicos.
- `04_integrations/syscom`: integracion Syscom.
- `01_core_erp/erp`: modelos nuevos para Cart, POS, estados, roles, costos, facturacion, devoluciones, errores, jobs, kits, clientes y licitaciones.
- `01_core_erp/apis`: APIs nuevas para Cart, POS, GovernmentTender, Billing, Documents y Notifications.
- `01_core_erp/flows`: flujos nuevos para carrito, POS, devoluciones, errores y licitaciones.
- `02_projects/tecnotelec/frontend/09_interface_proposal.md`: interfaz propuesta desde el PDF visual.

## Documentos archivados

Se mantiene en `_archive`:

- Fuente visual util de Tecno Telec en `source_notes/tecnotelec-ui`.

## Contradicciones encontradas

Ver `00_audit/03_inconsistencies.md`.

Principales:

- Habia carpetas duplicadas para arquitectura, base de datos y dominio.
- Syscom estaba al mismo nivel que el nucleo ERP.
- Operacion, seguridad y pruebas estaban mezcladas con arquitectura.
- Tecno Telec debe ser proyecto, no todo el ERP.
- El PDF visual fue extraido a imagenes y documentado como referencia, no como interfaz final exacta.
- Cart, POS, Projects, Sales y Pricing estaban mezclados en ideas entrantes y quedaron separados por responsabilidad.

## Que pertenece al nucleo

Ver `01_core_erp/README.md`.

En resumen:

- Modulos ERP.
- Arquitectura reusable.
- APIs internas.
- Modelos de datos.
- Flujos genericos.
- Estados, roles, costos, facturacion, devoluciones, jobs, notificaciones, kits y licitaciones cuando apliquen a mas de un proyecto.

## Que pertenece a Tecno Telec

Ver `02_projects/tecnotelec/README.md`.

En resumen:

- Identidad.
- Servicios.
- Segmentos.
- Frontend.
- Tareas.
- Decisiones propias.

## Que pertenece al ecosistema

Ver `02_projects/_ecosystem/00_ecosystem_overview.md`.

En resumen:

- Holding.
- Desarrolladora.
- ERP JobCron.
- Consultora.
- Plataformas tecnologicas.
- Comercio.
- Operacion.
- Servicios tecnicos.
- Legal.
- Servicios locales.
- Creativo.
- Utilidades.

## Prioridades documentales siguientes

1. Revisar `01_core_erp/README.md`.
2. Revisar `02_projects/tecnotelec/README.md`.
3. Aprobar `docs/README.md` como indice principal.
4. Revisar pendientes en `02_projects/tecnotelec/tasks`.
5. Revisar visualmente la propuesta `frontend/09_interface_proposal.md`.

## Recomendacion

Antes de seguir escribiendo documentos nuevos, usar esta regla:

```text
Nucleo reusable -> 01_core_erp
Proyecto Tecno Telec -> 02_projects/tecnotelec
Estandar de trabajo -> 03_standards
Proveedor externo -> 04_integrations
Fuente vieja -> _archive
```
