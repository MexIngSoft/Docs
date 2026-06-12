Puedes darle una redacción más técnica y precisa para que Codex tenga menos margen de interpretación:

## Desarrollo, documentación, pruebas e integración

La API Backend en Python con Django deberá desarrollarse siguiendo las mejores prácticas y estándares establecidos para el proyecto, incluyendo:

* Arquitectura modular y desacoplada.
* Principios SOLID cuando aplique.
* Separación de responsabilidades.
* Tipado estático donde sea posible.
* Manejo centralizado de errores.
* Configuración mediante variables de entorno.
* Validación de entradas y salidas.
* Registro (logging) de errores y eventos relevantes.
* Seguridad básica para consumo de APIs.

### Documentación Backend

Toda la API deberá documentarse utilizando los estándares definidos para el proyecto, incluyendo:

* Descripción funcional de cada endpoint.
* Parámetros de entrada.
* Parámetros opcionales.
* Ejemplos de solicitudes.
* Ejemplos de respuestas exitosas.
* Ejemplos de respuestas de error.
* Códigos HTTP utilizados.
* Variables de entorno requeridas.
* Flujo general de ejecución.

### Desarrollo Frontend

La aplicación web deberá desarrollarse siguiendo los estándares definidos para Next.js y la arquitectura actual del proyecto, incluyendo:

* Componentes reutilizables.
* Separación entre presentación, lógica y servicios.
* Consumo centralizado de APIs.
* Manejo adecuado de estados de carga.
* Manejo de errores de comunicación.
* Tipado con TypeScript.
* Interfaces y tipos compartidos cuando sea posible.
* Documentación de componentes y flujos principales.

### Configuración de la API

La integración con Apify deberá realizarse mediante variables de entorno.

Utilizar los siguientes parámetros configurables:

```env
APIFY_TOKEN=[REDACTED_BY_CODEX_DO_NOT_COMMIT_SECRET]
```

No deberán existir tokens, claves o credenciales codificadas directamente en el código fuente.

Toda la configuración deberá cargarse desde variables de entorno y documentarse adecuadamente.

### Configuración de búsqueda

El sistema deberá permitir modificar dinámicamente:

* País.
* Estado.
* Ciudad.
* Dirección.
* Coordenadas geográficas.
* Latitud.
* Longitud.
* Radio de búsqueda.

No se deben utilizar ubicaciones fijas dentro del código.

La ubicación deberá poder modificarse desde la interfaz de usuario y enviarse dinámicamente al backend.

### Pruebas

Una vez desarrollado el módulo:

1. Construir todos los contenedores Docker.
2. Levantar el entorno completo mediante Docker Compose.
3. Ejecutar pruebas funcionales de la API.
4. Verificar conectividad con Apify.
5. Verificar recuperación de resultados.
6. Verificar filtrado de negocios sin teléfono.
7. Verificar persistencia en base de datos.
8. Verificar consumo desde el frontend.
9. Verificar exportación de resultados.
10. Documentar los resultados obtenidos.

### Evidencias

Agregar a la documentación:

* Capturas de pantalla.
* Ejemplos de peticiones.
* Ejemplos de respuestas.
* Resultados de pruebas.
* Posibles errores encontrados.
* Soluciones implementadas.

### Criterio de aceptación

La funcionalidad se considerará terminada únicamente cuando:

* La API responda correctamente.
* El frontend consuma la información correctamente.
* Sea posible cambiar cualquier ubicación de búsqueda.
* Los resultados se almacenen correctamente.
* Los negocios sin teléfono sean identificados correctamente.
* Todas las pruebas se ejecuten satisfactoriamente dentro del entorno Docker.
* La documentación se encuentre completa y actualizada.

Esta versión deja claro que la ubicación debe ser configurable y obliga a Codex a documentar, probar y validar todo el flujo antes de marcar la tarea como terminada.
