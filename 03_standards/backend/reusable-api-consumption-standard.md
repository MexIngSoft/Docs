# Reusable API Consumption Standard

## Objetivo

Definir como una API especializada consume APIs reutilizables sin copiar sus
responsabilidades.

## Regla principal

Una API especializada puede conservar referencias y snapshots operativos, pero
no debe duplicar catalogos, permisos, direcciones, pricing, inventario,
facturacion o autenticacion que pertenezcan a APIs compartidas.

## Patrons permitidos

| Patron | Uso |
|---|---|
| ID de referencia | Guardar `AddressId`, `CustomerId`, `ProductId` u otro identificador externo. |
| Snapshot publicable | Guardar texto corto visible para historial operativo. |
| Adapter interno | Traducir respuesta de API compartida al contrato propio. |
| Outbox | Emitir evento cuando la API compartida no este disponible sin bloquear la operacion. |

## Prohibido

- Copiar tablas completas de una API reutilizable.
- Crear Auth local por proyecto.
- Crear catalogos geograficos por proyecto.
- Consultar base de datos de otra API directamente.
- Saltar el Gateway General para llamadas desde frontend.

## Validacion

Cada cambio debe indicar:

- API reutilizable revisada.
- Responsabilidad reutilizada.
- Datos guardados localmente.
- Datos que no se duplican.
- Validacion ejecutada.
