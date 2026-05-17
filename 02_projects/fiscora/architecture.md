# Arquitectura Fiscora

## Diagrama

```text
WEB.NJ.NEXT.Fiscora
        |
        v
API.PY.DJANGO.Fiscora.Gateway
        |
        +--> API.PY.DJANGO.Fiscora
        |       - planes
        |       - creditos
        |       - reglas de uso
        |       - preferencias
        |
        +--> API.PY.DJANGO.Fiscal
        |       - CFDI
        |       - SAT
        |       - XML
        |       - reportes fiscales
        |       - jobs fiscales
        |
        +--> API.PY.DJANGO.Document
                - XML
                - PDF
                - render visual
                - plantillas
                - transformaciones
```

## Reglas

- El frontend consume solo el gateway Fiscora.
- El gateway normaliza errores, sesiones y permisos.
- La API Fiscora administra experiencia comercial, planes, creditos y preferencias.
- La API Fiscal administra CFDI, XML, SAT, jobs fiscales, paquetes, reportes y auditoria.
- Document API procesa archivos, XML, render visual y PDF.
- El XML original nunca se modifica.
- La personalizacion de factura vive en una capa visual separada.

## Fases

| Fase | Alcance |
|---|---|
| 1 | Fiscal API MVP, Fiscora API MVP, gateway y preview visual. |
| 2 | SAT jobs reales, explorador CFDI, reportes y personalizador visual. |
| 3 | Automatizaciones, creditos, alertas inteligentes e IA fiscal. |
