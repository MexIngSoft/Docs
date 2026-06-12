Claro. Pega esta instrucciÃ³n completa en Codex:

## Corregir timeout y dejar funcionando correctamente LeadForge / LeadHunter

Actualmente la web muestra este error:

HTTPConnectionPool(host='api-backend-python', port=8021): Read timed out. (read timeout=30)

Esto indica que el frontend sÃ­ logra comunicarse con el backend, pero el backend tarda demasiado en responder porque estÃ¡ esperando a que termine la bÃºsqueda en Apify.

El sistema debe corregirse para que las bÃºsquedas no bloqueen la peticiÃ³n HTTP.

---

## Objetivo

Modificar el mÃ³dulo de prospectos para que funcione mediante procesamiento asÃ­ncrono:

1. El usuario inicia una bÃºsqueda desde la web.
2. El backend crea un registro de bÃºsqueda.
3. El backend responde inmediatamente con `search_id`.
4. La bÃºsqueda en Apify se ejecuta en segundo plano.
5. El frontend consulta el estado cada 3 o 5 segundos.
6. Cuando termina, el frontend carga los resultados.
7. Si falla, se muestra un error claro.
8. Nunca se deben devolver datos falsos, mock, sample o inventados.

---

## Backend Django / Python

Crear o corregir el flujo de bÃºsqueda con estos estados:

```text
pending
running
completed
failed
```

### Endpoint 1: Crear bÃºsqueda

```http
POST /api/v1/prospect-searches/
```

Debe recibir:

```json
{
  "latitude": 20.092474,
  "longitude": -98.752026,
  "country": "Mexico",
  "state": "Hidalgo",
  "city": "Pachuca",
  "address": "",
  "radius_km": 20,
  "max_per_category": 25,
  "verticals": ["transporte_pesado", "maquinaria_pesada", "offroad"]
}
```

Debe responder rÃ¡pido:

```json
{
  "search_id": 123,
  "status": "pending",
  "message": "BÃºsqueda creada correctamente. El procesamiento continuarÃ¡ en segundo plano."
}
```

No debe esperar a que Apify termine.

---

### Endpoint 2: Consultar estado

```http
GET /api/v1/prospect-searches/{search_id}/status/
```

Respuesta esperada:

```json
{
  "search_id": 123,
  "status": "running",
  "progress": {
    "total_queries": 20,
    "completed_queries": 7,
    "total_found": 45,
    "total_without_phone": 12
  },
  "message": "BÃºsqueda en proceso."
}
```

Si terminÃ³:

```json
{
  "search_id": 123,
  "status": "completed",
  "progress": {
    "total_queries": 20,
    "completed_queries": 20,
    "total_found": 180,
    "total_without_phone": 37
  },
  "message": "BÃºsqueda completada correctamente."
}
```

Si fallÃ³:

```json
{
  "search_id": 123,
  "status": "failed",
  "message": "La bÃºsqueda fallÃ³. Revisar logs del backend.",
  "error": "Detalle controlado del error"
}
```

---

### Endpoint 3: Obtener resultados

```http
GET /api/v1/prospect-searches/{search_id}/results/
```

Debe devolver solo negocios reales y filtrados, principalmente sin telÃ©fono:

```json
{
  "search_id": 123,
  "status": "completed",
  "count": 37,
  "results": [
    {
      "name": "Refaccionaria Diesel Hidalgo",
      "category": "Refaccionaria",
      "address": "DirecciÃ³n real",
      "phone": null,
      "website": null,
      "rating": 4.3,
      "reviews_count": 18,
      "latitude": 20.1,
      "longitude": -98.7,
      "google_maps_url": "https://www.google.com/maps/...",
      "score": 125
    }
  ]
}
```

---

## EjecuciÃ³n en segundo plano

Implementar una de estas opciones:

### OpciÃ³n preferida

Usar Celery + Redis si el proyecto ya tiene infraestructura para tareas asÃ­ncronas.

### OpciÃ³n temporal aceptable

Usar `ThreadPoolExecutor` o threading controlado dentro del backend, siempre que:

* No bloquee la respuesta HTTP.
* Actualice el estado en base de datos.
* Capture errores.
* Registre logs.
* No cree mÃºltiples hilos infinitos.
* No reinicie bÃºsquedas ya finalizadas.

---

## Modelos requeridos

### Tabla `prospect_searches`

Campos mÃ­nimos:

```text
id
latitude
longitude
country
state
city
address
radius_km
max_per_category
verticals
status
total_queries
completed_queries
total_found
total_without_phone
error_message
created_at
updated_at
started_at
finished_at
```

### Tabla `business_prospects`

Campos mÃ­nimos:

