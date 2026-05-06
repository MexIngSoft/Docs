# Frontend Rules

> Ruta actual: `/docs/03_standards/operations/frontend-rules.md`

## 1. Qué mostrar

| Dato | Mostrar |
|---|---:|
| Nombre producto | Sí |
| Modelo | Sí |
| Marca | Sí |
| Imagen portada | Sí |
| Categoría | Sí |
| Precio final | Sí |
| Disponibilidad comercial | Sí |
| Stock separado por origen | Opcional |
| Garantía | Sí |
| Ficha técnica | Sí |

## 2. Qué NO mostrar

| Dato | Motivo |
|---|---|
| Costo proveedor | Información interna. |
| Precio SYSCOM bruto | No es precio cliente. |
| Link privado | Puede exponer proveedor/cuenta. |
| RawData | Técnico/interno. |
| Token | Seguridad. |

## 3. Disponibilidad sugerida

Mostrar textos comerciales:

| Caso | Texto frontend |
|---|---|
| Stock propio > 0 | `Disponible en oficina` |
| Stock SYSCOM vigente > 0 | `Disponible bajo pedido` |
| Ambos | `Disponible en oficina y proveedor` |
| Sin stock | `No disponible` |
| Stock viejo | `Consultar disponibilidad` |

## 4. Cotización

Toda cotización debe mostrar:

```txt
Precio válido por X horas.
Disponibilidad sujeta a confirmación al momento de compra.
```

## 5. Productos de proyecto

Si `IsProject = true`, mostrar:

```txt
Producto bajo proyecto / consultar con asesor.
```
