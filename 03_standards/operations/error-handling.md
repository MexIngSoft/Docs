# Error Handling

> Ruta actual: `/docs/03_standards/operations/error-handling.md`

## 1. Objetivo

Definir cómo manejar errores sin perder control del proceso.

## 2. Tipos de errores

| Tipo | Ejemplo | Acción |
|---|---|---|
| Auth | Token vencido | Renovar token y reintentar. |
| Red | Timeout | Retry con backoff. |
| HTTP | 429 rate limit | Esperar y reintentar. |
| HTTP | 500 proveedor | Reintentar y registrar. |
| Datos | Campo nulo | Aplicar regla de limpieza. |
| Datos | Precio inválido | Saltar precio, no producto. |
| DB | Duplicado | Usar upsert. |
| DB | Texto muy largo | Aumentar campo o truncar con warning. |

## 3. Retry

Recomendación:

```txt
Intento 1: inmediato
Intento 2: esperar 5 segundos
Intento 3: esperar 15 segundos
Fallo final: registrar error
```

## 4. Nivel de transacción

No usar una sola transacción para todo el full sync.

Recomendado:

```txt
Transacción por producto
Transacción por lote pequeño
```

Así, si falla un producto, no se pierde toda la sincronización.

## 5. SupplierSyncLog

Cada proceso debe registrar:

- Inicio.
- Fin.
- Estado.
- Cantidad creada.
- Cantidad actualizada.
- Cantidad saltada.
- Cantidad con error.
- Error general.
- Metadata.

## 6. Logs por producto

Cuando falle un producto, registrar:

```txt
Provider
ExternalProductId
Endpoint
Payload/resumen
Error
Fecha
```

## 7. Errores no fatales

No deben detener todo el sync:

- Marca sin detalle.
- Producto sin precio.
- Producto sin imagen.
- Categoría relacionada no encontrada.
- Accesorios fallidos.

## 8. Errores fatales

Sí deben detener proceso:

- Sin credenciales SYSCOM.
- No se puede obtener token.
- Base de datos no disponible.
- Respuesta raíz inválida para proceso principal.
