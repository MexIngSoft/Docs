# Data Quality — Limpieza y normalización

> Ruta actual: `/docs/03_standards/operations/data-quality.md`

## 1. Problemas esperados en datos SYSCOM

| Problema | Ejemplo |
|---|---|
| Número como texto | `"37.50"` |
| Valor no disponible | `"-"` |
| Texto con espacios dobles | `"Control  de Acceso"` |
| Campo vacío | `""` |
| Campo null como texto | `"null"` |
| Precios como array vacío | `precios: []` |
| Iconos como array u objeto | `iconos: []` o `{}` |
| Nombre largo | títulos mayores a 250 caracteres |

## 2. Normalización de texto

```txt
strip()
reemplazar espacios múltiples por uno
conservar acentos
no convertir todo a mayúsculas salvo campos de código
```

## 3. Normalización numérica

```txt
"-" → null
"" → null
"0" → Decimal(0)
"37.50" → Decimal("37.50")
```

## 4. Reglas de campos largos

Para `titulo`, usar `TextField` o `varchar(500/1000)`.

No se recomienda `varchar(250)` para nombres de productos SYSCOM, porque pueden ser muy largos.

## 5. RawData

Siempre conservar RawData para:

- Auditoría.
- Reproceso.
- Debug.
- Recuperar campos no mapeados inicialmente.

## 6. Visibilidad frontend

No todo producto debe mostrarse.

Reglas posibles:

| Condición | IsVisible |
|---|---:|
| Sin nombre | false |
| Sin precio | false o sujeto a consulta |
| Nota: solicitar distribución | false o bajo consulta |
| Producto proyecto | visible solo si usuario autorizado |
| Sin imagen | visible si tiene datos mínimos |
