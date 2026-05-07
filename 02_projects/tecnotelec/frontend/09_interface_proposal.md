# Propuesta de interfaz Tecno Telec

## Fuente visual revisada

Se reviso el PDF archivado de interfaz web y se extrajeron 9 imagenes de referencia en:

```text
Docs/tecnotelec-ui/
```

El boceto confirma una web comercial enfocada en soluciones integradas, proyectos, diagnostico y contacto directo.

La maqueta visual consolidada queda en `13_visual_mockup_spec.md`.

## Direccion visual confirmada

- Marca azul, blanca y gris claro.
- Logo Tecno Telec en header.
- Hero con imagen tecnologica o render de casa/empresa inteligente.
- Mensaje principal orientado a transformar espacios con tecnologia.
- Cards de soluciones con imagen o icono.
- Seccion de proyectos/casos tipo.
- Diagnostico guiado para disenar una solucion.
- Contacto con formulario, telefono, WhatsApp, correo y ubicacion.
- Boton primario azul y boton secundario amarillo para acciones humanas.

## Correcciones necesarias sobre el boceto

El PDF contiene varios textos con errores o generados automaticamente. La interfaz final debe corregirlos y usar copy profesional.

Ejemplos corregidos:

| Boceto | Texto final sugerido |
|---|---|
| `Comienza tu Pisgrostico` | `Comienza tu diagnostico` |
| `Energia Renovable` | `Energia renovable` |
| `Telecomunicacio-nes` | `Telecomunicaciones` |
| `Consultoria y Diseno Integral` | `Consultoria y diseno integral` |
| `Habia por WhatsApp` | `Habla por WhatsApp` |

## Estructura de inicio

```text
Header
Hero principal
Soluciones destacadas
Diagnostico / cotizador
Proyectos recientes
Proyectos tipo
Asesoria
Contacto
Footer
```

## Header

Elementos:

- Logo Tecno Telec.
- Soluciones.
- Proyectos.
- Disena tu proyecto.
- Asesoria.
- Cotizaciones.

Regla:

El header debe vender soluciones, no catalogo generico.

## Hero principal

Titulo sugerido:

```text
Soluciones tecnologicas integradas para tu hogar o empresa
```

Texto:

```text
Disenamos, instalamos y conectamos sistemas de energia, red, seguridad y automatizacion que trabajan juntos.
```

Acciones:

```text
Explorar soluciones
Comienza tu diagnostico
```

## Soluciones

Soluciones principales:

- Energia renovable.
- Electricidad y respaldo.
- Internet y conectividad.
- Telecomunicaciones.
- Automatizacion y domotica.
- Seguridad inteligente.
- Infraestructura y cableado.
- Consultoria y diseno integral.

Cada solucion debe tener:

- Nombre.
- Descripcion corta.
- Beneficio claro.
- CTA.
- Posibilidad de iniciar diagnostico.

## Proyectos

La seccion de proyectos debe mostrar casos tipo y casos reales cuando existan.

Segmentos:

- Hogares inteligentes.
- Oficinas y corporativos.
- Instituciones y escuelas.
- Plantas industriales.
- Telecomunicaciones.
- Energia solar y respaldo.

Cards de proyecto:

- Imagen.
- Nombre.
- Tipo de espacio.
- Necesidades resueltas.
- Resultado o beneficio.
- CTA.

## Diagnostico guiado

El boceto muestra un flujo simple que debe convertirse en `QuoteStepper`.

Pasos sugeridos:

```text
1. Tipo de espacio
2. Necesidades
3. Tamano o capacidad requerida
4. Ubicacion
5. Presupuesto estimado
6. Resultado preliminar
7. Contacto para asesoria
```

Tipos de espacio:

- Hogar.
- Oficina o empresa.
- Institucion o escuela.
- Planta o taller.

Necesidades:

- Energia renovable.
- Electricidad y respaldo.
- Internet y conectividad.
- Seguridad.
- Domotica y automatizacion.
- Consultoria.

Resultado:

- Paquete recomendado.
- Componentes sugeridos.
- Rango estimado.
- Tiempo estimado.
- Requiere visita tecnica: si/no.

## Contacto

Debe incluir:

- Formulario.
- Telefono.
- WhatsApp.
- Correo.
- Ubicacion.
- Horarios.

Asuntos sugeridos:

```text
Cotizacion
Asesoria
Soporte
Proyecto existente
Licitacion
```

## Relacion con ERP

| Interfaz | Modulo ERP |
|---|---|
| Soluciones | Catalog / Projects |
| Diagnostico | Projects / Rules Engine |
| Cotizacion preliminar | Pricing / Quote |
| Proyectos tipo | Projects / Sales |
| Contacto | CRM / Notifications |
| Licitacion | GovernmentTender / Documents |

## Regla final

La interfaz de Tecno Telec debe sentirse como consultora tecnologica, no como tienda de productos. El carrito puede existir, pero el camino principal debe ser diagnostico, asesoria y cotizacion.
