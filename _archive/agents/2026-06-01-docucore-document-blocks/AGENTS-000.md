Estas instrucciones están mejor estructuradas para que Codex pueda implementarlas correctamente sin perder detalles funcionales:

# Workspace – Sistema Visual de Corte y División de Documentos

## Objetivo

Cuando un usuario cargue múltiples documentos PDF dentro del Workspace, el sistema debe permitir identificar visualmente dónde inicia y termina cada documento, dividir documentos en nuevos bloques, reorganizarlos y exportarlos posteriormente como archivos independientes.

---

# 1. Separadores automáticos al cargar múltiples documentos

Cuando se carguen dos o más documentos PDF:

* Antes de la primera página de cada documento debe insertarse automáticamente una hoja/separador visual.
* Esta hoja debe distinguirse claramente de una página normal.
* Debe utilizar un color de alto contraste (rojo inicialmente).
* No debe formar parte del PDF final.
* Su única función es indicar límites documentales dentro del Workspace.

Ejemplo:

[Separador]
"Aquí inicia Documento 1"

Página 1
Página 2
Página 3

[Separador]
"Aquí termina Documento 1 e inicia Documento 2"

Página 4
Página 5
Página 6

[Separador]
"Aquí termina Documento 2"

---

# 2. Acciones disponibles sobre un separador

Al posicionar el cursor sobre un separador debe aparecer una barra contextual con:

* Eliminar separador
* Convertir todos los documentos en un único documento
* Dividir documento
* Renombrar bloque
* Cambiar color identificador

Si el usuario elimina un separador:

* Los bloques adyacentes se fusionan.
* El sistema debe mostrar confirmación visual.
* El nuevo bloque resultante se comportará como un único documento.

---

# 3. Inserción manual de separadores

El usuario debe poder insertar separadores manualmente entre dos páginas.

Las zonas de inserción deben existir entre todas las páginas.

Al arrastrar un separador hacia una zona:

* Debe mostrarse una animación indicando dónde será colocado.
* Debe visualizarse claramente que se está creando una nueva división documental.

Al soltarlo:

* Se crea un nuevo bloque documental.
* Se recalculan automáticamente todos los bloques existentes.

---

# 4. Indicadores visuales de bloques documentales

Cada bloque documental debe estar identificado visualmente.

No basta con mostrar un separador.

Debe existir un sistema visual permanente que permita reconocer:

* Dónde inicia el bloque.
* Dónde termina.
* Cuántas páginas contiene.
* A qué documento pertenece cada página.

---

# 5. Sistema de líneas de agrupación

Para visualizar claramente los límites documentales:

* Cada bloque tendrá una línea vertical tipo llave o "I" mayúscula.
* La línea iniciará en el primer separador.
* La línea finalizará en el último elemento del bloque.
* La línea abarcará visualmente todas las páginas que pertenecen a ese documento.

Ejemplo:

Documento Azul
│
├ Página 1
├ Página 2
├ Página 3
│

Documento Verde
│
├ Página 4
├ Página 5
├ Página 6
│

---

# 6. Colores automáticos por bloque

Cada bloque debe recibir automáticamente un color distinto.

Reglas:

* No repetir colores consecutivos.
* Mantener suficiente contraste.
* El color debe aplicarse a:

  * Separadores.
  * Línea de agrupación.
  * Etiquetas del bloque.
  * Indicadores visuales.

Ejemplo:

Documento 1 → Azul
Documento 2 → Verde
Documento 3 → Naranja
Documento 4 → Morado

---

# 7. Nombre editable del bloque

Al hacer clic sobre la línea de agrupación o la etiqueta del bloque:

Debe abrirse un editor rápido.

Permitir:

* Cambiar nombre.
* Agregar descripción.
* Cambiar color.
* Ver cantidad de páginas.
* Ver tamaño estimado.

Ejemplo:

Contrato Cliente A
Páginas: 1-4

Factura Marzo
Páginas: 5-9

Expediente Legal
Páginas: 10-22

---

# 8. Actualización automática

Si el usuario:

* Mueve páginas.
* Elimina páginas.
* Inserta páginas.
* Fusiona bloques.
* Divide bloques.

El sistema debe recalcular automáticamente:

* Rangos de páginas.
* Líneas de agrupación.
* Colores.
* Etiquetas.
* Nombres internos.

Sin necesidad de recargar el Workspace.

---

# 9. Vista de exportación

Antes de exportar debe mostrarse una vista resumen:

Documento Azul
Nombre: Contrato Cliente A
Páginas: 1-4

Documento Verde
Nombre: Factura Marzo
Páginas: 5-9

Documento Naranja
Nombre: Expediente Legal
Páginas: 10-22

Desde esta vista el usuario podrá:

* Exportar todos.
* Exportar uno específico.
* Renombrar antes de exportar.
* Fusionar bloques.
* Crear nuevos bloques.

---

# 10. Objetivo UX

El usuario nunca debe perder de vista dónde inicia y dónde termina cada documento.

La separación documental debe entenderse visualmente sin necesidad de leer números de página.

Con solo observar el Workspace, el usuario debe identificar inmediatamente:

* Cuántos documentos existen.
* Qué páginas pertenecen a cada documento.
* Dónde inicia cada documento.
* Dónde termina cada documento.
* Qué nombre tendrá cada archivo al exportarse.

Además agregaría una mejora importante: cuando un bloque tenga muchas páginas, mostrar una pequeña etiqueta flotante en la línea de agrupación con algo como **"Contrato Cliente A (24 páginas)"**, para que el usuario no tenga que desplazarse hasta el inicio del bloque para saber qué documento está viendo. Esto mejora mucho la experiencia cuando se trabaja con expedientes grandes de 100, 200 o más páginas.
