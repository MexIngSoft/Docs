Claro. Te lo dejo como **instrucción limpia para Codex**, ya corregida y más clara para que no implemente cosas de más.

# Ajustes obligatorios para Workspace y herramienta Dividir PDF en DocuCore

## Objetivo

Corregir el comportamiento actual del Workspace para que sea más simple, estable y fácil de usar, especialmente en carga de múltiples documentos, panel de herramientas, zoom de previews y simplificación de la herramienta Dividir PDF.

---

# 1. Corrección: carga de múltiples documentos en el mismo proyecto

## Problema actual

Cuando el usuario intenta subir N documentos al mismo proyecto, el sistema solo carga un PDF por proyecto, aunque se hayan seleccionado dos o más archivos.

## Comportamiento requerido

El Workspace debe permitir cargar múltiples documentos dentro del mismo proyecto.

Ejemplo:

Si el usuario selecciona:

* documento_1.pdf
* documento_2.pdf

El proyecto debe contener ambos documentos.

## Reglas

1. Un proyecto puede contener uno o varios documentos.
2. Cada documento debe tener su propio identificador interno.
3. El Workspace debe mostrar una lista, pestaña o selector de documentos cargados.
4. El documento activo es el único que se muestra en el área de trabajo.
5. Las herramientas deben aplicarse únicamente al documento activo, salvo que la herramienta soporte múltiples documentos.
6. No reemplazar el primer documento cuando se suba un segundo documento.
7. No crear un proyecto nuevo automáticamente si el usuario ya está trabajando dentro de un proyecto existente.
8. Registrar en logs cada archivo cargado con su propio requestId.

## Resultado esperado

Al subir dos PDF dentro del mismo proyecto, ambos deben quedar disponibles y el usuario debe poder cambiar entre ellos.

---

# 2. Panel de herramientas acoplable y ocultable

## Problema actual

La ventana o panel de herramientas ocupa espacio fijo y no permite ampliar correctamente el área de trabajo.

## Comportamiento requerido

El panel de configuración de herramientas debe ser acoplable, ocultable y recuperable.

## Reglas

1. El panel derecho de configuración debe poder ocultarse.

2. Al ocultarlo, el área central de trabajo debe expandirse automáticamente.

3. Debe quedar visible un botón flotante o lateral para volver a mostrar el panel.

4. El botón debe ser claro, por ejemplo:

   "Mostrar configuración"

   o un icono de panel.

5. Si el panel vuelve a mostrarse, el área central debe reducirse correctamente sin romper el layout.

6. El estado del panel puede guardarse en localStorage.

7. El panel no debe generar scroll horizontal.

8. El contenido interno del panel debe adaptarse al ancho disponible.

## Estados del panel

* visible
* oculto
* fijado
* no fijado

## Resultado esperado

El usuario puede trabajar con más espacio visual y mostrar la configuración solo cuando la necesite.

---

# 3. Zoom para previews del documento

## Problema actual

No existe un control claro para hacer más grandes o más pequeñas las miniaturas/previews de las páginas.

## Comportamiento requerido

Agregar controles de zoom para previews.

## Componentes requeridos

Agregar una barra superior o componente flotante con:

* Botón disminuir zoom
* Slider de zoom
* Porcentaje actual
* Botón aumentar zoom
* Botón restablecer zoom

## Rango sugerido

* Mínimo: 60%
* Predeterminado: 100%
* Máximo: 180%

## Reglas

1. El zoom debe afectar únicamente las miniaturas/previews.
2. No debe afectar el tamaño de la interfaz completa.
3. El grid debe reajustarse automáticamente.
4. El zoom debe conservarse mientras el usuario esté en el Workspace.
5. Puede guardarse en localStorage.
6. No debe romper el drag and drop.
7. No debe romper la selección de páginas.

## Resultado esperado

El usuario puede aumentar o reducir las páginas según su comodidad.

---

# 4. Simplificar herramienta Dividir PDF

## Problema actual

La herramienta Dividir PDF muestra demasiada información técnica y visual:

* Bloques visuales
* Eventos esperados
* Resumen interno
* Portapapeles
* Descartadas visibles
* tool_config_opened
* tool_option_changed
* pages_selected
* document_blocks_changed
* process_requested
* execution_resource_event

Esta información no es para el usuario final y genera confusión.

## Comportamiento requerido

Eliminar del panel de usuario toda información técnica, eventos internos y textos de depuración.

## Eliminar de la vista del usuario

Quitar del panel de Dividir PDF:

* Bloques visuales
* Agrupa páginas con selección, arrastre y separadores visibles desde el workspace
* Documento principal / páginas / expandida
* Colapsar
* Renombrar
* Color
* Fijar
* Fusionar anterior
* Crear bloque desde selección
* Fusionar último bloque
* Convertir todo en un documento
* Resumen antes de aplicar
* Páginas seleccionadas como bloque técnico
* Bloques como dato técnico
* Sin portapapeles activo
* Descartadas visibles
* Eventos esperados
* Nombres de eventos internos

