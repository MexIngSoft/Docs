# Analisis previo al desarrollo web

## Objetivo

Cerrar los puntos necesarios antes de implementar la web de Tecno Telec.

## Decision de arquitectura

La web debe crearse como proyecto independiente:

```text
WEB.NJ.NEXT.TecnoTelec
```

Durante desarrollo puede vivir dentro de:

```text
Docker.WEB.NJ/
```

pero debe conservar separacion suficiente para operar como repositorio propio.

## Relacion con APIs

```text
WEB.NJ.NEXT.TecnoTelec
  -> API.PY.DJANGO.Gateway
    -> tecnotelec-api
    -> auth-api
    -> catalog-api
    -> pricing-api
    -> sales-api
    -> projects-api / rules-engine-api cuando existan
```

Reglas:

- El frontend no consume APIs core directamente.
- El Gateway General adapta respuestas para la interfaz.
- La API especializada de Tecno Telec guarda reglas, tablas y procesos especificos del proyecto.
- Las reglas reutilizables viven en APIs core.

## Estado antes de programar

| Area | Estado | Accion |
|---|---|---|
| Nombre frontend | DEFINIDO | `WEB.NJ.NEXT.TecnoTelec`. |
| Docker frontend | EXISTE | Agregar servicio separado cuando se cree el proyecto. |
| Gateway | PARCIAL | Confirmar endpoints reales antes de conectar UI. |
| API propia Tecno Telec | PARCIAL | Confirmar persistencia y procesos propios. |
| Auth | PARCIAL | Definir sesion y roles finales. |
| Catalog/Pricing | PARCIAL | Confirmar contratos para soluciones, productos y precios. |
| Rules Engine | PENDIENTE_DE_DEFINIR | Requerido para diagnostico inteligente avanzado. |
| Projects | PENDIENTE_DE_DEFINIR | Requerido para seguimiento de proyectos completos. |
| Cart/Checkout | FUTURO | No debe dominar el MVP si no hay decision comercial. |
| GovernmentTender | FUTURO | Reusable por empresa; no bloquea la web comercial. |

## MVP recomendado

Primera fase:

- Home.
- Soluciones.
- Detalle de solucion.
- Contacto.
- Diagnostico/cotizador basico.
- Login.
- Portal cliente minimo para cotizaciones.
- Admin minimo para leads y cotizaciones.

No iniciar primero con marketplace generico. Tecno Telec debe posicionarse como consultora e integradora tecnologica.

## Criterios antes de implementar

- Confirmar copy de marca.
- Confirmar WhatsApp, correo, telefono y ubicacion reales.
- Confirmar roles: visitante, cliente, asesor, admin.
- Confirmar formato de lead y cotizacion.
- Confirmar si el diagnostico genera solo lead o cotizacion preliminar.
- Confirmar si se mostraran productos individuales o solo soluciones/paquetes.
