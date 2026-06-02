Perfecto. La **Fase 7** introduce una de las funcionalidades más potentes para documentos complejos: **Marcadores (Bookmarks), Índices y Navegación Inteligente**.

Mientras las fases anteriores se enfocan en páginas y secciones creadas por el usuario, esta fase aprovecha la estructura interna del documento o permite construirla manualmente.

Esta funcionalidad es especialmente valiosa para:

```text
Expedientes judiciales
Contratos extensos
Libros
Manuales
Tesis
Documentación técnica
PDFs escaneados con OCR
```

Porque permite navegar cientos o miles de páginas sin perderse.

# FASE 7 — Sistema de Marcadores, Índices y Navegación Inteligente

## Objetivo

Permitir que el usuario navegue, organice, divida y estructure documentos mediante marcadores.

Los marcadores deben funcionar como una tabla de contenido interactiva.

El usuario debe poder:

```text
Ver marcadores existentes.
Crear nuevos marcadores.
Editar marcadores.
Eliminar marcadores.
Mover marcadores.
Usar marcadores para dividir documentos.
Usar marcadores para navegar.
Generar índices automáticos.
```

---

# Problema actual

Documento:

```text
1200 páginas
```

Usuario necesita localizar:

```text
Capítulo 4
Anexo B
Prueba 17
Contrato principal
```

Sin marcadores:

```text
Debe buscar manualmente.
```

---

# Concepto principal

Un marcador representa:

```text
Una referencia a una página o grupo de páginas.
```

Ejemplo:

```text
Capítulo 1
Capítulo 2
Capítulo 3
Anexos
```

---

# Panel de marcadores

Agregar panel lateral:

```text
📚 Marcadores

▼ Contrato
  Página 1

▼ Cláusulas
  Página 15

▼ Anexos
  Página 80
```

---

# Navegación rápida

Al hacer clic:

```text
Contrato
```

El visor debe desplazarse automáticamente.

Ejemplo:

```text
Página 1
```

---

# Detección automática

Cuando el PDF contiene bookmarks.

Detectar:

```text
Títulos
Capítulos
Subcapítulos
Índice interno
```

---

# Ejemplo

PDF original:

```text
Capítulo 1
Capítulo 2
Capítulo 3
```

Resultado:

```text
▼ Capítulo 1
▼ Capítulo 2
▼ Capítulo 3
```

---

# Ayuda contextual

Mostrar:

```text
Se detectaron 15 marcadores automáticamente.

Puedes utilizarlos para navegar o dividir el documento.
```

---

# Caso sin marcadores

Mostrar:

```text
No se encontraron marcadores.
```

y ofrecer:

```text
Crear marcadores manualmente
```

---

# Crear marcador manual

Acción:

```text
Agregar marcador
```

---

# Flujo

Usuario selecciona:

```text
Página 45
```

Crear:

```text
Nuevo marcador
```

Resultado:

```text
▼ Nuevo marcador
Página 45
```

---

# Renombrar marcador

Antes:

```text
Nuevo marcador
```

Después:

```text
Prueba documental
```

---

# Marcadores jerárquicos

Permitir:

```text
Contrato

├── Cláusula 1
├── Cláusula 2
├── Cláusula 3
```

---

# Niveles

Soportar:

```text
Nivel 1
Nivel 2
Nivel 3
Nivel 4
```

---

# Visualización

Ejemplo:

```text
▼ Contrato

   ▼ Cláusulas

      ▼ Cláusula 1

      ▼ Cláusula 2
```

---

# Arrastrar marcadores

Permitir:

```text
Mover
```

Ejemplo:

Antes:

```text
Anexos
Pruebas
```

Después:

```text
Pruebas
Anexos
```

---

# Reordenación automática

Al mover marcadores.

Actualizar:

```text
Jerarquía
Orden
Posición
```

---

# Dividir por marcadores

Funcionalidad clave.

Ejemplo:

```text
Capítulo 1
Capítulo 2
Capítulo 3
```

Resultado:

```text
Archivo 1
Capítulo 1

Archivo 2
Capítulo 2

Archivo 3
Capítulo 3
```

---

# Vista previa

Mostrar:

```text
Se crearán:

Capítulo 1.pdf
Capítulo 2.pdf
Capítulo 3.pdf
```

---

# División por nivel

Ejemplo:

```text
Contrato
  Cláusula 1
  Cláusula 2

Anexos
  Anexo A
  Anexo B
```

Dividir por:

```text
Nivel 1
```

Resultado:

```text
Contrato.pdf
Anexos.pdf
```

---

# División por nivel 2

Resultado:

```text
Cláusula 1.pdf
Cláusula 2.pdf
Anexo A.pdf
Anexo B.pdf
```

