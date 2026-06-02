La forma más fácil de verlo es comparándolo con una carpeta de trabajo real.

## Ejemplo 1: Caso simple

Subes un PDF llamado:

```text
SENTENCIA_CONDENATORIA.pdf
```

Lo giras, eliminas páginas y luego lo conviertes a Word.

### Proyecto

El proyecto es la carpeta donde guardas todo:

```text
Proyecto:
Sentencia Condenatoria
```

Dentro tiene:

```text
SENTENCIA_CONDENATORIA.pdf
```

Y también guarda:

```text
- páginas giradas
- páginas eliminadas
- fecha de modificación
- usuario
- estado actual
```

### Jobs

Los jobs son las tareas ejecutadas dentro del proyecto.

```text
Job 1:
Girar páginas

Job 2:
Eliminar páginas

Job 3:
Convertir PDF a Word
```

Resultado:

```text
Proyecto:
Sentencia Condenatoria

Documentos:
- SENTENCIA_CONDENATORIA.pdf
- SENTENCIA_CONDENATORIA.docx

Jobs:
- Girar páginas
- Eliminar páginas
- Convertir PDF a Word
```

---

# Ejemplo 2: Varios documentos

El usuario sube:

```text
Sentencia.pdf
Pruebas.pdf
Anexos.pdf
```

No tiene sentido que cada archivo sea un proyecto.

Lo correcto sería:

```text
Proyecto:
Expediente Penal 332024
```

Documentos:

```text
- Sentencia.pdf
- Pruebas.pdf
- Anexos.pdf
```

Después ejecuta:

```text
Unir PDFs
OCR
Comprimir
```

Entonces:

```text
Proyecto
└── Expediente Penal 332024

Documentos
├── Sentencia.pdf
├── Pruebas.pdf
└── Anexos.pdf

Jobs
├── Merge PDF
├── OCR
└── Compress PDF
```

---

# Ejemplo 3: Como Google Drive

Piensa en Google Drive.

La carpeta sería:

```text
Proyecto
```

Los archivos serían:

```text
Documentos
```

Y las acciones realizadas serían:

```text
Jobs
```

---

# En DocuCore

Yo lo estructuraría así:

```text
Proyecto
│
├── Documentos
│
├── Historial
│
├── Configuración
│
├── Resultados
│
└── Jobs
```

Por ejemplo:

```text
Proyecto:
Demanda Mercantil

Documentos:
- Demanda.pdf
- Contrato.pdf
- Facturas.pdf

Jobs:
- OCR
- Extraer texto
- Dividir PDF
- Convertir a Word

Resultados:
- Demanda.docx
- TextoExtraido.txt
```

---

# Entonces, ¿qué debería mostrar Upload?

Upload debería mostrar:

```text
Proyecto:
Demanda Mercantil

3 documentos
52 páginas

Última modificación:
01/06/2026 08:41 PM

Estado:
En edición

[Continuar]
```

No esto:

```text
Demanda.pdf
Contrato.pdf
Facturas.pdf
```

Porque el usuario realmente está trabajando en un conjunto de documentos relacionados.

---

# ¿Y la pestaña Jobs?

Jobs mostraría algo parecido a:

```text
Proyecto: Demanda Mercantil

Jobs

✓ OCR terminado
✓ Dividir PDF terminado
⟳ Convertir Word procesando
✗ Extraer imágenes falló
```

O incluso:

```text
Todos los Jobs

Proyecto           Acción          Estado
------------------------------------------------
Demanda Mercantil  OCR             Completado
Demanda Mercantil  Dividir PDF     Completado
Contrato Laboral   OCR             Procesando
Expediente Penal   OCR             Error
```

---

Para DocuCore, si tu objetivo es que un usuario pueda subir varios documentos, modificarlos, regresar días después y seguir trabajando donde se quedó, entonces el modelo correcto es:

```text
Proyecto
    ├── Documentos
    ├── Workspace
    ├── Historial
    ├── Resultados
    └── Jobs
```

y no:

```text
Documento
Documento
Documento
Documento
```

porque eso se vuelve difícil de administrar cuando el usuario tiene decenas o cientos de archivos.
