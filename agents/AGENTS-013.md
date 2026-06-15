Sí. JobCron debe quedar como **ERP núcleo**, no como una web más.

Base confirmada: la documentación separa el sistema en **núcleo ERP**, **proyectos**, **estándares** e **integraciones**; el núcleo debe contener módulos reutilizables como cotizador, carrito, punto de venta, ventas, compras, logística, estados, roles, costos, facturación, devoluciones y notificaciones. ([GitHub][1]) Además, la arquitectura comercial ya está dividida en APIs de Catalog, Inventory, Pricing, Procurement, Sales y Supplier. 

## Estructura que debe tener JobCron

JobCron debe dividirse así:

```txt
JobCron ERP
├── Dashboard general
├── CRM / Leads
├── Clientes
├── Cotizaciones
├── Ventas
├── Compras
├── Proveedores
├── Catálogo
├── Inventario
├── Precios
├── Logística
├── Facturación / pagos
├── Proyectos web
├── Integraciones
├── Automatizaciones / ETL
├── Reportes
├── Usuarios / roles / permisos
├── Configuración
└── Auditoría / sistema
```

## Módulos que ya existen pero deben actualizarse

**Catalog**: debe actualizarse para manejar productos internos, productos de proveedores, productos publicados por web, equivalencias, imágenes, fichas técnicas, categorías y marcas.

**Inventory**: debe agregar inventario por proveedor, inventario propio, disponibilidad estimada, apartado, reservado, vendido, pedido y sin existencia.

**Pricing**: debe manejar precio proveedor, costo real, margen mínimo, margen sugerido, precio por canal, precio web, precio mayoreo, descuento y promoción.

**Procurement**: debe crecer a solicitudes de compra, comparación de proveedores, seguimiento por WhatsApp, orden de compra, recepción y devolución.

**Sales**: debe incluir leads, cotizaciones, órdenes, pagos, seguimiento, estados comerciales y cierre.

**Supplier**: debe manejar contactos, WhatsApp, categorías que vende, zonas, reputación, tiempo de respuesta, condiciones, productos y documentos.

## Módulos faltantes importantes

Faltan estos módulos para que el ERP sea realmente usable:

```txt
CRM comercial
LeadHunter
Solicitudes de búsqueda
Panel de cotización manual
Workflow de estados
Centro de notificaciones
Módulo de WhatsApp semi-automático
Gestión de proyectos web
Gestión multiempresa
Rules Engine
Reportes ejecutivos
Auditoría completa
Control de tareas internas
Configurador visual por proyecto
Feature visibility por web
Módulo de costos operativos
Módulo de rentabilidad
```

## Interfaz recomendada

La interfaz no debe mostrar todos los módulos como menú gigante. Debe mostrarse por **áreas de trabajo**:

```txt
Inicio
Ventas
Compras
Inventario
Proveedores
Clientes
Webs / Proyectos
Automatizaciones
Reportes
Configuración
```

Cada área debe abrir un tablero simple con:

```txt
Resumen
Pendientes
Acciones rápidas
Listado principal
Filtros
Detalle lateral
Historial
Notas
```

Ejemplo para Refapart:

```txt
Refapart
├── Solicitudes de piezas
├── Cotizaciones pendientes
├── Proveedores sugeridos
├── Mensajes WhatsApp
├── Piezas encontradas
├── Clientes por contactar
└── Ventas cerradas
```

## Instrucción completa para Codex

