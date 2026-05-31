# Gobierno global del ecosistema

## Objetivo

Estandarizar como se diseñan, documentan, implementan y validan los proyectos
del ecosistema comercial para que cada nuevo producto salga con mejor base.

## Capas

| Capa | Ruta canonica | Responsabilidad |
|---|---|---|
| Nucleo ERP | `Docs/01_core_erp` | Capacidades reutilizables, APIs core, flujos genericos, datos compartidos y reglas transversales. |
| Proyectos | `Docs/02_projects/<proyecto>` | Marca, negocio, UX, API/Gateway propios, decisiones particulares y roadmap del producto. |
| Estandares | `Docs/03_standards` | UI/UX, arquitectura, seguridad, testing, Docker, operacion, agentes y cierre. |
| Integraciones | `Docs/04_integrations` | Proveedores externos, contratos, ETL, credenciales y mappers. |
| Agents | `Docs/agents` | Instrucciones temporales y reporte de ejecucion. |

## Regla de proyecto completo

Un proyecto se considera listo para desarrollo formal cuando tiene:

- README canonico.
- Arquitectura.
- Limites de sistema.
- API contracts.
- Modelo de datos o decision de no persistencia.
- UX/navigation o mockup aprobado.
- Seguridad y permisos.
- Roadmap/MVP.
- Validaciones esperadas.
- Repositorios y puertos.

## Clasificacion de modulos

| Tipo | Definicion | Ejemplos |
|---|---|---|
| `Core ERP` | Capacidad reutilizable y necesaria para varios negocios. | Auth, Billing, Jobs, Notifications, Customers. |
| `Shared Module` | Servicio compartido que habilita varios productos, pero puede evolucionar separado. | Document Intelligence, FeatureAvailability, OCR. |
| `Commercial Module` | Capacidad vendible dentro de un producto. | PDF split, creditos DocuCore, editor Imagrafity. |
| `Independent Product` | Producto con marca, dominio, frontend y canal comercial propios. | DocuCore, LexNova, Fiscora, Imagrafity. |
| `Future/Pending` | Idea sin owner, MVP o contratos suficientes. | Proyectos futuros sin alcance cerrado. |

## Criterios para avanzar

No iniciar implementacion grande si falta:

- owner;
- usuario objetivo;
- flujo principal;
- API responsable;
- datos compartidos y aislados;
- permisos;
- criterios de aceptacion;
- comando de validacion;
- decision de monetizacion cuando aplique.

## Auditorias obligatorias

Antes de cerrar una fase relevante, revisar:

- arquitectura: limites, API/Gateway, datos y dependencias;
- UI/UX: mobile first, estados, accesibilidad y mockup;
- producto: categoria de modulo, monetizacion y roadmap;
- seguridad: permisos, datos sensibles y secretos;
- operacion: jobs, eventos, observabilidad y rollback.
