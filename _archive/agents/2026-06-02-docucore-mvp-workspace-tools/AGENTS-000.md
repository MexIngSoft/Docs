Correcto. Si ya tomaron la decisión arquitectónica de sacar del MVP:

* OCR avanzado
* Indexación documental
* Detección inteligente de estructura
* IA documental
* Generación de índices

entonces la opción **"Secciones"** ya no debería existir en ninguna parte de DocuCore.

Porque técnicamente el sistema no tiene forma de saber qué es:

```text
Contrato
Anexo
Capítulo
Prueba
Apéndice
Índice
Sección
```

Sin un motor que analice el contenido.

---

De hecho, veo una consecuencia más importante:

### Deben revisar todas las herramientas

No solo Dividir PDF.

Porque seguramente quedaron conceptos heredados de cuando sí existía la idea de indexación inteligente.

Por ejemplo:

#### Dividir PDF

Eliminar:

```text
Secciones
Contrato, anexos y pruebas
```

---

#### Marcadores

Si los marcadores son detectados desde el PDF original y vienen embebidos por Adobe u otro software:

```text
Sí pueden existir.
```

Pero si DocuCore pretende generarlos:

```text
No deben existir.
```

---

#### Automático por capítulos

Eliminar.

Porque requiere detección documental.

---

#### División por contenido

Eliminar.

Porque requiere IA.

---

## Lo que realmente queda en el MVP

### Manual

```text
Seleccionar páginas
```

Ejemplos:

```text
1-10
15-30
50
```

---

### Visual

Desde Workspace:

```text
Seleccionar páginas
Arrastrar páginas
Crear bloques
Crear separadores
```

---

### Automático simple

```text
Cada N páginas
```

Ejemplo:

```text
Cada 5
Cada 10
Cada 20
```

---

### Marcadores PDF nativos

Solo si existen dentro del PDF original.

---

## Yo agregaría una regla de arquitectura

### Regla

> Ninguna pantalla del MVP puede mostrar funciones que dependan de OCR, IA, indexación documental o análisis semántico si dichos módulos fueron retirados de la Fase 1.

Y aplicaría esta revisión a:

```text
Dividir PDF
Fusionar PDF
OCR
Document API
Workspace
Preview
Paneles laterales
Ayudas contextuales
Landing pages
Documentación
```

Porque ahora mismo la interfaz parece diseñada para un DocuCore Fase 3 o Fase 4, mientras que el producto que realmente están construyendo es un MVP centrado en manipulación documental visual y manual.

La ventaja es que al eliminar todo lo relacionado con secciones inteligentes, capítulos y clasificación documental, la herramienta de dividir PDF se vuelve muchísimo más simple y coherente con el alcance actual del proyecto.
