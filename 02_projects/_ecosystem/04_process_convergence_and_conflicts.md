# Procesos compartidos y contradicciones entre empresas

## Objetivo

Identificar en que procesos las empresas del ecosistema se unen, en cuales se contradicen y que decisiones deben quedar definidas antes de desarrollar.

Este documento debe revisarse antes de crear una API, modulo, flujo, tabla o integracion que toque mas de una empresa/proyecto.

## Principio

El ecosistema puede compartir datos, clientes, proveedores, pagos, inventario, logistica y analitica, pero cada empresa puede tener marca, reglas, surtido, margen, operacion y experiencia distintas.

```text
Compartir modulo no significa compartir regla comercial.
Compartir catalogo no significa publicar los mismos productos.
Compartir cliente no significa mostrarle la misma experiencia.
```

## Procesos donde las empresas se unen

| Proceso compartido | Empresas/proyectos | Modulo base | Decision previa |
|---|---|---|---|
| Identidad y acceso | Todos | Auth | Roles globales, roles por empresa y permisos por canal. |
| Catalogo normalizado | Tecno Telec, Buildora, Phone Shop, REFAPART, Imagrafity, Nutriva | Catalog | Categorias internas, atributos requeridos y calidad minima de datos. |
| Descarga de proveedores | Tecno Telec, Buildora, Phone Shop, REFAPART, Sekura Tech | Supplier | Proveedores activos, frecuencia de sync y datos obligatorios. |
| Surtido por canal | Tecno Telec, Buildora, Phone Shop, REFAPART | ChannelAssortment | Que se muestra, se oculta, se bloquea o solo se cotiza por proyecto. |
| Precios y margenes | Todos los comerciales | Pricing | Listas de precio, margen minimo, descuentos y moneda. |
| Cotizaciones | Tecno Telec, Nexora, Buildora, REFAPART, servicios locales | Quote/Sales | Vigencia, aprobacion humana, snapshots y conversion a venta. |
| Ventas y pagos | Todos los que cobran | Sales/Pagora | Metodos de pago, anticipos, devoluciones y conciliacion. |
| Inventario propio | Tecno Telec, Stockara, Buildora, REFAPART, Nutriva | Inventory/Stockara | Almacenes, reservas, stock proveedor vs stock propio. |
| Logistica | Rutexa, Tecno Telec, Nutriva, Lavanderia 3P, REFAPART | Logistics/Rutexa | Zona de entrega, tiempos, costo, tracking y responsable. |
| Notificaciones | Todos | Notifications | Canales permitidos, plantillas, eventos y reintentos. |
| Analitica | Datara y todos | Reports/BI | Indicadores compartidos y privacidad por empresa. |
| Documentos | Tecno Telec, GovernmentTender, LexNova, Billing | Documents | Tipos de documento, permisos, vigencia y confidencialidad. |
| Licitaciones | Tecno Telec, Nexora, Sekura Tech, Innovation Engines Repair, Buildora | GovernmentTender | Empresa participante, categorias, documentos legales y aprobador. |
| Compatibilidad tecnica | Buildora, Tecno Telec, REFAPART | ProductCompatibility | Atributos obligatorios y politica para datos incompletos. |
| Soporte/tickets | Clientix, Innovation Engines Repair, Tecno Telec, Phone Shop | Clientix/Projects | SLA, responsables, estados y relacion con venta/garantia. |

## Procesos donde pueden contradecirse

| Conflicto | Empresas/proyectos | Riesgo | Decision obligatoria |
|---|---|---|---|
| Mismo producto, distinta marca/canal | Tecno Telec vs Phone Shop vs Buildora | Tecno Telec puede parecer tienda generica si publica telefonos o accesorios sueltos. | Definir `ChannelAssortment` por proyecto antes de publicar. |
| Catalogo grande vs experiencia consultiva | Tecno Telec, Nexora | El usuario compra productos sueltos cuando el negocio quiere vender solucion. | Definir si el producto es `SELLABLE`, `QUOTE_ONLY` o `COMPONENT_ONLY`. |
| Producto compatible vs producto solo disponible | Buildora, REFAPART, Tecno Telec | Se vende una configuracion tecnicamente invalida. | Definir reglas `ProductCompatibility` antes de habilitar compra directa. |
| Stock proveedor vs stock propio | Tecno Telec, Buildora, REFAPART, Stockara | Se promete entrega inmediata de producto que solo existe en proveedor. | Definir fuente de disponibilidad y mensaje al cliente. |
| Margen diferente por negocio | Todos los comerciales | Un descuento rentable en un canal puede perder dinero en otro. | Definir listas de precio y margen minimo por proyecto/canal. |
| Devoluciones por tipo de negocio | Phone Shop, REFAPART, Nutriva, Lavanderia 3P | Un flujo unico de devolucion puede ser incorrecto para perecederos, usados o servicios. | Definir politica de devolucion por proyecto. |
| Facturacion y documentos | Tecno Telec, LexNova, GovernmentTender, Sales | Documentos sensibles visibles para usuarios incorrectos. | Definir permisos y tipos documentales antes de integrar `Documents`. |
| Licitacion vs venta normal | Tecno Telec, Nexora, Sekura Tech, Buildora | Se trata una licitacion como orden normal y se omiten requisitos legales. | Definir perfil de licitacion por empresa y aprobador. |
| Servicio local vs ecommerce | Lavanderia 3P, Nutriva, Festora, Buildora | Checkout, tiempos y logistica no aplican igual. | Definir tipo de fulfillment antes de implementar carrito/checkout. |
| Reparacion vs venta de producto | Innovation Engines Repair, Phone Shop, REFAPART | Se confunden garantias, diagnosticos y refacciones. | Definir si el flujo inicia como ticket, cotizacion o venta. |
| LegalTech vs ERP comercial | LexNova vs empresas comerciales | Datos legales pueden mezclarse con clientes comerciales comunes. | Definir aislamiento, permisos y analitica separada. |
| Automatizacion social vs marca | Social Networks con todos | Publicaciones inconsistentes o fuera de tono para cada marca. | Definir tono, aprobacion y calendario por empresa. |
| Simulacion de ubicacion | MockWander | Riesgo etico/legal si se integra con apps operativas. | Definir alcance legal y no mezclar con tracking real de Rutexa/Clientix. |

