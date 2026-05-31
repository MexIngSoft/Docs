# Estrategia de producto y monetizacion

## Objetivo

Clasificar capacidades, definir monetizacion y evitar que los proyectos crezcan
como colecciones de funciones sin modelo comercial claro.

## Clasificacion obligatoria

Cada nueva capacidad debe clasificarse como:

| Tipo | Uso |
|---|---|
| `Core ERP` | Necesaria para operar multiples negocios. |
| `Shared Module` | Reusable por varios productos. |
| `Commercial Module` | Vendible dentro de un producto. |
| `Independent Product` | Producto con marca, dominio y canal propio. |
| `Internal Tool` | Uso administrativo o tecnico. |

## Modelos de monetizacion permitidos

| Modelo | Aplica cuando |
|---|---|
| Suscripcion | Hay uso recurrente y valor continuo. |
| Creditos | El costo depende de recursos consumidos. |
| Pago por operacion | Hay accion aislada con costo claro. |
| Freemium | Conviene adquirir usuarios y convertir empresas. |
| Publicidad opcional | Sirve como adquisicion o subsidio, sin interrumpir flujos criticos. |
| Enterprise | Hay equipos, permisos, auditoria, SLA o facturacion formal. |

## Reglas

- No usar publicidad como ingreso principal en MVP si no hay trafico alto.
- La publicidad recompensada debe ser opcional.
- Los creditos promocionales deben distinguirse de creditos comprados.
- Los costos deben poder auditarse: paginas, MB, OCR, IA, CPU, almacenamiento y
  transferencia cuando aplique.
- JobCron gobierna reglas, planes, creditos, promociones y visibilidad; no
  ejecuta procesamiento especializado de producto.

## Pendientes por producto

Cada producto debe documentar:

- usuario objetivo;
- propuesta de valor;
- plan gratuito o trial;
- precios o unidad de credito;
- costos operativos;
- limites de abuso;
- reglas de cancelacion;
- reportes administrativos.
