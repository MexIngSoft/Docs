# Search Implementation Standard

## Regla Principal

Toda busqueda reutilizable debe implementarse en Search API y exponerse por Gateway General.

## Backend

- Usar endpoints canonicos de Search.
- Enviar `projectCode`.
- Enviar `domainCode` cuando aplique.
- Enviar `entityType` y `externalId` para toda entidad indexable.
- Enviar `version` o `sourceVersion` y `sourceUpdatedAt` para evitar que un
  evento atrasado sobrescriba informacion reciente.
- Registrar consultas.
- Registrar eventos de indexacion, errores y conciliaciones.
- No duplicar busqueda avanzada en APIs de proyecto.
- Exponer o generar lotes completos de fuente para `reconcile` cuando el
  proyecto cree datos buscables.

## Frontend

- Consumir solo Gateway General.
- No llamar Search API directamente.
- No duplicar normalizacion ni scoring.

## Demanda No Satisfecha

Si no hay resultados y el flujo comercial lo requiere, crear demanda para seguimiento operativo.

## Recuperacion de Datos

La API Search debe poder reconstruir su indice desde las APIs origen. Las APIs
de proyecto no deben asumir que Search siempre recibio todos los eventos en
tiempo real; deben poder reenviar documentos completos mediante bulk index o
conciliacion.
