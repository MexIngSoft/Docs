# Patron de consumo de APIs por proyecto

## Objetivo

Establecer como deben comunicarse los proyectos web, moviles o administrativos con el nucleo ERP.

## Principio

Todo proyecto debe separar tres capas:

```text
Web/Mobile/Admin
  -> API.PY.DJANGO.Gateway
  -> APIs compartidas
  -> API especializada solo si aplica
```

La API especializada no es obligatoria.

Solo se permite cuando el proyecto tiene logica exclusiva del dominio que no
pertenece a una API compartida.

No se debe crear una API por proyecto como patron general.

## Capas

| Capa | Responsabilidad | Ejemplo Tecno Telec |
|---|---|---|
| Cliente web/mobile | Interfaz de usuario. | Web Tecno Telec, app movil futura. |
| Gateway central | Punto unico de entrada versionado para pantallas y canales. | `API.PY.DJANGO.Gateway`. |
| API especializada | Reglas, tablas y procesos exclusivos del dominio cuando existan. | `tecnotelec-api`, solo si aplica. |
| Core ERP APIs | Modulos reutilizables del ERP. | Auth, Catalog, Pricing, Sales, Projects, Logistics. |

## Regla principal

El frontend no debe consumir directamente las APIs core del ERP. Siempre debe pasar por `API.PY.DJANGO.Gateway`.

Auth tambien se consume por medio del Gateway central. El frontend no
debe llamar directamente a `API.PY.DJANGO.Auth`; el Gateway propaga o deriva
`ApplicationCode` / `X-Application-Code` y normaliza errores de sesion.

## Gateway central

Debe:

- Recibir solicitudes de web, mobile o admin.
- Validar autenticacion y permisos de canal.
- Exponer endpoints de sesion propios del proyecto y llamar internamente a
  Auth.
- Adaptar respuestas para pantallas.
- Orquestar llamadas a APIs compartidas y APIs especializadas cuando apliquen.
- Centralizar errores de frontend.
- Ocultar contratos internos del ERP.

No debe:

- Guardar reglas permanentes de negocio.
- Crear tablas propias de dominio si pertenecen al proyecto.
- Reemplazar APIs core.
- Saltarse permisos de Auth.
- Exponer secretos, tokens internos o contratos de Auth directamente al
  navegador.

## API especializada

Debe existir solo cuando el proyecto tenga requerimientos exclusivos que no
pertenecen al nucleo ERP ni a una API compartida.

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

Para APIs Django compartidas:

```text
API.PY.DJANGO.NombreDominio
```

Para el Gateway central:

```text
API.PY.DJANGO.Gateway
```

Para API especializada:

```text
API.PY.DJANGO.NombreEspecializado
```

Ejemplo:

```text
API.PY.DJANGO.Gateway
API.PY.DJANGO.Refapart
API.PY.DJANGO.LexNova
API.PY.DJANGO.Fiscora
```

Estos repositorios especializados solo existen si hay logica exclusiva.

Regla de creacion:

- La entrada publica de frontend pasa unicamente por Gateway General.
- Las APIs especializadas solo se crean cuando existe logica exclusiva del dominio.
- Si el proyecto tiene tablas, procesos, formularios, configuracion o reglas
  exclusivas, evaluar una API especializada
  `API.PY.DJANGO.NombreEspecializado`.
- Si el proyecto solo consume APIs core sin datos propios, la API de dominio puede omitirse, pero la decision debe quedar documentada.
- La API especializada y el frontend deben ser repositorios Git independientes
  cuando ambos existan.
- El repositorio orquestador Docker debe ignorar `API.PY.DJANGO.*/` para no versionar APIs externas dentro del compose.

El nombre operativo puede documentarse en kebab-case:

```text
central-gateway-api
tecnotelec-api
```

## Flujo de ejemplo

```text
Web Tecno Telec
  -> central-gateway-api
  -> tecnotelec-api
  -> projects-api
  -> pricing-api
  -> sales-api
```

## Criterio de ubicacion

Si una regla sirve para varios proyectos, vive en core.

Si una regla solo existe por una empresa, marca, canal o vertical, vive en la API especializada.

Si una respuesta solo acomoda datos para una pantalla, debe resolverse en el
Gateway General mediante agregacion o transformacion ligera.
