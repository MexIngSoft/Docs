Sí, correcto. Entonces la instrucción debe quedar así:

# Estados animados según tipo de archivo

Después de subir un archivo, el sistema debe mostrar una **línea de progreso animada**, donde cada paso se va activando conforme el backend lo ejecuta.

No debe ser texto fijo. Debe funcionar como:

```text
○ Documento recibido
○ Extrayendo texto
○ Detectando secciones
○ Generando índice
○ Pendiente de revisión
○ Listo para revisar
```

Y conforme avanza:

```text
● Documento recibido
● Extrayendo texto
○ Detectando secciones
○ Generando índice
○ Pendiente de revisión
○ Listo para revisar
```

---

# 1. Estados para documentos PDF / Word / imagen

```text
1. Documento recibido
2. Preparando archivo
3. Extrayendo texto
4. Aplicando OCR si es necesario
5. Detectando documentos y secciones
6. Generando índice
7. Guardando información
8. Pendiente de revisión
9. Listo para revisar
```

---

# 2. Estados para audio

```text
1. Audio recibido
2. Preparando archivo
3. Leyendo archivo desde almacenamiento
4. Validando calidad del audio
5. Transcribiendo audio
6. Extrayendo transcripción
7. Detectando participantes y temas
8. Guardando información
9. Pendiente de revisión
10. Listo para analizar
```

---

# 3. Estados para video

```text
1. Video recibido
2. Preparando archivo
3. Leyendo video desde almacenamiento
4. Separando audio y video
5. Extrayendo audio
6. Transcribiendo audio
7. Extrayendo transcripción
8. Detectando momentos relevantes
9. Guardando información
10. Pendiente de revisión
11. Listo para analizar
```

---

# 4. Estados para archivo desde nube

Aplica cuando viene de:

* Google Drive
* Dropbox
* Mega
* OneDrive
* URL

```text
1. Enlace recibido
2. Conectando con la nube
3. Leyendo archivo enviado
4. Descargando copia segura
5. Guardando original
6. Preparando procesamiento
7. Procesando contenido
8. Guardando información
9. Pendiente de revisión
10. Listo para revisar
```

---

# 5. Estados para archivo comprimido ZIP / RAR

```text
1. Archivo recibido
2. Validando contenido
3. Descomprimiendo archivos
4. Clasificando archivos internos
5. Procesando documentos
6. Procesando imágenes, audio o video si aplica
7. Generando índice general
8. Guardando estructura
9. Pendiente de revisión
10. Listo para revisar
```

---

# 6. Regla de interfaz

El frontend debe mostrar estados amigables al usuario, pero internamente puede manejar códigos técnicos.

Ejemplo interno:

```text
TEXT_EXTRACTION
```

Ejemplo visible:

```text
Extrayendo texto
```

---

# 7. Regla para animación

Cada estado debe tener:

```text
Pendiente
En proceso
Completado
Error
Requiere acción
```

Ejemplo:

```text
✓ Documento recibido
⟳ Extrayendo texto
○ Detectando secciones
○ Generando índice
○ Pendiente de revisión
○ Listo para revisar
```

Si falla:

```text
✓ Documento recibido
✕ No se pudo extraer texto
Acción requerida: revisar archivo o intentar OCR manual.
```

---

# 8. Regla final

El flujo animado debe adaptarse automáticamente según el tipo de archivo.

No debe mostrarse el mismo flujo para todos.

```text
PDF ≠ Audio ≠ Video ≠ ZIP ≠ Nube
```

Cada tipo de archivo debe tener su propio pipeline visual.
