# Repositorios Fiscora

## Asignacion

| Proyecto | Ruta local | Repositorio remoto | Estado |
|---|---|---|---|
| `API.PY.DJANGO.Fiscal` | `Docker.API.PY/API.PY.DJANGO.Fiscal` | `https://github.com/MexIngSoft/API.PY.DJANGO.Fiscal.git` | MVP creado, Git local asignado. |
| `API.PY.DJANGO.Gateway` | `Docker.API.PY/API.PY.DJANGO.Gateway` | `https://github.com/MexIngSoft/API.PY.DJANGO.Gateway.git` | Entrada central vigente. |
| `API.PY.DJANGO.Fiscora` | `Docker.API.PY/API.PY.DJANGO.Fiscora` | `https://github.com/MexIngSoft/API.PY.DJANGO.Fiscora.git` | MVP creado, Git local asignado. |
| `WEB.NJ.NEXT.Fiscora` | `Docker.WEB.NJ/WEB.NJ.NEXT.Fiscora` | `https://github.com/MexIngSoft/WEB.NJ.NEXT.Fiscora.git` | Preview creado, Git local asignado. |

## Orden de responsabilidad

1. `API.PY.DJANGO.Fiscal`: nucleo fiscal reutilizable.
2. `API.PY.DJANGO.Gateway`: entrada central del portal.
3. `API.PY.DJANGO.Fiscora`: producto comercial.
4. `WEB.NJ.NEXT.Fiscora`: experiencia web.

## Reglas

- Fiscora no duplica Auth.
- Fiscora no guarda la logica fuerte de CFDI/SAT.
- Fiscal puede ser reutilizado por otros proyectos ERP.
- La web no consume APIs internas directamente.
- JobCron puede administrar clientes, jobs, errores, limites y auditoria a futuro.
