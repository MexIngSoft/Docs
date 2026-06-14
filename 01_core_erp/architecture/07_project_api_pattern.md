# Patron de API por proyecto

## Objetivo

Establecer como deben comunicarse los proyectos web, moviles o administrativos con el nucleo ERP.

## Principio

Todo proyecto debe separar tres capas:

```text
Web/Mobile/Admin
  -> Project Gateway / BFF API
  -> Project Domain API
  -> Core ERP APIs
```

## Capas

| Capa | Responsabilidad | Ejemplo Tecno Telec |
|---|---|---|
| Cliente web/mobile | Interfaz de usuario. | Web Tecno Telec, app movil futura. |
| Project Gateway / BFF API | Punto unico de entrada para pantallas y canales. | `tecnotelec-gateway-api`. |
| Project Domain API | Reglas, tablas y procesos propios del proyecto. | `tecnotelec-api`. |
| Core ERP APIs | Modulos reutilizables del ERP. | Auth, Catalog, Pricing, Sales, Projects, Logistics. |

## Regla principal

El frontend no debe consumir directamente las APIs core del ERP. Siempre debe pasar por la API intermedia del proyecto.

Auth tambien se consume por medio del Gateway/BFF del proyecto. El frontend no
debe llamar directamente a `API.PY.DJANGO.Auth`; el Gateway propaga o deriva
`ApplicationCode` / `X-Application-Code` y normaliza errores de sesion.

## Project Gateway / BFF API

Debe:

- Recibir solicitudes de web, mobile o admin.
- Validar autenticacion y permisos de canal.
- Exponer endpoints de sesion propios del proyecto y llamar internamente a
  Auth.
- Adaptar respuestas para pantallas.
- Orquestar llamadas a `Project Domain API` y APIs core.
- Centralizar errores de frontend.
- Ocultar contratos internos del ERP.

No debe:

- Guardar reglas permanentes de negocio.
- Crear tablas propias de dominio si pertenecen al proyecto.
- Reemplazar APIs core.
- Saltarse permisos de Auth.
- Exponer secretos, tokens internos o contratos de Auth directamente al
  navegador.

## Project Domain API

Debe existir cuando el proyecto tenga requerimientos propios que no pertenecen al nucleo ERP.

Puede contener:

- Tablas especificas del proyecto.
- Procesos propios del negocio.
- Configuracion por marca, canal o vertical.
- Formularios propios.
- Reglas especificas que no deben reutilizarse globalmente.
- Integraciones exclusivas del proyecto.
- Estados internos del proyecto.

No debe contener:

- Productos reutilizables del catalogo global.
- Precios generales.
- Inventario core.
- Ventas core.
- Usuarios o permisos globales.
- Reglas que aplican a varios proyectos.

## Core ERP APIs

Son APIs reutilizables. Deben conservar responsabilidades de dominio:

- `auth-api`
- `catalog-api`
- `pricing-api`
- `inventory-api`
- `quote-api`
- `sales-api`
- `projects-api`
- `logistics-api`
- `rules-engine-api`
- `documents-api`
- `notifications-api`
- `government-tender-api`

## Nomenclatura

Para APIs Django:

```text
API.PY.DJANGO.NombreProyecto
```

Para gateway/BFF:

```text
API.PY.DJANGO.NombreProyecto.Gateway
```

Para API propia del proyecto:

```text
API.PY.DJANGO.NombreProyecto
```

Ejemplo:

```text
API.PY.DJANGO.TecnoTelec.Gateway
API.PY.DJANGO.TecnoTelec
```

Regla de creacion:

- Si un proyecto necesita Gateway/BFF, crear `API.PY.DJANGO.NombreProyecto.Gateway`.
- Si el proyecto tiene tablas, procesos, formularios, configuracion o reglas propias, crear tambien `API.PY.DJANGO.NombreProyecto`.
- Si el proyecto solo consume APIs core sin datos propios, la API de dominio puede omitirse, pero la decision debe quedar documentada.
- Ambas carpetas deben ser repositorios Git independientes y subirse a GitHub al momento de crearlas.
- El repositorio orquestador Docker debe ignorar `API.PY.DJANGO.*/` para no versionar APIs externas dentro del compose.

El nombre operativo puede documentarse en kebab-case:

```text
tecnotelec-gateway-api
tecnotelec-api
```

## Flujo de ejemplo

```text
Web Tecno Telec
  -> tecnotelec-gateway-api
  -> tecnotelec-api
  -> projects-api
  -> pricing-api
  -> sales-api
```

## Criterio de ubicacion

Si una regla sirve para varios proyectos, vive en core.

Si una regla solo existe por una empresa, marca, canal o vertical, vive en la API propia del proyecto.

Si una respuesta solo acomoda datos para una pantalla, vive en gateway/BFF.
