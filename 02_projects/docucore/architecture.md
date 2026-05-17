# Arquitectura DocuCore

## Objetivo

Separar responsabilidades entre producto, procesamiento documental, gateway y frontend.

## Diagrama

```text
WEB.NJ.NEXT.DocuCore
        |
        v
API.PY.DJANGO.DocuCore.Gateway
        |
        +--> API.PY.DJANGO.DocuCore
        |       - catalogo de herramientas
        |       - configuraciones
        |       - limites
        |       - historial
        |
        +--> API.PY.DJANGO.Document
                - upload
                - validacion
                - storage privado
                - procesadores
                - jobs
```

## Reglas

- El frontend no debe hablar directo con Document API.
- Document API no decide experiencia de producto.
- DocuCore API no guarda archivos.
- Gateway normaliza errores y respuestas.
- Procesamiento pesado debe pasar a Celery/Redis cuando salga del MVP.
