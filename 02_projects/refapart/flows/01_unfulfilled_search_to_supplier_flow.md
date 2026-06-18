# REFAPART Unfulfilled Search To Supplier Flow

## Objetivo

Convertir busquedas sin resultado en demanda operable por cotizadores y
proveedores.

## Flujo

1. Detectar busqueda sin resultado util.
2. Mostrar mensaje de pieza no encontrada.
3. Capturar datos opcionales del cliente.
4. Crear o relacionar `SearchQuery`.
5. Crear `UnfulfilledSearchDemand`.
6. Crear `PartRequest`.
7. Emitir `search.requested`.
8. Sugerir proveedores compatibles.
9. Preparar mensaje WhatsApp.
10. Registrar contacto y respuesta.

## Formulario cliente

- Nombre opcional.
- WhatsApp opcional.
- Ciudad.
- Marca.
- Modelo.
- Anio.
- Pieza.
- Motor.
- Version.
- Lado.
- Posicion.
- Notas.
- Fotos opcionales.
- Urgencia.
