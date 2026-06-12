Sí. Pégale esto a Codex como instrucción principal:

Desarrollar módulo completo de prospección de negocios de alto valor.

Stack actual:

* Frontend: Next.js
* Backend: Python
* Base de datos: PostgreSQL
* Fuente inicial de datos: Apify Google Maps Scraper
* Objetivo: buscar negocios de alto valor por geolocalización y devolver solo los que no tienen número telefónico registrado.

Objetivo funcional:
Crear una herramienta donde el usuario pueda seleccionar una ubicación en el mapa, definir un radio de búsqueda, elegir categorías de alto valor y ejecutar una búsqueda automática de negocios. El sistema debe guardar los resultados, filtrar los negocios sin teléfono y asignar una puntuación comercial.

Categorías principales de alto valor:

1. Transporte pesado:

* Refacciones para tractocamiones
* Refacciones para trailers
* Taller diesel
* Taller de tractocamiones
* Suspensiones para trailers
* Frenos para trailers
* Llantas para trailers
* Radiadores para tractocamiones
* Transmisiones para camiones diesel

2. Maquinaria pesada:

* Refacciones maquinaria pesada
* Taller maquinaria pesada
* Excavadoras
* Retroexcavadoras
* Montacargas
* Grúas industriales
* Equipos hidráulicos
* Bombas hidráulicas
* Motores diesel industriales

3. Autos caros y refacciones costosas:

* Refacciones BMW
* Refacciones Mercedes Benz
* Refacciones Audi
* Refacciones Porsche
* Refacciones Land Rover
* Refacciones Jaguar
* Taller BMW
* Taller Mercedes Benz
* Taller Audi
* Taller Porsche
* Taller autos premium
* Taller autos de lujo
* Transmisiones automáticas autos premium

4. Vehículos todo terreno / off-road:
- Refacciones RZR
- Refacciones Polaris RZR
- Refacciones Can-Am
- Refacciones Maverick X3
- Refacciones ATV
- Refacciones UTV
- Taller RZR
- Taller Polaris
- Taller Can-Am
- Accesorios off-road
- Accesorios 4x4
- Suspensiones off-road
- Llantas off-road
- Refacciones Jeep 4x4
- Taller 4x4
- Taller off-road

5. Industria y empresas:

* Material eléctrico industrial
* Automatización industrial
* Seguridad industrial
* CCTV empresarial
* Paneles solares industriales
* Telecomunicaciones empresariales
* Redes empresariales
* Sistemas contra incendios
* Generadores eléctricos
* UPS industriales

Backend Python:
Crear servicio que reciba:

* latitude
* longitude
* radius_meters
* categories[]
* max_places_per_category
* min_rating opcional
* min_reviews opcional

El backend debe:

1. Construir búsquedas por categoría.
2. Ejecutar Apify Google Maps Scraper mediante API.
3. Recuperar resultados del dataset.
4. Normalizar campos:

   * name
   * category
   * address
   * phone
   * website
   * rating
   * reviews_count
   * latitude
   * longitude
   * google_maps_url
   * source
5. Filtrar negocios sin teléfono:

   * phone IS NULL
   * phone = ''
   * phone = 'N/A'
6. Calcular puntuación comercial:

   * Sin teléfono: +40
   * Sin sitio web: +30
   * Categoría de alto valor: +30
   * Rating >= 4: +10
   * Reviews entre 5 y 50: +15
   * Reviews mayor a 50: +10
   * Negocio industrial/premium: +20
7. Guardar resultados en PostgreSQL.
8. Evitar duplicados por google_maps_url o place_id.
9. Devolver resultados ordenados por score descendente.

Modelo de base de datos:
Tabla prospect_searches:

* id
* latitude
* longitude
* radius_meters
* categories
* status
* total_found
* total_without_phone
* created_at

Tabla business_prospects:

* id
* search_id
* name
* category
* address
* phone
* website
* rating
* reviews_count
* latitude
* longitude
* google_maps_url
* source
* score
* has_phone
* has_website
* created_at

Frontend Next.js:
Crear pantalla /prospectos

La pantalla debe tener:

1. Mapa para seleccionar ubicación.
2. Input de latitud y longitud manual.
3. Selector de radio:

   * 5 km
   * 10 km
   * 20 km
   * 50 km
