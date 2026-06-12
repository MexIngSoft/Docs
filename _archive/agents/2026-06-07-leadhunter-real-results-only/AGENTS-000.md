Sí, tienes razón. Revisé el CSV y **lo que te generó son datos de ejemplo/falsos**: nombres como “Autos premium Norte” y URLs tipo `sample...`. Eso no sirve como prospección real.

El problema no es solo Apify: **también está mal el criterio de búsqueda**. No debe buscar por categorías genéricas como “autos premium” o “maquinaria pesada”, sino por **palabras reales que usan los negocios y clientes**.

Pega esta instrucción mejorada a Codex:

Corregir el módulo LeadForge / LeadHunter porque actualmente está generando datos de prueba o negocios falsos.

Problema detectado:
El sistema devolvió resultados tipo sample, por ejemplo:

* Autos premium Norte
* Industria y negocio Norte
* Maquinaria pesada Norte
* Transporte pesado Norte
* URLs de Google Maps con “sample”

Esto no debe permitirse. El sistema solo debe guardar negocios reales obtenidos desde Apify/Google Maps.

Reglas obligatorias:

1. Eliminar cualquier mock, seed, fake data, sample data o fallback automático.
2. Si Apify no devuelve resultados reales, la API debe responder con lista vacía y mensaje claro.
3. No inventar negocios.
4. No generar nombres artificiales.
5. No guardar URLs que contengan:

   * sample
   * test
   * demo
   * fake
   * placeholder
6. Validar que cada negocio tenga al menos:

   * name real
   * address real
   * google_maps_url real
   * latitude y longitude si están disponibles
7. Si no hay conexión con Apify o falla el token, devolver error controlado, no datos falsos.

Nuevo criterio de búsqueda:
El sistema no debe buscar solo por categorías genéricas. Debe buscar por combinaciones de palabras reales usadas por clientes y negocios.

Crear un catálogo de palabras clave dividido por vertical comercial.

VERTICAL 1: Transporte pesado y tractocamiones

Palabras base:

* refaccionaria
* refacciones
* autopartes
* partes
* taller
* servicio
* transmisiones
* suspensión
* frenos
* clutch
* embrague
* radiadores
* muelles
* diferenciales
* motores diesel
* inyectores diesel
* turbo diesel
* reparación diesel
* grúas
* tractocamiones
* camiones
* trailers
* remolques
* semirremolques

Marcas:

* Volvo
* Kenworth
* Freightliner
* International
* Scania
* Mercedes Benz
* Isuzu
* Hino
* Dina
* Cummins
* Detroit Diesel
* Caterpillar

Búsquedas generadas:

* refacciones tractocamiones
* refaccionaria tractocamiones
* autopartes tractocamiones
* taller diesel tractocamiones
* transmisiones tractocamiones
* frenos para trailers
* suspensión para trailers
* refacciones Volvo camiones
* refacciones Kenworth
* refacciones Freightliner
* motores Cummins
* motores Detroit Diesel
* taller diesel Cummins
* grúas industriales

VERTICAL 2: Transporte de líquidos y pipas

Palabras base:

* pipas
* pipas de agua
* pipas de gasolina
* pipas de diesel
* transporte de líquidos
* tanques
* autotanques
* remolques tanque
* bombas para pipas
* válvulas para pipas
* mangueras industriales
* conexiones industriales
* transporte de combustible
* transporte de agua potable
* transporte de químicos

Búsquedas generadas:

* pipas de agua
* pipas de gasolina
* transporte de líquidos
* transporte de combustible
* autotanques
* remolques tanque
* bombas para pipas
* válvulas para pipas
* mangueras industriales para pipas

VERTICAL 3: Maquinaria pesada

Palabras base:

* maquinaria pesada
* refacciones maquinaria pesada
* reparación maquinaria pesada
* excavadoras
* retroexcavadoras
* bulldozer
* cargadores frontales
* montacargas
* grúas
* hidráulica
* bombas hidráulicas
* cilindros hidráulicos
* mangueras hidráulicas
* motores diesel industriales

Marcas:

* Caterpillar
* Komatsu
* John Deere
* JCB
* Case
* New Holland
* Bobcat
* Toyota montacargas
* Yale
* Hyster

Búsquedas generadas:

* refacciones maquinaria pesada
* taller maquinaria pesada
* refacciones Caterpillar
* refacciones Komatsu
* reparación excavadoras
* reparación retroexcavadoras
* bombas hidráulicas
* mangueras hidráulicas
* montacargas refacciones
* taller montacargas

VERTICAL 4: Vehículos todo terreno / off-road

Palabras base:

* RZR
* Polaris
* Can-Am
* Maverick X3
* ATV
* UTV
* 4x4
* off road
* todo terreno
* refacciones RZR
* refacciones Polaris
* refacciones Can-Am
* accesorios 4x4
* suspensión off road
* llantas off road
* taller 4x4
* taller off road

Búsquedas generadas:

* refacciones RZR
* refacciones Polaris RZR
* refacciones Can-Am
* refacciones Maverick X3
* taller Polaris RZR
* taller Can-Am
* accesorios off road
* accesorios 4x4
* suspensión off road
* llantas off road
* taller 4x4

VERTICAL 5: Autos premium y refacciones costosas

Marcas:

