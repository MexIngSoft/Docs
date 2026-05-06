# Ecosistema empresarial

## Objetivo

Ordenar las empresas, marcas y productos que pueden crecer alrededor del ERP JobCron, separando claramente holding, desarrolladora, ERP, canales comerciales, operaciones, servicios y productos digitales.

## Regla de organizacion

- `01_core_erp` contiene el nucleo reusable del ERP.
- `02_projects/jobcron` documenta JobCron como producto ERP.
- Cada empresa/proyecto vive en su propia carpeta dentro de `02_projects`.
- Los proyectos pueden iniciar con necesidades basicas y madurar conforme crezca el ERP.

## Mapa general

| Categoria | Proyecto | Rol |
|---|---|---|
| Holding | Tecno Telec | Empresa base y grupo comercial. |
| Desarrollo | Mexingsof | Desarrollo de software, APIs, apps y mantenimiento. |
| Consultoria | Nexora | Entrada comercial para cotizar soluciones completas. |
| ERP | JobCron | ERP central que orquesta modulos y negocios. |
| Plataforma | Modulix | Arquitectura modular e integracion de servicios. |
| Plataforma | Clientix | Apps para clientes, tecnicos y administracion. |
| Plataforma | Cloudra | Hosting, nube, VPN y monitoreo. |
| Plataforma | Datara | Analitica, BI, reportes y metricas. |
| Comercio | Imagrafity | Personalizacion de productos. |
| Comercio | Buildora | Configurador y venta de PCs/equipos a medida. |
| Comercio | Refakto | Marketplace de refacciones usadas. |
| Operacion | Rutexa | Logistica y envios. |
| Operacion | Stockara | Inventarios y almacenes. |
| Operacion | Pagora | Pagos y financiamiento. |
| Servicio tecnico | Innovation Engines Repair | Reparacion de electronica y computo. |
| Servicio tecnico | Sekura Tech | Seguridad, camaras y control de acceso. |
| Legal | LexNova | LegalTech para gestion y analisis de casos. |
| Servicio local | Festora | Organizacion de eventos. |
| Servicio local | Lavanderia 3P | Lavanderia y pedidos locales. |
| Servicio local | Nutriva | Comida saludable. |
| Creativo | Imagiland | Libros infantiles y contenido creativo. |
| Creativo/legacy | Pensavart | Proyecto previo de libros digitales. |
| Utilidad | Tip Smart | Calculadora de propinas. |
| Automatizacion | Social Networks | Auto-publicacion en redes sociales. |
| Privacidad/ubicacion | MockWander | Rutas simuladas y privacidad de ubicacion. |

## Flujo conceptual

```text
Cliente
  -> Nexora / tienda / app especifica
  -> JobCron
  -> Pagora / Stockara / Rutexa
  -> Producto o servicio
  -> Clientix
  -> Datara
```

## Criterio para crecer

Cada proyecto debe iniciar con:

- Identidad.
- Necesidades ERP.
- Modulos JobCron requeridos.
- MVP.
- Pendientes.

No se debe programar una API por cada marca hasta que exista necesidad real. Primero se documenta el dominio y se decide si usa modulos comunes de JobCron o requiere modulo propio.
