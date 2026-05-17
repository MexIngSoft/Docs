# Contratos API Fiscora

## Gateway

Base:

```text
/api/fiscora
```

## Estado del dashboard

```http
GET /api/fiscora/dashboard/summary/
```

Respuesta:

```json
{
  "downloaded_cfdi": 248,
  "new_cfdi": 12,
  "estimated_iva": 12450,
  "cancelled_cfdi": 3,
  "credits": 80,
  "sat_status": "connected"
}
```

## Crear descarga SAT

```http
POST /api/fiscora/sat/download-jobs/
```

Body:

```json
{
  "rfc": "XAXX010101000",
  "year": 2025,
  "months": [1, 2, 3],
  "direction": "received"
}
```

Estados:

```text
pending
connecting
authenticating
querying_sat
downloading_metadata
downloading_xml
processing_xml
generating_pdf
saving_documents
completed
failed
cancelled
retrying
```

## Buscar CFDI

```http
GET /api/fiscora/cfdi/?q=facturas%20arriba%20de%2020%20mil
```

## Ver CFDI

```http
GET /api/fiscora/cfdi/{uuid}/
```

## Generar PDF visual

```http
POST /api/fiscora/cfdi/{uuid}/visual-pdf/
```

