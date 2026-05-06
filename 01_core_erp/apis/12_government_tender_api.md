# GovernmentTender API

## Objetivo

Administrar oportunidades de licitacion publica como proceso de inteligencia, evaluacion y seguimiento.

## Responsabilidades

- Registrar convocatorias u oportunidades.
- Guardar requisitos, documentos y fechas limite.
- Evaluar viabilidad con `Rules Engine`.
- Relacionar oportunidad con productos, proveedores y proyectos.
- Preparar propuesta tecnica y economica.
- Convertir oportunidad ganada a proyecto, cotizacion o venta.
- Permitir que cada empresa configure categorias, responsables, documentos y margen minimo.

## Endpoints base

```http
GET /api/government-tenders/opportunities
POST /api/government-tenders/opportunities
GET /api/government-tenders/opportunities/{tender_id}
POST /api/government-tenders/opportunities/{tender_id}/requirements
POST /api/government-tenders/opportunities/{tender_id}/evaluate
POST /api/government-tenders/opportunities/{tender_id}/proposals
POST /api/government-tenders/opportunities/{tender_id}/documents
POST /api/government-tenders/opportunities/{tender_id}/convert-to-project
POST /api/government-tenders/opportunities/{tender_id}/convert-to-quote
POST /api/government-tenders/company-profiles
```

## Regla

No debe automatizar el envio oficial de propuestas hasta confirmar integracion, marco legal y requisitos de cada plataforma.

## Empresa participante

Cada empresa debe tener perfil propio:

```text
CompanyTenderProfile
- CompanyId
- EnabledCategories
- LegalDocuments
- MinimumMargin
- GeographicScope
- ApprovalUserId
- IsActive
```
