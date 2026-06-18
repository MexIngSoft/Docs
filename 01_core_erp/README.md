# Nucleo ERP

## Objetivo

Esta carpeta contiene la documentacion reutilizable del ERP modular. No debe depender exclusivamente de Tecno Telec.

## Contenido

| Carpeta | Contenido |
|---|---|
| `erp` | Vision, modulos y modelos de negocio internos. |
| `architecture` | Arquitectura general, comunicacion, gateway, seguridad y split futuro. |
| `database` | Schemas, entidades, relaciones y modelos de datos. |
| `apis` | APIs internas y responsabilidades. |
| `flows` | Flujos operativos reutilizables. |

## Documentos base incorporados

| Fuente | Resultado canonico |
|---|---|
| Notas entrantes de carrito, POS, proyectos, ventas y precios | Cart, POS, Projects, Sales y Pricing separados por responsabilidad. |
| Notas entrantes de huecos ERP | Estados, roles, costos, facturacion, devoluciones, errores, jobs, kits y notificaciones. |
| Notas entrantes de reglas y ventas | Rules Engine, ventas/cotizaciones y diagrama general. |
| Notas entrantes de licitaciones | GovernmentTender como modulo de inteligencia y seguimiento de licitaciones. |
| Vision ERP modular por giro | `erp/23_business_software_builder.md` define como diagnosticar negocios y activar modulos/features segun necesidad. |

## Modulos generales agregados

- `GovernmentTender` aplica a cualquier empresa que pueda participar en licitaciones.
- `Documents` administra anexos, evidencias y documentos legales reutilizables.
- `07_project_api_pattern.md` define como cada proyecto usa Gateway General,
  APIs compartidas y API especializada solo si aplica.
- `08_data_isolation_and_reference_tables.md` define como separar APIs, bases propias y tablas referenciadas.
- `ChannelAssortment` define que muestra cada proyecto aunque el catalogo sea compartido.
- `ProductCompatibility` permite configuradores y validacion tecnica entre componentes.

## Regla

Si un documento podria servir para otra empresa distinta a Tecno Telec, pertenece aqui.
