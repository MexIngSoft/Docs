SÃ­, eso debe quedar como **regla general para todos los bloques del panel**, no solo para marcas o servicios.

PÃ©gale esto a Codex:

## Regla general para selecciÃ³n mÃºltiple en todos los bloques del panel

Aplicar esta regla a todas las secciones del panel de bÃºsqueda, incluyendo pero no limitado a:

* Verticales
* Marcas
* Servicios
* CategorÃ­as
* Ciudades
* Radios
* Tipos de negocio
* Palabras clave
* Filtros adicionales

### Estado inicial

Por defecto, todas las opciones seleccionables deben iniciar seleccionadas.

Ejemplo:

```text
Verticales: todas seleccionadas
Marcas: todas seleccionadas
Servicios: todos seleccionados
Tipos de negocio: todos seleccionados
Palabras clave: todas seleccionadas
```

### Control por bloque

Cada bloque o secciÃ³n debe tener controles propios para:

```text
Seleccionar todo
Deseleccionar todo
```

Ejemplo visual:

```text
Marcas
[Seleccionar todo] [Deseleccionar todo]

Volvo  Kenworth  Freightliner  International
Scania Mercedes Benz Isuzu Hino Dina
```

### Comportamiento requerido

1. Al cargar la pantalla, todas las opciones deben estar seleccionadas.
2. El usuario debe poder deseleccionar opciones individuales.
3. El usuario debe poder volver a seleccionar opciones individuales.
4. Cada bloque debe tener su propio â€œSeleccionar todoâ€.
5. Cada bloque debe tener su propio â€œDeseleccionar todoâ€.
6. La acciÃ³n de un bloque no debe afectar otros bloques.
7. Si el usuario deselecciona todo en un bloque obligatorio, mostrar advertencia clara antes de buscar.
8. No ejecutar bÃºsqueda si no hay ninguna vertical seleccionada.
9. No ejecutar bÃºsqueda si no hay ninguna palabra clave, marca o servicio seleccionado.
10. La selecciÃ³n debe mantenerse mientras el usuario cambia ciudad, radio o ubicaciÃ³n.

### Regla de implementaciÃ³n

Crear un componente reutilizable para selecciÃ³n mÃºltiple:

```text
SelectableOptionGroup
```

Debe recibir:

```typescript
title: string
options: Option[]
selectedValues: string[]
onChange: (values: string[]) => void
allowSelectAll: boolean
allowClearAll: boolean
required?: boolean
```

Cada opciÃ³n debe tener:

```typescript
type Option = {
  label: string;
  value: string;
  group?: string;
}
```

### Botones tipo chip

Las opciones como marcas y servicios deben mostrarse como chips seleccionables.

Estado seleccionado:

```text
Fondo verde/teal
Texto blanco
Borde verde/teal
```

Estado no seleccionado:

```text
Fondo claro
Texto verde/teal
Borde verde/teal
```

### Ordenamiento de resultados

Los negocios encontrados deben ordenarse por prioridad comercial, de mayor a menor.

Orden principal:

```text
score DESC
```

Orden secundario:

```text
rating DESC
```

Orden terciario:

```text
reviews_count DESC
```

Es decir:

1. Primero el negocio con mayor score.
2. Si hay empate, primero el de mayor calificaciÃ³n.
3. Si hay empate, primero el de mÃ¡s reseÃ±as.

### Regla de score

Mantener el score comercial, pero asegurarse de que el orden final sea:

```sql
ORDER BY score DESC, rating DESC, reviews_count DESC
```

### Frontend

La tabla de resultados tambiÃ©n debe permitir ordenar manualmente por:

* Score
* Rating
* ReseÃ±as
* Nombre
* Ciudad
* CategorÃ­a

Pero por default debe iniciar ordenada por:

```text
Mejor prospecto primero
```

equivalente a:

```text
score DESC, rating DESC, reviews_count DESC
```

### Criterio de aceptaciÃ³n

La tarea se considera terminada cuando:

1. Todas las secciones inician con todo seleccionado.
2. Cada secciÃ³n tiene â€œSeleccionar todoâ€.
3. Cada secciÃ³n tiene â€œDeseleccionar todoâ€.
4. Las acciones de selecciÃ³n son independientes por secciÃ³n.
5. No se ejecuta bÃºsqueda sin verticales seleccionadas.
6. No se ejecuta bÃºsqueda sin criterios de bÃºsqueda seleccionados.
7. Los resultados aparecen ordenados del mejor al menor prospecto.
8. El orden por defecto es score descendente, rating descendente y reseÃ±as descendente.
9. La regla aplica a cualquier secciÃ³n nueva que se agregue despuÃ©s.

