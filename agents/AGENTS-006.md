Sí, y de hecho creo que aquí encontramos algo importante:

**DocuCore no tiene una sola interfaz.**
Tiene al menos **4 maquetas principales** que deben diseñarse como productos distintos.

---

# 1. HOME (Marketing)

Cuando el usuario entra a:

```text
docucore.com
```

Debe ver algo parecido a esto:

```text
┌─────────────────────────────────────────────────────┐
│ DOCUCORE                                    Entrar │
├─────────────────────────────────────────────────────┤
│                                                     │
│ Procesa documentos de forma inteligente             │
│                                                     │
│ OCR • Conversión • Expedientes • IA                │
│                                                     │
│        [ Subir Documento ]                          │
│        [ Ver Herramientas ]                         │
│                                                     │
└─────────────────────────────────────────────────────┘


┌────────────┬────────────┬────────────┬──────────────┐
│ OCR        │ PDF        │ IA         │ Expedientes  │
└────────────┴────────────┴────────────┴──────────────┘


Casos de Uso

⚖️ Jurídico
🏢 Empresarial
🏛 Gobierno
🎓 Académico


Herramientas Populares

PDF → Word
OCR
Comprimir PDF
Separar Expediente
Generar Índice


Planes
```

---

# 2. Landing SEO

Ejemplo:

```text
docucore.com/pdf-a-word
```

Aquí no debe verse todo DocuCore.

Debe verse:

```text
┌─────────────────────────────────────────────┐
│ PDF a Word                                  │
├─────────────────────────────────────────────┤
│                                             │
│ Arrastra tu PDF aquí                        │
│                                             │
│ [ Seleccionar Archivo ]                     │
│                                             │
└─────────────────────────────────────────────┘


✓ Mantiene formato

✓ OCR opcional

✓ Procesamiento rápido

✓ Descarga inmediata


Preguntas Frecuentes

¿Tiene límite?
¿Conserva imágenes?
¿Funciona con OCR?
```

---

# 3. Workspace (La aplicación real)

Aquí está el corazón.

```text
┌──────────────┬──────────────────────┬──────────────┐
│ Archivos     │ Documento Activo     │ Procesos     │
├──────────────┼──────────────────────┼──────────────┤
│              │                      │ OCR          │
│ PDF1         │                      │              │
│ PDF2         │   Vista previa       │ Índice       │
│ PDF3         │                      │              │
│              │                      │ IA           │
│              │                      │              │
│              │                      │ Exportar     │
└──────────────┴──────────────────────┴──────────────┘
```

---

# 4. Documento cargado

Aquí cambia totalmente.

Supongamos que subimos:

```text
EXPEDIENTE.PDF
```

---

## Vista superior

```text
┌─────────────────────────────────────────────┐
│ expediente.pdf                              │
│ 245 páginas                                 │
│ 80 MB                                       │
│ Expediente Judicial Detectado               │
└─────────────────────────────────────────────┘
```

---

## Vista previa

```text
┌────────────────────────────┐
│ Página 1                   │
│                            │
│  Vista PDF                 │
│                            │
└────────────────────────────┘
```

---

## Diagnóstico

```text
Documento detectado:

⚖️ Expediente Judicial

Confianza: 94%

OCR requerido: Sí

Documentos internos: 37

Posibles anexos: 12
```

---

## Herramientas recomendadas

```text
┌────────────────────────────┐
│ OCR Completo               │
│ Recomendado                │
└────────────────────────────┘

┌────────────────────────────┐
│ Separar Expediente         │
│ Recomendado                │
└────────────────────────────┘

┌────────────────────────────┐
│ Generar Índice             │
│ Recomendado                │
└────────────────────────────┘

┌────────────────────────────┐
│ Extraer Participantes      │
│ Recomendado                │
└────────────────────────────┘
```

---

# 5. Resultado Procesado

Después del OCR.

```text
┌────────────────────────────────────┐
│ Resultado                           │
├────────────────────────────────────┤
│ OCR completado                      │
│                                     │
│ Texto extraído                      │
│ Índice generado                     │
│ 37 documentos detectados            │
│                                     │
│ [ Descargar PDF OCR ]               │
│ [ Descargar Índice ]                │
│ [ Descargar ZIP ]                   │
│ [ Abrir Workspace ]                 │
└────────────────────────────────────┘
```

---

# 6. Vista para expedientes (Especialidad DocuCore)

Esta sería la pantalla más importante.

```text
┌────────────────────────────────────────────────────┐
│ Expediente Judicial                                │
├────────────────────────────────────────────────────┤
│                                                    │
│ Documento 1 - Oficio             Páginas 1-15      │
│ Documento 2 - Acuerdo            Páginas 16-24     │
│ Documento 3 - Notificación       Páginas 25-31     │
│ Documento 4 - Sentencia          Páginas 32-68     │
│ Documento 5 - Anexo              Páginas 69-90     │
│                                                    │
└────────────────────────────────────────────────────┘
```

Al dar clic:

```text
Documento 4
↓
Vista previa
↓
OCR
↓
Metadatos
↓
Exportar
```

---

# 7. Vista API

```text
┌─────────────────────────────────────┐
│ API DocuCore                        │
├─────────────────────────────────────┤
│ API Key                             │
│                                     │
│ *****************************       │
│                                     │
│ Requests Hoy: 4,522                │
│ Créditos Restantes: 10,000         │
│                                     │
│ POST /ocr                          │
│ POST /convert                      │
│ POST /classify                     │
│ POST /index                        │
└─────────────────────────────────────┘
```

Si tuviera que elegir una sola pantalla para invertir más tiempo de diseño, sería la **pantalla de documento cargado + workspace**, porque ahí es donde DocuCore deja de parecer un convertidor de PDF y empieza a parecer una plataforma documental profesional. Ahí es donde realmente se diferencia de SmallPDF, iLovePDF o PDF2Go.