## Definiciones obligatorias antes de desarrollar

Antes de crear codigo, endpoint, tabla o integracion, debe responderse:

| Pregunta | Respuesta esperada |
|---|---|
| Que empresa/proyecto lo necesita? | Nombre del proyecto y responsable. |
| Es reusable por varias empresas? | Si: core ERP. No: API propia del proyecto. |
| Que modulo core toca? | Auth, Catalog, Supplier, Pricing, Inventory, Sales, etc. |
| Que API de proyecto participa? | Ejemplo: `tecnotelec-api`, `tecnotelec-gateway-api`. |
| Que datos comparte con otras empresas? | Cliente, catalogo, stock, precio, documentos, pagos, etc. |
| Que datos deben aislarse? | Documentos sensibles, casos legales, permisos, datos fiscales. |
| Que categorias puede mostrar? | Lista permitida y bloqueada. |
| El producto se vende, se cotiza o solo es componente? | `SELLABLE`, `QUOTE_ONLY`, `COMPONENT_ONLY`, `BLOCKED`. |
| Requiere compatibilidad tecnica? | Atributos y reglas necesarias antes de vender. |
| Requiere aprobacion humana? | Rol aprobador y estado previo. |
| Como se calcula precio/margen? | Lista, margen minimo, moneda, impuestos y descuentos. |
| Que pasa si falla una API? | Retry, estado intermedio o revision manual. |
| Que documentos necesita? | Tipo, vigencia, permisos y fuente. |
| Como se entrega o cumple? | Envio, instalacion, ruta, pickup, servicio local o digital. |
| Como se factura o cobra? | Pago unico, anticipo, suscripcion, financiamiento o factura. |

## Matriz rapida por tipo de desarrollo

### Nuevo producto de proveedor

Debe definirse:

- Proveedor fuente.
- Categoria interna.
- Atributos minimos.
- Proyecto/canal donde se publica.
- Estado de publicacion.
- Margen minimo.
- Si requiere compatibilidad.

### Nuevo canal web/mobile

Debe definirse:

- Gateway/BFF del proyecto.
- API propia del proyecto.
- Modulos core consumidos.
- Roles y permisos.
- Surtido publicado.
- Flujo principal: consulta, cotizacion, venta, servicio o ticket.

### Nuevo flujo de venta

Debe definirse:

- Si inicia en carrito, cotizador, POS, ticket o licitacion.
- Si requiere asesor.
- Si reserva inventario.
- Si permite stock proveedor.
- Politica de pago, cancelacion y devolucion.

### Nueva empresa/proyecto

Debe definirse:

- Identidad y objetivo.
- Si es empresa, canal, producto o modulo.
- Que comparte con JobCron.
- Que contradice con empresas existentes.
- MVP y modulos requeridos.
- Si necesita API propia o usa core.

## Reglas de decision

- Si el dato afecta a varios proyectos, va al core.
- Si el dato existe solo por marca/canal, va a la API del proyecto.
- Si solo cambia la forma de mostrar datos, va al Gateway/BFF.
- Si un producto puede dañar la percepcion de marca, se controla por `ChannelAssortment`.
- Si un producto depende de compatibilidad, no se vende directo sin `ProductCompatibility`.
- Si el proceso implica documentos legales, fiscales o licitaciones, debe existir aprobacion humana.

## Pendientes de analisis por empresa

| Proyecto | Pendiente |
|---|---|
| Phone Shop | Definir si sera marca independiente, canal dentro de otro comercio o tienda fisica/digital. |
| Buildora | Definir atributos tecnicos obligatorios por categoria. |
| REFAPART | Activo como marca final de esta fase; mantener proveedor oculto, compra a REFAPART y backend futuro por Gateway/API propios. |
| REFAPART | Proyecto activo; `Refakto` queda solo en archivo historico. |
| Tecno Telec | Definir surtido bloqueado vs componente para telefonos, cables y accesorios. |
| Nexora | Definir si cotiza como consultora o si solo canaliza proyectos a Tecno Telec/otros. |
| Rutexa | Definir si opera logistica interna, externa o ambas. |
| Stockara | Definir si sera modulo interno o producto visible para clientes. |
| LexNova | Definir aislamiento de datos legales frente al CRM comercial. |
| Social Networks | Definir aprobacion por marca antes de publicar. |
| MockWander | Definir limites eticos/legales y separacion de tracking operativo real. |
