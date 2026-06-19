# Address Form Standard

## Objetivo

Estandarizar formularios de direccion para que las webs usen Address API y no
dupliquen catalogos geograficos.

## Regla principal

Todo formulario de direccion debe resolver pais, estado, municipio, codigo
postal, asentamiento y direccion normalizada mediante Gateway General hacia
Address API.

## Campos minimos

| Campo | Regla |
|---|---|
| Pais | Seleccion desde Address API. |
| Estado | Depende del pais. |
| Municipio | Depende del estado. |
| Codigo postal | Puede detonar sugerencias. |
| Asentamiento | Depende del codigo postal. |
| Calle | Texto o sugerencia. |
| Numero exterior | Requerido para direccion completa. |
| Numero interior | Opcional. |
| Referencia | Opcional. |
| Tipo | Shipping, Billing, Pickup, Supplier, Customer, Fiscal o Warehouse. |

## Estados UI

- Cargando catalogo.
- Sin resultados.
- Direccion incompleta.
- Direccion normalizada.
- Error de validacion.
- Address API no disponible.

## Prohibido

- Hardcodear estados o municipios en el frontend.
- Llamar Address API directamente desde navegador.
- Marcar facturacion real si el modulo fiscal no esta activo.
