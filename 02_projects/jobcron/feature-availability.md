# FeatureAvailability en JobCron

## Objetivo

Crear una capa centralizada para decidir que modulo, seccion o funcionalidad
puede mostrarse en cada web del ecosistema y en que estado de desarrollo se
encuentra.

JobCron debe administrar esta informacion porque es el centro operativo del
ecosistema: proyectos, modulos, jobs, despliegues, documentacion, visibilidad y
operacion.

## Alcance MVP

La primera version no debe ser un motor complejo de reglas. Debe cubrir:

| Campo | Uso |
|---|---|
| `ProjectKey` | Web o proyecto: `docucore`, `lexnova`, `tecnotelec`, etc. |
| `ModuleKey` | Modulo funcional: `documents`, `checkout`, `quotes`, etc. |
| `FeatureKey` | Llave estable: `docucore.workspace`, `checkout.coupons`. |
| `Status` | `disabled`, `development`, `internal`, `beta`, `released`. |
| `Enabled` | Activa o bloquea la feature. |
| `Countries` | Paises permitidos, iniciando con `MX` cuando aplique. |
| `Regions` | Estado/region opcional. No obligatorio para MVP. |
| `ShowInDevelopment` | Permite ver maquetas o features incompletas en entorno dev. |
| `ShowUnfinishedBadge` | Obliga a marcar visualmente una zona incompleta. |
| `FrontendReady` | Indica si la parte visual existe. |
| `BackendReady` | Indica si la API/engine existe. |
| `QaReady` | Indica si paso validacion. |
| `DocumentationReady` | Indica si tiene documento canonico. |

## Comportamiento seguro

```text
Si no existe regla -> no mostrar.
```

Excepcion: una web existente puede conservar comportamiento actual solo si se
documenta explicitamente un fallback seguro.

## API objetivo

```http
GET /api/features/availability/?project=docucore&country=MX&region=JAL
```

Respuesta esperada:

```json
{
  "project": "docucore",
  "features": [
    {
      "feature_key": "docucore.workspace",
      "status": "development",
      "enabled": true,
      "can_show_public": false,
      "can_show_development": true,
      "show_unfinished_badge": true
    }
  ]
}
```

## Regla frontend/backend

- Frontend consulta para mostrar, ocultar o marcar visualmente.
- Backend valida de nuevo antes de ejecutar operaciones sensibles.
- Una feature oculta en frontend no queda autorizada automaticamente en backend.

## Relacion con desarrollo modular

FeatureAvailability debe crecer hacia un modulo mas amplio de ciclo de vida:

```text
Project
-> Module
-> Feature
-> Visibility Rules
-> Development Status
-> Documentation Status
-> Deployment Status
-> Dependencies
-> Versions
```

## Pendientes

- Definir modelos Django o API responsable dentro de JobCron.
- Definir panel administrativo.
- Definir relacion con Auth para permisos internos.
- Definir si reglas regionales usaran ubicacion de usuario, cliente, dominio o
  configuracion manual del proyecto.
- Definir auditoria de cambios de visibilidad.
