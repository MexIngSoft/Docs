# Estrategia de adaptacion del Gateway General

## Objetivo

Definir como el Gateway General adapta el ERP y las APIs especializadas al
frontend web o mobile.

## Adaptacion para web/mobile

El Gateway General puede entregar respuestas pensadas para pantallas, no para
tablas internas.

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

Si una respuesta existe solo para simplificar una pantalla, vive en el Gateway
General. Si representa regla de negocio, vive en la API especializada del
dominio correspondiente.

## Relacion con APIs especializadas

El Gateway General puede llamar a:

- API especializada del proyecto.
- APIs core del ERP.
- Servicios externos permitidos por el proyecto.

La API especializada guarda procesos y tablas especificas. El Gateway General
solo adapta, enruta y orquesta.