* BMW
* Mercedes Benz
* Audi
* Porsche
* Land Rover
* Jaguar
* Volvo
* Mini Cooper
* Lexus
* Acura
* Infiniti
* Tesla

Palabras base:

* refacciones
* autopartes
* taller
* transmisiones automáticas
* suspensión
* frenos
* sensores
* módulos
* diagnóstico automotriz
* servicio especializado

Búsquedas generadas:

* refacciones BMW
* taller BMW
* refacciones Mercedes Benz
* taller Mercedes Benz
* refacciones Audi
* taller Audi
* refacciones Porsche
* taller Porsche
* refacciones Land Rover
* transmisiones automáticas autos premium
* diagnóstico automotriz premium

VERTICAL 6: Industria y venta B2B

Palabras base:

* material eléctrico industrial
* automatización industrial
* tableros eléctricos
* variadores de frecuencia
* motores eléctricos
* compresores industriales
* generadores eléctricos
* UPS industriales
* CCTV empresarial
* redes empresariales
* telecomunicaciones empresariales
* seguridad industrial
* sistemas contra incendios
* paneles solares industriales

Búsquedas generadas:

* material eléctrico industrial
* automatización industrial
* tableros eléctricos
* variadores de frecuencia
* motores eléctricos industriales
* generadores eléctricos
* UPS industriales
* CCTV empresarial
* redes empresariales
* telecomunicaciones empresariales
* sistemas contra incendios
* paneles solares industriales

Ubicación:
El sistema debe permitir buscar por:

* latitud
* longitud
* radio en kilómetros
* país
* estado
* ciudad
* dirección escrita

La ubicación no debe estar fija en código.

Agregar puntos base configurables para ciudades objetivo:

* Pachuca, Hidalgo
* CDMX
* Monterrey
* Guadalajara
* Querétaro
* Puebla
* Toluca
* León
* San Luis Potosí
* Aguascalientes
* Mérida
* Tijuana
* Cancún
* Saltillo
* Torreón

Cada ciudad debe tener:

* name
* state
* country
* latitude
* longitude
* default_radius_km

Importante:
Las coordenadas deben guardarse en una tabla editable o archivo de configuración. No deben estar quemadas directamente en la lógica principal.

Nuevo flujo de búsqueda:

1. El usuario selecciona ciudad o coloca coordenadas.
2. El usuario selecciona vertical comercial.
3. El sistema genera búsquedas combinando:

   * palabra base
   * marca
   * tipo de servicio
   * ciudad/estado
4. Apify ejecuta cada búsqueda.
5. El backend normaliza resultados.
6. El backend elimina duplicados.
7. El backend descarta resultados falsos o sample.
8. El backend filtra negocios sin teléfono.
9. El backend calcula score.
10. El frontend muestra solo negocios reales.

Filtro principal:
Guardar como prospecto prioritario solo si:

phone está vacío
o phone es null
o phone es N/A

Y además debe cumplir al menos 2 de estas condiciones:

* Tiene dirección real.
* Tiene categoría real.
* Tiene rating.
* Tiene reseñas.
* Tiene URL real de Google Maps.
* Tiene coordenadas.
* Tiene sitio web vacío, lo cual aumenta prioridad.

Sistema de puntuación:

* Sin teléfono: +40
* Sin sitio web: +30
* Vertical de alto valor: +30
* Marca premium o industrial: +20
* Rating mayor o igual a 4: +10
* De 5 a 50 reseñas: +15
* Más de 50 reseñas: +10
* Dirección completa: +10
* Coordenadas válidas: +10

Penalizaciones:

* Nombre genérico artificial: -100
* URL con sample/test/demo/fake: -100
* Sin dirección: -20
* Sin categoría: -10
* Resultado duplicado: descartar
* Negocio cerrado permanentemente: descartar si el dato está disponible

Frontend:
Actualizar el catálogo actual para que no muestre categorías genéricas solamente.

Debe permitir seleccionar:

* Transporte pesado
* Transporte de líquidos / pipas
* Maquinaria pesada
* Off-road / 4x4
* Autos premium
* Industria B2B

Dentro de cada vertical, permitir seleccionar:

* Marcas
* Refacciones
* Talleres
* Transmisiones
* Grúas
* Hidráulica
* Pipas
* Autopartes
* Accesorios
* Servicios especializados

Agregar botón:
“Buscar negocios reales sin teléfono”

Agregar advertencia:
“Si no hay resultados reales, el sistema no generará datos de ejemplo.”

Criterio de aceptación:
La tarea solo se considera terminada si:

1. No existen datos sample en la respuesta.
2. No se inventan negocios.
3. La búsqueda usa palabras clave reales.
4. Se puede cambiar la ubicación.
5. Se puede seleccionar vertical comercial.
6. Se puede seleccionar marcas y palabras clave.
7. Solo se muestran negocios sin teléfono.
8. Los resultados tienen URL real de Google Maps.
9. Los resultados pueden exportarse a CSV o Excel.
10. El sistema corre completo en Docker.

La clave es esta: **no busques “autos premium” ni “maquinaria pesada” como categoría general**. Busca como buscaría una persona real:

```text
refacciones Volvo camiones Pachuca
taller diesel Cummins Querétaro
bombas hidráulicas Puebla
pipas de agua Hidalgo
refacciones RZR CDMX
transmisiones automáticas BMW
```

Eso debería mejorar muchísimo la calidad de resultados.