```txt
Analiza la documentación del repositorio MexIngSoft/Docs y actualiza JobCron para que funcione como ERP núcleo modular.

JobCron no debe tratarse como una web comercial, sino como el sistema administrador central que controla clientes, proveedores, productos, cotizaciones, ventas, compras, inventario, precios, integraciones, automatizaciones, reportes, permisos y proyectos web.

Respetar la separación documental existente:
- 01_core_erp: todo módulo reutilizable del ERP.
- 02_projects: reglas específicas de cada proyecto, como Refapart o TecnoTelec.
- 03_standards: estándares técnicos, UI, Docker, seguridad, testing y operación.
- 04_integrations: proveedores externos como Syscom, Apify, WhatsApp u otros.

Actualizar o crear los siguientes módulos del ERP:

1. Dashboard general:
- KPIs principales.
- Leads nuevos.
- Cotizaciones pendientes.
- Ventas abiertas.
- Compras en proceso.
- Proveedores por responder.
- Errores de integraciones.
- Tareas urgentes.

2. CRM / Leads:
- Leads manuales.
- Leads importados desde LeadHunter.
- Negocios encontrados por Apify.
- Negocios con web.
- Negocios sin web.
- Negocios sin teléfono.
- Estado del contacto.
- Giro comercial.
- Proyecto destino.
- Prioridad.
- Fuente.
- Historial.

3. Clientes:
- Cliente individual o empresa.
- Contactos.
- Teléfonos.
- WhatsApp.
- Dirección.
- Proyecto relacionado.
- Historial de cotizaciones.
- Historial de compras.
- Notas internas.

4. Solicitudes / cotizaciones:
- Solicitud del cliente.
- Proyecto origen.
- Producto o pieza buscada.
- Fotos.
- Descripción.
- Marca.
- Modelo.
- Año.
- Compatibilidades.
- Estado.
- Proveedores consultados.
- Respuestas recibidas.
- Precio proveedor.
- Margen.
- Precio final.
- Vigencia.
- PDF o mensaje para cliente.

5. Proveedores:
- Datos generales.
- Contactos.
- WhatsApp directo.
- Categorías que maneja.
- Marcas.
- Ubicación.
- Tiempo de respuesta.
- Calificación interna.
- Condiciones de pago.
- Productos relacionados.
- Historial de compras.
- Historial de respuestas.

6. Compras:
- Solicitud de compra.
- Orden de compra.
- Proveedor.
- Productos.
- Cantidades.
- Costo.
- Estado.
- Recepción.
- Devolución.
- Evidencias.

7. Ventas:
- Cotización aprobada.
- Orden de venta.
- Cliente.
- Productos.
- Anticipos.
- Pagos.
- Estado.
- Entrega.
- Facturación.
- Devolución.

8. Catálogo:
- Productos propios.
- Productos de proveedores.
- Productos importados desde integraciones.
- Categorías.
- Subcategorías.
- Marcas.
- Imágenes.
- Fichas técnicas.
- Equivalencias.
- Estado de publicación.

9. Inventario:
- Stock propio.
- Stock proveedor.
- Stock estimado.
- Apartados.
- Reservas.
- Entradas.
- Salidas.
- Ajustes.
- Ubicaciones.
- Historial.

10. Precios:
- Precio proveedor.
- Costo real.
- Margen mínimo.
- Margen sugerido.
- Precio web.
- Precio interno.
- Precio por canal.
- Promociones.
- Reglas de descuento.

11. Logística:
- Recolección.
- Envío.
- Entrega local.
- Paquetería.
- Evidencias.
- Costos.
- Estados.
- Responsable.

12. Integraciones:
- Syscom.
- Apify.
- WhatsApp.
- Google Maps si aplica.
- Proveedores futuros.
- Tokens.
- Logs.
- Mappers.
- ETLs.
- Última sincronización.
- Errores.

13. Automatizaciones / ETL:
- Ejecutables.
- Frecuencia.
- Última ejecución.
- Próxima ejecución.
- Estado.
- Reintentos.
- Errores.
- Logs.
- Dependencias.

14. Proyectos web:
- Nombre del proyecto.
- Dominio.
- Tipo de negocio.
- Módulos activos.
- APIs requeridas.
- Gateway relacionado.
- Configuración visual.
- Feature visibility.
- Estado de desarrollo.
- Estado de publicación.

15. Reportes:
- Ventas.
- Compras.
- Cotizaciones.
- Leads.
- Proveedores.
- Productos más solicitados.
- Margen.
- Rentabilidad.
- Costos.
- Integraciones.
- Errores.

16. Usuarios, roles y permisos:
- Usuarios.
- Roles.
- Permisos por módulo.
- Permisos por proyecto.
- Auditoría de accesos.
- Sesiones.
- Acciones sensibles.

17. Auditoría:
- Quién creó.
- Quién modificó.
- Qué cambió.
- Fecha.
- Módulo.
- Entidad.
- Estado anterior.
- Estado nuevo.

Rediseñar la interfaz del ERP para que sea clara y no saturada.

La navegación principal debe agruparse por áreas:
- Inicio.
- Ventas.
- Compras.
- Inventario.
- Proveedores.
- Clientes.
- Webs / Proyectos.
- Automatizaciones.
- Reportes.
- Configuración.

Cada módulo debe usar una estructura visual común:
- Encabezado claro.
- Resumen con tarjetas.
- Acciones rápidas.
- Filtros visibles.
- Tabla principal.
- Panel lateral de detalle.
- Historial de actividad.
- Estados con colores.
- Botones primarios claros.
- Mensajes de error entendibles.

No crear pantallas aisladas sin relación con el flujo del ERP.

Cada módulo debe conectarse con los demás mediante estados:
Lead → Cliente → Solicitud → Cotización → Venta → Compra → Logística → Entrega → Pago → Cierre.

Para Refapart, agregar flujo especializado:
Cliente busca pieza → ERP crea solicitud → usuario consulta proveedores → se genera mensaje WhatsApp → proveedor responde → se registra precio/disponibilidad → se arma cotización → cliente acepta → se compra pieza → se gestiona entrega → se cierra venta.

Para LeadHunter:
Negocio encontrado → validación → clasificación → proyecto destino → contacto → seguimiento → conversión a cliente.

Documentar todo lo que se cree o modifique dentro de la carpeta correcta del repositorio Docs.
No duplicar documentación entre núcleo ERP y proyectos.
Si algo es reutilizable, va en 01_core_erp.
Si algo es específico de Refapart, TecnoTelec u otra web, va en 02_projects.
Si algo depende de proveedor externo, va en 04_integrations.
Si falta información real, usar PENDIENTE_DE_DEFINIR.
```

Con esto JobCron queda como el **centro operativo**: no solo administra productos, sino clientes, proveedores, webs, ventas, compras, automatizaciones y rentabilidad.

[1]: https://github.com/MexIngSoft/Docs "GitHub - MexIngSoft/Docs · GitHub"
