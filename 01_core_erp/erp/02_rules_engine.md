# Rules Engine

## Objetivo

Centralizar decisiones de negocio para evitar que la logica quede dispersa entre Pricing, Inventory, Logistics, Projects y Sales.

## Responsabilidades

- Decidir desde que almacen surtir.
- Elegir proveedor recomendado.
- Aplicar reglas de margen.
- Aplicar descuentos permitidos.
- Decidir si se permite vender sin stock.
- Decidir si conviene dividir pedido.
- Elegir estrategia logistica.
- Determinar si una cotizacion requiere revision humana.

## Tipos de reglas

- `PRICING`.
- `INVENTORY`.
- `LOGISTICS`.
- `PROJECT`.
- `SALES`.
- `APPROVAL`.

## Ejemplos

- Margen minimo por proveedor.
- Margen minimo por categoria.
- Descuento maximo permitido.
- Costo extra por instalacion.
- Validacion de stock minimo.
- Restriccion por zona geografica.
- Regla por tipo de cliente.
- Regla por volumen de compra.

## Tablas sugeridas

```sql
"Rules"."BusinessRules"
- Id
- Code
- Name
- RuleType
- Priority
- ConditionJson
- ActionJson
- IsActive
- CreatedAt
- UpdatedAt
```

```sql
"Rules"."RuleExecutions"
- Id
- RuleId
- ContextType
- ContextId
- InputJson
- OutputJson
- WasApplied
- CreatedAt
```

## Flujo

```text
Projects / Cart / Sales envia contexto
  -> Rules Engine evalua reglas
  -> devuelve decision
  -> Pricing, Inventory, Logistics o Sales ejecutan segun su responsabilidad
```
