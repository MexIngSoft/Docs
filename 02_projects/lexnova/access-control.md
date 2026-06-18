# LexNova access control

## Estado

ACTIVE

## Objetivo

Definir el modelo de identidad, roles, niveles, permisos y participacion en
casos para LexNova sin duplicar usuarios dentro de la misma plataforma.

## Regla principal

Un usuario se registra una sola vez. La identidad no cambia cuando el usuario
tiene mas de una responsabilidad.

```text
Usuario
-> roles por aplicacion
-> niveles de rol
-> permisos efectivos
-> participaciones por caso
-> contextos visuales
```

Ejemplo:

```text
Usuario: hugo@example.com
Rol global LexNova: ADMIN_ROOT
Relacion con Caso A: OWNER
Relacion con Caso B: CLIENT
```

El usuario no debe cerrar sesion ni registrarse dos veces para ver sus propios
casos. El dashboard debe permitir filtros contextuales como:

- Mis casos.
- Casos asignados.
- Casos del equipo.
- Todos los casos.

## Registro publico

Todo registro publico inicia con:

```text
CLIENT_BASE
```

No se permite registro publico directo como admin, analista, revisor o gestor.
El cambio de perfil se solicita y debe ser aprobado por un rol autorizado.

## Roles LexNova

| Rol | Uso |
|---|---|
| `CLIENT` | Cliente o propietario de casos. |
| `ANALYST` | Analisis de expedientes y documentos asignados. |
| `REVIEWER` | Revision y aprobacion de resultados. |
| `MANAGER` | Gestion operativa de equipos, carga y autorizaciones. |
| `ADMIN` | Administracion de plataforma, seguridad y configuracion. |

## Niveles

| Rol | Nivel inicial | Nivel especial |
|---|---|---|
| `CLIENT` | `CLIENT_BASE` | `CLIENT_PLUS` |
| `ANALYST` | `ANALYST_BASE` | `ANALYST_PLUS` |
| `REVIEWER` | `REVIEWER_BASE` | `REVIEWER_PLUS` |
| `MANAGER` | `MANAGER_BASE` | `MANAGER_PLUS` |
| `ADMIN` | `ADMIN_BASE` | `ADMIN_ROOT` |

El nivel modifica alcance, visibilidad, limites, modulos y permisos criticos.
No debe modelarse como otra cuenta de usuario.

## Participacion por caso

La relacion del usuario con un caso se modela aparte del rol del sistema:

```text
CaseParticipant
- CaseId
- UserId
- ParticipantType
```

Tipos recomendados:

```text
OWNER
CLIENT
ANALYST
REVIEWER
LAWYER
OBSERVER
```

## Permisos recomendados

LexNova debe usar el patron canonico del Auth Core:

```text
recurso:accion:ambito
```

Permisos iniciales:

| Permiso | Uso |
|---|---|
| `case:read:own` | Ver casos donde participa el usuario. |
| `case:read:assigned` | Ver casos asignados. |
| `case:read:team` | Ver casos del equipo. |
| `case:read:all` | Ver todos los casos. |
| `case:update:assigned` | Actualizar casos asignados. |
| `case:assign:team` | Asignar casos dentro del equipo. |
| `analysis:run:assigned` | Ejecutar analisis en casos asignados. |
| `analysis:approve:assigned` | Aprobar resultados asignados. |
| `access:update:managed` | Modificar perfiles bajo su administracion. |
| `access:update:root` | Modificar perfiles criticos. Solo `ADMIN_ROOT`. |

Alias visuales permitidos en UI:

```text
CASE_VIEW_OWN -> case:read:own
CASE_VIEW_ASSIGNED -> case:read:assigned
CASE_VIEW_TEAM -> case:read:team
CASE_VIEW_ALL -> case:read:all
```

## Reglas de cambio de perfil

| Accion | Autorizado |
|---|---|
| Subirse de nivel solo | No permitido. |
| Solicitar cambio | Usuario autenticado. |
| Aprobar cambio operativo | `MANAGER_GLOBAL` o `ADMIN`. |
| Convertir usuario a admin | Solo `ADMIN_ROOT`. |
| Quitar `ADMIN_ROOT` | Solo otro `ADMIN_ROOT`. |

Debe existir un minimo de dos usuarios `ADMIN_ROOT` activos para reducir riesgo
operativo.

## Password temporal

Los usuarios internos creados manualmente deben recibir password temporal
aleatorio y cambio obligatorio en primer login:

```text
MustChangePassword = true
```

No se permiten passwords genericos permanentes.

## Dashboard contextual

La interfaz privada debe reaccionar a permisos efectivos:

| Contexto | Vista principal |
|---|---|
| Cliente | Mis casos, resultados, estado actual y mensajes. |
| Analista | Casos asignados, IA pendiente, documentos y carga de trabajo. |
| Revisor | Resultados por aprobar y alertas juridicas. |
| Manager | KPIs, equipos, carga operativa y tiempos. |
| Admin | Usuarios, logs, roles, seguridad, aplicaciones e integraciones. |

Regla de visibilidad:

```text
No mostrar modulos no autorizados.
```

No se deben mostrar modulos deshabilitados si revelan arquitectura interna.
Tampoco se deben exponer nombres internos de arquitectura, Auth, API, endpoint,
proxy, puertos o repositorios en textos visibles para clientes o usuarios finales.

## Modulo recomendado

```text
/dashboard/modules/admin/access-control
```

Secciones:

- Usuarios.
- Roles.
- Niveles.
- Permisos.
- Modulos.
- Acciones.
- Visibilidad.
- Auditoria.

## Integracion con Auth

LexNova debe consumir permisos desde el Gateway General. La web no consume Auth
directamente.

Frontend:

```text
GET /api/lexnova/access/me/permissions/
```

Gateway hacia Auth:

```text
GET /api/access/me/permissions/?application_code=LEXNOVA
```

El frontend usa la respuesta del gateway para experiencia visual. La seguridad
real se valida en gateway, Auth y API de dominio.
