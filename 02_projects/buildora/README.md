# Buildora

## Rol

Configurador y venta de PCs/equipos a medida.

Nombre anterior o concepto origen:

```text
Escoge tu PC
```

## Dominios

- buildora.com
- buildora.mx

## Que hace

Permite configurar equipos y validar compatibilidad, disponibilidad y precio.

## Categorias principales

- Procesadores.
- Tarjetas madre.
- Memoria RAM.
- Fuentes de poder.
- Gabinetes.
- Tarjetas graficas.
- Almacenamiento.
- Enfriamiento.
- Perifericos.
- Monitores.

## Necesidades JobCron

- Catalog.
- Rules Engine.
- Pricing.
- Inventory.
- Supplier.
- Quote/Sales.
- ChannelAssortment.
- ProductCompatibility.

## Regla clave

No debe vender compatibilidad por texto libre. Debe validar relaciones tecnicas con atributos estructurados.

Ejemplo:

```text
CPU socket AM5
  -> Motherboard socket AM5
  -> RAM DDR5
  -> Case compatible ATX
  -> PSU suficiente para consumo estimado
```

## MVP sugerido

1. Descargar fichas tecnicas.
2. Normalizar atributos por categoria.
3. Crear reglas de compatibilidad base.
4. Configurador basico.
5. Cotizacion.
6. Compra.

## Pendientes

- Definir categorias iniciales.
- Definir nivel de automatizacion de compatibilidad.
- Definir politica para productos sin ficha tecnica suficiente.
