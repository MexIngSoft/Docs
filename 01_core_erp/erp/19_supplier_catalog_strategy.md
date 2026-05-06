# Estrategia de catalogo multi-proveedor

## Objetivo

Definir como el ERP debe descargar, conservar, normalizar y publicar informacion de proveedores como Syscom, CT Internacional y DC Mayorista.

## Principio

El ERP debe descargar la mayor cantidad de informacion util del proveedor, pero no todo lo descargado debe publicarse en todos los proyectos.

```text
Proveedor externo
  -> Supplier RawData
  -> SupplierProduct normalizado por proveedor
  -> Catalog Product interno
  -> Project/Channel Assortment
  -> Web/Mobile/POS del proyecto
```

## Proveedores iniciales

- Syscom.
- CT Internacional.
- DC Mayorista.

## Capas de informacion

| Capa | Responsable | Uso |
|---|---|---|
| RawData | Supplier | Evidencia completa de lo recibido. |
| SupplierProduct | Supplier | Producto tal como lo vende el proveedor. |
| CatalogProduct | Catalog | Producto interno normalizado. |
| ProductAttributes | Catalog | Especificaciones tecnicas consultables. |
| CompatibilityRules | Catalog/Rules | Relaciones entre productos compatibles. |
| ChannelAssortment | Project API | Decide donde se muestra o se vende. |

## Regla de descarga

Se debe descargar y conservar:

- Identificador externo.
- Nombre.
- Marca.
- Categoria proveedor.
- Descripcion.
- Imagenes.
- Precio/costo proveedor.
- Moneda.
- Stock proveedor.
- Ficha tecnica.
- Atributos tecnicos.
- Garantia.
- Dimensiones y peso cuando exista.
- Relacion con accesorios o productos relacionados.
- Fecha de sincronizacion.
- RawData completo.

## Regla de publicacion

Descargar no significa publicar.

Un producto puede existir en Supplier y Catalog, pero no mostrarse en un proyecto si no encaja con la marca, servicio o canal.

Ejemplo:

```text
Telefono celular
  -> Se descarga desde proveedor.
  -> Puede existir en Catalog.
  -> No se muestra en Tecno Telec como telefono generico.
  -> Si tiene software de seguridad/encriptacion o forma parte de solucion empresarial, podria mostrarse como componente de solucion.
  -> Si existe Phone Shop, ahi si puede venderse como producto principal.
```

## Regla de normalizacion

Catalog debe traducir categorias de proveedor a categorias internas.

Ejemplo:

```text
Proveedor: celulares, smartphones, telefonia
Catalog: MobileDevice
Canales:
  Tecno Telec: solo si aplica a solucion empresarial.
  Phone Shop: permitido como producto principal.
  Buildora: permitido si aporta al configurador o compatibilidad.
```

## Informacion minima por categoria tecnica

Para categorias con compatibilidad tecnica, deben descargarse atributos estructurados.

Ejemplos:

- Procesadores: socket, generacion, consumo, graficos integrados.
- Tarjetas madre: socket, chipset, memoria soportada, formato, puertos.
- Memoria RAM: tipo, velocidad, capacidad, latencia.
- Gabinetes: formato soportado, espacio GPU, bahias, enfriamiento.
- Fuentes: watts, certificacion, conectores, formato.
- GPUs: largo, consumo, conectores, interfaz.
- Almacenamiento: interfaz, formato, capacidad.

## Pendientes por proveedor

```text
PENDIENTE_DE_DEFINIR:
- Endpoints exactos CT Internacional.
- Endpoints exactos DC Mayorista.
- Frecuencia de sincronizacion por proveedor.
- Calidad real de fichas tecnicas.
- Politica para productos sin atributos suficientes.
```
