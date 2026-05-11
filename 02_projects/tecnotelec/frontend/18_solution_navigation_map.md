# Mapa de navegacion de soluciones Tecno Telec

> Estado: implementado en la experiencia publica de soluciones.

## Objetivo

Definir a donde lleva cada elemento de la experiencia de soluciones para que el cliente final pueda:

- Entender una solucion.
- Comparar niveles de alcance.
- Revisar componentes y productos relacionados.
- Iniciar diagnostico.
- Contactar a Tecno Telec.
- Volver al catalogo si quiere comprar productos directos.

La web no debe mostrar lenguaje de APIs. La web solo consume Gateway y presenta informacion orientada al cliente.

## Entrada principal

| Elemento | Ruta destino | Objetivo |
|---|---|---|
| Menu `Soluciones` | `/soluciones` | Mostrar soluciones publicadas. |
| CTA `Quiero diagnostico` | `/cotizador` | Ayudar al usuario que no sabe que producto necesita. |
| CTA `Quiero productos` | `/catalogo` | Llevar al usuario que quiere comprar o buscar productos directos. |
| Tarjeta de solucion `Ver detalle` | `/soluciones/[slug]` | Explicar alcance, componentes y siguiente paso. |
| Tarjeta de solucion `Comenzar diagnostico` | `/cotizador/[slug]` | Abrir formulario consultivo de la solucion. |

## Detalle de solucion

Ruta:

```text
/soluciones/[slug]
```

La pagina debe mostrar una navegacion interna con anclas para evitar huecos y facilitar lectura:

| Elemento | Ancla destino | Objetivo |
|---|---|---|
| `Alcance` | `#alcance` | Mostrar cliente ideal y casos de uso. |
| `Incluye` | `#detalle` | Mostrar entregables y exclusiones. |
| `Paquetes` | `#paquetes` | Mostrar Esencial, Profesional y Empresarial. |
| `Componentes` | `#componentes` | Explicar como se arma la solucion. |
| `Proceso` | `#proceso` | Explicar pasos de levantamiento, validacion y cotizacion. |
| `Diagnostico` | `#diagnostico` | Mostrar preguntas que alimentan la cotizacion. |
| `Soporte` | `#soporte` | Mostrar garantia, soporte y FAQs. |
| `Productos` | `#productos` | Mostrar productos relacionados reales. |

## CTAs del detalle

| Elemento | Ruta destino | Objetivo |
|---|---|---|
| CTA principal del hero | `/cotizador/[slug]` | Iniciar diagnostico de la solucion actual. |
| `Hablar por WhatsApp` / contacto | `https://wa.me/527711445514?...` | Abrir conversacion directa contextual. |
| `Iniciar diagnostico` en siguiente paso | `/cotizador/[slug]` | Reforzar camino consultivo. |
| CTA final `Iniciar diagnostico` | `/cotizador/[slug]` | Cerrar la pagina con accion clara. |
| CTA final `Contactar a Tecno Telec` | `https://wa.me/527711445514?...` | Canal directo para dudas o proyecto complejo. |
| CTA final `Ver productos` | `/catalogo` | Camino para usuario que prefiere comprar productos. |

## Estados vacios permitidos

Si una seccion no tiene datos dinamicos, debe mostrar:

```text
Sin datos por el momento.
```

No se debe reemplazar con contenido estatico no validado.

## Imagenes de soluciones

Las soluciones publicadas deben usar assets locales profesionales, no URLs genericas de placeholder. Los archivos actuales viven en:

```text
WEB.NJ.NEXT.TecnoTelec/public/images/solutions/
```

Mapa actual:

| Solucion | Imagen |
|---|---|
| `videovigilancia-para-negocio` | `/images/solutions/videovigilancia.svg` |
| `wifi-empresarial-oficina` | `/images/solutions/wifi-empresarial.svg` |
| `respaldo-electrico-para-operacion` | `/images/solutions/respaldo-electrico.svg` |
| `cableado-estructurado-oficina` | `/images/solutions/cableado-estructurado.svg` |
| `control-acceso-negocio` | `/images/solutions/control-acceso.svg` |
| `soporte-tecnologico-empresarial` | `/images/solutions/soporte-tecnologico.svg` |

Si una solucion no tiene imagen real o asset local aprobado, la interfaz debe mostrar el estado `Sin imagen publicada`.

Las imagenes deben verse profesionales, limpias y relacionadas con el perfil de la solucion. No deben usar estilos genericos de maqueta ni proveedores externos de placeholder.

## Validaciones minimas por solucion

Cada solucion publicada debe tener:

- Hero comercial.
- `SolutionDetailSection` con `DELIVERABLE`.
- `SolutionDetailSection` con `EXCLUSION`.
- `SolutionDetailSection` con `PROCESS_STEP`.
- `SolutionDetailSection` con `WARRANTY`.
- `SolutionDetailSection` con `FAQ`.
- Al menos un paquete activo.
- Al menos una pregunta de diagnostico.
- CTA a `/cotizador/[slug]`.

Los productos relacionados pueden estar vacios si el catalogo aun no tiene coincidencias, pero la seccion debe mostrar estado vacio.

## Flujo recomendado para cliente

```text
/soluciones
  -> /soluciones/[slug]
    -> #alcance
    -> #detalle
    -> #componentes
    -> #productos
    -> /cotizador/[slug]
      -> POST solicitud de cotizacion
        -> seguimiento comercial
```

Ruta alternativa:

```text
/soluciones
  -> /catalogo
    -> /catalogo/[producto]
```

Ruta de contacto:

```text
/soluciones/[slug]
  -> /contacto
```

## Pendientes a construir

- Contacto debe integrarse a canal real de WhatsApp o formulario con seguimiento.
- Cotizador debe convertirse a cotizacion formal cuando exista el modulo final de Quotes/Sales.
- JobCron/Admin debe validar soluciones publicadas sin secciones requeridas.
- El mapa puede crecer con casos de exito cuando existan proyectos reales.

## Regla de timeout

El detalle de solucion consulta informacion compuesta por Gateway y productos relacionados. En desarrollo local puede tardar mas que una ruta simple mientras Catalog/Pricing/Inventory responden.

La web debe usar:

```text
NEXT_PUBLIC_GATEWAY_FETCH_TIMEOUT_MS=30000
```

Esto evita falsos 404 cuando la solucion existe pero el Gateway tarda en armar el detalle.

## WhatsApp directo

Numero configurado:

```text
771 144 5514
```

Variable publica:

```text
NEXT_PUBLIC_WHATSAPP_NUMBER=527711445514
NEXT_PUBLIC_WHATSAPP_DISPLAY=771 144 5514
```

Sintaxis:

```text
https://wa.me/527711445514?text=<mensaje_codificado>
```

Mensajes implementados:

| Contexto | Mensaje |
|---|---|
| Solucion | `Hola Tecno Telec, quiero asesoria sobre la solucion: <solucion>.` |
| Producto | `Hola Tecno Telec, quiero informacion y cotizacion del producto: <producto> modelo <modelo>.` |
| Diagnostico | `Hola Tecno Telec, quiero iniciar un diagnostico para cotizar: <solucion>.` |
| General | `Hola Tecno Telec, quiero asesoria para una solucion tecnologica.` |
