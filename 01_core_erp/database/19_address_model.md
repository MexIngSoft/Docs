# Modelo Address

Schema publicado `[Address]` con tablas singulares: `Country`, `State`,
`Municipality`, `City`, `PostalCode`, `SettlementType`, `Settlement`, `Zone`,
`StreetType`, `Street`, `AddressType`, `AddressStatus`, `Address` y
`AddressSuggestionLog`.

Los identificadores son UUID, los campos publicados usan PascalCase y las
relaciones con Customer, Supplier, Warehouse o Logistics viven fuera de este
dominio.
