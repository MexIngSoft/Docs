# API Gateway

## Nombre oficial generico

```text
<project>-gateway-api
```

## Objetivo

Ser el punto unico de entrada para web, mobile o admin de un proyecto y actuar como API Gateway/BFF.

Ejemplo Tecno Telec:

```text
tecnotelec-gateway-api
```

## Responsabilidades

- Recibir solicitudes del frontend.
- Validar autenticacion.
- Orquestar llamadas a APIs internas.
- Orquestar llamadas a la API propia del proyecto.
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
- API propia del proyecto.

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
