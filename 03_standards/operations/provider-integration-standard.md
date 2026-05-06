# Estandar para integrar proveedores

## Objetivo

Definir los pasos minimos para agregar un proveedor nuevo sin romper la arquitectura modular.

## Checklist

1. Documentar endpoints en `docs/04_integrations/{provider}/api_reference/{provider}-*.md`.
2. Crear servicios HTTP en `supplier/{provider}/services`.
3. Crear mappers en `supplier/{provider}/mappers`.
4. Crear writers hacia `Supplier` en `supplier/{provider}/writers`.
5. Crear publishers hacia modulos internos cuando aplique.
6. Crear comandos individuales `sync_*` y `publish_*`.
7. Crear un comando orquestador `sync_{provider}_all`.
8. Agregar pruebas o, al menos, comandos de verificacion.
9. Documentar orden de ejecucion en `docs/04_integrations/{provider}/etl/{provider}-commands.md`.

## Estructura recomendada

```text
supplier/{provider}/services
supplier/{provider}/mappers
supplier/{provider}/writers
supplier/{provider}/sync
supplier/management/commands/sync_{provider}_*.py
supplier/management/commands/publish_{provider}_*.py
```

## Requisitos de datos

Cada proveedor debe guardar:

- Proveedor (`Supplier`).
- ID externo estable.
- SKU externo cuando exista.
- Nombre o descripcion basica.
- `RawData` completo.
- Fecha de ultima vista o captura.
- Logs de ejecucion.

## Orden recomendado

```text
1. Credenciales o token
2. Categorias
3. Publicacion de categorias
4. Marcas
5. Publicacion de marcas
6. Productos
7. Publicacion de productos
8. Stock proveedor
9. Precios proveedor
10. Publicacion de precios
11. Relaciones, accesorios o enriquecimientos
```

## Criterios de aceptacion

- Se puede ejecutar cada catalogo por separado.
- Se puede ejecutar todo desde un orquestador.
- Repetir el comando no debe duplicar maestros.
- Los errores por registro no deben detener todo el proceso.
- El dato original queda disponible para auditoria.
- Los modulos internos no conocen detalles de la API externa.
