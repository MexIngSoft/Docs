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
- `case-participants-access.md`: separacion User/Person/CaseParticipant,
  autorizaciones familiares, privacidad documental y auditoria de accesos.
- `document-intelligence.md`: regla oficial para OCR, clasificacion,
  segmentacion, indice documental, API documental reusable y revision humana.
- `legal-domain-research.md`: investigacion juridica inicial, catalogos,
  matrices, fuentes oficiales y roadmap de datos legales versionables.
- `legal-process-data-model.md`: modelo de datos para casos, carpetas de
  investigacion, juicio oral, amparos, documentos, evidencia y pendientes
  procesales.
- `local-dependency-runbook.md`: relaciones operativas, orden de arranque,
  puertos, CORS y diagnostico local de LexNova.
- `process-tracking.md`: decision de producto para centrar resultados dentro
  del caso, carga simple de evidencia, cola posterior y seguimiento visible del
  procedimiento.
- `repositories.md`: repositorios esperados y orden de publicacion.
- `frontend/identity-interface.md`: identidad visual y estructura inicial de interfaz.

## Usuarios de prueba

Las credenciales de desarrollo de LexNova estan documentadas en:

```text
Docs/02_projects/lexnova/auth-seed.md
```

Resumen:

- Usuario/correo: ver la tabla `Usuarios semilla` en `auth-seed.md`.
- Password temporal comun: `LexNova.Temp#2026`.
- Regla: todos los usuarios semilla tienen `MustChangePassword = true`.
- Fuente tecnica: `Docker.API.PY/API.PY.DJANGO.Auth/access/migrations/0014_seed_lexnova_auth.py`.

Estas credenciales son solo para desarrollo local y no deben usarse en
produccion.

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

- Completar CRUD de casos, documentos, participantes y analisis.
- Completar endpoints de escritura para casos, documentos, participantes,
  clasificacion y revision humana.
- Cerrar flujos productivos de invitacion, consentimiento y revocacion de
  participantes autorizados.
- Conectar el Centro de Carga Documental web con storage, OCR, clasificacion,
  segmentacion, indice web, revision humana y cadena de custodia.
- Reemplazar datos visuales de demostracion por consumo real del Gateway donde
  aplique.
- Completar semilla estatal y validacion final de plazos para los catalogos
  versionables definidos en `legal-domain-research.md`.
- Crear modelos especializados para revision de amparo o derechos humanos solo
  cuando el modelo flexible de `LegalProceedings` ya no sea suficiente.
- Mantener LexNova como plataforma separada de JobCron para experiencia legal.
