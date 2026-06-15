# Estandar Feature Visibility

JobCron `FeatureAvailability` es la fuente operativa para saber si una funcion
existe, esta desarrollada, visible y habilitada por proyecto, entorno y region.
Los frontends consumen esta configuracion mediante Gateway y no dispersan
condiciones locales. Feature visibility no sustituye permisos backend.

Estados permitidos: `disabled`, `development`, `internal`, `beta`, `mvp` y
`released`. Solo `mvp` y `released` pueden ser publicos.
