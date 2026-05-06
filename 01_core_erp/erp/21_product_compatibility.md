# Compatibilidad entre productos

## Objetivo

Permitir consultas y validaciones tecnicas entre productos para proyectos como `Buildora` antes `Escoge tu PC`, configuradores, cotizadores y soluciones tecnicas.

## Principio

La compatibilidad no debe vivir como texto libre. Debe modelarse como atributos y reglas consultables.

```text
Product
  -> ProductAttributes
  -> CompatibilityRules
  -> CompatibilityGraph
  -> Configurator / Quote
```

## Casos principales

- Procesador compatible con tarjeta madre.
- Tarjeta madre compatible con memoria RAM.
- Tarjeta madre compatible con gabinete.
- Fuente compatible con GPU y consumo total.
- Gabinete compatible con GPU, disipador y formato de tarjeta madre.
- Almacenamiento compatible con interfaz disponible.
- Enfriamiento compatible con socket y espacio fisico.

## Atributos estructurados

### CPU

```text
socket
generation
tdp_watts
integrated_graphics
supported_memory_type
```

### Motherboard

```text
socket
chipset
form_factor
memory_type
memory_slots
max_memory_gb
m2_slots
pcie_version
```

### RAM

```text
memory_type
capacity_gb
speed_mhz
module_count
```

### Case

```text
supported_form_factors
max_gpu_length_mm
max_cooler_height_mm
psu_form_factor
```

### PSU

```text
watts
certification
form_factor
pcie_connectors
```

### GPU

```text
length_mm
recommended_psu_watts
power_connectors
interface
```

## Tipos de relacion

```text
COMPATIBLE_WITH
REQUIRES
REQUIRES_ADAPTER
NOT_COMPATIBLE_WITH
RECOMMENDED_WITH
ALTERNATIVE_TO
PART_OF_KIT
```

## Entidades sugeridas

```text
ProductCompatibilityRule
- Id
- SourceProductId
- TargetProductId NULL
- SourceCategoryId
- TargetCategoryId
- RelationType
- ConditionJson
- Explanation
- ConfidenceLevel
- IsActive
```

```text
ProductCompatibilityCheck
- Id
- ContextType
- ContextId
- InputJson
- ResultJson
- IsCompatible
- CreatedAt
```

## Resultado esperado

Un configurador debe poder responder:

```text
Esta tarjeta madre es compatible con este procesador.
Esta fuente no alcanza para esta GPU.
Este gabinete no soporta el formato seleccionado.
Falta seleccionar memoria compatible DDR5.
```

## Regla de calidad

Si un producto no tiene atributos suficientes, no debe venderse como compatible automaticamente. Debe quedar como `REQUIRES_REVIEW`.
