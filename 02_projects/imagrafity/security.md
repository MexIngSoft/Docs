# Seguridad Imagrafity

## Estado

ACTIVE

## Reglas MVP

- El frontend consume solo `API.PY.DJANGO.Imagrafity.Gateway`.
- Los secretos viven en `.env.local` o variables de entorno y no se publican.
- `.env.local.example` documenta variables sin secretos reales.
- CORS local queda limitado a `http://localhost:3006`.
- El Gateway normaliza errores y no debe exponer trazas internas.

## Datos sensibles

| Dato | Tratamiento |
|---|---|
| Email de cliente | Permitido en MVP para disenos, requiere politica de privacidad antes de produccion. |
| Archivos de arte | Pendiente; debe pasar por Document API o storage controlado. |
| Prompts de cliente/admin | Guardar en base de datos; requieren moderacion antes de produccion. |
| Imagenes IA generadas | Pendiente; requieren storage controlado y politica de derechos. |
| Pagos | Fuera de alcance MVP; no almacenar datos de tarjeta. |
| Derechos de autor | Pendiente de politica legal antes de habilitar marketplace o comunidad. |

## Pendientes

- Autenticacion.
- Roles de cliente, creador, operador y admin.
- Validacion de archivos.
- Moderacion de contenido.
- Moderacion de prompts e imagenes generadas.
- Auditoria de cambios en produccion.
