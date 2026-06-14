# Repositorios DocuCore

## Asignacion

Cada proyecto DocuCore debe publicarse desde su carpeta local como repositorio independiente. `Workspace.Comercial` se mantiene solo como carpeta de trabajo y `Docker.API.PY` / `Docker.WEB.NJ` actuan como orquestadores locales.

| Proyecto | Ruta local | Repositorio remoto | Puerto | Rol |
|---|---|---|---|---|
| `API.PY.DJANGO.Document` | `Docker.API.PY/API.PY.DJANGO.Document` | `https://github.com/MexIngSoft/API.PY.DJANGO.Document.git` | `8011` | Upload, validacion, storage, procesamiento y jobs de archivos. |
| `API.PY.DJANGO.DocuCore` | `Docker.API.PY/API.PY.DJANGO.DocuCore` | `https://github.com/MexIngSoft/API.PY.DJANGO.DocuCore.git` | `8012` | Catalogo de herramientas, configuracion, limites, historial y personalizacion. |
| `API.PY.DJANGO.Gateway` | `Docker.API.PY/API.PY.DJANGO.Gateway` | `https://github.com/MexIngSoft/API.PY.DJANGO.Gateway.git` | `8025` | Entrada central y routing a APIs internas. |
| `WEB.NJ.NEXT.DocuCore` | `Docker.WEB.NJ/WEB.NJ.NEXT.DocuCore` | `https://github.com/MexIngSoft/WEB.NJ.NEXT.DocuCore.git` | `3004` | Dashboard, herramientas, upload, jobs, downloads e historial. |

## Estado local validado

- Las cuatro carpetas existen.
- Las cuatro carpetas tienen repositorio Git local inicializado.
- Las cuatro carpetas tienen `origin` asignado al remoto correspondiente.
- No se hicieron commits ni pushes durante la asignacion.

## Checks ejecutados

| Proyecto | Check | Resultado |
|---|---|---|
| `API.PY.DJANGO.Document` | `python manage.py check` | Correcto |
| `API.PY.DJANGO.Document` | `python -m compileall .` | Correcto |
| `API.PY.DJANGO.DocuCore` | `python manage.py check` | Correcto |
| `API.PY.DJANGO.DocuCore` | `python -m compileall .` | Correcto |
| `API.PY.DJANGO.Gateway` | `python manage.py check` | Correcto |
| `API.PY.DJANGO.Gateway` | `python -m compileall .` | Correcto |
| `WEB.NJ.NEXT.DocuCore` | `npm run build` | Correcto |

## Reglas

- El frontend debe consumir solo `API.PY.DJANGO.Gateway`.
- `API.PY.DJANGO.Gateway` puede hablar con `API.PY.DJANGO.DocuCore` y `API.PY.DJANGO.Document`.
- `API.PY.DJANGO.Document` no debe guardar configuracion de producto ni decidir experiencia de usuario.
- `API.PY.DJANGO.DocuCore` no debe guardar archivos binarios.
- Los orquestadores Docker solo deben contener configuracion de montaje, puertos, redes y variables ejemplo.
