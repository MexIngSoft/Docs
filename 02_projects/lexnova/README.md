# LexNova

## Estado

ACTIVE

## Rol

LegalTech.

## Dominios

- lexnova.com
- lexnova.mx

## Que hace

Gestiona y analiza casos legales.

## Necesidades JobCron

- Auth.
- Documents.
- Case management.
- Notifications.
- Billing opcional.

## MVP sugerido

1. Casos.
2. Documentos.
3. Participantes.
4. Analisis.

## Documentos canonicos

- `access-control.md`: identidad, roles, niveles, permisos y participacion por caso.
- `architecture.md`: gateway/BFF obligatorio y limites entre web, Auth y APIs.
- `auth-seed.md`: usuarios, perfiles, modulos y permisos iniciales en Auth.
- `repositories.md`: repositorios esperados y orden de publicacion.
- `frontend/identity-interface.md`: identidad visual y estructura inicial de interfaz.

## Repositorios

| Capa | Ruta local | Repositorio |
|---|---|---|
| API | `Docker.API.PY/API.PY.DJANGO.LexNova` | `https://github.com/MexIngSoft/API.PY.DJANGO.LexNova.git` |
| Gateway | `Docker.API.PY/API.PY.DJANGO.LexNova.Gateway` | `https://github.com/MexIngSoft/API.PY.DJANGO.LexNova.Gateway.git` |
| Web | `Docker.WEB.NJ/WEB.NJ.NEXT.LexNova` | `https://github.com/MexIngSoft/WEB.NJ.NEXT.LexNova.git` |

## Rama de trabajo actual

```text
feature/lex-nova-tech-identification
```

La rama fue creada desde `dev` para documentar e implementar la identidad de
Lex Nova Tech.

## Pendientes

- Reemplazar el mock de casos por consumo real del Gateway.
- Completar CRUD de casos, documentos, participantes y analisis.
- Mantener LexNova como plataforma separada de JobCron para experiencia legal.
