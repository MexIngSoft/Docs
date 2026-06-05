# Catalogo de herramientas DocuCore

## Fuente de verdad

La fuente operativa del catalogo debe ser la base de datos de `API.PY.DJANGO.DocuCore`.

Tablas:

```text
DocuCore.Modules
DocuCore.Tools
```

`core/catalog.py` queda como semilla y fallback de desarrollo, no como fuente
final de producto. La API publica del Gateway debe devolver el inventario desde
base de datos:

```http
GET /api/gateway/modules/
GET /api/gateway/tools/
```

La web puede mantener un registro local de degradacion para evitar pantallas
vacias cuando Gateway o API no esten levantados. Ese registro debe estar
sincronizado con la semilla backend y no puede convertir una herramienta no
activa en ejecutable.

Cada herramienta debe indicar:

- Modulo.
- Estado (`enabled`, `planned`, `development`, `beta`, `internal`, `disabled`).
- Si esta activa (`enabled`).
- Si es visible publicamente.
- Creditos estimados.
- Extension aceptada.
- Salida esperada.
- Preparacion frontend/backend/documentacion.

El detalle de paneles de configuracion, eventos, mensajes al usuario y estado
por herramienta vive en:

```text
tool-readiness-and-configuration.md
```

## Herramientas activas MVP

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

## Herramientas inventariadas no activas

Estas capacidades se listan en base de datos para que el usuario y el equipo
vean el alcance, pero no deben ejecutarse hasta tener motor real:

- Rotar PDF.
- Ordenar paginas.
- Proteger PDF.
- Leer metadata PDF.
- PDF a imagen.
- Convertir formato de imagen.
- OCR por lotes.
- OCR por regiones.
- PDF buscable con capa OCR.
- Clasificar documento.
- Segmentar documento.
- Resumir documento.
- Extraer datos estructurados.
- Separar expediente.
- Detectar anexos.
- OCR + indice.
- Convertir + comprimir.
- OCR + extraer datos.
- Importar desde Drive/OneDrive/Dropbox.
- API keys, cuotas, logs y webhooks.

## Regla de UI

La web debe mostrar el catalogo completo por categorias y filtros, pero con
estado visible:

```text
Activo       -> se puede ejecutar.
No activo    -> existe en roadmap/base de datos, pero no se puede ejecutar.
Interno      -> solo equipo/admin.
Oculto       -> no aparece en navegacion publica.
```

La UI no debe ocultar el alcance del producto; debe impedir ejecutar lo que no
tiene backend real.
