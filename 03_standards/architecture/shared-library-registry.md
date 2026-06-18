# Registro de librerias compartidas

## Objetivo

Inventariar librerias compartidas reales o faltantes para evitar duplicacion en
APIs y webs.

## Regla principal

Si una logica se repite en dos proyectos, se evalua como libreria compartida.
Si falta evidencia real, se registra como `PENDIENTE_DE_DEFINIR`.

## Registro

| Libreria | Ruta | Existe / Falta | Responsabilidad | Quien la consume | Que NO debe duplicarse |
|---|---|---|---|---|---|
| jobcron_common | `Docker.API.PY/libs/jobcron_common` | PENDIENTE_DE_DEFINIR | Utilidades backend compartidas | PENDIENTE_DE_DEFINIR | Configuracion DB, healthcheck, errores, paginacion, auth client, logging |
| jobcron-ui | `Docker.WEB.NJ/packages/jobcron-ui` | PENDIENTE_DE_DEFINIR | Componentes UI compartidos | PENDIENTE_DE_DEFINIR | Layout, tablas, formularios, cards, estados vacios, loaders |
| jobcron-api-client | `Docker.WEB.NJ/packages/jobcron-api-client` | PENDIENTE_DE_DEFINIR | Cliente Gateway compartido | PENDIENTE_DE_DEFINIR | Fetcher, tokens, errores normalizados, tipos compartidos |

## Validacion

- No duplicar logica comun dentro de cada proyecto.
- No crear libreria sin contrato estable.
- No mover logica especifica de proyecto a libreria compartida sin evidencia de
  reutilizacion.
