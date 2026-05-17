# LexNova identity interface

## Estado

ACTIVE

## Objetivo

Definir la direccion visual y funcional inicial de la interfaz Lex Nova Tech.
La web debe comunicar confianza juridica, gobierno de permisos y trabajo
contextual por caso.

## Identidad de producto

Nombre visible recomendado:

```text
Lex Nova Tech
```

Uso:

- `Lex Nova Tech` para marca publica e identidad comercial.
- `LexNova` como nombre corto de plataforma o repositorio.

## Principios de UI

- LegalTech sobria, profesional y orientada a decision.
- Informacion densa pero clara, especialmente en dashboard.
- No depender de decoracion generica; mostrar estados, casos, documentos,
  permisos y resultados.
- La identidad debe reforzar seguridad, trazabilidad y evidencia.

## Paleta inicial

| Token | Uso |
|---|---|
| Azul institucional `#102A43` | Titulos, estructura, confianza. |
| Oro juridico `#B68A35` | Acciones, acentos, verificacion. |
| Fondo claro `#F7F8FB` | Superficie publica y dashboard claro. |
| Fondo oscuro `#07111F` | Modo oscuro institucional. |

## Hero publico

La primera vista debe mostrar:

- Nombre/sector: Lex Nova Tech para equipos legales.
- Propuesta: inteligencia juridica para decidir con evidencia.
- Beneficio operativo: una sola identidad con permisos claros.
- Panel visual de expediente, probabilidad tecnica, documentos,
  jurisprudencia, privacidad y participantes.

## Dashboard

El dashboard debe evitar que el usuario cambie de cuenta o perfil para ver sus
propios casos. La navegacion se resuelve por permisos efectivos.

La web debe consumir solo:

```text
NEXT_PUBLIC_GATEWAY_BASE_URL
```

No debe llamar directo a `API.PY.DJANGO.Auth`, `API.PY.DJANGO.LexNova` ni APIs
core. Los endpoints `/auth`, `/users` y `/access` visibles en frontend son
rutas proxy del gateway LexNova.

Filtros base:

- Mis casos.
- Casos asignados.
- Casos del equipo.
- Todos los casos.

## Modulo de control de acceso

Ruta MVP:

```text
/dashboard/modules/admin/access-control
```

Debe agrupar:

- Usuarios.
- Roles.
- Niveles.
- Permisos efectivos.
- Modulos.
- Acciones.
- Auditoria.

## Resultado implementado

Se inicio la identidad en `WEB.NJ.NEXT.LexNova` con:

- Portada publica enfocada en identidad, permisos y evidencia legal.
- Panel visual de expediente juridico.
- Correccion de textos visibles con codificacion rota en portada y navbar.
- Pantalla MVP de control de acceso para dashboard administrativo.

## Pendientes

- Conectar el dashboard con permisos reales del gateway/Auth.
- Completar CRUD administrativo de usuarios, roles, niveles y permisos.
- Definir copy legal final con el equipo de negocio.
- Agregar pruebas visuales/manuales por rol cuando existan datos reales.
