Sí, encontré al menos un documento donde **la documentación actualmente establece explícitamente un Gateway/BFF por proyecto**, no un Gateway general compartido.

### 1. Documento encontrado

**Patrón de API por proyecto**

En este documento se define:

```text
Web/Mobile/Admin
  -> Project Gateway / BFF API
  -> Project Domain API
  -> Core ERP APIs
```

y más adelante indica:

```text
API.PY.DJANGO.NombreProyecto.Gateway
```

Ejemplos:

```text
API.PY.DJANGO.TecnoTelec.Gateway
API.PY.DJANGO.TecnoTelec
```

También establece:

> Si un proyecto necesita Gateway/BFF, crear `API.PY.DJANGO.NombreProyecto.Gateway`.  

Y el flujo documentado es:

```text
Web Tecno Telec
  -> tecnotelec-gateway-api
  -> tecnotelec-api
  -> projects-api
  -> pricing-api
  -> sales-api
```



---

### 2. Otro documento relacionado

En el estándar Next.js también aparece:

```text
Frontend -> Project Gateway/BFF -> Project API + Core ERP APIs
```

Y además indica que el frontend solo debe consumir su Gateway/BFF.



---

## Problema arquitectónico

Si ahora la decisión es:

```text
Webs
   ↓
Gateway General
   ↓
APIs Core
   ↓
APIs de Proyecto (cuando existan)
```

entonces estos documentos quedaron desactualizados porque siguen describiendo:

```text
TecnoTelec Gateway
DocuCore Gateway
Fiscora Gateway
Refapart Gateway
...
```

como componentes obligatorios.

---

## Lo que debes buscar y corregir en Docs

Revisa y reemplaza cualquier referencia a:

```text
Project Gateway
Gateway por proyecto
NombreProyecto.Gateway
tecnotelec-gateway-api
fiscora-gateway-api
docucore-gateway-api
refapart-gateway-api
```

por la nueva arquitectura.

---

## Mi recomendación antes de cambiarlo todo

Antes de eliminar los gateways por proyecto, define primero cuál será el modelo final:

### Opción A (Gateway General Único)

```text
Webs
    ↓
Gateway General
    ↓
Core ERP APIs
    ↓
Project APIs
```

Ventajas:

* Menos repositorios.
* Menos Docker.
* Menos mantenimiento.
* Menos costos.

Desventajas:

* Gateway enorme.
* Más acoplamiento.
* Riesgo de afectar todos los proyectos con un cambio.

---

### Opción B (Gateway General Modular)

```text
Gateway General
├── Refapart Module
├── TecnoTelec Module
├── LexNova Module
├── Fiscora Module
├── DocuCore Module
└── Shared Module
```

Mantienes un solo despliegue pero internamente separado por módulos.

---

### Opción C (La que actualmente está documentada)

```text
TecnoTelec Gateway
Fiscora Gateway
DocuCore Gateway
Refapart Gateway
```

Es la arquitectura que hoy aparece en la documentación. 

---

Antes de modificar Docs masivamente, te sugiero definir si **Auth también será absorbido por el Gateway General** o si seguirá siendo una API independiente compartida. Esa decisión cambia buena parte de la arquitectura y de los estándares que ya están escritos.
