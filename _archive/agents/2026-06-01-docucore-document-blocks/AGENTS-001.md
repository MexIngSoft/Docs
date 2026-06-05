Esa idea resuelve un problema importante: cuando existen muchos bloques documentales, las líneas completas terminan ocupando demasiado espacio visual. Yo la documentaría como una evolución del sistema de agrupación:

# 11. Sistema Adaptativo de Líneas de Agrupación

## Problema

Cuando existen pocos documentos, las líneas de agrupación completas son útiles porque permiten visualizar claramente el inicio y fin de cada bloque.

Sin embargo, cuando el usuario genera muchos bloques (5 o más), las líneas completas comienzan a saturar visualmente el Workspace.

---

## Comportamiento Adaptativo

### Modo Expandido

Cuando existan entre 1 y 4 bloques:

* Mostrar las líneas completas.
* Mostrar nombre del documento.
* Mostrar rango de páginas.
* Mostrar color identificador.

Ejemplo:

Contrato.pdf
│
├ Página 1
├ Página 2
├ Página 3
│

---

### Modo Compacto

Cuando existan 5 o más bloques:

* Las líneas deben comprimirse automáticamente.
* Deben conservar el color identificador.
* Deben seguir siendo visibles.
* Deben ocupar mucho menos espacio horizontal.

En este modo:

* El nombre del documento se oculta.
* El rango de páginas se oculta.
* Solo permanece una barra gruesa y coloreada.

Ejemplo:

█
█
█

---

## Expansión Temporal

Cuando el usuario:

* Pase el cursor sobre una línea.
* Haga clic sobre una línea.
* Toque una línea en dispositivos táctiles.

La línea debe expandirse temporalmente mostrando:

* Nombre del documento.
* Rango de páginas.
* Cantidad de páginas.
* Acciones rápidas.

Ejemplo:

Contrato Cliente A
Páginas 1-12
12 páginas

---

## Fijar Expansión

El usuario podrá anclar cualquier línea.

Al anclar:

* La línea permanecerá expandida.
* No volverá al modo compacto.
* Mantendrá siempre visible la información.

Esto permite que el usuario decida qué documentos desea monitorear constantemente.

---

# 12. Colores Compartidos en Separadores

Los separadores entre dos documentos deben mostrar visualmente ambos documentos.

No deben utilizar un único color.

Deben dividirse exactamente en dos segmentos.

Ejemplo:

Azul | Verde

Donde:

* La mitad izquierda representa el documento anterior.
* La mitad derecha representa el documento siguiente.

---

## Separador de Inicio

Si es el primer documento:

Solo utiliza el color del documento.

Ejemplo:

Azul

"Aquí inicia Documento 1"

---

## Separador Intermedio

Si existe un documento antes y otro después:

Mostrar ambos colores.

Ejemplo:

Azul | Verde

"Aquí termina Contrato.pdf"
"Aquí inicia Factura.pdf"

---

## Separador Final

Si representa el fin absoluto:

Mostrar únicamente el color del documento que termina.

Ejemplo:

Verde

"Fin de Factura.pdf"

---

# 13. Navegación Visual Rápida

Al pasar el cursor sobre un color:

El sistema debe resaltar inmediatamente:

* Todas las páginas del bloque.
* Su línea de agrupación.
* Sus separadores.
* Su nombre.

De esta manera el usuario identifica instantáneamente el alcance completo del documento.

---

# 14. Objetivo UX

Cuando existan decenas de documentos dentro del Workspace:

* El usuario no debe sentirse saturado visualmente.
* Los bloques deben seguir siendo identificables.
* El color debe convertirse en el identificador principal.
* Las líneas completas solo deben mostrarse cuando sean necesarias.
* El usuario debe poder expandir o fijar cualquier bloque individualmente.

También agregaría una regla adicional: si el usuario tiene más de 10 documentos, mostrar un mini mapa lateral tipo "índice de documentos" con los mismos colores. Al hacer clic en un color, el Workspace se desplaza automáticamente al bloque correspondiente. Esto facilita mucho trabajar con expedientes grandes o cortes masivos de PDF.
