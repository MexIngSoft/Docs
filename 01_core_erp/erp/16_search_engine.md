# Search Engine Global

El Search Engine es un modulo core reutilizable del ERP.

Toda web que necesite busqueda debe consumir Search mediante Gateway General. No se permiten buscadores aislados con logica duplicada cuando el caso aplica a productos, documentos, servicios u operaciones.

## Responsabilidades

- Normalizar terminos.
- Manejar sinonimos y errores comunes.
- Indexar documentos buscables.
- Registrar consultas.
- Crear demanda no satisfecha cuando no existan resultados.
- Exponer sugerencias.

## No Responsabilidades

- Calcular precios finales.
- Reservar inventario.
- Crear ventas.
- Gestionar proveedores.

Esas responsabilidades pertenecen a sus APIs de dominio.
