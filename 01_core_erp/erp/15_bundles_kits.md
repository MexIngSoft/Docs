# Bundles y kits

## Objetivo

Permitir vender soluciones compuestas por productos, materiales, servicios y mano de obra.

## Conceptos

```text
Product = articulo individual.
Bundle = conjunto comercial vendible.
Kit = conjunto tecnico requerido para instalar o entregar una solucion.
Service = mano de obra o servicio profesional.
```

## Ejemplo

```text
Kit de camaras:
- Camaras
- Cable
- DVR/NVR
- Disco
- Fuente
- Conectores
- Instalacion
```

## Responsabilidades

| Modulo | Responsabilidad |
|---|---|
| Catalog | Definir productos, bundles y componentes. |
| Inventory | Validar stock de componentes fisicos. |
| Pricing | Calcular precio del conjunto. |
| Projects | Recomendar soluciones segun necesidad. |
| Sales | Guardar snapshot del bundle vendido. |

## Reglas

- Un bundle puede tener componentes obligatorios y opcionales.
- El precio puede ser suma de componentes o precio fijo.
- La cotizacion debe conservar snapshot del bundle y sus componentes.

