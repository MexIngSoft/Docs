# Estandar de implementacion Search

- No duplicar motores `LIKE` por proyecto.
- Separar normalizacion reutilizable de diccionarios de dominio.
- Registrar consulta, resultado, click y conversion sin guardar secretos.
- Soportar usuarios anonimos mediante `SessionId`.
- Crear demanda solo cuando el umbral de resultado util no se alcance.
- Versionar contratos y validar permisos en backend.

## Sincronizacion e Idempotencia

- Toda API origen debe enviar `projectCode`, `domainCode`, `entityType`,
  `externalId`, `title`, `version` o `sourceVersion`, y `sourceUpdatedAt`.
- Search debe aplicar `UPSERT` idempotente por
  `projectCode + domainCode + entityType + externalId`.
- Un evento atrasado no puede sobrescribir datos mas recientes.
- Las bajas deben distinguir borrado logico, restauracion y borrado fisico
  controlado.
- Los lotes deben aceptar errores parciales: un documento invalido no debe
  detener todo el lote.
- Todo fallo de indexacion debe quedar registrado para reintento automatico.

## Conciliacion Automatica

- Cada proyecto que indexe datos debe exponer o generar un lote fuente completo
  para `reconcile` o `reindex`.
- Si una entidad existe en la tabla origen y no existe en Search, la
  conciliacion debe insertarla.
- Si una entidad esta en Search pero ya no existe activa en origen, la
  conciliacion debe marcarla como stale y, cuando aplique, desactivarla.
- `SearchSyncStatus` es la fuente operativa para detectar faltantes, registros
  obsoletos y eventos fallidos.
- Si el proyecto origen no puede exportar sus datos completos, debe documentar
  `PENDIENTE_DE_DEFINIR` en su documentacion de proyecto.
