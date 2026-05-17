# Catalogo de eventos

## Eventos MVP

| Evento | Emisor | Consumidor | Payload minimo |
|---|---|---|---|
| `FileUploaded` | Document API | Jobs/DocuCore | `file_id`, `sha256`, `mime_type` |
| `FileProcessingRequested` | Gateway | Document API | `file_id`, `tool`, `options` |
| `FileProcessingCompleted` | Document API | DocuCore/Frontend | `job_id`, `file_id`, `result` |
| `SupplierProductUpdated` | Supplier API | Catalog/Pricing/Inventory | `supplier_id`, `product_id` |
| `QuoteRequested` | Sales/Project API | Notifications/JobCron | `quote_id`, `project_id` |

## Regla

Los eventos se documentan como contratos aunque el MVP use HTTP sin bus dedicado.
