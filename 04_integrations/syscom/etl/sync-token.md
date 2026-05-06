# ETL token SYSCOM

## Objetivo

Garantizar que exista un token valido para consumir la API de SYSCOM.

## Comando

```bash
docker compose exec api-multiproyecto sh /usr/src/api/start.sh manage supplier sync_syscom_token
```

## Entrada

Variables de entorno:

```env
SYSCOM_BASE_URL=https://developers.syscom.mx
SYSCOM_CLIENT_ID=...
SYSCOM_CLIENT_SECRET=...
```

## Salida

Registro en:

```text
Supplier.SyscomTokens
```

## Algoritmo

```text
1. Buscar ultimo token por CreatedAt DESC.
2. Si existe y ExpiresAt > now + margen de seguridad, reutilizar.
3. Si no existe o expiro, llamar POST /oauth/token.
4. Calcular ExpiresAt = now + expires_in.
5. Guardar AccessToken, TokenType y ExpiresAt.
6. Retornar AccessToken.
```

## Errores

| Error | Accion |
|---|---|
| Falta variable de entorno | Abortar proceso y registrar error critico. |
| 401/403 | Revisar credenciales. |
| Timeout | Reintentar si la politica lo permite. |
| Respuesta sin `access_token` | Abortar y guardar error. |

## Frecuencia

`sync_syscom_token` puede ejecutarse manualmente, pero tambien debe poder ser llamado por cualquier proceso que consuma SYSCOM.

## Nota de arquitectura

`SyscomTokens` es una implementacion especifica para SYSCOM. Cuando se agreguen mas proveedores, conviene evaluar una tabla generica de credenciales o secretos por proveedor.
