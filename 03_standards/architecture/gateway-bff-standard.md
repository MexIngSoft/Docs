# Estandar Gateway central modular

```text
Web -> API.PY.DJANGO.Gateway -> API de proyecto -> Core/Shared
```

El Gateway es una aplicacion central con registro y adapters por proyecto. El
aislamiento se logra por `X-Application-Code`, allowlists, rutas, permisos,
configuracion y contratos; no creando Gateways duplicados.

Responsabilidades: sesion, routing, rate limit, observabilidad, normalizacion
de errores y adaptacion de frontera. Prohibido: tablas de negocio, reglas de
precio, inventario, cotizacion o persistencia de proyecto.
