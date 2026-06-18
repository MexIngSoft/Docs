# Estandar API especializada y Gateway General

## Objetivo

Evitar acoplamientos directos entre frontends, ERP e integraciones internas.
Cada proyecto con dominio propio debe tener frontera backend clara.

## Regla principal

```text
Frontend del proyecto
-> API.PY.DJANGO.Gateway
-> API especializada del proyecto, si aplica
-> APIs Core ERP / Shared Modules / Integraciones
```

## Prohibido

```text
Frontend -> ERP directo
Frontend -> API interna compartida sin Gateway
Proyecto A -> Base de datos de Proyecto B
```

## Responsabilidades

| Capa | Responsabilidad |
|---|---|
| Frontend | UX, estado visual, validacion ligera, consumo del Gateway. |
| Gateway General | Sesion, permisos de frontera, routing, normalizacion de errores y proxy seguro. |
| API especializada | Reglas del dominio, persistencia propia, contratos publicables cuando apliquen. |
| Core ERP | Capacidades reutilizables y datos compartidos controlados. |
| Shared Module | Servicio especializado reusable, por ejemplo Document API o FeatureAvailability. |

## Criterios para evaluar API especializada

Evaluar API especializada si el proyecto tiene:

- datos propios;
- permisos o roles propios;
- integraciones especificas;
- reglas de negocio diferenciadas;
- procesos asincronos propios;
- monetizacion propia;
- dominio o marca independiente.

La existencia de estos criterios no obliga automaticamente a crear una API
especializada.

Primero se debe revisar si la funcionalidad pertenece a una API compartida
existente.

Solo se crea API especializada cuando la responsabilidad no encaja en Auth,
Gateway General, Catalog, Inventory, Pricing, Supplier, Procurement, Sales,
Search, Document, Notification, FeatureVisibility, ETL, Fiscal, Address u otra
API compartida vigente.

No se debe crear una API por proyecto como patron general.

No se debe crear Gateway/BFF por proyecto.

No se debe crear Auth por proyecto.

No se debe crear Docker por proyecto.

Si la funcionalidad pertenece a una API compartida, no se crea una API nueva.

Si la funcionalidad es exclusiva del dominio, tiene reglas propias, datos
propios, formularios propios o integracion exclusiva, entonces puede
documentarse una API especializada solo si aplica.

## Documentacion minima

Cada proyecto debe documentar:

- `architecture.md`;
- `api-contracts.md`;
- `database.md` o decision de no persistencia;
- `security.md`;
- `repositories.md`;
- puertos locales;
- dependencia con Core ERP, Shared Modules e integraciones.

## Validacion

Antes de cerrar una fase:

- el frontend consume `API.PY.DJANGO.Gateway`;
- el Gateway no expone secretos;
- la API documenta errores normalizados;
- los endpoints estan listados;
- los datos sensibles no cruzan proyectos sin contrato.
