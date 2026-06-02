Perfecto. La **Fase 8** es donde DocuCore comienza a diferenciarse de las herramientas tradicionales de PDF.

Hasta ahora el usuario ha trabajado manualmente:

```text
Crear secciones
Seleccionar páginas
Descartar páginas
Crear marcadores
Generar índices
```

La Fase 8 introduce la **División Inteligente y Automática**, donde el sistema analiza el documento y propone estructuras, divisiones y agrupaciones sin que el usuario tenga que revisar página por página.

La filosofía de esta fase es:

```text
El usuario no debería tener que organizar manualmente 500 páginas
si el sistema puede detectar patrones y proponer una estructura inicial.
```

# FASE 8 — División Inteligente y Automática de Documentos

## Objetivo

Permitir que DocuCore analice el documento y genere automáticamente propuestas de división basadas en reglas, patrones, OCR, marcadores, páginas en blanco y estructuras detectadas.

El sistema no debe modificar el documento automáticamente.

Siempre debe:

```text
Detectar
Proponer
Visualizar
Permitir confirmar
```

---

# Principio fundamental

DocuCore nunca debe ejecutar una división automática sin mostrar previamente el resultado.

Flujo obligatorio:

```text
Analizar documento
↓
Generar propuesta
↓
Mostrar vista previa
↓
Usuario confirma
↓
Aplicar cambios
```

---

# Problema actual

Documento:

```text
850 páginas
```

Usuario necesita separar:

```text
Capítulos
Anexos
Facturas
Pruebas
Contratos
```

Manual:

```text
Lento
Propenso a errores
Difícil de mantener
```

---

# Nuevo concepto

DocuCore debe poder sugerir:

```text
Dónde dividir
Qué páginas agrupar
Qué secciones crear
Qué nombres utilizar
```

---

# Modos de división automática

## Modo 1 — Cada X páginas

Ejemplo:

```text
Cada 10 páginas
```

Resultado:

```text
Archivo 1 → 1-10
Archivo 2 → 11-20
Archivo 3 → 21-30
```

---

# Vista previa

Mostrar:

```text
Documento original

[1-10]
[11-20]
[21-30]
```

---

# Ayuda visual

Colorear cada bloque.

Ejemplo:

```text
Azul
Verde
Naranja
Morado
```

---

# Modo 2 — Páginas en blanco

Detectar:

```text
Páginas completamente vacías
```

---

# Ejemplo

Documento:

```text
Página 1
Página 2
Página 3

Página en blanco

Página 4
Página 5
```

Resultado:

```text
Sección 1
Páginas 1-3

Sección 2
Páginas 4-5
```

---

# Vista previa

Mostrar:

```text
──────────────
Página en blanco detectada
──────────────
```

---

# Modo 3 — Portadas

Detectar:

```text
Portadas
Carátulas
Cubiertas
```

---

# Ejemplo

OCR detecta:

```text
EXPEDIENTE PENAL
```

Resultado:

```text
Nueva sección sugerida
```

---

# Indicador visual

```text
📄 Posible portada detectada
```

---

# Modo 4 — OCR Inteligente

Analizar texto.

Detectar:

```text
CAPÍTULO
SECCIÓN
ANEXO
TÍTULO
ARTÍCULO
```

---

# Ejemplo

Texto:

```text
CAPÍTULO III
```

Resultado:

```text
Propuesta de división
```

---

# Vista previa

Mostrar:

```text
🔍 CAPÍTULO III

¿Crear nueva sección aquí?
```

---

# Modo 5 — Marcadores existentes

Basado en:

```text
Bookmarks PDF
```

---

# Resultado

```text
Capítulo 1
Capítulo 2
Capítulo 3
```

Convertidos en:

```text
Secciones automáticas
```

---

# Modo 6 — Detección por texto personalizado

Usuario define:

```text
FACTURA
ANEXO
PRUEBA
```

---

# Ejemplo

Buscar:

```text
FACTURA
```

Resultado:

```text
Nueva sección cada vez que aparezca.
```

---

# Vista previa

Mostrar:

```text
15 coincidencias encontradas
```

---

# Modo 7 — Detección por QR

Detectar:

```text
QR
Código de barras
Código Datamatrix
```

---

# Caso de uso

Documentos escaneados.

Cada QR representa:

```text
Inicio de expediente
```

---

# Resultado

```text
Sección automática.
```

---

# Modo 8 — Detección por separación visual

Analizar:

```text
Diseño
Espaciado
Títulos
Formato
```

---

# Ejemplo

Página:

```text
Título grande
```

Resultado:

```text
Posible inicio de sección
```

---

# Modo 9 — Detección por tamaño de documento

Ejemplo:

```text
100 páginas
```

Dividir automáticamente:

```text
25
25
25
25
```

---

# Modo 10 — IA Documental

Analizar:

```text
Contenido
Tema
Contexto
```

---

# Ejemplo