```text
id
search_id
name
category
address
phone
website
rating
reviews_count
latitude
longitude
google_maps_url
place_id
source
score
has_phone
has_website
created_at
updated_at
```

---

## Reglas obligatorias de datos reales

Eliminar por completo cualquier uso de:

```text
mock
sample
fake
demo
placeholder
seed
fixture
test data
```

Buscar en todo el proyecto:

```text
sample
mock
fake
demo
placeholder
seed
fixture
Autos premium Norte
Industria y negocio Norte
Maquinaria pesada Norte
Transporte pesado Norte
```

Si existen datos ficticios, eliminarlos o dejarlos Ãºnicamente para pruebas unitarias, nunca para respuestas reales de la API.

Si Apify falla o no responde, la API debe devolver `failed`, no datos inventados.

Si Apify devuelve cero resultados, la API debe devolver lista vacÃ­a.

---

## ValidaciÃ³n de resultados

Antes de guardar un negocio, validar:

1. No debe contener `sample`, `fake`, `demo`, `test` o `placeholder`.
2. Debe tener nombre real.
3. Debe tener URL real de Google Maps o `place_id`.
4. Debe tener direcciÃ³n o coordenadas.
5. Debe pertenecer a una bÃºsqueda generada desde catÃ¡logo real.
6. Debe deduplicarse por `place_id`, `google_maps_url` o combinaciÃ³n de nombre + direcciÃ³n.

Descartar negocios cerrados permanentemente si Apify devuelve ese dato.

---

## Filtro principal

El sistema debe priorizar negocios sin telÃ©fono.

Considerar sin telÃ©fono cuando:

```python
phone is None
phone == ""
phone.strip() == ""
phone.upper() in ["N/A", "NA", "NULL", "NONE"]
```

Guardar `has_phone = False`.

El frontend debe mostrar por defecto solo negocios sin telÃ©fono.

---

## CatÃ¡logo real de bÃºsqueda

No usar categorÃ­as genÃ©ricas como:

```text
autos premium
maquinaria pesada
industria y negocio
transporte pesado
```

Generar bÃºsquedas con palabras reales que usarÃ­a una persona en Google Maps.

### Vertical: Transporte pesado

```text
refacciones tractocamiones
refaccionaria tractocamiones
autopartes tractocamiones
taller diesel
taller diesel tractocamiones
transmisiones tractocamiones
frenos para trailers
suspensiÃ³n para trailers
muelles para camiones
motores diesel
inyectores diesel
turbo diesel
refacciones Volvo camiones
refacciones Kenworth
refacciones Freightliner
refacciones International
motores Cummins
motores Detroit Diesel
grÃºas industriales
```

### Vertical: Transporte de lÃ­quidos / pipas

```text
pipas de agua
pipas de gasolina
pipas de diesel
transporte de lÃ­quidos
transporte de combustible
autotanques
remolques tanque
bombas para pipas
vÃ¡lvulas para pipas
mangueras industriales para pipas
transporte de quÃ­micos
```

### Vertical: Maquinaria pesada

```text
refacciones maquinaria pesada
taller maquinaria pesada
refacciones Caterpillar
refacciones Komatsu
refacciones John Deere
refacciones JCB
reparaciÃ³n excavadoras
reparaciÃ³n retroexcavadoras
bombas hidrÃ¡ulicas
mangueras hidrÃ¡ulicas
cilindros hidrÃ¡ulicos
montacargas refacciones
taller montacargas
grÃºas industriales
```

### Vertical: Off-road / 4x4

```text
refacciones RZR
refacciones Polaris RZR
refacciones Can-Am
refacciones Maverick X3
refacciones ATV
refacciones UTV
taller Polaris RZR
taller Can-Am
accesorios off road
accesorios 4x4
suspensiÃ³n off road
llantas off road
taller 4x4
refacciones Jeep 4x4
```

### Vertical: Autos premium

```text
refacciones BMW
taller BMW
refacciones Mercedes Benz
taller Mercedes Benz
refacciones Audi
taller Audi
refacciones Porsche
taller Porsche
refacciones Land Rover
taller Land Rover
refacciones Jaguar
transmisiones automÃ¡ticas BMW
transmisiones automÃ¡ticas Mercedes Benz
diagnÃ³stico automotriz premium
```

### Vertical: Industria B2B

```text
material elÃ©ctrico industrial
automatizaciÃ³n industrial
tableros elÃ©ctricos
variadores de frecuencia
motores elÃ©ctricos industriales
compresores industriales
generadores elÃ©ctricos
UPS industriales
CCTV empresarial
redes empresariales
telecomunicaciones empresariales
seguridad industrial
sistemas contra incendios
paneles solares industriales
```

---

## Ubicaciones objetivo

