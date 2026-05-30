# Mapa de repositorios Git

> Estado: base vigente.

## Objetivo

Definir que `Workspace.Comercial` es solo una carpeta local de trabajo y no un repositorio Git unico. Cada proyecto debe publicarse desde su propio repositorio para evitar mezclar Docker, APIs, webs y documentacion en un solo historial.

## Regla principal

Los commits y pushes se hacen por repositorio y por responsabilidad. No se debe inicializar ni publicar `Workspace.Comercial` como un monorepo mientras la arquitectura siga separada por proyectos.

## Repositorios detectados

| Capa | Ruta local | Repositorio remoto | Estado de publicacion |
|---|---|---|---|
| Docker APIs | `Docker.API.PY` | `https://github.com/MexIngSoft/Docker.API.PY.git` | Separado |
| API Auth | `Docker.API.PY/API.PY.DJANGO.Auth` | `https://github.com/MexIngSoft/API.PY.DJANGO.Auth.git` | Separado |
| API Catalog | `Docker.API.PY/API.PY.DJANGO.Catalog` | `https://github.com/MexIngSoft/API.PY.DJANGO.Catalog.git` | Separado |
| API Customization | `Docker.API.PY/API.PY.DJANGO.Customization` | `https://github.com/MexIngSoft/API.PY.DJANGO.Customization.git` | Separado |
| API Inventory | `Docker.API.PY/API.PY.DJANGO.Inventory` | `https://github.com/MexIngSoft/API.PY.DJANGO.Inventory.git` | Separado |
| API LexNova Gateway | `Docker.API.PY/API.PY.DJANGO.LexNova.Gateway` | `https://github.com/MexIngSoft/API.PY.DJANGO.LexNova.Gateway.git` | Separado |
| API LexNova | `Docker.API.PY/API.PY.DJANGO.LexNova` | `https://github.com/MexIngSoft/API.PY.DJANGO.LexNova.git` | Separado |
| API Pricing | `Docker.API.PY/API.PY.DJANGO.Pricing` | `https://github.com/MexIngSoft/API.PY.DJANGO.Pricing.git` | Separado |
| API Procurement | `Docker.API.PY/API.PY.DJANGO.Procurement` | `https://github.com/MexIngSoft/API.PY.DJANGO.Procurement.git` | Separado |
| API Sales | `Docker.API.PY/API.PY.DJANGO.Sales` | `https://github.com/MexIngSoft/API.PY.DJANGO.Sales.git` | Separado |
| API Supplier | `Docker.API.PY/API.PY.DJANGO.Supplier` | `https://github.com/MexIngSoft/API.PY.DJANGO.Supplier.git` | Separado |
| API TecnoTelec | `Docker.API.PY/API.PY.DJANGO.TecnoTelec` | `https://github.com/MexIngSoft/API.PY.DJANGO.TecnoTelec.git` | Separado |
| API TecnoTelec Gateway | `Docker.API.PY/API.PY.DJANGO.TecnoTelec.Gateway` | `https://github.com/MexIngSoft/API.PY.DJANGO.TecnoTelec.Gateway.git` | Separado |
| API Document | `Docker.API.PY/API.PY.DJANGO.Document` | `https://github.com/MexIngSoft/API.PY.DJANGO.Document.git` | Separado |
| API DocuCore | `Docker.API.PY/API.PY.DJANGO.DocuCore` | `https://github.com/MexIngSoft/API.PY.DJANGO.DocuCore.git` | Separado |
| API DocuCore Gateway | `Docker.API.PY/API.PY.DJANGO.DocuCore.Gateway` | `https://github.com/MexIngSoft/API.PY.DJANGO.DocuCore.Gateway.git` | Separado |
| API Fiscal | `Docker.API.PY/API.PY.DJANGO.Fiscal` | `https://github.com/MexIngSoft/API.PY.DJANGO.Fiscal.git` | Separado |
| API Fiscora | `Docker.API.PY/API.PY.DJANGO.Fiscora` | `https://github.com/MexIngSoft/API.PY.DJANGO.Fiscora.git` | Separado |
| API Fiscora Gateway | `Docker.API.PY/API.PY.DJANGO.Fiscora.Gateway` | `https://github.com/MexIngSoft/API.PY.DJANGO.Fiscora.Gateway.git` | Separado |
| API JobCron | `Docker.API.PY/API.PY.DJANGO.JobCron` | `https://github.com/MexIngSoft/API.PY.DJANGO.JobCron.git` | Repo local creado; remoto pendiente de crear/habilitar |
| Docker PostgreSQL | `Docker.DB.PG` | `https://github.com/MexIngSoft/Docker.DB.PG.git` | Separado |
| Docker Nginx | `Docker.SW.Nginx` | `https://github.com/1CASH1/Docker.SW.Nginx` | Separado |
| Docker Web | `Docker.WEB.NJ` | `https://github.com/MexIngSoft/Docker.WEB.NJ.git` | Separado, requiere validar propiedad local |
| Web DocuCore | `Docker.WEB.NJ/WEB.NJ.NEXT.DocuCore` | `https://github.com/MexIngSoft/WEB.NJ.NEXT.DocuCore.git` | Separado |
| Web Fiscora | `Docker.WEB.NJ/WEB.NJ.NEXT.Fiscora` | `https://github.com/MexIngSoft/WEB.NJ.NEXT.Fiscora.git` | Separado |
| Web JobCron | `Docker.WEB.NJ/WEB.NJ.NEXT.JobCron` | `https://github.com/MexIngSoft/WEB.NJ.NEXT.JobCron.git` | Separado |
| Web LexNova | `Docker.WEB.NJ/WEB.NJ.NEXT.LexNova` | `https://github.com/MexIngSoft/WEB.NJ.NEXT.LexNova.git` | Separado |
| Web TecnoTelec | `Docker.WEB.NJ/WEB.NJ.NEXT.TecnoTelec` | `https://github.com/MexIngSoft/WEB.NJ.NEXT.TecnoTelec.git` | Separado |
| Documentacion | `Docs` | `https://github.com/MexIngSoft/Docs.git` | Separado |

