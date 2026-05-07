# Crear APIs para mostrar productos en la página web de Tecno Telect

Crear las APIs necesarias para que la página web de Tecno Telect pueda mostrar productos correctamente desde el ecosistema actual.

Las APIs deben permitir consultar y mostrar:

- Productos.
- Categorías.
- Subcategorías.
- Marcas.
- Precios.
- Existencias.
- Imágenes principales.
- Galerías de imágenes.
- Imágenes 360 si existen.
- Descripción del producto.
- Modelo.
- SKU o identificador externo.
- Proveedor.
- Ficha técnica.
- Dimensiones.
- Peso.
- Garantía.
- Información SAT si aplica.
- Productos relacionados.
- Productos por categoría.
- Productos por marca.
- Búsqueda de productos.
- Filtros de productos.
- Ordenamiento de productos.
- Paginación.

La lógica debe crearse de forma ordenada, separando responsabilidades entre:

- API de Tecno Telect.
- Gateway de Tecno Telect.
- Página web de Tecno Telect.

La API de Tecno Telect debe encargarse de obtener, organizar y exponer la información base del catálogo.

El Gateway de Tecno Telect debe consumir la API de Tecno Telect, aplicar las reglas necesarias para la web y exponer endpoints limpios para el frontend.

La página web debe consumir únicamente el Gateway, no debe consumir directamente las APIs internas.

Se debe definir:

- Endpoints necesarios.
- Parámetros de entrada.
- Respuestas esperadas.
- Estructura JSON.
- Validaciones.
- Manejo de errores.
- Paginación.
- Filtros.
- Ordenamiento.
- Seguridad.
- Permisos si aplican.
- Caché si aplica.
- Tiempos de respuesta esperados.
- Documentación técnica de cada endpoint.

El resultado debe incluir:

- APIs creadas o ajustadas.
- Lógica organizada.
- Endpoints documentados.
- Ejemplos de request y response.
- Integración con el Gateway.
- Integración con la página web.
- Pruebas básicas de funcionamiento.
- Documentación de pendientes.