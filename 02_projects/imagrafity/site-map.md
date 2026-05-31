# Mapa del sitio Imagrafity

## Objetivo

Definir la arquitectura inicial de navegacion para una plataforma moderna de
personalizacion creativa.

## Paginas MVP

| # | Pagina | Proposito |
|---|---|---|
| 1 | Inicio | Presentar marca, productos destacados y acceso al editor. |
| 2 | Catalogo | Mostrar categorias principales. |
| 3 | Ropa y moda | Productos textiles personalizables. |
| 4 | Hogar y decoracion | Tazas, cuadros, cojines y decoracion. |
| 5 | Regalos y recuerdos | Fechas, eventos y obsequios. |
| 6 | Oficina y escuela | Articulos utiles y corporativos. |
| 7 | Tecnologia y celulares | Accesorios personalizados. |
| 8 | Publicidad y empresa | Kits, uniformes y branding. |
| 9 | Arte y creatividad | Plantillas, obras e inspiracion. |
| 10 | Premium | Ediciones especiales. |
| 11 | Detalle de producto | Precio, opciones, materiales y CTA de personalizacion. |
| 12 | Personalizador | Editor y preview. |
| 13 | Galeria | Ejemplos e inspiracion. |
| 14 | Contacto | Asesoria personalizada. |
| 15 | Nosotros | Historia, valores y proceso. |
| 16 | Guia/Blog | Educacion y tutoriales. |
| 17 | Carrito/Checkout | Compra y pago. |
| 18 | Perfil | Pedidos, disenos y datos. |
| 19 | Comunidad | Creadores, testimonios y retos. |
| 20 | Legal | Politicas, terminos y garantias. |

## Modulos futuros

- Promociones.
- Academia creativa.
- Portal B2B.
- Admin interno.
- Politica de propiedad de disenos.
- Internacionalizacion.
- API de pedidos.
- Prensa y colaboraciones.
- Concursos creativos.

## Regla UX

El usuario debe poder llegar al personalizador desde:

- home;
- catalogo;
- detalle de producto;
- galeria de inspiracion;
- pedidos previos;
- plantilla compartida.

Ninguna pagina debe quedar aislada. Toda pantalla debe dejar visible:

- donde esta el usuario;
- como regresar;
- que puede hacer despues;
- como comprar;
- como personalizar;
- como contactar;
- como ver pedidos cuando exista cuenta.

## Navegacion principal objetivo

```text
Inicio
-> Productos
-> Personalizar
-> Inspiracion
-> Empresas
-> Blog
-> Contacto
-> Favoritos
-> Carrito
-> Mi Cuenta
```

## Flujo completo objetivo

```text
Inicio
-> Categoria
-> Producto
-> Personalizar
-> Prompt / Editor
-> Preview sobre producto
-> Cantidad
-> Guardar diseno
-> Carrito
-> Checkout
-> Pago
-> Confirmacion
-> Seguimiento
```

## Admin ERP futuro

El arbol administrativo es separado de la web publica:

```text
Administracion
-> Dashboard
-> Pedidos
-> Produccion
-> Disenos
-> Productos
-> Prompts por producto
-> Inventario
-> Clientes
-> Cotizaciones
-> Pagos
-> Facturacion
-> Envios
-> Blog
-> Comunidad
-> Cupones
-> Marketing
-> Soporte
-> Reportes
-> Configuracion
```
