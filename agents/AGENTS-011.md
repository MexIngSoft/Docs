Perfecto. La **Fase 5** está directamente relacionada con la Fase 4, pero tiene un objetivo distinto. Mientras la Fase 4 define qué es una página descartada y cómo se administra, la Fase 5 define **cómo el usuario visualiza o esconde esas páginas durante su trabajo**.

Esta fase es muy importante porque en expedientes grandes (100, 500 o incluso 2,000 páginas), mantener visibles todas las páginas descartadas puede volver el workspace difícil de usar.

# FASE 5 — Sistema de Visibilidad de Páginas Descartadas

## Objetivo

Permitir que el usuario decida si desea visualizar o esconder las páginas descartadas dentro del workspace.

Las páginas descartadas seguirán existiendo dentro del proyecto, pero el usuario podrá elegir si desea:

```text
Verlas
Ocultarlas
Mostrarlas parcialmente
Filtrarlas
```

sin afectar el resultado del documento.

---

# Relación con Fase 4

La Fase 4 creó:

```text
Estado descartado
Papelera inteligente
Restauración
Eliminación permanente
```

La Fase 5 agrega:

```text
Control visual
Filtros
Persistencia de visualización
Modos de trabajo
```

---

# Problema actual

Supongamos:

```text
Documento de 500 páginas
```

Usuario descarta:

```text
120 páginas
```

Visualmente tendría:

```text
Página 1
Página 2
🗑 Página descartada
🗑 Página descartada
🗑 Página descartada
Página 3
Página 4
```

Durante cientos de páginas.

Esto dificulta:

```text
Navegar
Editar
Organizar
Dividir
```

---

# Nuevo concepto

Las páginas descartadas tienen dos estados independientes:

## Estado documental

```text
Activa
Descartada
```

---

## Estado visual

```text
Visible
Oculta
```

---

# Ejemplo

Página:

```text
Página 12
```

Puede estar:

```text
Descartada
Visible
```

o

```text
Descartada
Oculta
```

---

# Control principal

Agregar en la barra superior:

```text
☑ Mostrar páginas descartadas
```

---

# Estado activado

```text
☑ Mostrar páginas descartadas
```

Visual:

```text
Página 1

🗑 Página 2

Página 3

🗑 Página 4

Página 5
```

---

# Estado desactivado

```text
☐ Mostrar páginas descartadas
```

Visual:

```text
Página 1

Página 3

Página 5
```

Las páginas descartadas desaparecen del workspace.

---

# Indicador obligatorio

Aunque estén ocultas:

Mostrar:

```text
🗑 2 páginas ocultas
```

---

# Indicadores intermedios

Cuando varias páginas ocultas estén entre páginas activas.

Ejemplo:

```text
Página 10

──────────────────
🗑 5 páginas ocultas
[ Mostrar ]
──────────────────

Página 16
```

---

# Expansión temporal

Al dar clic:

```text
Mostrar
```

Visual:

```text
Página 10

🗑 Página 11
🗑 Página 12
🗑 Página 13
🗑 Página 14
🗑 Página 15

Página 16
```

---

# Colapsar nuevamente

Botón:

```text
Ocultar nuevamente
```

---

# Caso práctico 1

Documento:

```text
100 páginas
```

Usuario descarta:

```text
20 páginas
```

Modo oculto:

```text
Workspace limpio
```

Modo visible:

```text
Workspace completo
```

---

# Caso práctico 2

Expediente jurídico

```text
400 páginas
```

Anexos descartados:

```text
80 páginas
```

Visual:

```text
🗑 80 páginas ocultas
```

sin llenar la pantalla.

---

# Caso práctico 3

OCR

Usuario descarta:

```text
Páginas ilegibles
```

Las oculta temporalmente.

Posteriormente:

```text
Mostrar descartadas
```

para volver a revisarlas.

---

# Modos de visualización

## Modo completo

Mostrar:

```text
Todas las páginas.
```

---

