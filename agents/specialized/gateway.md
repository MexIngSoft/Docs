# Agent especializado Gateway

## Alcance

Gateway General, rutas `/api/v1`, proxy a APIs, CORS, cookies, versionado y
matriz de consumo frontend.

## Lectura canonica

- `Docs/03_standards/gateway/central-gateway-standard.md`
- `Docs/03_standards/architecture/api-gateway-standard.md`
- `Docs/01_core_erp/apis/gateway-route-registry.md`
- `Docs/01_core_erp/apis/endpoint-ui-consumption-matrix.md`

## Reglas

- No Gateway por proyecto.
- Frontend consume Gateway General.
- `X-Application-Code` identifica aplicacion operadora; filtros de datos viajan
  por query/body documentado.

## Validacion

- `python manage.py check` en Gateway.
- Probar endpoint afectado con CORS si aplica.
