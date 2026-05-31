Sí, eso debería convertirse en una regla global de DocuCore y no dejarse a criterio de cada pantalla.

Actualmente tienes un problema de consistencia visual:

```text
Pantalla Upload
↓
Botón grande y llamativo

Workspace
↓
Botones pequeños y discretos
```

El usuario deja de identificar rápidamente dónde puede realizar acciones.

Yo agregaría este estándar de diseño:

# DOCUCORE UI STANDARD – PRIMARY ACTION BUTTONS

## Objetivo

Toda acción importante dentro de DocuCore debe verse claramente accionable.

Ningún botón principal debe parecer texto, enlace o elemento secundario.

El usuario debe identificar inmediatamente:

* Dónde subir archivos.
* Dónde aplicar cambios.
* Dónde procesar documentos.
* Dónde descargar resultados.
* Dónde agregar más archivos.

---

# Jerarquía de Botones

## Nivel 1 – Acción Principal

Color:

* Rojo corporativo DocuCore.

Uso:

* Seleccionar archivos.
* Agregar más archivos.
* Aplicar cambios.
* Procesar documento.
* Descargar resultado.
* Ejecutar OCR.
* Convertir archivo.
* Dividir PDF.
* Unir PDF.

Características:

* Alto mínimo: 48px
* Bordes redondeados.
* Sombra suave.
* Hover.
* Icono.
* Texto en negrita.

Ejemplo:

📄 Seleccionar archivos

➕ Agregar más archivos

⚙ Aplicar cambios

⬇ Descargar resultado

---

## Nivel 2 – Acción Secundaria

Color:

* Blanco.
* Borde visible.

Uso:

* Cancelar.
* Volver.
* Ocultar panel.
* Abrir configuración.

Ejemplo:

← Volver

⚙ Configuración

ℹ Información

---

## Nivel 3 – Acción Discreta

Uso:

* Eliminar archivo.
* Cerrar panel.
* Expandir sección.

Nunca deben usarse para procesos importantes.

---

# Regla de Consistencia

El botón:

"Seleccionar archivos"

debe tener exactamente el mismo lenguaje visual que:

"Agregar más archivos"

"Aplicar cambios"

"Procesar"

"Descargar"

El usuario debe reconocer inmediatamente que todos pertenecen a la misma familia visual.

---

# Estándar para Subida de Archivos

Estado vacío:

[ 📄 Seleccionar archivos ]

Estado con archivos:

[ ➕ Agregar más archivos ]

Ambos botones deben compartir:

* Tamaño.
* Color.
* Iconografía.
* Sombra.
* Animaciones.
* Bordes.

La única diferencia será el texto.

---

# Workspace

Los siguientes botones siempre serán de Nivel 1:

* Aplicar cambios.
* Procesar.
* Ejecutar OCR.
* Convertir.
* Descargar resultado.
* Agregar más archivos.

Nunca deben verse como botones secundarios.

---

# Acciones Compatibles

Cuando aparezcan las acciones sugeridas:

Incorrecto:

Dividir PDF

OCR

Comprimir

Correcto:

[ ✂ Dividir PDF ]

[ 🔍 OCR ]

[ 🗜 Comprimir PDF ]

[ 📄 PDF a Word ]

Todas las acciones deben verse como botones reales.

No como tarjetas pasivas.

---

# Regla Global

Si una acción genera:

* Un proceso.
* Una modificación.
* Un resultado.

Entonces debe representarse mediante un botón de acción primaria.

Nunca mediante texto plano o tarjetas sin énfasis visual.

Además agregaría una regla específica para Codex:

```text
Todos los botones de acción primaria deben consumir el mismo componente reutilizable:

<PrimaryActionButton />

No crear estilos independientes para:
- Seleccionar archivos
- Agregar más archivos
- Aplicar cambios
- Procesar
- Descargar

Todos deben heredar del mismo componente base para garantizar consistencia visual en toda la plataforma.
```

Esa última regla evita que dentro de seis meses tengas cinco estilos distintos de botones repartidos por DocuCore.
