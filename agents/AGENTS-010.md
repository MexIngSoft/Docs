Perfecto. La **Fase 4** es donde comenzamos a trabajar con algo que prácticamente ninguna herramienta de PDF maneja bien: **las páginas descartadas como un estado visual y reversible**, no como una eliminación inmediata.

Esto es importante porque el usuario muchas veces elimina páginas por error o quiere comparar resultados antes de exportar. Por eso, en DocuCore, una página descartada no desaparece; entra a un estado temporal controlado.

# FASE 4 — Sistema de Páginas Descartadas y Papelera Inteligente

## Objetivo

Permitir que el usuario descarte páginas temporalmente sin eliminarlas de forma definitiva.

El sistema debe comportarse como un editor profesional:

```text
Descartar ≠ Eliminar definitivamente
```

Una página descartada:

```text
- Sigue existiendo.
- Sigue perteneciendo al proyecto.
- Puede restaurarse.
- Puede visualizarse.
- Puede ocultarse temporalmente.
- Puede exportarse o ignorarse según la configuración.
```

---

# Problema actual

En la mayoría de herramientas PDF:

```text
Eliminar página
```

significa:

```text
Desaparecer inmediatamente.
```

Esto provoca:

```text
- Errores difíciles de corregir.
- Pérdida de trabajo.
- Necesidad de volver a cargar el documento.
- Mala experiencia de usuario.
```

---

# Nuevo concepto

Toda página puede existir en dos estados:

## Estado activo

```text
La página participa en el resultado final.
```

## Estado descartado

```text
La página permanece en el proyecto pero no participa en el resultado final.
```

---

# Flujo visual

Antes:

```text
Página 1
Página 2
Página 3
Página 4
```

Usuario descarta:

```text
Página 2
```

Resultado:

```text
Página 1

🗑 Página 2 (Descartada)

Página 3
Página 4
```

---

# Regla principal

Descartar una página nunca debe eliminarla inmediatamente.

La eliminación permanente será una acción diferente.

---

# Apariencia visual

Una página descartada debe verse claramente diferente.

---

## Color

Utilizar:

```text
Grises suaves
```

Ejemplo:

```text
Fondo gris claro
Borde gris
Texto gris oscuro
```

---

## Opacidad

Reducir ligeramente la visibilidad.

Ejemplo:

```text
100% → Activa
40%-60% → Descartada
```

---

## Indicador superior

Mostrar:

```text
🗑 Página descartada
```

---

## Etiqueta flotante

Ejemplo:

```text
┌─────────────────────┐
│ 🗑 DESCARTADA       │
│                     │
│     Página 12       │
│                     │
└─────────────────────┘
```

---

# Acciones disponibles

Una página descartada debe mostrar:

```text
Restaurar
Eliminar definitivamente
Ver detalles
```

---

# Restaurar página

Al restaurar:

Antes:

```text
🗑 Página descartada
```

Después:

```text
Página activa
```

Debe recuperar:

```text
Color de sección
Posición
Etiquetas
Notas
OCR
```

---

# Eliminación permanente

Acción separada.

Mostrar confirmación:

```text
Esta acción eliminará la página definitivamente.

¿Deseas continuar?
```

Opciones:

```text
Cancelar
Eliminar definitivamente
```

---

# Papelera inteligente

Crear una zona especial.

Ejemplo:

```text
Páginas descartadas (3)
```

---

# Panel de papelera

Al abrir:

```text
🗑 Papelera

Página 4
Página 12
Página 18
```

---

# Acciones masivas

Permitir:

```text
Restaurar todas
Eliminar todas
Seleccionar varias
```

---

# Caso práctico 1

Documento:

```text
Página 1
Página 2
Página 3
Página 4
Página 5
```

Descartar:

```text
Página 2
Página 4
```

Resultado:

```text
Página 1

🗑 Página 2

Página 3

🗑 Página 4

Página 5
```