## Webs dentro de Docker.WEB.NJ

Se detectaron estas carpetas web:

| Proyecto web | Ruta local | Estado Git detectado |
|---|---|---|
| DocuCore | `Docker.WEB.NJ/WEB.NJ.NEXT.DocuCore` | Repo propio asignado: `https://github.com/MexIngSoft/WEB.NJ.NEXT.DocuCore.git` |
| Fiscora | `Docker.WEB.NJ/WEB.NJ.NEXT.Fiscora` | Repo propio asignado: `https://github.com/MexIngSoft/WEB.NJ.NEXT.Fiscora.git` |
| JobCron | `Docker.WEB.NJ/WEB.NJ.NEXT.JobCron` | Repo propio detectado: `https://github.com/MexIngSoft/WEB.NJ.NEXT.JobCron.git` |
| LexNova | `Docker.WEB.NJ/WEB.NJ.NEXT.LexNova` | Repo propio detectado: `https://github.com/MexIngSoft/WEB.NJ.NEXT.LexNova.git` |
| TecnoTelec | `Docker.WEB.NJ/WEB.NJ.NEXT.TecnoTelec` | Repo propio detectado: `https://github.com/MexIngSoft/WEB.NJ.NEXT.TecnoTelec.git` |

Si una web no tiene repo Git propio, antes de subirla como proyecto separado se debe restaurar o crear su `.git` propio y asignar su remoto. Mientras no exista `.git` por web, sus cambios viven dentro del repo contenedor que la incluya.

## Orden recomendado de subida