## Modo limpio

Mostrar:

```text
Solo páginas activas.
```

---

## Modo compacto

Mostrar:

```text
Página 1

🗑 15 páginas descartadas

Página 16
```

---

# Selector de vista

Agregar:

```text
Vista de descartadas

● Completa
● Compacta
● Oculta
```

---

# Persistencia

La preferencia debe guardarse.

Ejemplo:

Usuario selecciona:

```text
Oculta
```

Cierra sesión.

Al volver:

```text
Continúa oculta.
```

---

# Configuración global

Guardar:

```ts
showDiscardedPages
discardedViewMode
```

---

# Configuración por herramienta

Puede sobrescribirse.

Ejemplo:

```text
Dividir PDF → Ocultas
OCR → Visibles
```

---

# Resumen visual

Siempre mostrar:

```text
Total páginas: 250

Activas: 210

Descartadas: 40
```

---

# Leyenda

Mostrar:

```text
🗑 Página descartada visible

🗑 10 páginas ocultas

✓ Página activa
```

---

# Ayuda contextual

Primera vez:

```text
Las páginas descartadas pueden ocultarse para facilitar el trabajo en documentos grandes.

Ocultarlas no las elimina ni modifica el resultado del proyecto.
```

---

# Navegación rápida

Agregar filtro:

```text
Mostrar solo descartadas
```

Visual:

```text
Página 12
Página 25
Página 33
Página 41
```

---

# Restauración masiva

Cuando el usuario filtra descartadas.

Permitir:

```text
Restaurar todas
Restaurar selección
```

---

# Exportación

La visibilidad nunca afecta exportación.

Ejemplo:

```text
Visible → No exportar
Oculta → No exportar
```

Lo que manda es:

```text
Estado documental
```

---

# Estado visual recomendado

## Visible

```text
display: block
```

---

## Compacto

```text
Bloque resumido
```

---

## Oculto

```text
No renderizar preview
```

---

# Estructura técnica

```ts
type DiscardedViewMode =
  | "visible"
  | "compact"
  | "hidden";
```

---

# Estado global

```ts
type DiscardVisibilityState = {
  showDiscardedPages: boolean;
  discardedViewMode: DiscardedViewMode;
};
```

---

# Persistencia

Guardar:

```ts
localStorage
perfil de usuario
proyecto
```

---

# Accesibilidad

No depender únicamente de ocultar.

Mostrar:

```text
Contador
Texto
Indicador
```

---

# Ayudas visuales obligatorias

Cuando se ocultan páginas.

Mostrar transición:

```text
Página visible
↓
Agrupación
↓
🗑 10 páginas ocultas
```

Para que el usuario entienda qué ocurrió.

---

# Criterios de aceptación

La fase queda terminada cuando:

```text
1. Las páginas descartadas pueden mostrarse u ocultarse.
2. Existe modo visible.
3. Existe modo compacto.
4. Existe modo oculto.
5. Las preferencias se guardan.
6. Existe contador de páginas descartadas.
7. Existe leyenda visual.
8. Existe filtro para ver solo descartadas.
9. Existe restauración masiva.
10. La visibilidad no afecta exportación.
11. El usuario recibe ayuda contextual.
12. El workspace se mantiene limpio en documentos grandes.
```

---

# Instrucción final para Codex

Implementar la Fase 5 creando un sistema de visibilidad para páginas descartadas independiente de su estado documental. Permitir tres modos de visualización: visible, compacto y oculto. Agregar controles globales para mostrar u ocultar páginas descartadas, agrupaciones inteligentes cuando existan múltiples páginas descartadas consecutivas, filtros para mostrar únicamente páginas descartadas y herramientas de restauración masiva. Guardar las preferencias de visualización en el proyecto y en el perfil del usuario. Garantizar que la visibilidad no afecte la exportación ni el resultado documental y proporcionar ayudas visuales y mensajes explicativos para que el usuario comprenda claramente qué páginas están ocultas y por qué.
