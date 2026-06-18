# REFAPART Customer Search Flow

## Objetivo

Permitir que el cliente busque una refaccion por texto libre, pieza, vehiculo,
anio, ciudad, categoria o numero de parte.

## Flujo

1. Recibir `RawQuery`.
2. Crear `SessionId` si el usuario no esta autenticado.
3. Normalizar texto.
4. Aplicar diccionario automotriz.
5. Corregir errores comunes.
6. Detectar intencion.
7. Buscar coincidencia exacta.
8. Buscar coincidencia flexible.
9. Buscar compatibilidad.
10. Calcular `SearchScore`.
11. Ordenar resultados.
12. Guardar `SearchQuery`.
13. Guardar `SearchResultLog`.
14. Si no hay resultados utiles, crear `UnfulfilledSearchDemand`.
15. Mostrar CTA de solicitud.

## Normalizaciones iniciales

| Entrada | Salida |
|---|---|
| facia | fascia |
| fasia | fascia |
| nisan | nissan |
| calabera | calavera |
| piloto | izquierdo |
| copiloto | derecho |
| defensa | fascia, cuando aplique |

## Ranking sugerido

| Factor | Peso |
|---|---|
| TextMatchScore | 0.30 |
| VehicleMatchScore | 0.25 |
| PartMatchScore | 0.20 |
| CompatibilityScore | 0.15 |
| AvailabilityScore | 0.05 |
| TrustScore | 0.03 |
| LocationScore | 0.02 |