## Mantener solo opciones simples

El panel de Dividir PDF debe mostrar únicamente opciones comprensibles:

### Dividir PDF

Opciones:

1. Dividir por rango de páginas
2. Extraer páginas seleccionadas
3. Separar cada página en un PDF
4. Dividir cada N páginas

Botón principal:

* Aplicar división

Botón secundario:

* Cancelar

## Mensajes permitidos

Ejemplos válidos:

* Selecciona las páginas que quieres extraer.
* Indica el rango de páginas.
* Se crearán nuevos archivos PDF.
* Esta acción no modifica el archivo original hasta que confirmes.

## Resultado esperado

El usuario debe entender la herramienta sin ver información técnica.

---

# 5. Corrección de scroll horizontal en panel Dividir PDF

## Problema actual

El panel de Dividir PDF genera una barra horizontal y parte del contenido se sale del entorno.

## Comportamiento requerido

Eliminar cualquier scroll horizontal.

## Reglas CSS obligatorias

Aplicar al panel y sus hijos:

```css
.tool-settings-panel {
  overflow-x: hidden;
  max-width: 100%;
}

.tool-settings-panel * {
  max-width: 100%;
  box-sizing: border-box;
}

.tool-settings-panel button,
.tool-settings-panel input,
.tool-settings-panel select,
.tool-settings-panel textarea {
  width: 100%;
  min-width: 0;
}

.tool-settings-panel .row {
  display: flex;
  flex-wrap: wrap;
  gap: 8px;
}

.tool-settings-panel .row > * {
  min-width: 0;
  flex: 1 1 auto;
}
```

## Resultado esperado

Ningún elemento debe salirse del panel derecho.

---

# 6. Estandarización de paneles de herramientas

Todas las herramientas deben seguir el mismo patrón visual.

## Estructura estándar

```text
Nombre de herramienta
Descripción corta

Opciones principales

Vista de resumen simple

Botón principal
Botón secundario
```

## Ejemplo

```text
Dividir PDF

Crea nuevos PDF a partir de páginas o rangos.

Modo de división:
○ Por rango
○ Páginas seleccionadas
○ Cada página
○ Cada N páginas

[Aplicar división]
[Cancelar]
```

## Reglas

1. No mostrar eventos internos.
2. No mostrar logs.
3. No mostrar nombres técnicos.
4. No mostrar estados de programación.
5. No mostrar información que no ayude a decidir.
6. El usuario solo debe ver acciones claras.
7. El detalle técnico debe ir al módulo Diagnóstico, no al panel de herramienta.

---

# 7. Separación entre UI de usuario y diagnóstico técnico

Toda esta información debe ir únicamente al sistema de diagnóstico:

* tool_config_opened
* tool_option_changed
* pages_selected
* document_blocks_changed
* process_requested
* execution_resource_event
* requestId
* stack trace
* eventos esperados
* errores técnicos
* logs internos

## Regla

Nada de esto debe mostrarse en la herramienta Dividir PDF del usuario final.

Solo debe aparecer en:

* panel de diagnóstico admin
* logs internos
* consola de desarrollo
* módulo Observability & Diagnostics

---

# 8. Layout final esperado

El Workspace debe quedar así:

```text
┌─────────────────────────────────────────────┐
│ Documento activo · páginas · estado         │
└─────────────────────────────────────────────┘

┌───────┬───────────────────────────┬─────────┐
│ Tools │ Área de documento         │ Config  │
│       │ previews + zoom           │ simple  │
│       │                           │         │
└───────┴───────────────────────────┴─────────┘
```

Cuando el panel derecho está oculto:

```text
┌───────┬─────────────────────────────────────┐
│ Tools │ Área de documento expandida         │
│       │ previews + zoom                     │
└───────┴─────────────────────────────────────┘

Botón visible:
[Mostrar configuración]
```

---

# 9. Criterios de aceptación

La tarea se considera correcta cuando:

1. Se pueden subir dos o más documentos al mismo proyecto.
2. No se reemplaza el documento anterior al subir otro.
3. Existe selector visual para cambiar documento activo.
4. El panel derecho puede ocultarse.
5. Al ocultar el panel, el Workspace se expande.
6. Existe botón visible para volver a mostrar la configuración.
7. Existe zoom funcional para previews.
8. El panel Dividir PDF ya no muestra bloques visuales ni eventos técnicos.
9. No existe scroll horizontal en el panel derecho.
10. Las opciones de Dividir PDF son simples.
11. Los eventos internos se mandan a logs/diagnóstico, no a UI.
12. No se rompe la selección de páginas.
13. No se rompe el drag and drop.
14. No se rompe la ejecución de herramientas existentes.
15. Todo cambio debe mantener compatibilidad con los estándares de logs y tipos de archivo soportados de DocuCore.

Con esto Codex debería entender que el problema no es agregar más cosas, sino **quitar ruido**, dejar el Workspace más profesional y separar lo técnico del usuario final.
