Sí. Esto debe quedar como instrucción para el agente/desarrollador:

### Instrucción para implementar prompts editables en Imagrafity

1. **Eliminar imágenes de ejemplo del agent**

   * Si las imágenes ya fueron analizadas y usadas como referencia visual, ya no deben permanecer dentro de `Docs/agents`, ni en carpetas temporales del agent.
   * Solo debe quedar documentado el criterio visual y funcional.

2. **Crear zona editable de prompts**

   * Debe existir una sección administrativa llamada: **Prompts de personalización**.
   * Ubicación sugerida:

     * `Admin / Productos / Editar producto / Prompts`
     * o `Admin / IA / Prompts por producto`.

3. **Tres prompts editables por producto**
   Cada producto debe tener mínimo 3 prompts configurables:

   * **Prompt 1: Diseño base**

     * Define el estilo inicial del diseño.
     * Ejemplo: “Crear diseño urbano neón para una taza blanca con estilo moderno.”

   * **Prompt 2: Variación creativa**

     * Sirve para generar alternativas.
     * Ejemplo: “Generar una versión más colorida, juvenil y llamativa del diseño.”

   * **Prompt 3: Ajuste final / producción**

     * Sirve para preparar el diseño para impresión o sublimación.
     * Ejemplo: “Optimizar el diseño para impresión, fondo limpio, alta resolución y sin deformaciones.”

4. **Dónde se usan**

   * En la página del producto.
   * En el personalizador.
   * En el editor visual.
   * En el flujo de IA: “describe tu idea → genera diseño”.
   * Esto coincide con lo ya definido: el cliente podrá usar IA generadora de arte, diseños predeterminados, texto editable, imágenes, color base y vista 3D. 

5. **Sistema de datos**
   Cada prompt debe guardarse en base de datos, no quemado en código.

   Tabla sugerida:

```sql
product_prompts
- id
- product_id
- name
- type
- prompt_text
- negative_prompt
- is_active
- sort_order
- created_at
- updated_at
```

6. **Zona editable dentro del editor**
   En el editor del cliente debe aparecer como panel lateral o pestaña:

   * “Crear con IA”
   * “Mis instrucciones”
   * “Estilo”
   * “Vista previa”
   * “Aplicar al producto”

   Visualmente debe respetar el personalizador oscuro, con paneles tipo glass, botones neón y zona canvas iluminada, como ya marca la guía visual de Imagrafity. 

7. **Regla importante**
   Todos los datos modificables deben venir de base de datos o configuración administrativa:

   * prompts
   * colores disponibles
   * zonas editables
   * tipo de impresión
   * medidas del área editable
   * imágenes base
   * plantillas
   * textos permitidos
   * restricciones del producto

Así Imagrafity no queda amarrado a código fijo: cada producto podrá tener sus propios prompts, estilos, medidas, plantillas y reglas de edición.