4. Checklist de categorías:

   * Transporte pesado
   * Maquinaria pesada
   * Autos premium
   * Gaming / tecnología premium
   * Industria y empresas
5. Botón: Buscar prospectos
6. Tabla de resultados:

   * Nombre
   * Categoría
   * Dirección
   * Teléfono
   * Sitio web
   * Rating
   * Reseñas
   * Score
   * Ver en Google Maps
7. Filtros:

   * Solo sin teléfono
   * Sin sitio web
   * Rating mínimo
   * Reseñas mínimas
   * Score mínimo
8. Exportar:

   * Excel
   * CSV

Reglas importantes:

* No mostrar negocios con teléfono cuando esté activo el filtro “solo sin teléfono”.
* No descargar reviews ni imágenes en la primera versión para ahorrar créditos de Apify.
* La primera versión debe limitarse a máximo 100 resultados por categoría.
* El código debe estar separado por servicios:

  * apify_client.py
  * prospect_service.py
  * scoring_service.py
  * models.py
  * routes/prospects.py
* Agregar variables de entorno:

  * APIFY_TOKEN
  * APIFY_ACTOR_ID
  * DATABASE_URL
* Agregar manejo de errores si Apify falla, si no hay créditos o si el dataset viene vacío.
* Agregar estado de búsqueda:

  * pending
  * running
  * completed
  * failed

Entregable:
Implementar backend, base de datos y frontend funcional para buscar negocios de alto valor por geolocalización, filtrar los que no tienen teléfono y exportar los resultados.

Solo corregiría una palabra: no sería “reciones de razer”, sino probablemente **“refacciones de Razer”** o **“negocios de Razer/gaming premium”**.

Para empezar bien, dile a Codex que primero haga solo el backend con una búsqueda pequeña de prueba. Después ya le pides el mapa y la tabla en Next.js.



ejemplo de códigos 


from apify_client import ApifyClient

# Initialize the ApifyClient with your API token
client = ApifyClient("<YOUR_API_TOKEN>")

# Prepare the Actor input
run_input = {
    "searchStringsArray": ["restaurant"],
    "locationQuery": "New York, USA",
    "maxCrawledPlacesPerSearch": 50,
    "language": "en",
    "categoryFilterWords": [
        "pizza",
        "italian",
    ],
    "searchMatching": "all",
    "placeMinimumStars": "",
    "website": "allPlaces",
    "skipClosedPlaces": False,
    "scrapePlaceDetailPage": False,
    "scrapeTableReservationProvider": False,
    "scrapeOrderOnline": False,
    "includeWebResults": False,
    "scrapeDirectories": False,
    "maxQuestions": 0,
    "scrapeContacts": False,
    "scrapeSocialMediaProfiles": {
        "facebooks": False,
        "instagrams": False,
        "youtubes": False,
        "tiktoks": False,
        "twitters": False,
    },
    "maximumLeadsEnrichmentRecords": 0,
    "leadsEnrichmentDepartments": [
        "sales",
        "marketing",
    ],
    "verifyLeadsEnrichmentEmails": False,
    "maxReviews": 0,
    "reviewsStartDate": "2024-01-01",
    "reviewsSort": "newest",
    "reviewsFilterString": "",
    "reviewsOrigin": "all",
    "scrapeReviewsPersonalData": True,
    "maxImages": 0,
    "scrapeImageAuthors": False,
    "countryCode": "US",
    "city": "New York",
    "state": "New York",
    "county": "New York County",
    "postalCode": "10001",
    "customGeolocation": {
        "type": "Point",
        "coordinates": [
            -73.9857,
            40.7484,
        ],
    },
    "startUrls": [{ "url": "https://www.google.com/maps/place/Yellowstone+National+Park/@44.5857951,-110.5140571,9z/data=!3m1!4b1!4m5!3m4!1s0x5351e55555555555:0xaca8f930348fe1bb!8m2!3d44.427963!4d-110.588455?hl=en-GB" }],
    "placeIds": ["ChIJabcdEFGHijklMNOPqrstUVWX"],
    "allPlacesNoSearchAction": "",
}

# Run the Actor and wait for it to finish
run = client.actor("nwua9Gu5YrADL7ZDj").call(run_input=run_input)

# Fetch and print Actor results from the run's dataset (if there are any)
for item in client.dataset(run["defaultDatasetId"]).iterate_items():
    print(item)