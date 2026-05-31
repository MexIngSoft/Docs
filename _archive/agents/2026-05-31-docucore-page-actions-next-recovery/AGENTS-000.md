Para DocuCore yo separaría las acciones en **acciones rápidas por página**, **acciones de selección múltiple** y **acciones de documento completo**.

Las que aparecen al pasar el cursor sobre una página deberían ser las más frecuentes y ejecutarse sin abrir otro panel.

## Acciones rápidas por página dentro del preview

### Objetivo

Cada página previsualizada debe tener una barra de acciones rápidas visible al pasar el cursor sobre la página o al seleccionarla.

Estas acciones deben permitir corregir o modificar páginas individuales sin abandonar el workspace.

---

## Barra rápida de página

Ejemplo:

```text
┌───────────────────────────────┐
│ Página 5 · Carta              │
│                               │
│         Preview               │
│                               │
└───────────────────────────────┘

↶ ↷ ✂ 📋 ⭐ 👁 🔍 📥 🗑 ⋮
```

---

# Acciones básicas

## Girar izquierda

```text
↶
```

Acción:

```text
Rotar -90°
```

---

## Girar derecha

```text
↷
```

Acción:

```text
Rotar +90°
```

---

## Eliminar página

```text
🗑
```

Acción:

```text
Eliminar página seleccionada.
```

Con confirmación.

---

## Duplicar página

```text
📋
```

Acción:

```text
Crear copia inmediata.
```

---

## Extraer página

```text
✂
```

Acción:

```text
Convertir la página en un archivo independiente.
```

Resultado:

```text
pagina_5.pdf
```

---

## Marcar página

```text
⭐
```

Acción:

```text
Agregar a favoritos.
```

Útil para expedientes grandes.

---

# Acciones de visualización

## Zoom rápido

```text
🔍
```

Opciones:

```text
50%
75%
100%
125%
150%
200%
```

---

## Vista completa

```text
👁
```

Acción:

```text
Abrir página individual.
```

---

## Descargar página

```text
📥
```

Acción:

```text
Descargar página seleccionada.
```

---

# Acciones OCR

Si la página es imagen o escaneo.

## Ejecutar OCR

```text
🔤
```

Acción:

```text
Extraer texto solo de esa página.
```

---

## Ver texto OCR

```text
📄
```

Acción:

```text
Mostrar texto detectado.
```

---

# Acciones para imágenes

Si la página contiene imagen.

## Recortar

```text
✂️
```

---

## Enderezar

```text
📐
```

Acción:

```text
Corregir inclinación.
```

---

## Mejorar contraste

```text
☀
```

Acción:

```text
Mejorar legibilidad.
```

---

## Convertir blanco y negro

```text
◐
```

Acción:

```text
Optimizar para OCR.
```

---

# Acciones de organización

## Mover arriba

```text
⬆
```

---

## Mover abajo

```text
⬇
```

---

## Arrastrar

```text
⋮⋮
```

Acción:

```text
Reordenar páginas.
```

---

# Acciones jurídicas (Lex Nova)

Muy útiles para expedientes.

## Agregar marcador

```text
🔖
```

---

## Agregar nota

```text
📝
```

---

## Agregar etiqueta

```text
🏷
```

Ejemplos:

```text
Prueba
Contrato
Oficio
Pericial
Sentencia
```

---

## Resaltar página importante

```text
🚩
```

---

# Menú avanzado

Botón:

```text
⋮
```

Acciones menos frecuentes:

```text
Firmar página
Marca de agua
Numerar
Extraer imágenes
Dividir desde aquí
Insertar página
Reemplazar página
Traducir página
```

---

# Selección múltiple

Cuando el usuario seleccione varias páginas:

```text
Página 2
Página 3
Página 4
```

Mostrar:

```text
Eliminar
Rotar
Extraer
Mover
OCR
Descargar
Fusionar
```

---

# Acciones siempre visibles

Recomiendo que únicamente estas estén visibles permanentemente:

```text
↶ Girar izquierda
↷ Girar derecha
✂ Extraer
📋 Duplicar
🗑 Eliminar
⋮ Más opciones
```

Todo lo demás puede ir en el menú expandible.

---

## Instrucción final para desarrollo

Implementar una barra de acciones rápidas por página dentro del preview. Al pasar el cursor o seleccionar una página, mostrar acciones principales: girar izquierda, girar derecha, extraer página, duplicar página, eliminar página y menú de opciones avanzadas. Las acciones avanzadas deben incluir OCR por página, notas, etiquetas, marcadores, reordenamiento, descarga individual, recorte, corrección de inclinación, mejora de contraste, firma, marca de agua y traducción. Todas las acciones deben ejecutarse sobre la página seleccionada sin obligar al usuario a salir del workspace.
