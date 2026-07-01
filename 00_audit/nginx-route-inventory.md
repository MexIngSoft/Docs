# Inventario de rutas Nginx

## Estado

ACTUALIZADO_PARCIAL.

## Archivo revisado

```text
Docker.SW.Nginx/nginx.conf
```

## Hallazgos

| Ruta/proxy | Destino | Estado |
|---|---|---|
| `proxy_pass $jobcron_web_server` | Web JobCron | Detectado. |
| `proxy_pass $web_server` | Web general/default | Detectado. |
| `proxy_pass $tecnotelec_web_server` | Web TecnoTelec | Detectado. |
| `proxy_pass $lexnova_web_server` | Web LexNova | Detectado. |

## Riesgo

No se detecto proxy directo a APIs internas en este archivo. Si se agregan rutas
API, deben pasar por Gateway General salvo excepcion documentada.