Agregar catÃ¡logo editable de ciudades con poder adquisitivo o actividad industrial:

```text
Pachuca, Hidalgo
CDMX
Monterrey, Nuevo LeÃ³n
Guadalajara, Jalisco
QuerÃ©taro, QuerÃ©taro
Puebla, Puebla
Toluca, Estado de MÃ©xico
LeÃ³n, Guanajuato
San Luis PotosÃ­, San Luis PotosÃ­
Aguascalientes, Aguascalientes
MÃ©rida, YucatÃ¡n
Tijuana, Baja California
CancÃºn, Quintana Roo
Saltillo, Coahuila
TorreÃ³n, Coahuila
```

Cada ciudad debe tener:

```text
name
state
country
latitude
longitude
default_radius_km
```

La ubicaciÃ³n tambiÃ©n debe poder introducirse manualmente desde la web.

---

## IntegraciÃ³n con Apify

Usar variables de entorno:

```env
APIFY_TOKEN=xxxxxxxxxxxx
APIFY_ACTOR_ID=compass~crawler-google-places
```

No guardar tokens en Git.

Si falta `APIFY_TOKEN`, responder:

```json
{
  "status": "failed",
  "message": "APIFY_TOKEN no estÃ¡ configurado."
}
```

Agregar logging de diagnÃ³stico sin imprimir el token completo:

```text
APIFY_TOKEN cargado: sÃ­/no
APIFY_ACTOR_ID cargado
Actor ejecutado
Dataset recibido
Total items recibidos
Total items vÃ¡lidos
Total sin telÃ©fono
```

Nunca imprimir el token completo en logs.

---

## Frontend Next.js

Modificar la pantalla de prospectos para trabajar con flujo asÃ­ncrono.

### Al presionar â€œBuscar negocios reales sin telÃ©fonoâ€

1. Enviar POST al backend.
2. Recibir `search_id`.
3. Mostrar estado â€œBÃºsqueda en procesoâ€.
4. Consultar endpoint de status cada 3 o 5 segundos.
5. Mostrar progreso:

   * consultas completadas
   * total encontrado
   * total sin telÃ©fono
6. Cuando status sea `completed`, llamar endpoint de resultados.
7. Mostrar tabla.
8. Si status es `failed`, mostrar error claro.

---

## Tabla de resultados

Mostrar columnas:

```text
Nombre
CategorÃ­a
DirecciÃ³n
TelÃ©fono
Sitio web
Rating
ReseÃ±as
Score
Ver en Google Maps
```

Por defecto activar filtro:

```text
Solo negocios sin telÃ©fono
```

---

## ExportaciÃ³n

Agregar exportaciÃ³n a:

```text
CSV
Excel
```

El archivo debe incluir:

```text
name
category
address
phone
website
rating
reviews_count
latitude
longitude
google_maps_url
score
source
```

---

## Docker

Verificar que las variables de entorno lleguen al contenedor.

En `docker-compose.yml`, agregar si falta:

```yaml
environment:
  APIFY_TOKEN: ${APIFY_TOKEN}
  APIFY_ACTOR_ID: ${APIFY_ACTOR_ID}
```

Probar con:

```bash
docker exec -it api-multiproyecto printenv APIFY_ACTOR_ID
```

No imprimir el token completo. Para verificar token, solo mostrar si existe o no existe.

Reconstruir y levantar:

```bash
docker compose -f Docker.API.PY/docker-compose.yml up -d --force-recreate api-multiproyecto
```

---

## Pruebas obligatorias

Probar:

1. Backend levanta correctamente en Docker.
2. Variables Apify estÃ¡n disponibles.
3. Crear bÃºsqueda responde en menos de 3 segundos.
4. No aparece timeout de 30 segundos.
5. Status cambia de pending a running.
6. Status cambia de running a completed o failed.
7. Results devuelve datos reales o lista vacÃ­a.
8. No aparecen datos sample.
9. No aparecen negocios inventados.
10. Frontend muestra progreso.
11. Frontend muestra resultados.
12. ExportaciÃ³n funciona.
13. Logs registran errores reales.

---

## Criterio de aceptaciÃ³n final

La correcciÃ³n solo se considera terminada cuando:

* La web ya no muestra `Read timed out`.
* El backend no bloquea esperando a Apify.
* No existen datos ficticios en respuestas reales.
* Se puede buscar por cualquier ubicaciÃ³n.
* Se pueden seleccionar verticales comerciales.
* Se usan palabras clave reales.
* Se filtran negocios sin telÃ©fono.
* Los resultados son reales o la lista queda vacÃ­a.
* Todo corre correctamente en Docker.
* La documentaciÃ³n queda actualizada en:

```text
Docs/agents/EXECUTION_REPORT.md
```