Documento:

```text
Contrato
Anexos
Facturas
```

Resultado:

```text
Contrato
Anexos
Facturas
```

como secciones propuestas.

---

# Panel de propuestas

Agregar:

```text
Propuestas encontradas
```

---

# Ejemplo

```text
✓ División por OCR

✓ División por marcadores

✓ División por páginas en blanco
```

---

# Comparador de propuestas

Mostrar:

```text
Propuesta A
Propuesta B
Propuesta C
```

---

# Ejemplo

```text
OCR → 15 secciones

Marcadores → 10 secciones

Páginas en blanco → 22 secciones
```

---

# Aceptación parcial

El usuario puede aceptar:

```text
Solo algunas sugerencias
```

---

# Ejemplo

Aceptar:

```text
Capítulo 1
Capítulo 2
```

Ignorar:

```text
Capítulo 3
```

---

# Indicadores visuales

Las divisiones propuestas deben ser diferentes a las confirmadas.

---

# División sugerida

Mostrar:

```text
Borde punteado
```

---

# División confirmada

Mostrar:

```text
Borde sólido
```

---

# Leyenda

```text
────────
División confirmada

- - - - -
División sugerida
```

---

# Explicación contextual

Al seleccionar una propuesta:

Mostrar:

```text
Esta división fue sugerida porque se detectó el texto "CAPÍTULO III" mediante OCR.
```

---

# Vista previa del resultado

Siempre mostrar:

```text
Se crearán:

Contrato.pdf
25 páginas

Anexos.pdf
15 páginas

Facturas.pdf
10 páginas
```

---

# Estadísticas

Mostrar:

```text
Páginas analizadas: 850

OCR ejecutado: Sí

Marcadores encontrados: 12

Divisiones sugeridas: 18
```

---

# Configuración avanzada

Permitir:

```text
Sensibilidad OCR

Alta
Media
Baja
```

---

# Umbral de detección

Ejemplo:

```text
80%
```

---

# Persistencia

Guardar:

```ts
autoSplitMode
acceptedSuggestions
rejectedSuggestions
analysisResults
```

---

# Estructura técnica

```ts
type AutoSplitSuggestion = {
  id: string;
  source:
    | "ocr"
    | "bookmark"
    | "blank-page"
    | "qr"
    | "layout"
    | "ai";
  pageId: string;
  confidence: number;
  accepted: boolean;
};
```

---

# Estado global

```ts
type AutoSplitState = {
  suggestions: AutoSplitSuggestion[];
  selectedMode?: string;
  analysisCompleted: boolean;
};
```

---

# Ayuda contextual inicial

Mostrar:

```text
La división automática analiza tu documento para sugerir una estructura inicial.

Las propuestas nunca se aplicarán automáticamente. Siempre podrás revisarlas, modificarlas o ignorarlas antes de generar los archivos finales.
```

---

# Casos prácticos

## Caso 1

Documento:

```text
500 páginas
```

Dividir:

```text
Cada 50 páginas
```

Resultado:

```text
10 archivos.
```

---

## Caso 2

Documento escaneado.

Detectar:

```text
CAPÍTULO I
CAPÍTULO II
CAPÍTULO III
```

Resultado:

```text
3 secciones sugeridas.
```

---

## Caso 3

Documento jurídico.

Detectar:

```text
DEMANDA
CONTESTACIÓN
PRUEBAS
SENTENCIA
```

Resultado:

```text
4 bloques documentales.
```

---

## Caso 4

Expediente digital.

Detectar:

```text
12 QR
```

Resultado:

```text
12 divisiones sugeridas.
```

---

# Criterios de aceptación

La fase queda terminada cuando:

```text
1. Existe análisis automático.
2. Se soportan múltiples métodos de detección.
3. Todas las divisiones son propuestas inicialmente.
4. Existe vista previa obligatoria.
5. El usuario puede aceptar o rechazar sugerencias.
6. Existen indicadores visuales distintos para sugerencias.
7. Existe comparador de propuestas.
8. Existe explicación de cada sugerencia.
9. Existe resumen final.
10. Las sugerencias se guardan en el proyecto.
11. Existe configuración avanzada de sensibilidad.
12. El usuario entiende claramente por qué se propuso cada división.
```

---

# Instrucción final para Codex

Implementar la Fase 8 creando un sistema de división inteligente y automática basado en OCR, marcadores, páginas en blanco, QR, estructura visual, texto personalizado e IA documental. Todas las divisiones deben generarse inicialmente como sugerencias visuales que el usuario pueda revisar, aceptar o rechazar. Incorporar panel de propuestas, comparador de métodos, explicaciones de detección, indicadores visuales diferenciados para sugerencias y divisiones confirmadas, estadísticas de análisis y vista previa obligatoria del resultado antes de aplicar cualquier cambio. El sistema debe ser totalmente reversible y persistir las decisiones del usuario dentro del proyecto.
