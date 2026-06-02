Perfecto. La **Fase 6** es donde dejamos de trabajar con secciones completas y comenzamos a trabajar con **páginas individuales**.

Esta fase es extremadamente importante porque muchos usuarios no quieren dividir un PDF por bloques completos; quieren seleccionar páginas específicas para extraerlas, moverlas, copiarlas, duplicarlas o generar nuevos documentos.

La filosofía de DocuCore debe ser:

```text
No obligar al usuario a escribir números.
Permitir que trabaje directamente sobre las páginas.
```

Aunque se seguirán soportando rangos escritos para usuarios avanzados.

# FASE 6 — Selección Individual y Múltiple de Páginas

## Objetivo

Permitir que el usuario seleccione páginas específicas del documento para realizar operaciones sobre ellas.

Las páginas podrán seleccionarse:

```text
Individualmente
Por rango
Por bloques
Por sección
Por criterios automáticos
```

La selección debe ser visual y fácil de comprender.

---

# Problema actual

Las herramientas tradicionales obligan al usuario a escribir:

```text
1,3,5,7
```

o

```text
1-10
```

Lo que genera:

```text
Errores
Confusión
Falta de contexto visual
```

---

# Nuevo modelo

La selección principal debe realizarse sobre las miniaturas.

Ejemplo:

```text
☐ Página 1
☐ Página 2
☐ Página 3
☐ Página 4
```

---

# Selección simple

Al dar clic:

Antes:

```text
☐ Página 3
```

Después:

```text
☑ Página 3
```

---

# Apariencia visual

Una página seleccionada debe mostrar:

```text
Borde destacado
Fondo resaltado
Marca de selección
```

Ejemplo:

```text
┌─────────────────┐
│ ✓ Página 3      │
└─────────────────┘
```

---

# Color de selección

No reemplazar color de sección.

Debe agregarse encima.

Ejemplo:

```text
Sección azul
+
Borde de selección
```

---

# Selección múltiple

El usuario puede seleccionar:

```text
Página 1
Página 5
Página 9
```

Resultado:

```text
✓ Página 1
✓ Página 5
✓ Página 9
```

---

# Contador visual

Mostrar:

```text
3 páginas seleccionadas
```

---

# Barra contextual

Cuando exista selección:

Mostrar:

```text
Mover
Copiar
Cortar
Duplicar
Descartar
Exportar
```

Ejemplo:

```text
3 páginas seleccionadas

[ Copiar ]
[ Cortar ]
[ Duplicar ]
[ Descartar ]
```

---

# Selección por arrastre

El usuario puede arrastrar el cursor.

Ejemplo:

```text
Página 1
Página 2
Página 3
Página 4
```

Arrastre:

```text
Página 1
Página 2
Página 3
```

Resultado:

```text
✓ Página 1
✓ Página 2
✓ Página 3
```

---

# Selección con Shift

Ejemplo:

Primer clic:

```text
Página 10
```

Segundo clic:

```text
Shift + Página 20
```

Resultado:

```text
10-20 seleccionadas
```

---

# Ayuda contextual

Mostrar:

```text
Mantén Shift para seleccionar rangos completos.
```

---

# Selección por sección

Botón:

```text
Seleccionar sección completa
```

Resultado:

```text
Contrato
12 páginas

✓ Todas seleccionadas
```

---

# Selección de todas las páginas

Botón:

```text
Seleccionar todo
```

Resultado:

```text
✓ 250 páginas seleccionadas
```

---

# Deseleccionar todo

Botón:

```text
Limpiar selección
```

---

# Selección por criterio

Permitir:

```text
Páginas con OCR
Páginas descartadas
Páginas importantes
Páginas con notas
Páginas modificadas
```

Ejemplo:

```text
Seleccionar páginas OCR
```

Resultado:

```text
15 páginas seleccionadas
```

---

# Selección mediante texto

Para usuarios avanzados.

Campo:

```text
1,3,5
```

---

# Ejemplo

Entrada:

```text
1,3,5
```

Resultado:

```text
✓ Página 1
✓ Página 3
✓ Página 5
```

---

