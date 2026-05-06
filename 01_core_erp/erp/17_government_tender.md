# Modelo de licitaciones publicas

## Objetivo

`GovernmentTender` permite descubrir, analizar y dar seguimiento a oportunidades de licitacion publica sin mezclar ese proceso con ventas normales, compras o proyectos.

El modulo pertenece al nucleo ERP porque cualquier empresa del ecosistema puede licitar si cumple el requerimiento.

## Alcance inicial

- Inteligencia de oportunidades.
- Registro de requisitos.
- Evaluacion de viabilidad.
- Preparacion de propuesta tecnica y economica.
- Seguimiento de fechas y resultado.
- Conversion a proyecto, cotizacion o venta si la oportunidad se gana.

## Fuera de alcance inicial

- Envio automatico de propuestas a plataformas oficiales.
- Sustituir procesos oficiales de registro, firma o carga documental.
- Validacion legal automatica.

## Responsabilidades

- Consultar o registrar convocatorias publicas.
- Clasificar oportunidades por categoria.
- Relacionar productos, proveedores, inventario y costos.
- Evaluar margen, tiempos, requisitos y riesgos.
- Administrar documentos de soporte.
- Configurar perfiles por empresa participante.
- Convertir una oportunidad ganada a proyecto, cotizacion, venta u orden de compra interna.

## Estados

```text
DISCOVERED
ANALYZING
VIABLE
NOT_VIABLE
PREPARING_PROPOSAL
SUBMITTED
AWAITING_RESULT
WON
LOST
CANCELLED
```

## Integraciones internas

```text
Catalog
Supplier
Inventory
Pricing
Logistics
Projects
Sales
Documents
Auth
Rules Engine
```

## Perfil por empresa

Cada empresa define:

- Categorias donde puede participar.
- Documentos legales disponibles.
- Responsable que autoriza participar.
- Margen minimo.
- Alcance geografico.
- Capacidad tecnica.

Ver `18_government_tender_adoption.md`.

## Regla central

El modulo debe iniciar como inteligencia y seguimiento. Cualquier envio o participacion transaccional debe confirmarse contra la plataforma oficial y requisitos legales vigentes antes de implementarse.
