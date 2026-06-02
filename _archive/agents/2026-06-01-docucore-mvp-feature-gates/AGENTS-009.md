Perfecto. La **Fase 3** no trata únicamente de poner colores bonitos. Realmente es un sistema visual de identificación, navegación y comprensión rápida del documento. Si se diseña correctamente, el usuario podrá entender un expediente de 500 páginas en segundos simplemente observando colores, indicadores y leyendas.

# FASE 3 — Sistema de Colores, Identificación Visual y Navegación de Secciones

## Objetivo

Crear un sistema visual que permita al usuario identificar inmediatamente:

```text
- Qué páginas pertenecen a cada sección.
- Qué archivo se generará.
- Qué páginas fueron modificadas.
- Qué páginas fueron descartadas.
- Qué páginas contienen observaciones.
- Qué páginas son importantes.
- Qué páginas tienen OCR.
```

Sin necesidad de leer texto constantemente.

La información debe poder comprenderse visualmente.

---

# Problema actual

Actualmente una sección puede llamarse:

```text
Contrato
Anexos
Facturas
Pruebas
```

Pero si el documento tiene:

```text
300 páginas
20 secciones
```

el usuario pierde rápidamente la referencia visual.

Necesitamos que cada sección tenga identidad propia.

---

# Concepto principal

Cada sección debe tener:

```text
Nombre
Color
Ícono
Indicadores
Estado
```

Ejemplo:

```text
🔵 Contrato
🟢 Anexos
🟠 Facturas
🟣 Evidencias
```

---

# Sistema de colores

Cada sección recibe automáticamente un color.

Ejemplo:

```text
Sección 1 → Azul
Sección 2 → Verde
Sección 3 → Naranja
Sección 4 → Morado
Sección 5 → Turquesa
Sección 6 → Rosa
```

---

# Regla importante

No usar colores saturados.

Evitar:

```text
Rojo brillante
Verde fosforescente
Amarillo intenso
```

Usar tonos suaves.

Ejemplo:

```text
Azul 100
Verde 100
Morado 100
Naranja 100
```

---

# Aplicación del color

El color debe aparecer en:

```text
Encabezado de sección
Borde de página
Indicadores
Leyenda
Resumen final
```

---

# Encabezado de sección

Ejemplo:

```text
══════════════════════════════
🔵 CONTRATO
12 páginas
══════════════════════════════
```

---

# Bordes de página

Todas las páginas heredan el color de su sección.

Ejemplo:

```text
┌────────────────┐
│ Página 1       │
└────────────────┘
```

Borde azul.

---

# Vista de varias secciones

Ejemplo:

```text
🔵 CONTRATO

Página 1
Página 2
Página 3

══════════════

🟢 ANEXOS

Página 4
Página 5
Página 6

══════════════

🟠 FACTURAS

Página 7
Página 8
```

---

# Leyenda visual

Siempre visible.

Ejemplo:

```text
■ Azul      Contrato
■ Verde     Anexos
■ Naranja   Facturas
■ Morado    Evidencias
```

---

# Personalización de color

El usuario puede cambiar colores.

Ejemplo:

Antes:

```text
Contrato → Azul
```

Después:

```text
Contrato → Rojo oscuro
```

---

# Selector visual

Mostrar:

```text
● Azul
● Verde
● Naranja
● Morado
● Rosa
● Turquesa
```

No mostrar códigos hexadecimales al usuario común.

---

# Validación de colores

Evitar automáticamente:

```text
Dos secciones consecutivas con el mismo color.
```

Ejemplo incorrecto:

```text
Contrato → Azul
Anexos → Azul
Facturas → Azul
```

---

# Indicadores de estado

Además del color de sección, cada página puede mostrar estados.

---

# Página modificada

Visual:

```text
✏ Modificada
```

Color:

```text
Amarillo suave
```

---

# Página OCR

Visual:

```text
OCR
```

Color:

```text
Morado suave
```

---

# Página importante

Visual:

```text
⭐ Importante
```

Color:

```text
Dorado
```

---

# Página etiquetada

Visual:

```text
🏷 Etiqueta
```

Color:

```text
Azul claro
```

---

# Página con nota

Visual:

```text
📝 Nota
```

Color:

```text
Verde claro
```

---

# Página descartada

