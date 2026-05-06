# Estructura funcional de la plataforma web

## Objetivo

Definir que partes tendra la web de Tecno Telec y que pertenece a cada dominio.

## Secciones publicas

| Seccion | Objetivo | API |
|---|---|---|
| Inicio | Presentar propuesta de valor. | Gateway |
| Soluciones | Mostrar lineas de servicio. | Gateway/Catalog/Projects |
| Detalle solucion | Explicar alcance y beneficios. | Gateway |
| Diagnostico | Capturar necesidades. | Gateway/TecnoTelec/Rules |
| Proyectos tipo | Mostrar aplicaciones por segmento. | Gateway/Projects |
| Contacto | Capturar lead o asesoria. | Gateway/Notifications |
| Licitaciones | Informar capacidad de participar. | Gateway/GovernmentTender futuro |

## Secciones privadas cliente

| Seccion | Objetivo | API |
|---|---|---|
| Mi cuenta | Datos basicos del cliente. | Gateway/Auth/CRM |
| Mis cotizaciones | Consultar propuestas. | Gateway/Sales/Quote |
| Mis proyectos | Seguimiento de instalacion o servicio. | Gateway/Projects |
| Soporte | Tickets y solicitudes. | Gateway/Support |
| Documentos | Evidencias, anexos y archivos. | Gateway/Documents |

## Secciones internas

| Seccion | Objetivo | API |
|---|---|---|
| Dashboard | Indicadores comerciales y operativos. | Gateway |
| Leads | Seguimiento de prospectos. | Gateway/CRM |
| Cotizaciones | Crear, revisar y convertir propuestas. | Gateway/Sales/Pricing |
| Proyectos | Planeacion y seguimiento. | Gateway/Projects |
| Catalogo visible | Decidir surtido publico por canal. | Gateway/Catalog |
| Reglas Tecno Telec | Reglas propias de diagnostico y soluciones. | Gateway/TecnoTelec |
| Soporte | Tickets y SLA. | Gateway/Support |
| Licitaciones | Oportunidades y requisitos. | Gateway/GovernmentTender |

## Modulos por dominio

| Dominio | Modulos |
|---|---|
| ERP | Clientes, ventas, catalogo, pricing, inventario, compras, documentos, notificaciones. |
| Ecommerce | Catalogo visible, carrito, checkout y pedidos, si se aprueba fase comercial. |
| Consultoria | Diagnostico, proyectos, visitas tecnicas y propuestas. |
| Cotizaciones | QuoteStepper, reglas, pricing, snapshots y aprobaciones. |
| Soporte | Tickets, seguimiento, evidencias y comunicacion. |
| Telecom/infraestructura | Soluciones, paquetes, compatibilidades y proyectos. |
| Administracion | Usuarios, roles, leads, configuracion y reportes. |

## Flujos principales

### Diagnostico a cotizacion

```text
Visitante -> Diagnostico -> Lead -> Cotizacion preliminar -> Asesor -> Cotizacion formal -> Proyecto/Orden
```

### Cliente existente

```text
Cliente -> Login -> Mis cotizaciones / Mis proyectos -> Soporte o aprobacion
```

### Operacion interna

```text
Asesor/Admin -> Leads -> Cotizacion -> Proyecto -> Seguimiento -> Cierre
```

## Reglas de navegacion

- El usuario publico debe llegar rapidamente a soluciones, diagnostico y contacto.
- El usuario cliente debe ver estado, cotizaciones y soporte sin entrar a pantallas administrativas.
- El admin debe operar leads, cotizaciones y proyectos desde dashboard separado.
- El carrito no debe ser el camino principal del MVP salvo decision comercial posterior.
