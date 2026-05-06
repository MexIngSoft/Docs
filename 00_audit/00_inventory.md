# Inventario documental

## Objetivo

Registrar el estado de las fuentes documentales despues de reorganizar por nucleo, proyectos, estandares e integraciones.

| Archivo o carpeta | Ruta actual | Tipo | Tema | Estado | Accion recomendada |
|---|---|---|---|---|---|
| README principal | docs/README.md | DOCUMENTACION | Indice general | ACTIVO | Mantener como entrada principal. |
| AGENTS | docs/AGENTS.md | DOCUMENTACION | Reglas de organizacion | ACTIVO | Mantener alineado con estructura actual. |
| Auditoria | docs/00_audit | AUDITORIA | Control documental | ACTIVO | Actualizar cuando se reorganice. |
| Nucleo ERP | docs/01_core_erp | ERP | Reglas reutilizables | ACTIVO | Fuente principal del producto base. |
| Proyecto Tecno Telec | docs/02_projects/tecnotelec | PROYECTO | Negocio, frontend, tareas, decisiones | ACTIVO | Fuente principal de Tecno Telec. |
| Estandares | docs/03_standards | ESTANDAR | Operacion, seguridad, testing, Docker | ACTIVO | Usar para reglas de trabajo. |
| Integracion Syscom | docs/04_integrations/syscom | INTEGRACION | API externa y ETL Syscom | ACTIVO | Usar como referencia de proveedor. |
| Fuente visual Tecno Telec | docs/_archive/source_notes/tecnotelec-ui | ARCHIVO_UTIL | Imagenes extraidas del PDF de interfaz | CONSERVADO | Usar solo como referencia visual historica. |

## Clasificacion

- `NUCLEO_ERP`: reusable para cualquier proyecto.
- `PROYECTO`: especifico de Tecno Telec u otra implementacion.
- `ESTANDAR`: reglas de trabajo, operacion y calidad.
- `INTEGRACION`: proveedor externo.
- `AUDITORIA`: control de documentacion.
- `ARCHIVO`: fuente historica o material no activo.

## Regla de archivo

El archivo historico se mantiene limpio. Solo se conserva material que aporte trazabilidad real o referencia visual util.
