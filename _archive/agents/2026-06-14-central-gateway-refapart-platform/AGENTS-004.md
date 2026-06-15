Sí. Esto debe quedar como **módulo central de búsquedas y demanda no encontrada**.

### Objetivo

Cuando un usuario busque una pieza en Refapart:

1. Si existe en inventario, se muestran resultados.
2. Si no existe, **la búsqueda se guarda automáticamente**, aunque el usuario no esté registrado.
3. Esa búsqueda queda como referencia para:

   * saber qué piezas pide la gente;
   * buscarla con proveedores;
   * alimentar futuras búsquedas;
   * crear demanda real antes de tener inventario.

---

## Flujo principal

### 1. Usuario busca una pieza

Ejemplo:

> “fascia delantera Versa 2020”

El sistema debe guardar siempre:

```txt
texto_buscado
marca
modelo
año
pieza
versión
motor
ubicación aproximada
fecha
ip / session_id
usuario_id si existe
```

---

### 2. El sistema intenta encontrar coincidencias

Busca en:

```txt
inventario propio
productos de proveedores
piezas previamente solicitadas
equivalencias
sinónimos
historial de búsquedas
```

---

### 3. Si no encuentra resultados

No debe decir solamente “no encontrado”.

Debe mostrar algo así:

```txt
No encontramos esta pieza disponible por ahora.

Podemos ayudarte a buscarla con proveedores.
Déjanos tu WhatsApp y te avisamos cuando tengamos respuesta.
```

Opcional:

```txt
También puedes continuar sin registrarte.
Tu búsqueda quedará guardada para futuras referencias.
```

---

## Regla importante

Aunque el usuario no deje WhatsApp ni se registre, la búsqueda debe guardarse como **demanda anónima**.

Eso permite saber:

```txt
qué piezas se buscan más
qué marcas tienen más demanda
qué proveedores conviene contactar
qué productos conviene cargar primero
qué zonas tienen más intención de compra
```

---

## Estados de una búsqueda fallida

La búsqueda guardada puede tener estos estados:

```txt
pending_search        → pendiente de revisar
supplier_requested    → ya se preguntó a proveedores
supplier_found        → proveedor sí tiene la pieza
not_available         → nadie la tiene
converted_to_quote    → se volvió cotización
converted_to_order    → se convirtió en venta
archived              → cerrada sin acción
```

---

## Tablas recomendadas

### `part_searches`

Guarda todas las búsquedas.

```sql
id
user_id nullable
session_id
search_text
brand
model
year
part_name
engine
version
location
status
results_count
created_at
updated_at
```

---

### `unfulfilled_part_requests`

Guarda búsquedas que no tuvieron resultado.

```sql
id
part_search_id
contact_name nullable
contact_phone nullable
contact_email nullable
preferred_contact_channel
urgency
notes
status
created_at
updated_at
```

---

### `supplier_search_tasks`

Guarda las piezas que se deben preguntar a proveedores.

```sql
id
unfulfilled_request_id
supplier_id
message_text
channel
status
sent_at
response_at
supplier_response
price
availability
estimated_delivery_time
created_at
updated_at
```

---

## Regla para proveedores

Cuando varias personas busquen algo parecido, el sistema debe agruparlo.

Ejemplo:

```txt
fascia versa 2020
defensa delantera versa 2020
fascia nissan versa 2020
```

El sistema debe entender que probablemente es la misma demanda.

Entonces debe crear una sola oportunidad:

```txt
Alta demanda: fascia delantera Nissan Versa 2020
Búsquedas: 14
Usuarios con WhatsApp: 6
Prioridad: alta
```

---

## Función para el panel administrador

Debe existir una sección:

```txt
Demandas no encontradas
```

Con filtros:

```txt
marca
modelo
año
pieza
ciudad
fecha
cantidad de búsquedas
usuarios con contacto
estado
prioridad
```

Y botones:

```txt
Buscar con proveedores
Enviar WhatsApp
Crear cotización
Convertir en producto
Cerrar búsqueda
```

---

## Instrucción clara para Codex

```txt
Implementar un sistema donde toda búsqueda de refacción se registre, incluso si el usuario no está autenticado. 
Si la búsqueda no tiene resultados, debe guardarse como demanda no satisfecha y permitir al usuario dejar datos de contacto opcionales.
El sistema debe agrupar búsquedas similares para detectar demanda real, generar tareas de búsqueda con proveedores y permitir convertir una búsqueda fallida en cotización, producto o venta.
```

Esto convierte a Refapart en algo más fuerte que una tienda: **un sistema que aprende qué piezas necesita el mercado aunque todavía no las tenga cargadas**.