# Rangos

Entrada:

```text
1-10
```

Resultado:

```text
✓ Página 1
✓ Página 2
✓ Página 3
...
✓ Página 10
```

---

# Combinaciones

Entrada:

```text
1,3,5-10,15,20-25
```

Resultado:

```text
Selección múltiple combinada.
```

---

# Validaciones

Detectar:

```text
Página inexistente
```

Ejemplo:

```text
500
```

en documento de:

```text
120 páginas
```

Mostrar:

```text
La página 500 no existe.
```

---

# Vista previa de selección

Mostrar:

```text
Se seleccionarán:

Página 1
Página 3
Página 5
Página 6
Página 7
Página 8
```

---

# Selección invertida

Botón:

```text
Invertir selección
```

Ejemplo:

Antes:

```text
✓ Página 1
✓ Página 2
```

Después:

```text
Todas menos 1 y 2
```

---

# Selección por intervalo visual

Ejemplo:

```text
Página 1

────────

Página 20
```

Usuario:

```text
Seleccionar entre ambas
```

Resultado:

```text
1-20
```

---

# Selección de páginas consecutivas

Mostrar:

```text
15 páginas consecutivas seleccionadas
```

---

# Ayudas visuales

Mostrar:

```text
✓ Seleccionada
```

```text
■ Selección múltiple
```

```text
3 páginas seleccionadas
```

---

# Leyenda

Mostrar:

```text
✓ Seleccionada

☐ No seleccionada

🗑 Descartada

⭐ Importante
```

---

# Resumen

Siempre visible:

```text
Total páginas: 250

Seleccionadas: 15
```

---

# Acciones masivas

Cuando exista selección:

Permitir:

```text
Copiar
Cortar
Mover
Duplicar
Descartar
Exportar
OCR
```

---

# Persistencia

Guardar:

```ts
selectedPageIds: string[]
```

---

# Estado técnico

```ts
type PageSelectionState = {
  selectedPageIds: string[];
};
```

---

# Estructura de página

```ts
type PageSelectionInfo = {
  pageId: string;
  selected: boolean;
};
```

---

# Accesibilidad

Permitir:

```text
Teclado
Mouse
Pantallas táctiles
```

---

# Ayuda contextual inicial

Mostrar:

```text
Puedes seleccionar páginas individuales, rangos completos o grupos de páginas para aplicar acciones masivas.

Utiliza Shift para seleccionar rangos y Ctrl para agregar páginas individuales.
```

---

# Casos prácticos

## Caso 1

Seleccionar:

```text
Página 3
Página 8
Página 20
```

Resultado:

```text
3 páginas seleccionadas
```

---

## Caso 2

Seleccionar:

```text
1-50
```

Resultado:

```text
50 páginas seleccionadas
```

---

## Caso 3

Seleccionar:

```text
Todas las páginas OCR
```

Resultado:

```text
15 páginas seleccionadas
```

---

## Caso 4

Seleccionar:

```text
Sección completa
```

Resultado:

```text
Contrato
12 páginas seleccionadas
```

---

# Criterios de aceptación

La fase queda terminada cuando:

```text
1. Se pueden seleccionar páginas individualmente.
2. Se soporta selección múltiple.
3. Se soporta Shift para rangos.
4. Se soporta arrastre.
5. Se soporta selección por texto.
6. Se soporta selección por sección.
7. Existe contador visual.
8. Existe barra contextual.
9. Existen acciones masivas.
10. Existe ayuda contextual.
11. Existe leyenda visual.
12. La selección es accesible desde teclado y táctil.
```

---

# Instrucción final para Codex

Implementar la Fase 6 creando un sistema completo de selección de páginas. Permitir selección individual, múltiple, por arrastre, mediante Shift, por sección y mediante entrada textual usando páginas individuales y rangos. Mostrar indicadores visuales claros, contadores de selección, barra contextual de acciones masivas y ayudas contextuales. Mantener compatibilidad con colores de sección, estados de página y páginas descartadas. Incorporar validaciones, vista previa de selección y soporte para accesibilidad mediante teclado, mouse y dispositivos táctiles.
