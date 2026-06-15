Sí. El buscador debe ser un **motor de búsqueda inteligente de refacciones**, no un simple `LIKE`.

La documentación del repo dice que **Refakto/RefaPart es marketplace de refacciones usadas**, y que su MVP incluye catálogo, publicación, búsqueda, compra y envío. También dice que el frontend no debe consumir directamente APIs core, sino pasar por Gateway/BFF → API del proyecto → Core ERP APIs. ([GitHub][1]) ([GitHub][2])

# 1. División correcta

## En RefaPart / Refakto

Debe vivir la experiencia de búsqueda:

```txt
02_projects/refakto/search/
```

Aquí va:

```txt
buscador público
autocompletado
pantalla de resultados
pantalla de pieza no encontrada
filtros visuales
corrección de texto para usuario
historial local/sesión
captura de WhatsApp opcional
```

## En ERP / JobCron

Debe vivir el motor reutilizable:

```txt
01_core_erp/search/
01_core_erp/catalog/
01_core_erp/inventory/
01_core_erp/product_compatibility/
01_core_erp/demand/
```

Porque la documentación indica que lo reutilizable debe ir en `01_core_erp`, incluyendo modelos, APIs internas y flujos genéricos. ([GitHub][3])

---

# 2. Objetivo del algoritmo

El usuario puede escribir mal:

```txt
facía versa 2020
fasia nisan versa
defensa delantera bmw 320
calabera sentra 2018
retrovisor lado piloto aveo
motor 2.5 altima
```

El sistema debe entender:

```txt
pieza
marca
modelo
año
lado
posición
versión
motor
sinónimos
errores de escritura
compatibilidad
disponibilidad
ubicación
precio
confianza del resultado
```

---

# 3. Algoritmo óptimo por capas

## Capa 1: Normalización del texto

Entrada:

```txt
"Facía delantera Nisan Versa dos mil veinte lado copiloto"
```

Salida:

```json
{
  "RawQuery": "Facía delantera Nisan Versa dos mil veinte lado copiloto",
  "NormalizedQuery": "fascia delantera nissan versa 2020 lado derecho"
}
```

Debe hacer:

```txt
minúsculas
quitar acentos
corregir letras comunes
convertir años escritos a número
quitar palabras basura
normalizar marcas
normalizar modelos
normalizar piezas
normalizar lados
normalizar posiciones
```

Ejemplos:

```txt
nisan       → nissan
fasia       → fascia
facía       → fascia
calabera    → calavera
defensa     → fascia / defensa, según catálogo
lado piloto → izquierdo
lado chofer → izquierdo
lado copiloto → derecho
```

---

## Capa 2: Diccionario automotriz

Crear tablas ERP:

```sql
SearchDictionaryTerm
- Id
- Term
- NormalizedTerm
- TermType
- CanonicalValue
- Confidence
- IsActive
- CreatedAt
- UpdatedAt
```

`TermType`:

```txt
Brand
Model
Part
Synonym
Position
Side
Engine
Transmission
Year
CommonTypo
```

Ejemplo:

```txt
Term: facia
TermType: CommonTypo
CanonicalValue: fascia

Term: defensa
TermType: Synonym
CanonicalValue: fascia

Term: piloto
TermType: Side
CanonicalValue: izquierdo
```

---

## Capa 3: Extracción de intención

El buscador debe convertir texto libre en intención estructurada.

Entrada:

```txt
"busco espejo izquierdo para aveo 2016"
```

Salida:

```json
{
  "PartName": "espejo lateral",
  "Brand": "chevrolet",
  "Model": "aveo",
  "Year": 2016,
  "Side": "izquierdo",
  "Position": null,
  "IntentConfidence": 0.91
}
```

---

## Capa 4: Búsqueda exacta

Primero buscar coincidencias fuertes:

```txt
marca exacta
modelo exacto
año exacto
pieza exacta
lado exacto
posición exacta
motor exacto
```

Puntaje sugerido:

```txt
pieza exacta: +35
marca exacta: +20
modelo exacto: +20
año exacto: +15
lado exacto: +5
posición exacta: +5
```

---

## Capa 5: Búsqueda flexible

Si no hay suficientes resultados, relajar condiciones:

```txt
año ±1
modelo equivalente
pieza sinónimo
marca corregida
sin lado
sin versión
sin motor
```

Ejemplo:

```txt
fascia versa 2020
```

También puede mostrar:

```txt
fascia versa 2019
fascia versa 2021
fascia compatible versa 2020
fascia sin especificar año exacto
```

---

## Capa 6: Compatibilidad

La documentación ya contempla `ProductCompatibility` como modelo del ERP para validación técnica entre componentes. ([GitHub][4])

Crear:

```sql
ProductCompatibility
- Id
- ProductId
- Brand
- Model
- YearStart
- YearEnd
- Engine
- Version
- Transmission
- BodyType
- Notes
- CompatibilityConfidence
- CreatedAt
- UpdatedAt
```

Esto permite que si el usuario busca:

```txt
fascia versa 2020
```

Aparezca una pieza publicada como:

```txt
fascia versa 2019-2022
```

---

## Capa 7: Ranking final

Cada producto debe recibir un `SearchScore`.

Fórmula recomendada:

```txt
SearchScore =
TextMatchScore * 0.30 +
VehicleMatchScore * 0.25 +
PartMatchScore * 0.20 +
CompatibilityScore * 0.15 +
AvailabilityScore * 0.05 +
SellerTrustScore * 0.03 +
LocationScore * 0.02
```

Interpretación:

```txt
90-100 → resultado muy probable
70-89  → buen resultado
50-69  → posible coincidencia
menos de 50 → sugerencia secundaria
```

---

# 4. Flujo completo

```txt
1. Usuario escribe búsqueda.
2. Gateway recibe la búsqueda.
3. Refakto API normaliza el texto.
4. Refakto API consulta Search API del ERP.
5. Search API consulta Catalog, Inventory y ProductCompatibility.
6. Search API calcula puntaje.
7. Devuelve resultados ordenados.
8. Refakto muestra:
   - resultados exactos
   - resultados compatibles
   - sugerencias
   - búsqueda avanzada
9. Si no hay resultados útiles, se guarda demanda no satisfecha.
```

La documentación indica que el frontend debe pasar por Gateway/BFF y no consumir directamente las APIs core. ([GitHub][2])

---

# 5. Endpoints necesarios

## Gateway RefaPart

```txt
POST /api/search
GET /api/search/suggestions
POST /api/search/unfulfilled
```

## Refakto API

```txt
POST /api/refakto/search
GET /api/refakto/search/suggestions
POST /api/refakto/search/save-demand
```

## Core ERP Search API

```txt
POST /api/search/parts
GET /api/search/dictionary
POST /api/search/normalize
POST /api/search/reindex
GET /api/search/logs
```

---

# 6. Respuesta esperada del buscador

```json
{
  "query": "facía nisan versa 2020",
  "normalizedQuery": "fascia nissan versa 2020",
  "detectedIntent": {
    "brand": "nissan",
    "model": "versa",
    "year": 2020,
    "partName": "fascia",
    "side": null,
    "position": "delantera",
    "confidence": 0.94
  },
  "results": [
    {
      "productId": 1001,
      "title": "Fascia delantera Nissan Versa 2020",
      "score": 98,
      "matchType": "ExactMatch",
      "availability": "Available"
    },
    {
      "productId": 1002,
      "title": "Defensa delantera Nissan Versa 2019-2022",
      "score": 87,
      "matchType": "CompatibleMatch",
      "availability": "Available"
    }
  ],
  "suggestions": [
    "fascia delantera nissan versa 2020",
    "defensa delantera nissan versa 2020"
  ]
}
```

---

# 7. Cuando no encuentre pieza

No debe terminar en “sin resultados”.

Debe hacer esto:

```txt
1. Guardar búsqueda.
2. Crear demanda no satisfecha.
3. Mostrar formulario opcional.
4. Agrupar búsquedas parecidas.
5. Mandar esa demanda al ERP para proveedores.
```

Ejemplo:

```txt
No encontramos “fascia Nissan Versa 2020” disponible ahora.

Podemos buscarla con proveedores.
Déjanos tu WhatsApp y te avisamos cuando la encontremos.
```

---

