# Docker DocuCore

## API

DocuCore se integra al contenedor multiproyecto de Python:

```text
API.PY.DJANGO.Document        -> /usr/src/api/document      -> 8011
API.PY.DJANGO.DocuCore        -> /usr/src/api/docucore      -> 8012
API.PY.DJANGO.Gateway -> /usr/src/api/gateway -> 8025
```

## Web

```text
WEB.NJ.NEXT.DocuCore -> /usr/src/web/docucore -> 3004
```

## Arranque focalizado

Desde la raiz del workspace:

```powershell
docker compose -f Docker.DB.PG\docker-compose.docucore.db.yml up -d
docker compose -f Docker.API.PY\docker-compose.docucore.api.yml up -d --build
docker compose -f Docker.WEB.NJ\docker-compose.docucore.web.yml up -d --build
```

El compose propio de DocuCore debe ser un overlay delgado: no copia todo el
servicio, solo selecciona `API_PROJECTS` y `WEB_PROJECTS`.

Validacion minima:

```powershell
docker compose -f Docker.API.PY\docker-compose.docucore.api.yml config --quiet
docker compose -f Docker.WEB.NJ\docker-compose.docucore.web.yml config --quiet
Invoke-WebRequest http://localhost:8025/health/
Invoke-WebRequest http://localhost:3004
```

## Dependencias de sistema para fase avanzada

```text
tesseract-ocr
libmagic1
libreoffice
poppler-utils
```

En el MVP se documentan como dependencia futura de imagen Docker para conversiones/OCR reales.
