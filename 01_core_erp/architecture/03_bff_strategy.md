# Estrategia BFF

## Objetivo

Definir como el gateway adapta el ERP y la API propia del proyecto al frontend web o mobile.

## BFF para web/mobile

El BFF debe entregar respuestas pensadas para pantallas, no para tablas internas.

Ejemplo:

```text
/solutions/{slug}/quote-context
  -> solucion
  -> preguntas
  -> productos sugeridos
  -> precio estimado
  -> disponibilidad
```

## Regla

Si una respuesta existe solo para simplificar una pantalla, vive en gateway/BFF. Si representa regla de negocio, vive en la API de dominio.

## Relacion con API propia del proyecto

El BFF puede llamar a:

- API propia del proyecto.
- APIs core del ERP.
- Servicios externos permitidos por el proyecto.

La API propia del proyecto guarda procesos y tablas especificas. El BFF solo adapta y orquesta.
