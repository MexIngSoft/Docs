Después de ver tu Workspace, el problema principal no es visual, es de **arquitectura de interfaz**.

Actualmente tienes demasiados elementos compitiendo por atención:

* Sidebar global de navegación.
* Topbar de cuenta.
* Minimap de bloques.
* Separadores de bloques.
* Acciones por página.
* Líneas de inserción.
* Barras laterales futuras.
* Información de bloques repetida en cada página.
* Configuración futura de herramientas.

Todo esto hace que el usuario tenga que pensar demasiado. 

## Problema 1: El Workspace no tiene jerarquía

Hoy se ve así:

```text
Sidebar
Topbar
Minimap
Bloques
Separadores
Páginas
Botones
Acciones
Líneas
Más botones
```

Todo tiene casi el mismo peso visual.

El usuario no sabe:

* Qué es navegación.
* Qué es herramienta.
* Qué es documento.
* Qué es configuración.

---

# Estructura recomendada

```text
┌──────────────────────────────────────────────┐
│ Header Global                               │
└──────────────────────────────────────────────┘

┌──────┬───────────────────────┬──────────────┐
│      │                       │              │
│      │                       │              │
│      │                       │              │
│      │                       │              │
│      │     DOCUMENTO         │ CONFIG       │
│TOOLS │                       │ TOOL         │
│      │                       │              │
│      │                       │              │
│      │                       │              │
│      │                       │              │
└──────┴───────────────────────┴──────────────┘
```

---

# Panel izquierdo

Solo herramientas.

No navegación.

No login.

No historial.

No jobs.

Nada de eso.

```text
📄 PDF

✂ Dividir
🔗 Unir
🗑 Eliminar
↻ Rotar
📋 Extraer

────────

📑 Word

────────

🖼 Imagen

────────

📦 ZIP
```

Solo iconos.

Al pasar mouse:

```text
✂ Dividir PDF
```

---

# Navegación global

Debe salir del Workspace.

Actualmente ocupa espacio inútil.

```text
Inicio
Historial
Resultados
Jobs
Cuenta
```

Debe ir:

```text
Header superior
```

como Adobe.

como Figma.

como Canva.

como Notion.

---

# Panel derecho

Solo configuración.

Ejemplo:

Usuario selecciona:

```text
Dividir PDF
```

Panel derecho:

```text
DIVIDIR PDF

○ Por páginas

○ Por rangos

○ Por bloques

○ Por marcadores

[ Ejecutar ]
```

---

# Centro

Debe ser gigantesco

Actualmente la interfaz desperdicia mucho espacio.

Debe verse:

```text
80%
Documento

10%
Herramientas

10%
Configuración
```

---

# El minimapa

Actualmente:

```text
1
2
3
4
5
6
7
```

Ocupa espacio.

Lo movería a:

```text
lado derecho flotante
```

similar a:

```text
PDF
Bloque 1
Bloque 2
Bloque 3
```

colapsable.

---

# Bloques

Actualmente cada página muestra:

```text
Bloque 1
20 pag
```

Esto es ruido visual.

Solo la primera página del bloque debería mostrar:

```text
━━━━━━━━━━━━━━━
BLOQUE 1
20 páginas
━━━━━━━━━━━━━━━
```

Las demás páginas no.

---

# Acciones de página

Actualmente aparecen:

```text
Rotar
Rotar
Más
```

en cada página.

Hay cientos de páginas.

Eso genera ruido.

Mejor:

Al seleccionar una página:

```text
Barra flotante
```

como:

```text
Rotar
Eliminar
Duplicar
Mover
Extraer
```

Una sola barra.

No repetirla 500 veces.

---

# Separadores

Actualmente son enormes.

Deben tener dos estados.

### Estado compacto

```text
═══════
```

8px a 12px alto.

---

### Hover

```text
═══════════════════════

+ Insertar página

+ Crear bloque

+ Pegar

═══════════════════════
```

---

# Información superior

Actualmente:

```text
Workspace documental
Procesamiento seguro
```

Ocupa demasiado.

Reducir a:

```text
Documento.pdf
120 páginas
4 bloques
Guardado
```

---

# Resultado final

La distribución ideal sería:

```text
┌───────────────────────────────────────────┐
│ Documento.pdf | 120 pág | Guardado ✓      │
└───────────────────────────────────────────┘

┌──────┬─────────────────────────┬──────────┐
│      │                         │          │
│ PDF  │                         │ Config   │
│ IMG  │                         │ herramienta
│ ZIP  │      Documento          │          │
│ OCR  │                         │          │
│      │                         │          │
└──────┴─────────────────────────┴──────────┘
```

Esto elimina aproximadamente un **40% a 50% del ruido visual actual**, deja más espacio al documento y prepara correctamente la llegada de OCR, IA, índices, anotaciones, comparación de documentos y demás módulos futuros de DocuCore. 
