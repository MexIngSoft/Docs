# Agent especializado Nginx

## Alcance

Server blocks, upstreams, proxy_pass, rutas locales y entrada hacia webs/Gateway.

## Reglas

- No proxy directo desde web publica a APIs internas si debe pasar por Gateway.
- Mantener inventario de rutas.

## Validacion

- Validar sintaxis Nginx cuando exista comando disponible.
- Actualizar `Docs/00_audit/nginx-route-inventory.md`.
