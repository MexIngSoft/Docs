# Comunicacion entre proyectos

## Principio

Las APIs deben comunicarse por contratos documentados y no por conocimiento interno de tablas ajenas.

## Comunicacion recomendada

- Frontend consume solo `tecnotelec-gateway-api`.
- Web/mobile/admin consume solo el gateway/BFF de su proyecto.
- Gateway consume la API propia del proyecto y APIs internas.
- La API propia del proyecto consume APIs core cuando necesita reutilizar modulos.
- APIs internas exponen contratos versionados.
- Eventos o jobs pueden usarse para procesos asincronos futuros.

## Contratos clave

- Supplier -> Catalog.
- Supplier -> Pricing.
- Inventory -> Sales/Projects.
- Logistics -> Sales/Projects.
- Projects -> Sales.
- Rules Engine -> Gateway/APIs internas.
- Project Gateway -> Project Domain API.
- Project Domain API -> Core ERP APIs.

## Regla

Si dos APIs comparten base al inicio, debe mantenerse la frontera logica para poder separarlas despues.

## Regla de proyecto

Cada proyecto con web, mobile o canal propio debe documentar:

- Nombre de su gateway/BFF.
- Nombre de su API propia.
- Que procesos quedan en la API propia.
- Que modulos reutiliza del core ERP.
