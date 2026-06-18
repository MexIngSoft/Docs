# Gateway General

## Nombre oficial

```text
API.PY.DJANGO.Gateway
```

## Objetivo

Ser el punto unico de entrada para webs, mobile o admin del ecosistema.

## Responsabilidades

- Recibir solicitudes del frontend.
- Validar autenticacion.
- Orquestar llamadas a APIs internas.
- Orquestar llamadas a APIs especializadas de proyecto cuando existan.
- Unificar respuestas.
- Adaptar contratos internos a vistas web.
- Centralizar manejo de errores para frontend.
- Propagar `correlation_id`.
- Registrar logs de auditoria de entrada.

## Que no debe hacer

- No guardar productos.
- No calcular precio final.
- No modificar inventario directo.
- No reemplazar Sales, Pricing, Inventory o Projects.
- No contener reglas comerciales profundas.
- No guardar tablas propias del proyecto.

## APIs que consume

- Auth.
- Catalog.
- Supplier cuando sea estrictamente necesario.
- Pricing.
- Quote.
- Sales.
- Logistics.
- Rules Engine.
- Projects.
- Cart.
- API especializada del proyecto, si aplica.

## Seguridad

- Validar token con Auth.
- No exponer secretos.
- Aplicar rate limiting cuando exista infraestructura.
- Normalizar errores.

## Versionado

```text
/api/v1
```

Cambios incompatibles deben ir a nueva version.