# 8. Tablas mínimas para Codex

```sql
SearchQueryLog
- Id
- ProjectCode
- UserId
- SessionId
- RawQuery
- NormalizedQuery
- DetectedBrand
- DetectedModel
- DetectedYear
- DetectedPartName
- DetectedSide
- DetectedPosition
- ResultsCount
- BestScore
- SearchStatus
- CreatedAt

SearchDictionaryTerm
- Id
- Term
- NormalizedTerm
- TermType
- CanonicalValue
- Confidence
- IsActive
- CreatedAt
- UpdatedAt

SearchResultLog
- Id
- SearchQueryLogId
- ProductId
- Score
- MatchType
- RankPosition
- WasClicked
- WasContacted
- WasPurchased
- CreatedAt

UnfulfilledPartDemand
- Id
- SearchQueryLogId
- Brand
- Model
- Year
- PartName
- Side
- Position
- ContactPhone
- ContactName
- DemandStatus
- Priority
- CreatedAt
- UpdatedAt
```

Usar PascalCase en tablas/campos publicados, porque así lo indica la documentación. ([GitHub][3])

---

# 9. Instrucción lista para Codex

```txt
Implementar un motor avanzado de búsqueda de refacciones para Refakto/RefaPart.

Respetar la arquitectura documentada:
- El frontend no debe consumir APIs core directamente.
- El flujo debe ser Web → Refakto Gateway/BFF → Refakto API → Core ERP APIs.
- Lo reutilizable debe vivir en 01_core_erp.
- Lo específico del marketplace debe vivir en 02_projects/refakto.
- Las tablas y campos publicados deben documentarse en PascalCase.

Crear un módulo Core ERP Search que permita:
1. Normalizar búsquedas de usuarios.
2. Corregir errores comunes.
3. Detectar marca, modelo, año, pieza, lado, posición, motor y versión.
4. Usar diccionarios de sinónimos automotrices.
5. Buscar coincidencias exactas.
6. Buscar coincidencias flexibles.
7. Buscar compatibilidades por ProductCompatibility.
8. Calcular SearchScore.
9. Ordenar resultados por relevancia.
10. Guardar cada búsqueda en SearchQueryLog.
11. Guardar resultados mostrados en SearchResultLog.
12. Crear UnfulfilledPartDemand cuando no existan resultados útiles.

El buscador debe soportar usuarios no autenticados usando SessionId.
Si la búsqueda no tiene resultados, debe conservarse como demanda para futuras búsquedas y para consultar proveedores.

Implementar ranking con la siguiente lógica:
- TextMatchScore
- VehicleMatchScore
- PartMatchScore
- CompatibilityScore
- AvailabilityScore
- SellerTrustScore
- LocationScore

Crear endpoints:
POST /api/search/parts
POST /api/search/normalize
GET /api/search/suggestions
POST /api/search/reindex
GET /api/search/logs

Crear endpoints del proyecto Refakto:
POST /api/refakto/search
GET /api/refakto/search/suggestions
POST /api/refakto/search/save-demand

La respuesta debe incluir:
- búsqueda original
- búsqueda normalizada
- intención detectada
- resultados exactos
- resultados compatibles
- sugerencias
- estado de demanda si no se encontró pieza

El objetivo es que el usuario pueda escribir mal o incompleto y aun así encontrar piezas relevantes.
```

La idea central: **RefaPart debe entender al usuario aunque escriba mal, y el ERP debe aprender de cada búsqueda para mejorar inventario, proveedores y ventas futuras.**

[1]: https://github.com/MexIngSoft/Docs/tree/main/02_projects/refakto "Docs/02_projects/refakto at main · MexIngSoft/Docs · GitHub"
[2]: https://github.com/MexIngSoft/Docs/blob/main/01_core_erp/architecture/07_project_api_pattern.md "Docs/01_core_erp/architecture/07_project_api_pattern.md at main · MexIngSoft/Docs · GitHub"
[3]: https://github.com/MexIngSoft/Docs "GitHub - MexIngSoft/Docs · GitHub"
[4]: https://github.com/MexIngSoft/Docs/tree/main/01_core_erp "Docs/01_core_erp at main · MexIngSoft/Docs · GitHub"
