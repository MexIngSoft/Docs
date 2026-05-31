# Estandar API y Gateway por proyecto

## Objetivo

Evitar acoplamientos directos entre frontends, ERP e integraciones internas.
Cada proyecto con dominio propio debe tener frontera backend clara.

## Regla principal

```text
Frontend del proyecto
-> Gateway/BFF del proyecto
-> API propia del proyecto
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
| Gateway/BFF | Sesion, permisos de frontera, agregacion, normalizacion de errores, proxy seguro. |
| API del proyecto | Reglas del dominio, persistencia propia, contratos publicables. |
| Core ERP | Capacidades reutilizables y datos compartidos controlados. |
| Shared Module | Servicio especializado reusable, por ejemplo Document API o FeatureAvailability. |

## Criterios para exigir API propia

Crear API propia si el proyecto tiene:

- datos propios;
- permisos o roles propios;
- integraciones especificas;
- reglas de negocio diferenciadas;
- procesos asincronos propios;
- monetizacion propia;
- dominio o marca independiente.

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

- el frontend consume Gateway;
- el Gateway no expone secretos;
- la API documenta errores normalizados;
- los endpoints estan listados;
- los datos sensibles no cruzan proyectos sin contrato.
