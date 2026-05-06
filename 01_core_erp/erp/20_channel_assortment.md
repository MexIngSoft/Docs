# Surtido por proyecto y canal

## Objetivo

Definir que productos, servicios o soluciones puede mostrar cada proyecto aunque el ERP tenga mas productos descargados.

## Principio

El catalogo interno puede ser grande. Cada proyecto debe tener su propio surtido publicado.

```text
Catalog Product
  -> ChannelAssortment
  -> Proyecto/Canal
  -> Visible, cotizable o vendible
```

## Estados de publicacion

```text
HIDDEN
VISIBLE
QUOTE_ONLY
SELLABLE
COMPONENT_ONLY
BLOCKED
```

## Significado

| Estado | Uso |
|---|---|
| HIDDEN | Existe internamente, no se muestra. |
| VISIBLE | Se muestra como referencia o parte de solucion. |
| QUOTE_ONLY | Solo se cotiza con asesor o diagnostico. |
| SELLABLE | Se puede comprar directamente. |
| COMPONENT_ONLY | Solo aparece dentro de kits, bundles o proyectos. |
| BLOCKED | No debe publicarse en ese proyecto. |

## Regla por proyecto

Cada proyecto debe definir:

- Categorias permitidas.
- Categorias bloqueadas.
- Productos que solo son componentes.
- Productos que requieren configuracion o servicio.
- Productos que requieren aprobacion humana.
- Margen minimo.
- Politica de imagen, nombre y descripcion.

## Ejemplos

### Tecno Telec

Debe priorizar:

- Energia.
- Redes.
- Seguridad.
- Telecomunicaciones.
- Cableado.
- Automatizacion.
- Soluciones empresariales.

No debe parecer tienda generica de telefonos, cables o accesorios sueltos.

Telefonos:

```text
Permitido:
- Como componente de solucion empresarial.
- Si se entrega con configuracion, seguridad, MDM, cifrado o integracion.

No permitido:
- Vender cualquier telefono como producto suelto generico.
```

### Phone Shop

Debe permitir:

- Telefonos.
- Accesorios.
- Cargadores.
- Cables.
- Fundas.
- Reparacion y soporte.

### Buildora / Escoge tu PC

Debe permitir:

- Procesadores.
- Tarjetas madre.
- Memoria RAM.
- Fuentes.
- Gabinetes.
- GPUs.
- Almacenamiento.
- Enfriamiento.
- Perifericos.

Regla clave:

No basta publicar productos. Deben existir reglas de compatibilidad.

## Entidad sugerida

```text
ChannelAssortment
- Id
- ProjectCode
- ChannelCode
- ProductId
- CategoryId
- PublishStatus
- DisplayNameOverride
- DescriptionOverride
- RequiresService
- RequiresHumanReview
- MinimumMargin
- IsActive
```

## Regla final

Supplier descarga. Catalog normaliza. El proyecto decide que muestra.
