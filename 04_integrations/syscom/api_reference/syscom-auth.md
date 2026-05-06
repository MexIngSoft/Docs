# SYSCOM Auth API

> Ruta actual: `/docs/04_integrations/syscom/api_reference/syscom-auth.md`

## 1. Objetivo

Obtener un token de acceso para consumir las APIs de SYSCOM.

Este token debe guardarse y reutilizarse hasta que expire. No debe solicitarse un token nuevo por cada petición.

## 2. Endpoint

```http
POST https://developers.syscom.mx/oauth/token
```

## 3. Headers sugeridos

```http
Content-Type: application/json
Accept: application/json
```

## 4. Request body

```json
{
  "client_id": "{{client_id}}",
  "client_secret": "{{client_secret}}",
  "grant_type": "client_credentials"
}
```

## 5. Campos enviados

| Campo | Tipo | Requerido | Descripción | Origen |
|---|---:|---:|---|---|
| `client_id` | string | Sí | Identificador de aplicación entregado por SYSCOM. | `.env` |
| `client_secret` | string | Sí | Secreto entregado por SYSCOM. | `.env` |
| `grant_type` | string | Sí | Para este flujo debe ser `client_credentials`. | constante |

## 6. Response body

```json
{
  "token_type": "Bearer",
  "expires_in": 31536000,
  "access_token": "eyJ..."
}
```

## 7. Campos recibidos

| Campo | Tipo recibido | Tipo interno sugerido | Descripción |
|---|---:|---:|---|
| `token_type` | string | `varchar(20)` | Normalmente `Bearer`. |
| `expires_in` | integer | `integer` temporal | Segundos de vigencia del token. |
| `access_token` | string largo | `text` | Token usado en `Authorization`. |

## 8. Entidad interna relacionada

Proyecto:

```txt
API.PY.DJANGO.Supplier
```

Schema:

```txt
Supplier
```

Tabla:

```txt
"Supplier"."SyscomTokens"
```

## 9. Campos sugeridos de base de datos

| Campo | Tipo Django | Tipo PostgreSQL | Nulo | Descripción |
|---|---|---|---:|---|
| `Id` | `UUIDField` | `uuid` | No | Llave primaria. |
| `AccessToken` | `TextField` | `text` | No | Token completo. |
| `TokenType` | `CharField(max_length=20)` | `varchar(20)` | No | Ej. `Bearer`. |
| `ExpiresAt` | `DateTimeField(null=True)` | `timestamptz` | Sí | Fecha calculada: `now + expires_in`. |
| `CreatedAt` | `DateTimeField(auto_now_add=True)` | `timestamptz` | No | Fecha de creación. |

## 10. Variables de entorno

```env
SYSCOM_BASE_URL=https://developers.syscom.mx
SYSCOM_CLIENT_ID=...
SYSCOM_CLIENT_SECRET=...
```

## 11. Regla de uso

Antes de cualquier llamada a SYSCOM:

1. Buscar último token en `SyscomTokens`.
2. Si existe y `ExpiresAt > now + 5 minutos`, reutilizar.
3. Si no existe o está por expirar, solicitar token nuevo.
4. Guardar token nuevo.
5. Usar header:

```http
Authorization: Bearer {{access_token}}
```

## 12. Qué NO hacer

- No exponer el token al frontend.
- No guardar `client_secret` en base de datos.
- No imprimir el token completo en logs.
- No solicitar token en cada producto o categoría.

## 13. Proceso ETL relacionado

```txt
docs/04_integrations/syscom/etl/sync-token.md
```
