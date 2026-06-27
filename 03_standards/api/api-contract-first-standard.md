# Estandar API contract first

## Objetivo

Toda API debe definir contrato antes de implementar endpoints, migraciones o
consumo frontend.

## Contrato minimo

Todo contrato debe incluir:

- responsabilidad;
- endpoints;
- request;
- response;
- errores;
- permisos;
- modelos;
- migraciones;
- healthcheck;
- pruebas minimas;
- ruta Gateway;
- consumo frontend permitido.
- codigo de accion relacionado cuando exista consumo funcional desde web.

## Regla principal

Si falta informacion real, usar `PENDIENTE_DE_DEFINIR`. No inventar endpoints,
tablas ni permisos.

## Validacion

Una API no queda lista para implementacion si no tiene:

- contrato documentado;
- frontera con Gateway General;
- permisos;
- modelo de datos;
- estrategia de errores;
- prueba minima o check equivalente.

Si el endpoint sera consumido por una web, tambien debe aparecer en el
`code-actions-map.md` del proyecto consumidor.
