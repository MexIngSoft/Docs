# Inconsistencias

| Inconsistencia | Tipo | Documentos | Resolucion |
|---|---|---|---|
| Tecno Telec podria parecer tienda generica si se habla de carrito sin proyectos. | NEGOCIO | Notas entrantes integradas, AGENTS.md | Se documenta como plataforma de soluciones con carrito como canal, no como esencia. |
| `Rules API` vs `rules-engine-api`. | NOMBRE | Notas entrantes integradas, AGENTS.md | Nombre documental oficial: `rules-engine-api`. Modulo: `Rules Engine`. |
| `GovernmentTender API` no aparece en lista minima de AGENTS. | ALCANCE | Nota entrante de licitaciones integrada | Se registra como API futura, no bloqueante para MVP y reusable por empresa. |
| Frontend requerido pero no existe codigo en repo actual. | ALCANCE | AGENTS.md | Documentar rutas, layout y sistema visual como especificacion pendiente de implementacion. |
| PDF visual tenia textos rotos y estilo no final. | DISENO | Imagenes extraidas en `_archive/source_notes/tecnotelec-ui` | Se documento propuesta final en `02_projects/tecnotelec/frontend/09_interface_proposal.md`. |
| Carpeta `Tecno Telect` parece tener error ortografico frente a `Tecno Telec`. | NOMBRE | ruta de archivos | Usar nombre oficial `Tecno Telec`; archivar fuente sin renombrar contenido original. |
| Habia carpetas activas duplicadas para arquitectura, base de datos y dominio. | ORGANIZACION | `architecture`, `database`, `domain`, estructura numerada | Se reorganizo en `01_core_erp`, `02_projects`, `03_standards`, `04_integrations` y `_archive`. |
| Documentos de proveedor estaban al mismo nivel que documentos del nucleo. | ORGANIZACION | `apis`, `etl` | Se movieron a `04_integrations/syscom`. |
| Documentacion operativa estaba mezclada con documentos de arquitectura. | ORGANIZACION | `operations`, `security`, `testing` | Se movio a `03_standards`. |
| `Escoge tu PC` podria duplicar `Buildora`. | NOMBRE | AGENTS.md, propuesta de catalogo | Se conserva `Buildora` como proyecto formal y `Escoge tu PC` como nombre anterior/concepto origen. |
