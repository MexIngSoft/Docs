Claro. Te dejo las instrucciones más detalladas para Codex:

---

# Corrección visual y funcional de productos Tecno Telect

Revisar y corregir la interfaz gráfica de productos de Tecno Telect, especialmente la sección de tarjetas de productos, filtros laterales, descripciones y problemas de codificación de caracteres.

## 1. Corregir descripción de productos

Actualmente el campo de descripción está usando:

```text
DescriptionHtml
```

Esto provoca que se muestre contenido HTML demasiado grande, desordenado o con etiquetas visibles, afectando el diseño de la tarjeta del producto.

### Regla nueva

Para mostrar la descripción corta del producto en las tarjetas, usar este orden de prioridad:

```text
SatDescription
DescriptionHtml limpio sin etiquetas HTML
Name
```

Es decir:

1. Si existe `SatDescription`, usar ese campo.
2. Si `SatDescription` está vacío, usar `DescriptionHtml`, pero limpiando todo el HTML.
3. Si ambos están vacíos, usar el nombre del producto como descripción auxiliar.
4. Nunca mostrar etiquetas HTML dentro de la tarjeta.

---

## 2. Limitar tamaño de la descripción

La descripción visible en la tarjeta debe tener un tamaño controlado.

### Reglas

```text
La descripción debe mostrarse en máximo 2 o 3 líneas.
Todas las tarjetas deben conservar la misma altura.
Si el texto es muy largo, cortar con puntos suspensivos.
No permitir que la descripción aumente el tamaño de la tarjeta.
```

Ejemplo visual:

```text
Cámaras de seguridad para vigilancia...
```

No debe pasar esto:

```text
<div><p><strong>Descripción completa del producto...</strong></p></div>
```

---

## 3. Corregir caracteres especiales

La información descargada desde los proveedores está llegando con errores de codificación.

Ejemplo actual incorrecto:

```text
C?maras de seguridad
```

Debe mostrarse correctamente como:

```text
Cámaras de seguridad
```

### Instrucción técnica

Revisar el proceso ETL, descarga, transformación y guardado en base de datos para asegurar compatibilidad con caracteres especiales.

Validar:

```text
UTF-8 en la respuesta de la API
UTF-8 en el cliente HTTP
UTF-8 en Python/Django
UTF-8 en PostgreSQL
UTF-8 en serializers
UTF-8 en Next.js
```

El problema debe corregirse desde el origen del guardado, no solo visualmente en frontend.

---

## 4. Corregir barra lateral de filtros

Según la imagen adjunta, la barra lateral de filtros tiene problemas de diseño.

### Problemas detectados

```text
Los campos de búsqueda de marca y categoría se salen visualmente.
Los botones Aplicar filtros y Limpiar filtros no respetan bien el ancho del contenedor.
El filtro de precio mínimo y precio máximo no está correctamente alineado.
Los inputs no mantienen una separación uniforme.
El panel lateral parece invadir el área de productos.
El diseño no conserva una estructura limpia entre filtros y tarjetas.
```

### Reglas visuales

```text
La barra lateral debe tener ancho fijo en escritorio.
Ningún input, botón o selector debe salirse del panel.
Todos los elementos deben usar width: 100% dentro del contenedor.
Debe existir separación uniforme entre secciones.
Los filtros deben alinearse verticalmente.
Precio mínimo y precio máximo pueden ir uno debajo del otro para evitar desbordamiento.
El panel de filtros no debe invadir el área de productos.
```

---

## 5. Corregir diseño de inputs y botones

Todos los campos deben tener una estructura consistente.

### Inputs

```text
Altura uniforme.
Bordes redondeados.
Padding interno suficiente.
Texto visible sin cortarse.
Placeholder claro.
No deben superar el ancho del contenedor padre.
```

### Botones

```text
Aplicar filtros debe ocupar el ancho completo del panel.
Limpiar filtros debe ocupar el ancho completo del panel.
Ambos botones deben estar alineados.
No deben salirse del contenedor.
Debe existir espacio entre ambos.
```

---

## 6. Corregir distribución entre filtros y productos

La página debe dividirse correctamente en dos zonas:

```text
Zona izquierda: filtros
Zona derecha: listado de productos
```

La zona de productos no debe montarse encima de los filtros.

La tarjeta del producto no debe quedar debajo o detrás del panel lateral.

---

## 7. Validación final visual

Codex debe verificar en escritorio que:

```text
La barra lateral no se desborde.
Los inputs no se salen.
Los botones no se enciman.
Las tarjetas tienen la misma altura.
Las descripciones no muestran HTML.
Las descripciones largas se cortan con puntos suspensivos.
Los acentos y caracteres especiales se muestran correctamente.
La zona de productos respeta el espacio de filtros.
```

---

## 8. Validación final funcional

Codex debe probar con productos que tengan:

```text
SatDescription válido.
SatDescription vacío.
DescriptionHtml con HTML largo.
DescriptionHtml vacío.
Caracteres con acentos.
Texto muy largo.
Producto sin imagen.
Producto sin precio.
```

El resultado esperado es:

```text
La tarjeta siempre se ve limpia, uniforme y sin romper el diseño.
```

---
