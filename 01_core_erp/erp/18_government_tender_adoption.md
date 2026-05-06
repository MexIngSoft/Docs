# Uso de licitaciones por empresa

## Objetivo

Definir como cualquier empresa del ecosistema puede usar `GovernmentTender` sin convertirlo en un modulo exclusivo de Tecno Telec.

## Principio

Una licitacion es una oportunidad comercial especial. Puede aplicar a cualquier empresa que tenga capacidad de cumplir un requerimiento tecnico, logistico, legal y economico.

## Que pertenece al nucleo ERP

- Descubrimiento de oportunidades.
- Registro de convocatoria y fuente.
- Requisitos tecnicos, legales y administrativos.
- Documentos y anexos.
- Evaluacion de viabilidad.
- Riesgos, fechas limite y responsables.
- Propuesta tecnica.
- Propuesta economica.
- Relacion con productos, servicios, proveedores, inventario, proyectos y ventas.
- Seguimiento del resultado.

## Que pertenece a cada empresa

- Categorias en las que participa.
- Documentos legales propios.
- Margen minimo aceptado.
- Capacidad tecnica y geografica.
- Restricciones de entrega.
- Responsables internos.
- Politica de autorizacion para participar.

## Flujo por empresa

```text
Empresa activa interes en licitaciones
Define categorias y capacidades
GovernmentTender detecta o registra oportunidad
Rules Engine evalua compatibilidad
Catalog/Supplier/Inventory/Pricing/Logistics validan factibilidad
Projects arma solucion si el requerimiento es consultivo
Sales genera propuesta economica
Documents concentra anexos
Responsable autoriza participar
Se da seguimiento al fallo
Si se gana, se convierte en proyecto, venta u orden
```

## Empresas candidatas

| Empresa/proyecto | Uso probable |
|---|---|
| Tecno Telec | Energia, redes, seguridad, telecomunicaciones e infraestructura. |
| Nexora | Consultoria, integracion tecnologica y proyectos llave en mano. |
| Sekura Tech | Seguridad, control, monitoreo y cumplimiento. |
| Innovation Engines Repair | Servicios tecnicos, mantenimiento y reparacion especializada. |
| Buildora | Materiales, obra, instalaciones y equipamiento. |
| Refakto | Refacciones, suministros y mantenimiento. |
| Rutexa | Logistica, entrega y rutas cuando se subcontrate transporte. |

## Regla de seguridad

El ERP no debe enviar propuestas automaticamente a plataformas oficiales sin validacion legal, firma, registro y confirmacion humana. Primero se implementa como inteligencia y seguimiento.

## Pendientes por empresa

```text
PENDIENTE_DE_DEFINIR:
- Categorias oficiales donde cada empresa puede participar.
- Documentos legales disponibles.
- Responsable de autorizacion.
- Margen minimo por licitacion.
- Alcance geografico.
```

