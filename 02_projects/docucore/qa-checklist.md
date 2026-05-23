# QA checklist DocuCore

## Validaciones

| Area | Estado MVP |
|---|---|
| Upload | Endpoint y UI base creados. |
| PDF | Split, merge single-file y compress implementados; rotate/metadata pendientes. |
| XML | Lectura segura y resumen JSON implementados; validacion fiscal profunda pendiente. |
| Word | PDF/DOCX textual implementado; LibreOffice pendiente para fidelidad avanzada. |
| Images | Procesador registrado, Pillow disponible por requirements. |
| OCR | Procesador usa Tesseract si esta disponible; Docker avanzado pendiente. |
| Jobs | Modelo, estados y endpoint base creados. |
| Gateway | Contratos y proxy base creados. |
| Frontend | Dashboard, upload, jobs e history creados. |
| Downloads | Endpoint real por Gateway y artefactos persistidos. |

## Criterio de liberacion MVP

- `python manage.py check` por API.
- `python -m py_compile` sobre archivos Python.
- `npm run build` en frontend.
- Docker build sin romper proyectos existentes.
