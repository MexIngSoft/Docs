# Recomendacion para cerrar analisis e iniciar desarrollo

> Estado: decision recomendada para comenzar implementacion.
> Fecha: 2026-05-10.

## Objetivo

Cerrar el analisis de soluciones y cotizaciones Tecno Telec con una ruta concreta de desarrollo, evitando intentar construir todo el ERP operativo de golpe.

## Decision de fondo

Lo mejor para cerrar este tema y empezar desarrollo es implementar primero un **MVP de cotizacion consultiva**.

Este MVP debe permitir que el cliente:

1. Elija una solucion.
2. Vea informacion clara de alcance.
3. Indique si quiere solo productos o solucion instalada.
4. Capture ubicacion aproximada del proyecto.
5. Capture tamano del proyecto.
6. Capture presupuesto o saldo disponible.
7. Capture datos de contacto.
8. Envie una solicitud de cotizacion.
9. Reciba confirmacion clara de que un asesor revisara la solicitud si hay mano de obra, distancia o reglas pendientes.

## Por que esta es la mejor ruta

Automatizar reglas, mano de obra, distancia, agenda, viaticos, anticipo, saldo, compatibilidad tecnica y proyectos completos desde el inicio es demasiado grande y riesgoso.

El MVP consultivo permite:

- Captar clientes reales.
- Entender que soluciones piden.
- Generar cotizaciones con revision humana.
- No prometer precios cerrados sin datos suficientes.
- Preparar el ERP modular sin contaminar responsabilidades.
- Avanzar con desarrollo usable mientras se documentan los modulos complejos.

## Que se debe implementar primero

### 1. TecnoTelec API

Crear o ampliar modelos para:

- `SolutionFamily`
- `Solution`
- `SolutionPackage`
- `SolutionQuestion`
- `SolutionQuestionOption`
- `SolutionComponentGroup`
- `SolutionComponentRule`
- `SolutionRequest` o `QuoteRequest`

Responsabilidad:

- Guardar soluciones publicadas.
- Guardar preguntas de diagnostico.
- Guardar reglas propias de presentacion.
- Guardar solicitud inicial de cotizacion si Sales/Quote aun no cubre todo.

No debe:

- Calcular precio final.
- Reservar inventario.
- Administrar tecnicos.
- Formalizar ventas.

### 2. TecnoTelec Gateway

Crear endpoints publicos:

```text
GET  /api/public/solutions/
GET  /api/public/solutions/{slug}/
GET  /api/public/solutions/{slug}/quote-form/
POST /api/public/solutions/{slug}/quote-request/
```

Responsabilidad:

- Componer datos para la web.
- Ocultar Core APIs.
- Resolver productos relacionados cuando existan reglas simples.
- Crear solicitud de cotizacion.
- Devolver estados claros.

### 3. Web Tecno Telec

Actualizar:

- `/soluciones`
- `/soluciones/[slug]`
- `/cotizador`
- `/cotizador/[solution]`

Debe mostrar:

- Soluciones dinamicas.
- Estados vacios si no hay datos.
- CTA claro hacia cotizacion.
- Formulario con ubicacion, tamano, mano de obra y presupuesto.

### 4. Cotizacion MVP

El primer flujo debe crear una solicitud con:

- Datos del cliente.
- Solucion seleccionada.
- Productos si aplica.
- Linea `LABOR` pendiente si el cliente quiere instalacion.
- Ubicacion aproximada.
- Tamano del proyecto.
- Presupuesto o saldo disponible.
- Estado `PENDING_REVIEW` cuando aplique.

## Que no se debe implementar todavia

No iniciar con:

- Precio final automatico de instalacion.
- Compatibilidad tecnica completa.
- Agenda de tecnicos.
- Asignacion de subcontratistas.
- Apartado automatico de inventario.
- Anticipos y saldos reales.
- Conversion automatica a proyecto.
- Soporte postventa completo.

Estos puntos deben quedar como fases posteriores.

## Orden de desarrollo recomendado

1. Modelos TecnoTelec para soluciones.
2. Endpoints TecnoTelec internos/publicos.
3. Gateway de soluciones y quote request.
4. Web de soluciones dinamicas.
5. Cotizador por solucion.
6. Guardado de `SolutionRequest` o `QuoteRequest`.
7. Pruebas con datos reales.
8. Reporte de pendientes para fase 2.

## Criterio de cierre de esta etapa

La etapa queda lista cuando:

- La web lista soluciones reales.
- La web muestra detalle de solucion real.
- El cliente puede solicitar cotizacion.
- El cliente puede indicar si quiere mano de obra.
- El cliente puede indicar ubicacion y tamano.
- La solicitud queda guardada.
- La solicitud queda marcada para revision humana si aplica.
- No se muestran datos inventados.
- No se promete precio cerrado cuando faltan reglas.

## Siguiente fase despues del MVP

Una vez probado el flujo consultivo:

1. Formalizar Sales/Quote con snapshot completo.
2. Crear lineas `SERVICE`, `LABOR` y `LOGISTICS`.
3. Documentar e implementar reglas simples.
4. Agregar Logistics por zona.
5. Preparar Projects para cotizaciones aprobadas.

## Decision final

Cerrar el analisis y comenzar desarrollo con `SolutionRequest / QuoteRequest MVP`.

La automatizacion completa queda preparada, pero no bloquea que Tecno Telec empiece a captar clientes y generar cotizaciones revisables.
