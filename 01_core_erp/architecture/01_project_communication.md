# Comunicacion entre proyectos

## Principio

Las APIs deben comunicarse por contratos documentados y no por conocimiento interno de tablas ajenas.

## Comunicacion recomendada

- Todo frontend consume solo `API.PY.DJANGO.Gateway`.
- El Gateway central selecciona un modulo aislado por `ApplicationCode`.
- El Gateway consume APIs especializadas del proyecto solo cuando existen.
- La API especializada del proyecto consume APIs core cuando necesita reutilizar modulos.
- APIs internas exponen contratos versionados.
- Eventos o jobs pueden usarse para procesos asincronos futuros.

## Contratos clave

- Supplier -> Catalog.
- Supplier -> Pricing.
- Inventory -> Sales/Projects.
- Logistics -> Sales/Projects.
- Projects -> Sales.
- Rules Engine -> Gateway/APIs internas.
- Gateway General -> API especializada del proyecto.
- API especializada del proyecto -> Core ERP APIs.

## Regla

Si dos APIs comparten base al inicio, debe mantenerse la frontera logica para poder separarlas despues.

## Regla de proyecto

Cada proyecto con web, mobile o canal propio debe documentar:

- `ApplicationCode` y modulo de routing en el Gateway central.
- Nombre de su API especializada, si aplica.
- Que procesos quedan en la API especializada.
- Que modulos reutiliza del core ERP.