---

# Caso práctico 2

Expediente jurídico

```text
200 páginas
```

Usuario elimina anexos.

Resultado:

```text
25 páginas descartadas
```

No desaparecen.

Pueden restaurarse.

---

# Caso práctico 3

OCR incorrecto

Usuario descarta:

```text
Página escaneada ilegible
```

Posteriormente:

```text
Restaurar
```

para volver a procesarla.

---

# Visualización en secciones

Las páginas descartadas deben seguir mostrando:

```text
Color de sección
```

pero atenuado.

Ejemplo:

```text
Contrato → Azul
```

Página descartada:

```text
Azul grisáceo
```

---

# Numeración

La numeración original nunca cambia.

Ejemplo:

```text
Página 1
Página 2 (Descartada)
Página 3
Página 4
```

No renumerar.

---

# Resultado final

Antes de exportar:

Mostrar:

```text
Total páginas: 150

Activas: 135

Descartadas: 15
```

---

# Vista previa de exportación

Mostrar:

```text
Estas páginas no serán incluidas:

Página 12
Página 18
Página 44
```

---

# Filtro rápido

Agregar:

```text
☑ Mostrar páginas descartadas
```

Si se desactiva:

```text
Las páginas descartadas desaparecen visualmente.
```

Pero siguen existiendo.

---

# Ayuda contextual

Al descartar una página por primera vez:

Mostrar:

```text
Las páginas descartadas no se eliminan.

Permanecerán disponibles para restaurarlas más adelante o eliminarlas definitivamente desde la papelera.
```

---

# Indicadores visuales

## Página activa

```text
Sin indicador
```

## Página descartada

```text
🗑
```

---

## Varias páginas descartadas

Mostrar contador.

Ejemplo:

```text
🗑 15 páginas descartadas
```

---

# Persistencia

Guardar:

```ts
discarded: boolean
discardedAt?: string
discardedBy?: string
```

---

# Estructura técnica

```ts
type PageState = {
  pageId: string;
  discarded: boolean;
  discardedAt?: string;
};
```

---

# Papelera

```ts
type TrashState = {
  discardedPages: string[];
};
```

---

# Estado global

```ts
type DiscardWorkspaceState = {
  showDiscardedPages: boolean;
  discardedCount: number;
};
```

---

# Accesibilidad

No depender únicamente del color.

Toda página descartada debe mostrar:

```text
Ícono
Texto
Color
```

---

# Ayudas visuales obligatorias

Cuando una página sea descartada:

Mostrar animación suave:

```text
Página activa
↓
Página atenuada
↓
Etiqueta DESCARTADA
```

Para que el usuario entienda qué ocurrió.

---

# Criterios de aceptación

La fase queda terminada cuando:

```text
1. Existe estado descartado.
2. Descartar no elimina páginas.
3. Las páginas descartadas tienen apariencia diferenciada.
4. Existe restauración individual.
5. Existe eliminación permanente.
6. Existe papelera inteligente.
7. Existe contador de páginas descartadas.
8. Existe filtro para mostrarlas u ocultarlas.
9. Se conserva la numeración original.
10. El usuario recibe ayuda contextual.
11. El estado se guarda en el proyecto.
12. La exportación ignora páginas descartadas.
```

---

# Instrucción final para Codex

Implementar la Fase 4 creando un sistema de páginas descartadas basado en estados y no en eliminación inmediata. Las páginas descartadas deben permanecer dentro del proyecto, mostrarse visualmente diferenciadas mediante colores, etiquetas e indicadores, y poder restaurarse o eliminarse definitivamente desde una papelera inteligente. Mantener la numeración original, conservar todas las propiedades de la página y permitir ocultar o mostrar páginas descartadas mediante filtros. Agregar ayudas visuales, mensajes explicativos, contador de páginas descartadas y resumen previo a la exportación indicando qué páginas no serán incluidas en el resultado final.
