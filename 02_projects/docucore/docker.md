# Docker DocuCore

## API

DocuCore se integra al contenedor multiproyecto de Python:

```text
API.PY.DJANGO.Document        -> /usr/src/api/document      -> 8011
API.PY.DJANGO.DocuCore        -> /usr/src/api/docucore      -> 8012
API.PY.DJANGO.DocuCore.Gateway -> /usr/src/api/docucore_gateway -> 8013
```

## Web

```text
WEB.NJ.NEXT.DocuCore -> /usr/src/web/docucore -> 3004
```

## Dependencias de sistema para fase avanzada

```text
tesseract-ocr
libmagic1
libreoffice
poppler-utils
```

En el MVP se documentan como dependencia futura de imagen Docker para conversiones/OCR reales.