1. `Docs`: documentacion base, decisiones y reglas de publicacion.
2. APIs de dominio: cambios propios por API.
3. `API.PY.DJANGO.TecnoTelec.Gateway`: integracion entre web TecnoTelec y Core APIs.
4. `Docker.DB.PG`: schemas, scripts de inicializacion y reglas de base de datos.
5. `Docker.API.PY`: compose, Dockerfile, `start.sh`, workers y variables por proyecto.
6. `Docker.WEB.NJ`: frontend compartido o webs contenidas en ese repo.
7. `Docker.SW.Nginx`: rutas de publicacion cuando existan cambios.

Para cambios de una web con repo propio, subir primero el repo de la web y despues, solo si cambio el orquestador, subir `Docker.WEB.NJ`.

Este orden evita publicar infraestructura que dependa de contratos todavia no versionados.

## Reglas de commit

Los mensajes de commit deben escribirse en ingles, ser cortos y describir la responsabilidad del cambio.

Ejemplos:

| Repositorio | Ejemplo de commit |
|---|---|
| `Docs` | `Document separated repository publishing flow` |
| `Docker.API.PY` | `Configure isolated project environments` |
| `Docker.DB.PG` | `Add PascalCase project schemas` |
| `API.PY.DJANGO.Supplier` | `Add Syscom catalog sync endpoints` |
| `API.PY.DJANGO.Document` | `Add document processing MVP` |
| `API.PY.DJANGO.DocuCore` | `Add DocuCore tool catalog MVP` |
| `API.PY.DJANGO.DocuCore.Gateway` | `Expose DocuCore gateway endpoints` |
| `API.PY.DJANGO.Fiscal` | `Add fiscal core MVP` |
| `API.PY.DJANGO.Fiscora` | `Add Fiscora product API MVP` |
| `API.PY.DJANGO.Fiscora.Gateway` | `Add Fiscora gateway MVP` |
| `API.PY.DJANGO.LexNova.Gateway` | `Add LexNova gateway MVP` |
| `API.PY.DJANGO.TecnoTelec.Gateway` | `Expose product catalog through gateway` |
| `Docker.WEB.NJ` | `Update TecnoTelec catalog mockup` |
| `WEB.NJ.NEXT.DocuCore` | `Add DocuCore dashboard MVP` |
| `WEB.NJ.NEXT.Fiscora` | `Add Fiscora animation preview` |
| `WEB.NJ.NEXT.TecnoTelec` | `Improve public user experience` |
| `WEB.NJ.NEXT.JobCron` | `Update JobCron dashboard experience` |

## Reglas de seguridad

- No subir `.env`, `.env.local`, tokens, secrets ni credenciales reales.
- Mantener `.env.example` y `.env.local.example` como plantillas sin secretos.
- Revisar `git status --short` dentro de cada repo antes de hacer commit.
- Usar `git add` con rutas explicitas cuando haya cambios mezclados.
- No usar `git add -A` desde `Workspace.Comercial` porque no es repo y porque podria mezclar responsabilidades si se ejecuta desde un repo padre futuro.

## Publicacion por repositorio

Para cada repo:

```bash
cd <ruta-del-repo>
git status --short
git add <archivos-del-cambio>
git commit -m "<English commit message>"
git push origin <rama>
```

Antes de publicar `Docker.WEB.NJ`, si Git marca propiedad dudosa en Windows, se debe registrar la carpeta como segura para el usuario actual:

```bash
git config --global --add safe.directory C:/Users/cash1/source/repos/Workspace.Comercial/Docker.WEB.NJ
```

## Pendientes

- Confirmar si `WEB.NJ.NEXT.JobCron`, `WEB.NJ.NEXT.LexNova` y `WEB.NJ.NEXT.TecnoTelec` deben mantenerse como repos Git separados y si tambien deben referenciarse desde el repo contenedor.
- Instalar o habilitar GitHub CLI (`gh`) si se quiere crear pull requests desde terminal.
- Confirmar si los pushes se haran directo a `main` o mediante ramas `feature/*`.
