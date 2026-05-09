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
| API LexNova | `Docker.API.PY/API.PY.DJANGO.LexNova` | `https://github.com/MexIngSoft/API.PY.DJANGO.LexNova.git` | Separado |
| API Pricing | `Docker.API.PY/API.PY.DJANGO.Pricing` | `https://github.com/MexIngSoft/API.PY.DJANGO.Pricing.git` | Separado |
| API Procurement | `Docker.API.PY/API.PY.DJANGO.Procurement` | `https://github.com/MexIngSoft/API.PY.DJANGO.Procurement.git` | Separado |
| API Sales | `Docker.API.PY/API.PY.DJANGO.Sales` | `https://github.com/MexIngSoft/API.PY.DJANGO.Sales.git` | Separado |
| API Supplier | `Docker.API.PY/API.PY.DJANGO.Supplier` | `https://github.com/MexIngSoft/API.PY.DJANGO.Supplier.git` | Separado |
| API TecnoTelec | `Docker.API.PY/API.PY.DJANGO.TecnoTelec` | `https://github.com/MexIngSoft/API.PY.DJANGO.TecnoTelec.git` | Separado |
| API TecnoTelec Gateway | `Docker.API.PY/API.PY.DJANGO.TecnoTelec.Gateway` | `https://github.com/MexIngSoft/API.PY.DJANGO.TecnoTelec.Gateway.git` | Separado |
| Docker PostgreSQL | `Docker.DB.PG` | `https://github.com/MexIngSoft/Docker.DB.PG.git` | Separado |
| Docker Nginx | `Docker.SW.Nginx` | `https://github.com/1CASH1/Docker.SW.Nginx` | Separado |
| Docker Web | `Docker.WEB.NJ` | `https://github.com/1CASH1/Docker.WEB.NJ.git` | Separado, requiere validar propiedad local |
| Documentacion | `Docs` | `https://github.com/MexIngSoft/Docs.git` | Separado |

## Webs dentro de Docker.WEB.NJ

Se detectaron estas carpetas web:

| Proyecto web | Ruta local | Estado Git detectado |
|---|---|---|
| JobCron | `Docker.WEB.NJ/WEB.NJ.NEXT.JobCron` | Sin `.git` propio detectado |
| LexNova | `Docker.WEB.NJ/WEB.NJ.NEXT.LexNova` | Sin `.git` propio detectado |
| TecnoTelec | `Docker.WEB.NJ/WEB.NJ.NEXT.TecnoTelec` | Sin `.git` propio detectado |

Si estas webs deben publicarse como repositorios independientes, antes de subirlas se debe restaurar o crear su `.git` propio y asignar su remoto. Mientras no exista `.git` por web, los cambios frontend se publican desde `Docker.WEB.NJ`.

## Orden recomendado de subida

1. `Docs`: documentacion base, decisiones y reglas de publicacion.
2. APIs de dominio: cambios propios por API.
3. `API.PY.DJANGO.TecnoTelec.Gateway`: integracion entre web TecnoTelec y Core APIs.
4. `Docker.DB.PG`: schemas, scripts de inicializacion y reglas de base de datos.
5. `Docker.API.PY`: compose, Dockerfile, `start.sh`, workers y variables por proyecto.
6. `Docker.WEB.NJ`: frontend compartido o webs contenidas en ese repo.
7. `Docker.SW.Nginx`: rutas de publicacion cuando existan cambios.

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
| `API.PY.DJANGO.TecnoTelec.Gateway` | `Expose product catalog through gateway` |
| `Docker.WEB.NJ` | `Update TecnoTelec catalog mockup` |

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

- Confirmar si `WEB.NJ.NEXT.JobCron`, `WEB.NJ.NEXT.LexNova` y `WEB.NJ.NEXT.TecnoTelec` deben convertirse en repos Git separados.
- Instalar o habilitar GitHub CLI (`gh`) si se quiere crear pull requests desde terminal.
- Confirmar si los pushes se haran directo a `main` o mediante ramas `feature/*`.
