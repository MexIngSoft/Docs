# QA checklist DocuCore

## Validaciones

| Area | Estado MVP |
|---|---|
| Upload | Endpoint y UI base creados. |
| PDF | Procesador registrado, engine profundo pendiente. |
| XML | Procesador registrado, validacion profunda pendiente. |
| Word | Procesador registrado, LibreOffice pendiente en Docker avanzado. |
| Images | Procesador registrado, Pillow disponible por requirements. |
| OCR | Procesador registrado, Tesseract pendiente en Docker avanzado. |
| Jobs | Modelo, estados y endpoint base creados. |
| Gateway | Contratos y proxy base creados. |
| Frontend | Dashboard, upload, jobs e history creados. |
| Downloads | Documentado, endpoint real pendiente. |

## Criterio de liberacion MVP

- `python manage.py check` por API.
- `python -m py_compile` sobre archivos Python.
- `npm run build` en frontend.
- Docker build sin romper proyectos existentes.
