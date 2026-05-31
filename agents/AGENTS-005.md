Claro. Aquí tienes la **Fase 6: OCR avanzado con motor principal, respaldo y combinación de resultados**, lista para Codex. Tesseract puede generar salidas como texto, PDF, hOCR y TSV; esto sirve para comparar texto y confianza por palabras o bloques. PaddleOCR también está orientado a extraer texto estructurado desde imágenes/PDF y soporta múltiples idiomas, por eso puede servir como motor alterno o complementario. ([GitHub][1])

# FASE 6 — OCR avanzado con motor principal, respaldo y combinación

## Objetivo general

Implementar un sistema OCR más confiable usando dos motores OCR disponibles.

La idea no es ejecutar ambos siempre sin control, sino usar una estrategia inteligente:

1. Ejecutar OCR principal.
2. Evaluar si el resultado es suficiente.
3. Si falla o tiene baja calidad, ejecutar OCR secundario.
4. Comparar resultados.
5. Combinar texto cuando sea útil.
6. Guardar resultado final por página.

---

# 1. Problema actual

El OCR puede fallar en casos como:

* Texto borroso.
* Escaneo inclinado.
* Baja resolución.
* Imagen oscura.
* Documento con sellos o manchas.
* Tablas.
* Texto pequeño.
* Documento legal con muchas páginas.
* Páginas mezcladas entre imagen y texto real.

Por eso, si un motor OCR no detecta bien el texto, se necesita un respaldo.

---

# 2. Motores OCR

Definir dos motores:

```ts
type OcrEngine = "primary" | "secondary";
```

Ejemplo conceptual:

```text
primary = mejor motor OCR disponible
secondary = motor OCR alternativo
```

No amarrar todavía el código a nombres específicos si el proyecto ya tiene librerías instaladas.

---

# 3. Estado OCR por página

Cada página debe tener su propio estado OCR.

```ts
type OcrStatus =
  | "pending"
  | "running-primary"
  | "primary-completed"
  | "running-secondary"
  | "secondary-completed"
  | "merged"
  | "failed";
```

Agregar al estado de página:

```ts
type PreviewPage = {
  id: string;
  documentId: string;
  pageNumber: number;
  previewUrl: string;

  ocrStatus?: OcrStatus;
  ocrResult?: OcrPageResult;
};
```

---

# 4. Resultado OCR normalizado

Ambos motores deben devolver el mismo formato interno.

```ts
type OcrPageResult = {
  pageId: string;
  documentId: string;

  primary?: OcrEngineResult;
  secondary?: OcrEngineResult;

  finalText: string;
  finalConfidence: number;

  usedFallback: boolean;
  merged: boolean;

  createdAt: string;
};
```

Formato por motor:

```ts
type OcrEngineResult = {
  engine: "primary" | "secondary";
  text: string;
  confidence: number;
  words?: OcrWord[];
  blocks?: OcrBlock[];
  raw?: unknown;
};
```

Palabras:

```ts
type OcrWord = {
  text: string;
  confidence?: number;
  bbox?: {
    x: number;
    y: number;
    width: number;
    height: number;
  };
};
```

---

# 5. Flujo principal OCR

```text
Usuario ejecuta OCR por página
        ↓
Cambiar estado a running-primary
        ↓
Ejecutar OCR principal
        ↓
Evaluar calidad
        ↓
Si es suficiente, guardar resultado
        ↓
Si no es suficiente, ejecutar OCR secundario
        ↓
Comparar ambos resultados
        ↓
Combinar si mejora
        ↓
Guardar resultado final
```

---

# 6. Función principal recomendada

```ts
async function runOcrForPage(documentId: string, pageId: string) {
  updatePageOcrStatus(documentId, pageId, "running-primary");

  const primaryResult = await runPrimaryOcr(documentId, pageId);

  const primaryQuality = evaluateOcrQuality(primaryResult);

  if (primaryQuality.isAcceptable) {
    saveOcrResult(documentId, pageId, {
      pageId,
      documentId,
      primary: primaryResult,
      finalText: primaryResult.text,
      finalConfidence: primaryResult.confidence,
      usedFallback: false,
      merged: false,
      createdAt: new Date().toISOString()
    });

    updatePageOcrStatus(documentId, pageId, "primary-completed");
    markPageAsModified(documentId, pageId, "ocr");
    return;
  }

  updatePageOcrStatus(documentId, pageId, "running-secondary");

  const secondaryResult = await runSecondaryOcr(documentId, pageId);

  const mergedResult = mergeOcrResults(primaryResult, secondaryResult);

  saveOcrResult(documentId, pageId, {
    pageId,
    documentId,
    primary: primaryResult,
    secondary: secondaryResult,
    finalText: mergedResult.text,
    finalConfidence: mergedResult.confidence,
    usedFallback: true,
    merged: mergedResult.merged,
    createdAt: new Date().toISOString()
  });

  updatePageOcrStatus(documentId, pageId, mergedResult.merged ? "merged" : "secondary-completed");
  markPageAsModified(documentId, pageId, "ocr");
}
```

---

# 7. Evaluación de calidad OCR

Crear función:

```ts
function evaluateOcrQuality(result: OcrEngineResult) {
  const text = result.text?.trim() ?? "";
  const wordCount = text.split(/\s+/).filter(Boolean).length;

  const isEmpty = text.length === 0;
  const isTooShort = wordCount < 5;
  const hasLowConfidence = result.confidence < 0.65;

  return {
    isAcceptable: !isEmpty && !isTooShort && !hasLowConfidence,
    isEmpty,
    isTooShort,
    hasLowConfidence,
    wordCount
  };
}
```

