# Catalogo de herramientas DocuCore

## Herramientas iniciales

| Tool | Slug | Categoria |
|---|---|---|
| PDF Split | `pdf-split` | PDF |
| PDF Merge | `pdf-merge` | PDF |
| PDF Compress | `pdf-compress` | PDF |
| PDF to Word | `pdf-word` | Conversion |
| Word to PDF | `word-pdf` | Conversion |
| Image to PDF | `image-pdf` | Images |
| Clean Image | `image-clean` | Images |
| Excel to CSV | `excel-csv` | Spreadsheet |
| CSV to Excel | `csv-excel` | Spreadsheet |
| XML Read | `xml-read` | XML |
| ZIP Extract | `zip-extract` | Compression |
| OCR | `ocr-image` | OCR |
| Document Classification | `document-classification` | Document Intelligence |
| Document Segmentation | `document-segmentation` | Document Intelligence |
| Document Index | `document-index` | Document Intelligence |
| Indexed PDF Export | `indexed-pdf-export` | Document Intelligence |

## Fuente

La lista vive en:

```text
Docker.API.PY/API.PY.DJANGO.DocuCore/core/catalog.py
```

El frontend consume el catalogo desde:

```http
GET /api/gateway/tools/
```

`WEB.NJ.NEXT.DocuCore/lib/tools.ts` solo conserva el mapa visual de iconos.
No debe definir disponibilidad funcional.

## Pendientes no publicables como enabled

- PDF Rotate.
- PDF Metadata Read.
- Image Resize.
- Image Compress avanzado.
- Image Format Convert.
- OCR estructurado por coordenadas/bloques.
- Batch merge multiarchivo.
