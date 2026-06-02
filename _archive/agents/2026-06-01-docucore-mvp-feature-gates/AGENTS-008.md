Perfecto. La **Fase 2** es probablemente la más importante de toda la herramienta de Dividir PDF porque aquí nace el concepto de **secciones visuales**, que será la base para dividir, reorganizar, combinar, mover, exportar y trabajar documentos complejos.

# FASE 2 — Sistema de Secciones Visuales

## Objetivo

Permitir que el usuario divida un documento de forma completamente visual, creando secciones directamente sobre la vista previa del documento.

El usuario no debe tener que escribir rangos, calcular páginas o imaginar el resultado final.

La división debe realizarse sobre el documento visible mediante separadores, colores, etiquetas y vistas previas.

---

# Problema actual

Actualmente dividir un PDF normalmente requiere:

```text
1-10
11-20
21-40
```

o

```text
1,3,5,8
```

Lo que obliga al usuario a:

```text
- Contar páginas.
- Recordar números.
- Cometer errores fácilmente.
- No visualizar el resultado.
```

---

# Nuevo modelo

La división se realizará mediante:

```text
SECCIONES VISUALES
```

Cada sección representa:

```text
Un archivo futuro.
```

---

# Concepto principal

Entre todas las páginas debe existir una zona especial.

Ejemplo:

```text
Página 1

[ + Crear división aquí ]

Página 2

[ + Crear división aquí ]

Página 3
```

---

# Crear una sección

Cuando el usuario da clic:

```text
+ Crear división aquí
```

El sistema genera:

```text
═══════════════════════════
SECCIÓN A
═══════════════════════════
```

---

# Resultado esperado

Antes:

```text
Página 1
Página 2
Página 3
Página 4
```

Después:

```text
SECCIÓN A

Página 1
Página 2

══════════════════════

SECCIÓN B

Página 3
Página 4
```

---

# Regla principal

Toda página siempre pertenece a una sección.

Nunca puede existir una página sin sección.

---

# Sección inicial automática

Al cargar un documento:

```text
Documento.pdf
```

Debe generarse automáticamente:

```text
SECCIÓN A
```

que contiene todas las páginas.

Ejemplo:

```text
SECCIÓN A

Página 1
Página 2
Página 3
Página 4
```

---

# Visualización de secciones

Cada sección debe mostrar:

```text
Nombre
Color
Cantidad de páginas
Estado
Acciones
```

Ejemplo:

```text
┌─────────────────────┐
│ Contrato            │
│ 12 páginas          │
│ Azul                │
└─────────────────────┘
```

---

# Encabezado de sección

Ejemplo visual:

```text
═══════════════════════════════════
📁 CONTRATO
12 páginas
═══════════════════════════════════
```

---

# Colores de sección

Cada sección debe recibir un color.

Ejemplo:

```text
Contrato → Azul
Anexos → Verde
Facturas → Naranja
Pruebas → Morado
```

---

# Ayuda visual obligatoria

Las páginas de una sección deben mostrar un borde suave.

Ejemplo:

```text
┌──────────────┐
│ Página 1     │
└──────────────┘

┌──────────────┐
│ Página 2     │
└──────────────┘
```

Color del borde:

```text
Color de la sección.
```

---

# Leyenda visual

Debe existir una leyenda.

Ejemplo:

```text
■ Azul = Contrato
■ Verde = Anexos
■ Naranja = Facturas
```

---

# Renombrar sección

Cada sección puede cambiar de nombre.

Ejemplo:

Antes:

```text
SECCIÓN A
```

Después:

```text
CONTRATO
```

---

# Ejemplos de uso

## Caso 1

Documento:

```text
Contrato.pdf
```

Usuario crea división:

```text
Página 10
```

Resultado:

```text
Contrato
Páginas 1-10

Anexos
Páginas 11-25
```

---

## Caso 2

Documento jurídico

```text
Demanda
Pruebas
Anexos
Resolución
```

Resultado:

```text
SECCIÓN DEMANDA
SECCIÓN PRUEBAS
SECCIÓN ANEXOS
SECCIÓN RESOLUCIÓN
```

