# Reglas de visibilidad en frontend

## Objetivo

Definir que datos comerciales pueden mostrarse al usuario final y que datos deben permanecer internos.

## 1. Que mostrar

| Dato | Mostrar |
|---|---:|
| Nombre producto | Si |
| Modelo | Si |
| Marca | Si |
| Imagen portada | Si |
| Categoria | Si |
| Precio final | Si |
| Disponibilidad comercial | Si |
| Stock separado por origen | Opcional |
| Garantia | Si |
| Ficha tecnica | Si |

## 2. Que no mostrar

| Dato | Motivo |
|---|---|
| Costo proveedor | Informacion interna. |
| Precio SYSCOM bruto | No es precio cliente. |
| Link privado | Puede exponer proveedor/cuenta. |
| RawData | Tecnico/interno. |
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

## 4. Cotizacion

Toda cotizacion debe mostrar:

```txt
Precio valido por X horas.
Disponibilidad sujeta a confirmacion al momento de compra.
```

## 5. Productos de proyecto

Si `IsProject = true`, mostrar:

```txt
Producto bajo proyecto / consultar con asesor.
```
