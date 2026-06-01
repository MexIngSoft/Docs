Perfecto. Con la imagen ya queda claro: la miniatura rota sigue ocupando espacio horizontal, pero visualmente debería reservar espacio vertical y centrarse.

Agrega esta corrección a Codex:

```text
Corregir la vista de páginas rotadas en el grid de previews.

Problema actual:
Cuando una página se rota 90° o 270°, solo gira la imagen interna, pero el contenedor .pdf-thumb y .paper-mini siguen comportándose como si la página fuera horizontal. Esto provoca que el preview quede mal acomodado, con demasiado espacio vacío y sin adaptarse al tamaño real visual de la hoja rotada.

Regla requerida:
Cuando una página tenga rotación 90° o 270°, se debe calcular su tamaño visual invirtiendo ancho y alto.

Ejemplo:
Página original: 1000 x 588 px
Rotación: 90°
Tamaño visual esperado: 588 x 1000 px

La tarjeta .pdf-thumb debe adaptarse a ese tamaño visual, centrar el preview y permitir que la página rotada ocupe más altura si es necesario.

La barra .page-quick-actions:
- debe estar oculta por defecto;
- no debe tener la clase visible permanente;
- solo debe aparecer cuando el usuario haga hover sobre .pdf-thumb;
- también debe aparecer con focus-within por accesibilidad;
- si el menú de más opciones está abierto, puede mantenerse visible.

La zona .smart-insertion-zone:
- debe quedar centrada exactamente entre dos previews;
- debe tener la misma distancia a la página izquierda y a la página derecha;
- debe conservar esa misma separación si está al inicio o al final;
- no debe quedar pegada a un lado.

Criterio visual final:
La página rotada debe verse como una hoja vertical real, centrada dentro de su tarjeta, alineada con las páginas vecinas y sin que la barra rápida esté visible hasta que el usuario pase el cursor.
```