Visual:

```text
🗑 Descartada
```

Color:

```text
Gris
```

---

# Página cortada

Visual:

```text
✂ Cortada
```

Color:

```text
Gris oscuro
```

---

# Página copiada

Visual:

```text
📄 Copiada
```

Color:

```text
Gris claro
```

---

# Sistema de capas visuales

Las prioridades deben respetarse.

Ejemplo:

Una página puede ser:

```text
Contrato
Importante
OCR
```

El sistema debe mostrar:

```text
Color principal → Contrato
Indicador secundario → Importante
Indicador terciario → OCR
```

No reemplazar el color de sección.

---

# Indicadores flotantes

Ejemplo:

```text
┌──────────────────────┐
│ ⭐ OCR               │
│                      │
│     Página 12        │
│                      │
└──────────────────────┘
```

---

# Modo compacto

Si existen muchas páginas.

Mostrar:

```text
🔵
🟢
🟠
🟣
```

sin texto.

---

# Tooltip

Al pasar el cursor:

```text
Contrato
12 páginas
OCR aplicado
2 notas
```

---

# Vista miniatura

Las miniaturas deben mostrar color.

Ejemplo:

```text
🔵 Página 1
🔵 Página 2
🔵 Página 3

🟢 Página 4
🟢 Página 5
```

---

# Navegación rápida

Agregar panel:

```text
SECCIONES

🔵 Contrato (12)
🟢 Anexos (5)
🟠 Facturas (8)
```

Al dar clic:

```text
Ir a la sección.
```

---

# Resumen visual

Antes de exportar:

```text
Se crearán:

🔵 Contrato.pdf
12 páginas

🟢 Anexos.pdf
5 páginas

🟠 Facturas.pdf
8 páginas
```

---

# Ayuda contextual

Mostrar por primera vez:

```text
Cada sección tiene un color para ayudarte a identificar rápidamente qué páginas pertenecen a cada archivo.

Los colores no modifican el documento original. Solo facilitan la organización visual durante el trabajo.
```

---

# Accesibilidad

No depender únicamente del color.

Cada sección debe tener:

```text
Color
Nombre
Ícono
Cantidad de páginas
```

Ejemplo:

```text
🔵 Contrato
12 páginas
```

---

# Persistencia

Guardar:

```ts
sectionColor
sectionIcon
customColor
```

---

# Estructura técnica

```ts
type SectionVisualConfig = {
  sectionId: string;
  color: string;
  icon: string;
  customColor?: string;
};
```

---

# Estado global

```ts
type VisualWorkspaceState = {
  showLegend: boolean;
  compactMode: boolean;
  customColorsEnabled: boolean;
};
```

---

# Ejemplos prácticos

## Caso 1

Expediente legal:

```text
🔵 Demanda
🟢 Contestación
🟠 Pruebas
🟣 Sentencia
```

El usuario identifica inmediatamente cada bloque.

---

## Caso 2

Factura masiva:

```text
🔵 Enero
🟢 Febrero
🟠 Marzo
```

---

## Caso 3

OCR aplicado

```text
🔵 Contrato

Página 5
⭐ OCR
```

---

# Criterios de aceptación

La fase queda terminada cuando:

```text
1. Cada sección recibe un color automático.
2. Los colores aparecen en encabezados y páginas.
3. Existe leyenda visual.
4. El usuario puede cambiar colores.
5. Existen indicadores visuales para estados.
6. Las páginas muestran estados sin perder el color de sección.
7. Existe navegación rápida por secciones.
8. Existe resumen visual antes de exportar.
9. Existe ayuda contextual.
10. El sistema es accesible sin depender únicamente del color.
```

---

# Instrucción final para Codex

Implementar la Fase 3 creando un sistema completo de identificación visual para secciones y páginas. Cada sección debe tener color, nombre, icono e indicadores visuales. Los colores deben aplicarse a encabezados, bordes de página, miniaturas, leyendas y resúmenes. Implementar estados visuales para páginas modificadas, OCR, importantes, etiquetadas, con notas, copiadas, cortadas y descartadas. Mantener la accesibilidad mediante iconos, nombres y contadores, evitando depender únicamente del color. Agregar panel de navegación rápida por secciones, leyenda visual persistente y resumen visual del resultado antes de exportar.
