# Mapa documental

## Objetivo

Registrar la estructura documental activa y explicar que contiene cada carpeta.

| Carpeta | Tipo | Contenido | Relacion con ERP | Revisada |
|---|---|---|---|---|
| `00_audit` | Auditoria documental | Inventarios, inconsistencias, diccionario, estado y resumen. | Control de calidad documental. | SI |
| `01_core_erp` | Nucleo ERP | ERP, arquitectura, base de datos, APIs y flujos reutilizables. | Define el producto base reutilizable. | SI |
| `01_core_erp/erp` | Nucleo ERP | Vision, modulos, reglas, cotizador, ventas, compras, logistica. | Modelo funcional del ERP. | SI |
| `01_core_erp/architecture` | Arquitectura | Gateway, BFF, seguridad, comunicacion, split futuro. | Arquitectura reutilizable. | SI |
| `01_core_erp/database` | Base de datos | Schemas, entidades, relaciones y modelos. | Modelo de informacion del ERP. | SI |
| `01_core_erp/apis` | APIs | APIs internas y responsabilidades. | Contratos funcionales del ERP. | SI |
| `01_core_erp/flows` | Flujos | Cotizacion, compra, sync, pricing, logistica, orden. | Procesos reutilizables. | SI |
| `02_projects` | Proyectos | Implementaciones especificas del ERP. | Separa clientes/empresas del nucleo. | SI |
| `02_projects/_ecosystem` | Proyectos | Mapa global de empresas, marcas y productos. | Ordena el portafolio completo. | SI |
| `02_projects/tecnotelec` | Proyecto | Documentacion especifica Tecno Telec. | Implementacion actual. | SI |
| `02_projects/tecnotelec/business` | Negocio | Identidad, objetivos, FODA, servicios, segmentos, propuesta. | Esencia comercial Tecno Telec. | SI |
| `02_projects/tecnotelec/frontend` | Frontend | Rutas, layout, componentes, diseno y flujos web. | Web/cotizador Tecno Telec. | SI |
| `02_projects/tecnotelec/tasks` | Tareas | APIs, tablas, vistas y orden de desarrollo. | Plan de implementacion Tecno Telec. | SI |
| `02_projects/tecnotelec/decisions` | Decisiones | ADRs del proyecto. | Decisiones Tecno Telec. | SI |
| `03_standards` | Estandares | Operacion, seguridad, testing, Docker. | Reglas de trabajo. | SI |
| `04_integrations` | Integraciones | Proveedores externos y ETL. | Entrada/salida con terceros. | SI |
| `04_integrations/syscom` | Integracion | Referencias API y ETL Syscom. | Proveedor actual. | SI |
| `_archive` | Archivo | Fuentes previas, legacy, out of scope. | Trazabilidad historica. | SI |

## Carpetas duplicadas corregidas

Las carpetas antiguas que estaban al mismo nivel (`architecture`, `database`, `domain`, `apis`, `etl`, `operations`, `security`, `testing`) ya no compiten con la estructura canonica:

- Lo reusable se movio a `01_core_erp`.
- Lo de Tecno Telec se movio a `02_projects/tecnotelec`.
- Lo operativo se movio a `03_standards`.
- Lo de proveedores se movio a `04_integrations`.
- Lo historico se movio a `_archive`.
