Sí. Aquí está la **Fase 1** ya detallada para ponerla en Codex.

# FASE 1 — Nuevo modelo UX para Dividir PDF

## Objetivo

Reemplazar el panel actual basado en radio buttons por una experiencia visual más clara, moderna y fácil de entender.

La herramienta “Dividir PDF” no debe sentirse como un formulario largo. Debe sentirse como un editor visual donde el usuario pueda ver el documento, elegir el método de división y comprender qué resultado obtendrá antes de aplicar cambios.

---

## Problema actual

Actualmente el panel muestra opciones como:

```text
○ Por rango
○ Páginas seleccionadas
○ Cada X páginas
○ Por tamaño
○ Por marcadores
○ Una página por archivo
○ Detectar separadores
```

Este modelo tiene varios problemas:

```text
- Se ve cargado.
- Parece un formulario antiguo.
- No ayuda visualmente al usuario.
- No muestra claramente qué pasará con el documento.
- Obliga al usuario a imaginar el resultado.
- Ocupa demasiado espacio en el drawer.
```

---

## Cambio requerido

Eliminar el listado de radio buttons como forma principal de navegación.

Reemplazarlo por un sistema de pestañas o botones de modo.

Nueva estructura recomendada:

```text
Dividir PDF

[ Secciones ] [ Páginas ] [ Marcadores ] [ Automático ] [ Avanzado ]
```

---

## Modos principales

### 1. Secciones

Para dividir el PDF marcando visualmente bloques de páginas.

Uso esperado:

```text
Página 1
Página 2
[ Crear división aquí ]
Página 3
Página 4
```

Resultado:

```text
Archivo 1: páginas 1-2
Archivo 2: páginas 3-4
```

---

### 2. Páginas

Para dividir usando páginas seleccionadas manualmente.

Ejemplos que debe explicar la interfaz:

```text
1, 3, 5
```

Significa:

```text
Crear archivos o seleccionar páginas 1, 3 y 5.
```

Ejemplo con rangos:

```text
1-5
```

Significa:

```text
Usar páginas 1, 2, 3, 4 y 5.
```

Ejemplo combinado:

```text
1, 3, 5-8, 12
```

Significa:

```text
Usar páginas 1, 3, 5, 6, 7, 8 y 12.
```

---

### 3. Marcadores

Para dividir el PDF usando marcadores internos del documento.

Ejemplo:

```text
Capítulo 1
Capítulo 2
Anexos
```

Resultado:

```text
Archivo 1: Capítulo 1
Archivo 2: Capítulo 2
Archivo 3: Anexos
```

Si el PDF no tiene marcadores, mostrar:

```text
No se encontraron marcadores en este documento.
```

---

### 4. Automático

Para dividir el documento usando reglas.

Ejemplos:

```text
Cada 5 páginas
Cada 10 páginas
Cada 20 páginas
```

Resultado visual esperado:

```text
Archivo 1: páginas 1-5
Archivo 2: páginas 6-10
Archivo 3: páginas 11-15
```

---

### 5. Avanzado

Para opciones menos comunes o más técnicas.

Debe incluir:

```text
- Por tamaño
- Detectar separadores
- Una página por archivo
- División por texto detectado
- División por páginas en blanco
```

---

## Regla de visualización

El drawer no debe mostrar todas las configuraciones al mismo tiempo.

Debe mostrar únicamente:

```text
- Título de la herramienta.
- Tabs o botones de modo.
- Explicación corta del modo activo.
- Controles específicos del modo activo.
- Resumen del resultado.
- Botón aplicar cambios.
```

---

## Estructura visual recomendada

```text
┌────────────────────────────┐
│ Dividir PDF                │
│ Elige cómo quieres dividir │
├────────────────────────────┤
│ Secciones | Páginas        │
│ Marcadores | Automático    │
│ Avanzado                   │
├────────────────────────────┤
│ Explicación del modo       │
│ Controles del modo         │
│ Vista/resumen del resultado│
├────────────────────────────┤
│ [Aplicar cambios]          │
│ [Usar otra herramienta]    │
└────────────────────────────┘
```

---

## Ayuda contextual obligatoria

Cada modo debe incluir una explicación breve y ejemplos adaptados a su función.

No usar una sola explicación genérica para todos.

Ejemplo para “Secciones”:

```text
Crea divisiones visuales entre páginas. Cada sección se convertirá en un archivo separado.
```

Ejemplo para “Páginas”:

```text
Escribe páginas separadas por comas o rangos con guion. Ejemplo: 1, 3, 5-8.
```

Ejemplo para “Automático”:

```text
Divide el documento en bloques iguales. Por ejemplo, cada 10 páginas.
```

---

## Ayudas visuales

Cuando el modo lo requiera, el sistema debe mostrar ayudas visuales sobre el preview.

Ejemplos:

```text
- Marcos de colores para secciones.
- Líneas entre páginas para puntos de división.
- Etiquetas de “Archivo 1”, “Archivo 2”, “Archivo 3”.
- Páginas descartadas en gris.
- Indicadores de páginas seleccionadas.
- Vista previa del resultado antes de aplicar.
```

---

## Ejemplo visual para secciones

```text
Archivo 1 · Azul
┌─────────────┐
│ Página 1    │
└─────────────┘
┌─────────────┐
│ Página 2    │
└─────────────┘

──────── División ────────

Archivo 2 · Verde
┌─────────────┐
│ Página 3    │
└─────────────┘
┌─────────────┐
│ Página 4    │
└─────────────┘
```

---

## Ejemplo visual para páginas seleccionadas

```text
Página 1  ✓ Seleccionada
Página 2
Página 3  ✓ Seleccionada
Página 4
Página 5  ✓ Seleccionada
```

---

## Ejemplo visual para automático

```text
Cada 3 páginas

Archivo 1: Página 1 - Página 3
Archivo 2: Página 4 - Página 6
Archivo 3: Página 7 - Página 9
```

---

## Resumen del resultado

Antes de aplicar cambios, siempre debe mostrarse un resumen.

Ejemplo:

```text
Se crearán 3 archivos:

Archivo 1: páginas 1-10
Archivo 2: páginas 11-20
Archivo 3: páginas 21-40
```

Si existe algún error:

```text
Hay rangos inválidos.
La página 50 no existe.
El rango 10-5 está invertido.
```

---

## Validaciones iniciales

El sistema debe validar:

```text
- Que existan páginas cargadas.
- Que el modo seleccionado tenga configuración válida.
- Que los rangos no excedan el total de páginas.
- Que no se aplique una división vacía.
- Que el usuario vea un resumen antes de aplicar.
```

---

## Estado técnico recomendado

```ts
type SplitMode =
  | "sections"
  | "pages"
  | "bookmarks"
  | "automatic"
  | "advanced";

type SplitWorkspaceState = {
  activeMode: SplitMode;
  totalPages: number;
  showHelp: boolean;
  showPreviewGuides: boolean;
  resultSummary: SplitResultSummary | null;
};
```

---

## Configuración centralizada de modos

```ts
type SplitModeConfig = {
  key: SplitMode;
  label: string;
  description: string;
  helpText: string;
  examples: string[];
  enabled: boolean;
};
```

Ejemplo:

```ts
const splitModes: SplitModeConfig[] = [
  {
    key: "sections",
    label: "Secciones",
    description: "Divide visualmente el PDF por bloques.",
    helpText: "Crea divisiones entre páginas. Cada bloque será un archivo independiente.",
    examples: [
      "Crear una división entre página 2 y 3",
      "Crear secciones llamadas Contrato, Anexos y Evidencias"
    ],
    enabled: true
  },
  {
    key: "pages",
    label: "Páginas",
    description: "Divide usando páginas específicas o rangos.",
    helpText: "Usa comas para páginas separadas y guiones para rangos.",
    examples: [
      "1, 3, 5",
      "1-10",
      "1, 3, 5-8, 12"
    ],
    enabled: true
  }
];
```

---

## Responsive

En escritorio:

```text
Mostrar tabs horizontales o botones tipo tarjeta.
```

En móvil:

```text
Mostrar selector compacto tipo botones apilados o menú horizontal desplazable.
```

No usar un select tradicional si vuelve difícil entender la acción.

---

## Criterios de aceptación

La fase 1 se considera lista cuando:

```text
1. Ya no se usan radio buttons como navegación principal.
2. Existen modos visuales: Secciones, Páginas, Marcadores, Automático y Avanzado.
3. Solo se muestran los controles del modo activo.
4. Cada modo tiene explicación clara.
5. Cada modo tiene ejemplos adaptados.
6. El preview puede recibir ayudas visuales según el modo.
7. Existe resumen del resultado antes de aplicar.
8. Se validan errores básicos antes de aplicar cambios.
9. El drawer se ve más limpio y menos cargado.
10. El usuario entiende qué resultado obtendrá antes de ejecutar la división.
```

---

## Instrucción final para Codex

Implementar la Fase 1 del nuevo modelo UX para “Dividir PDF”. Reemplazar el listado de radio buttons por un sistema de modos visuales usando tabs o botones: Secciones, Páginas, Marcadores, Automático y Avanzado. El drawer debe mostrar únicamente la configuración del modo activo, una explicación breve, ejemplos prácticos adaptados, ayudas visuales cuando corresponda y un resumen del resultado antes de aplicar cambios. Preparar el estado técnico con `SplitMode`, `SplitWorkspaceState` y una configuración centralizada `splitModes`. No ejecutar cambios sin validar la configuración y sin mostrar al usuario qué archivos o secciones se crearán.
