# Search Implementation Standard

## Regla Principal

Toda busqueda reutilizable debe implementarse en Search API y exponerse por Gateway General.

## Backend

- Usar endpoints canonicos de Search.
- Enviar `projectCode`.
- Enviar `domainCode` cuando aplique.
- Registrar consultas.
- No duplicar busqueda avanzada en APIs de proyecto.

## Frontend

- Consumir solo Gateway General.
- No llamar Search API directamente.
- No duplicar normalizacion ni scoring.

## Demanda No Satisfecha

Si no hay resultados y el flujo comercial lo requiere, crear demanda para seguimiento operativo.