---

# Marcadores creados mediante OCR

Si existe OCR.

Detectar:

```text
CAPÍTULO
ANEXO
SECCIÓN
ARTÍCULO
```

---

# Ejemplo

Texto:

```text
CAPÍTULO III
```

Crear sugerencia:

```text
¿Crear marcador?
```

---

# Marcadores sugeridos

Panel:

```text
Sugerencias encontradas

CAPÍTULO I
CAPÍTULO II
CAPÍTULO III
```

---

# Confirmación masiva

Botón:

```text
Crear todos
```

---

# Índice visual

Generar:

```text
ÍNDICE

Contrato ............ 1

Anexos .............. 50

Pruebas ............. 80
```

---

# Índice editable

Permitir:

```text
Cambiar nombre
Cambiar orden
Eliminar
```

---

# Exportar índice

Formatos:

```text
PDF
DOCX
TXT
JSON
```

---

# Generación automática de índice

Basada en:

```text
Marcadores
OCR
Secciones
```

---

# Búsqueda de marcadores

Campo:

```text
Buscar marcador
```

Ejemplo:

```text
Anexo
```

Resultado:

```text
Anexo A
Anexo B
Anexo C
```

---

# Colores de marcadores

Heredar:

```text
Color de sección
```

---

# Vista compacta

Mostrar:

```text
📚 15 marcadores
```

---

# Vista expandida

Mostrar:

```text
Jerarquía completa
```

---

# Indicadores visuales

Marcador normal:

```text
📑
```

---

Marcador OCR:

```text
🔍
```

---

Marcador manual:

```text
✍
```

---

Marcador automático:

```text
⚙
```

---

# Ayudas visuales

Cuando un marcador es seleccionado.

Resaltar:

```text
Página asociada
```

---

# Ejemplo

Seleccionar:

```text
Capítulo 2
```

Resultado:

```text
Página resaltada
Borde temporal
Scroll automático
```

---

# Persistencia

Guardar:

```ts
bookmarkId
title
pageId
parentId
level
source
```

---

# Estructura técnica

```ts
type Bookmark = {
  id: string;
  title: string;
  pageId: string;
  parentId?: string;
  level: number;
  source:
    | "pdf"
    | "manual"
    | "ocr"
    | "generated";
};
```

---

# Estado global

```ts
type BookmarkWorkspaceState = {
  bookmarks: Bookmark[];
  selectedBookmarkId?: string;
  searchTerm: string;
};
```

---

# Accesibilidad

Todo marcador debe mostrar:

```text
Icono
Nombre
Página
Nivel
```

No depender únicamente del color.

---

# Casos prácticos

## Caso 1

Libro

```text
20 capítulos
```

Resultado:

```text
20 marcadores automáticos.
```

---

## Caso 2

Expediente jurídico

```text
Demanda
Contestación
Pruebas
Sentencia
```

Resultado:

```text
Índice navegable.
```

---

## Caso 3

OCR

Documento escaneado.

Detectar:

```text
ANEXO A
ANEXO B
ANEXO C
```

Generar:

```text
Marcadores sugeridos.
```

---

## Caso 4

División

Seleccionar:

```text
Dividir por marcadores.
```

Resultado:

```text
10 archivos.
```

---

# Ayuda contextual inicial

Mostrar:

```text
Los marcadores funcionan como una tabla de contenido interactiva.

Puedes utilizarlos para navegar rápidamente, generar índices o dividir documentos complejos sin necesidad de localizar manualmente las páginas.
```

---

# Criterios de aceptación

La fase queda terminada cuando:

```text
1. Se detectan marcadores PDF existentes.
2. Se pueden crear marcadores manuales.
3. Se pueden editar y eliminar.
4. Se soporta jerarquía multinivel.
5. Se soporta arrastrar y reordenar.
6. Existe navegación automática.
7. Se soporta división por marcadores.
8. Se generan índices.
9. Se soportan marcadores OCR.
10. Existe búsqueda.
11. Existe vista previa del resultado.
12. Toda la estructura se guarda en el proyecto.
```

---

# Instrucción final para Codex

Implementar la Fase 7 creando un sistema completo de marcadores e índices. Detectar automáticamente bookmarks existentes en PDFs, permitir crear marcadores manuales y generar marcadores sugeridos mediante OCR. Soportar estructuras jerárquicas multinivel, navegación automática, búsqueda, reordenación por arrastre y división de documentos utilizando marcadores. Incorporar generación de índices editables y exportables, ayudas visuales, resaltado de páginas asociadas, panel lateral de navegación y persistencia completa de la estructura dentro del proyecto.
