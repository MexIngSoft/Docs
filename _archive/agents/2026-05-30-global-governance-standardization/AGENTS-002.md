Sí, me parece necesario. Si DocuCore va a convertirse en una plataforma profesional y posteriormente en un ERP documental, no conviene cobrar únicamente por "documento procesado". El costo real está asociado a recursos consumidos:

* Tamaño del archivo (MB/GB).
* Cantidad de páginas.
* Calidad de imágenes.
* OCR requerido.
* IA utilizada.
* Conversión realizada.
* Tiempo de CPU.
* Memoria utilizada.
* Almacenamiento temporal.
* Transferencia de archivos.

Por eso propondría un sistema de **Créditos DocuCore**, donde cada operación consume créditos y el administrador puede modificar reglas desde el ERP.

---

# Modelo de Costos DocuCore

## Unidad Base

1 Crédito DocuCore (DC) = $0.10 MXN

Ejemplos:

| Créditos | Valor      |
| -------- | ---------- |
| 100      | $10 MXN    |
| 500      | $50 MXN    |
| 1,000    | $100 MXN   |
| 10,000   | $1,000 MXN |

---

# Reglas de Consumo

## PDF

### Dividir PDF

Costo:

```text
1 crédito por página
+
0.5 crédito por MB
```

Ejemplo:

PDF 100 páginas
20 MB

```text
100 créditos
+
10 créditos

110 créditos
=
$11 MXN
```

---

## Combinar PDF

```text
0.8 créditos por página total
+
0.5 crédito por MB
```

---

## Comprimir PDF

```text
2 créditos por página
+
1 crédito por MB
```

Porque requiere reprocesamiento.

---

## OCR

OCR consume mucho más.

```text
5 créditos por página
+
2 créditos por MB
```

Ejemplo:

100 páginas
50 MB

```text
500
+
100

600 créditos
=
$60 MXN
```

---

## OCR IA Avanzado

Extracción de tablas.

Extracción jurídica.

Extracción contable.

```text
10 créditos por página
+
5 créditos por MB
```

---

## PDF a Word

```text
3 créditos por página
+
1 crédito por MB
```

---

## Word a PDF

```text
0.5 crédito por página
```

---

## Imagen a PDF

```text
2 créditos por imagen
+
0.5 crédito por MB
```

---

## Excel

### XLSX → CSV

```text
5 créditos por archivo
```

---

## ZIP

```text
1 crédito por MB extraído
```

---

# Factor de Complejidad

Además del costo base.

| Complejidad | Multiplicador |
| ----------- | ------------- |
| Baja        | x1            |
| Media       | x1.5          |
| Alta        | x2            |
| IA          | x3            |

Ejemplo:

OCR 100 páginas

600 créditos

Complejidad IA

```text
600 x 3

1800 créditos
```

---

# Sistema de Publicidad

Para usuarios gratuitos.

Ver anuncio = obtener créditos.

## Recompensa

| Acción               | Créditos |
| -------------------- | -------- |
| Banner               | 2        |
| Video 15 segundos    | 10       |
| Video 30 segundos    | 20       |
| Encuesta             | 30       |
| Registro patrocinado | 50       |

---

## Límite Diario

```text
100 créditos diarios
```

Equivalente:

```text
$10 MXN diarios
```

---

# Plan Gratuito

Mensualmente:

```text
500 créditos
```

*

Publicidad.

Ideal para usuarios ocasionales.

---

# Plan Personal

$99 MXN / mes

Incluye:

```text
2,000 créditos
```

---

# Plan Profesional

$299 MXN / mes

Incluye:

```text
10,000 créditos
```

---

# Plan Empresa

$999 MXN / mes

Incluye:

```text
50,000 créditos
```

---

# Plan Enterprise

Cotización personalizada.

Créditos ilimitados o paquetes de:

```text
100,000
250,000
500,000
1,000,000
```

---

# Compra de Créditos

| Créditos | Precio |
| -------- | ------ |
| 500      | $50    |
| 1,000    | $100   |
| 5,000    | $450   |
| 10,000   | $850   |
| 25,000   | $2,000 |
| 50,000   | $3,750 |

---

# Administración ERP

Yo agregaría un módulo completo:

```text
DocuCore ERP
│
├── Costos
│   ├── Créditos
│   ├── Tarifas
│   ├── Multiplicadores
│   ├── Impuestos
│   └── Promociones
│
├── Publicidad
│   ├── Campañas
│   ├── Créditos por anuncio
│   ├── Límite diario
│   └── Estadísticas
│
├── Suscripciones
│   ├── Planes
│   ├── Renovaciones
│   ├── Facturación
│   └── Descuentos
│
└── Monitoreo
    ├── CPU
    ├── RAM
    ├── GPU
    ├── Storage
    └── Coste real
```

# JobCron y actualización inmediata

Sí.

La configuración debería vivir en una tabla de configuración de DocuCore:

```text
system_settings
pricing_rules
subscription_plans
advertising_rules
```

Cuando el administrador cambie una tarifa:

```text
ERP
→ API Gateway
→ Redis Cache
→ DocuCore API
→ WEB Next.js
```

La actualización debería reflejarse en segundos mediante eventos o invalidación de caché, no esperar al cron.

El cron lo usaría para:

* Renovar suscripciones.
* Asignar créditos mensuales.
* Expirar promociones.
* Generar facturas.
* Calcular métricas.

Pero no para actualizar precios, ya que esos cambios deberían verse prácticamente de inmediato en toda la plataforma.