Los umbrales deben ser configurables:

```ts
const OCR_QUALITY_CONFIG = {
  minConfidence: 0.65,
  minWordCount: 5,
  minTextLength: 20
};
```

---

# 8. Cuándo ejecutar OCR secundario

Ejecutar motor secundario si ocurre cualquiera de estos casos:

```text
- OCR principal devuelve texto vacío.
- OCR principal devuelve muy pocas palabras.
- OCR principal tiene baja confianza.
- OCR principal falla por error técnico.
- OCR principal detecta texto incompleto.
```

---

# 9. Manejo de errores

Si falla el OCR principal:

```ts
try {
  const primaryResult = await runPrimaryOcr(documentId, pageId);
} catch (error) {
  updatePageOcrStatus(documentId, pageId, "running-secondary");
  const secondaryResult = await runSecondaryOcr(documentId, pageId);
}
```

Si fallan ambos:

```ts
updatePageOcrStatus(documentId, pageId, "failed");
```

Mostrar:

```text
No se pudo extraer texto de esta página.
```

---

# 10. Combinación de resultados

Crear función:

```ts
function mergeOcrResults(primary: OcrEngineResult, secondary: OcrEngineResult) {
  const primaryQuality = evaluateOcrQuality(primary);
  const secondaryQuality = evaluateOcrQuality(secondary);

  if (!primaryQuality.isAcceptable && secondaryQuality.isAcceptable) {
    return {
      text: secondary.text,
      confidence: secondary.confidence,
      merged: false
    };
  }

  if (primaryQuality.isAcceptable && !secondaryQuality.isAcceptable) {
    return {
      text: primary.text,
      confidence: primary.confidence,
      merged: false
    };
  }

  const mergedText = mergeTextByLines(primary.text, secondary.text);

  return {
    text: mergedText,
    confidence: Math.max(primary.confidence, secondary.confidence),
    merged: true
  };
}
```

---

# 11. Combinación por líneas

Primera versión sencilla:

```ts
function mergeTextByLines(primaryText: string, secondaryText: string) {
  const lines = new Set<string>();

  primaryText
    .split("\n")
    .map((line) => line.trim())
    .filter(Boolean)
    .forEach((line) => lines.add(line));

  secondaryText
    .split("\n")
    .map((line) => line.trim())
    .filter(Boolean)
    .forEach((line) => lines.add(line));

  return Array.from(lines).join("\n");
}
```

---

# 12. Vista del resultado OCR

Después de ejecutar OCR, la página debe mostrar:

```text
OCR aplicado
```

Y permitir abrir:

```text
Ver texto OCR
```

Dentro del panel:

```text
Texto final
Confianza
Motor usado
Si usó respaldo
Si combinó resultados
```

Ejemplo:

```text
Motor principal: completado
Motor secundario: usado como respaldo
Resultado: combinado
Confianza final: 82%
```

---

# 13. Estados visuales

```css
.preview-page-frame.modified-ocr {
  border-color: #7C3AED;
  background: #F5F3FF;
}

.ocr-status-badge {
  background: #EDE9FE;
  color: #6D28D9;
}
```

Estados:

```text
OCR pendiente
OCR en proceso
OCR aplicado
OCR combinado
OCR fallido
```

---

# 14. OCR por página y OCR por documento

Esta fase debe implementar mínimo:

```text
OCR por página
```

Pero dejar preparado:

```text
OCR por documento completo
OCR por páginas seleccionadas
OCR por lote
```

---

# 15. Criterios de aceptación

La fase 6 queda lista cuando:

1. El usuario puede ejecutar OCR sobre una página.
2. Se ejecuta primero el motor OCR principal.
3. Si el resultado principal es bueno, se guarda sin ejecutar el secundario.
4. Si el resultado principal falla o es pobre, se ejecuta el secundario.
5. Si ambos producen texto útil, se puede combinar.
6. El resultado final queda guardado por página.
7. La página queda marcada como `modifiedReason: "ocr"`.
8. El usuario puede ver el texto OCR final.
9. Se muestra si se usó respaldo o combinación.
10. Si ambos fallan, se muestra estado de error claro.

---

# 16. Instrucción final para Codex

Implementar la Fase 6 del OCR avanzado por página. Crear un flujo OCR con motor principal y motor secundario. Al ejecutar OCR en una página, usar primero el motor principal y evaluar la calidad del resultado con métricas configurables como confianza mínima, cantidad mínima de palabras y longitud mínima de texto. Si el resultado es aceptable, guardar ese texto como resultado final. Si falla, está vacío, tiene baja confianza o es demasiado corto, ejecutar el motor secundario. Normalizar ambos resultados en una estructura común, comparar su calidad y combinar textos cuando sea útil. Guardar el resultado OCR final por página, indicando si se usó respaldo, si se combinaron resultados y cuál fue la confianza final. Marcar la página como modificada con `modifiedReason: "ocr"` y permitir visualizar el texto OCR final en el workspace.

[1]: https://github.com/tesseract-ocr/tesseract/wiki/FAQ/0d1cdebda4b7028ebc4e940f9488edb068f30b51?utm_source=chatgpt.com "FAQ · tesseract-ocr/tesseract Wiki"
