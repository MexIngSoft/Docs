# Relaciones

## Flujo principal

```text
SupplierProduct
  -> Catalog Product
  -> Pricing ProductPrice
  -> Inventory ProductInventory
  -> QuoteItem
  -> OrderItem
```

## Reglas

- `SupplierProduct` conserva `ExternalId`.
- `Catalog Product` es el producto interno.
- `Pricing` usa producto interno y costos.
- `Inventory` controla stock propio.
- `QuoteItem` guarda snapshot.
- `OrderItem` representa venta confirmada.

## Relaciones de licitaciones

```text
GovernmentTender TenderOpportunity
  -> TenderRequirement
  -> TenderProposal
  -> Documents DocumentLink
  -> Projects Project
  -> Sales Quote
```

## Relaciones documentales

- `Documents.DocumentLink` conecta archivos con clientes, proyectos, ventas, facturas, proveedores o licitaciones.
- `GovernmentTender` usa `Documents` para anexos legales, tecnicos y propuestas.
- `Billing` usa `Documents` para documentos fiscales cuando aplique.

## Relaciones de catalogo y publicacion

```text
SupplierProduct
  -> Catalog Product
  -> ProductAttributes
  -> ChannelAssortment
  -> Proyecto/Canal
```

- `SupplierProduct` puede existir aunque ningun proyecto lo publique.
- `ChannelAssortment` decide si un producto se oculta, se cotiza, se vende o solo aparece como componente.
- `ProductCompatibilityRule` define relaciones tecnicas entre productos o categorias.