---

## Caso 3

Expediente escaneado

```text
150 páginas
```

Usuario divide:

```text
25
50
75
100
125
```

Resultado:

```text
6 archivos independientes
```

---

# Crear división mediante arrastre

Además del botón:

```text
+ Crear división aquí
```

Debe existir:

```text
Arrastrar división
```

Ejemplo:

```text
══════════════
DIVISIÓN
══════════════
```

Mover:

```text
Entre página 10 y 11
```

a

```text
Entre página 15 y 16
```

---

# Reordenar secciones

Las secciones pueden moverse.

Ejemplo:

Antes:

```text
Contrato
Anexos
Facturas
```

Después:

```text
Facturas
Contrato
Anexos
```

---

# Fusionar secciones

Dos secciones pueden combinarse.

Ejemplo:

Antes:

```text
Contrato
Anexos
```

Después:

```text
Contrato + Anexos
```

Resultado:

```text
Una sola sección.
```

---

# Eliminar división

Al eliminar:

```text
══════════════
DIVISIÓN
══════════════
```

Las secciones se fusionan.

Ejemplo:

Antes:

```text
Sección A
Sección B
```

Después:

```text
Sección A
```

---

# Vista previa de resultado

Siempre mostrar:

```text
Se crearán:

Archivo 1 → Contrato.pdf
12 páginas

Archivo 2 → Anexos.pdf
5 páginas

Archivo 3 → Facturas.pdf
20 páginas
```

---

# Ayuda contextual

Al entrar por primera vez:

Mostrar:

```text
Las secciones permiten dividir visualmente un documento.

Cada sección se convertirá en un archivo independiente cuando exportes el resultado.

Puedes crear divisiones entre páginas, cambiar nombres, colores y reorganizar secciones antes de aplicar cambios.
```

---

# Estados visuales

## Sección normal

```text
Borde color sección
```

## Sección seleccionada

```text
Borde grueso
Fondo resaltado
```

## Sección colapsada

```text
▶ Contrato (12 páginas)
```

## Sección expandida

```text
▼ Contrato (12 páginas)
```

---

# Persistencia

Guardar:

```ts
sectionId
sectionName
sectionColor
sectionOrder
collapsed
pageIds
```

---

# Estructura técnica

```ts
type DocumentSection = {
  id: string;
  name: string;
  color: string;
  order: number;
  collapsed: boolean;
  pageIds: string[];
};
```

---

# Estado global

```ts
type SectionWorkspaceState = {
  sections: DocumentSection[];
  selectedSectionId?: string;
};
```

---

# Validaciones

No permitir:

```text
Secciones vacías.
```

No permitir:

```text
Dos nombres idénticos si el usuario decide restringir duplicados.
```

No permitir:

```text
Una página fuera de una sección.
```

---

# Criterios de aceptación

La fase queda terminada cuando:

```text
1. Existe una sección inicial automática.
2. Se pueden crear divisiones visuales.
3. Las secciones muestran nombre, color y páginas.
4. Las páginas heredan el color de la sección.
5. Se pueden renombrar secciones.
6. Se pueden mover divisiones.
7. Se pueden fusionar secciones.
8. Se pueden eliminar divisiones.
9. Existe vista previa del resultado.
10. El usuario entiende visualmente qué archivos se generarán.
11. Existe ayuda contextual.
12. Las secciones se guardan en el estado del proyecto.
```

---

# Instrucción final para Codex

Implementar la Fase 2 creando el sistema de Secciones Visuales. Cada documento debe iniciar con una sección automática que contenga todas las páginas. Entre páginas deben existir zonas de inserción para crear divisiones visuales. Cada división genera nuevas secciones con nombre, color, cantidad de páginas y acciones propias. Las secciones deben poder renombrarse, fusionarse, reordenarse, colapsarse y eliminar sus divisiones. Todas las páginas deben pertenecer siempre a una sección. Mostrar ayudas visuales, leyendas de color, vista previa del resultado final y explicaciones contextuales para que el usuario entienda claramente qué archivos se generarán antes de exportar.

