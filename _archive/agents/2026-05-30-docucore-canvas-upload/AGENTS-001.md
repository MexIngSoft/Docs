Sí. La instrucción para Codex debe quedar así:

```text
Modificar la pantalla /upload de DocuCore.

Objetivo:
La zona “Arrastra tus archivos aquí” debe verse claramente como una zona accionable tipo botón/dropzone.

Cambios requeridos:

1. En estado vacío:
   - Mantener la vista actual.
   - Mejorar visualmente el área de subida.
   - La zona completa debe ser clickeable.
   - Debe parecer un botón grande o tarjeta interactiva.
   - Agregar borde visible, sombra suave, hover y cursor pointer.
   - Texto sugerido:
     “Arrastra tus archivos aquí”
     “o haz clic en esta zona para seleccionarlos”

2. Cuando ya existan archivos cargados:
   - No cambiar toda la pantalla.
   - No mandar todavía al workspace/editor.
   - Ocultar la dropzone grande superior.
   - Mostrar la lista de archivos cargados.
   - Debajo de la lista colocar una versión compacta de la dropzone:
     “+ Agregar más archivos”
     “Arrastra aquí o haz clic para seleccionar más”

3. Después de cargar el primer o primeros archivos:
   - Debajo del botón compacto de subir más archivos, mostrar acciones compatibles y desaparecerán los label donde dicen zip, ocr, word, Excel.....
   - Ejemplo si son PDF:
     Dividir PDF
     Unir PDF
     Comprimir PDF
     PDF a Word
     OCR
     Extraer imágenes

4. Regla importante:
   - Subir archivos NO abre el workspace.
   - El workspace/editor solo se abre cuando el usuario da clic en una acción compatible.

5. Flujo correcto:
   Usuario entra a /upload
   → ve dropzone grande
   → sube uno o varios archivos
   → ve archivos cargados
   → puede eliminar o agregar más
   → ve acciones compatibles
   → da clic en una acción
   → ahora sí se abre el workspace de edición.

6. La vista de /upload debe seguir siendo una pantalla de preparación, no de edición.
```

Frase recomendada para el botón compacto:

```text
+ Agregar más archivos
Arrastra aquí o haz clic para seleccionar más
```

Y para el botón grande:

```text
Arrastra tus archivos aquí
o haz clic en esta zona para seleccionarlos
```
