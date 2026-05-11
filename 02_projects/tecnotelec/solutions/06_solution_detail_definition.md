# Definicion del detalle de soluciones

> Estado: implementado como extension del MVP de soluciones.

## Objetivo

El detalle de una solucion debe ayudar al cliente final a entender que recibe, que no recibe, como se prepara la cotizacion y que datos necesita compartir. No debe presentar lenguaje de APIs ni documentacion tecnica interna.

## Fuente de datos

El contenido visible vive en:

```text
Base de datos: comercial
Schema: TecnoTelec
Tabla: SolutionDetailSection
```

La web consume estos datos por Gateway y solo los renderiza. No debe guardar listas estaticas de entregables, exclusiones, proceso, garantia o FAQs.

## Tipos de seccion

| Tipo | Uso en web |
|---|---|
| `DELIVERABLE` | Lo que recibe el cliente. |
| `EXCLUSION` | Lo que no incluye o requiere cotizacion separada. |
| `PROCESS_STEP` | Pasos para pasar de necesidad a propuesta revisada. |
| `WARRANTY` | Acompanamiento, garantia y soporte. |
| `FAQ` | Preguntas frecuentes para reducir dudas de compra. |
| `REQUIREMENT` | Requisitos del cliente o del sitio cuando aplique. |

## Regla de experiencia

Cada pagina `/soluciones/[slug]` debe mostrar:

1. Hero comercial de la solucion.
2. Alcance y casos de uso.
3. Que incluye.
4. Que no incluye.
5. Paquetes o niveles de alcance.
6. Como se arma la solucion.
7. Proceso de diagnostico y cotizacion.
8. Preguntas del diagnostico.
9. Garantia y soporte.
10. FAQs.
11. Productos relacionados reales, si existen.

Si una seccion dinamica no trae informacion, la interfaz debe mostrar:

```text
Sin datos por el momento.
```

## Regla comercial

Una solucion no debe prometer precio cerrado si depende de instalacion, distancia, altura, cantidad, compatibilidad, obra civil o disponibilidad. En esos casos debe permanecer como `QUOTE_REQUIRED` y llevar al diagnostico.

## Relacion con productos

El detalle de solucion puede mostrar productos relacionados desde Catalog, Pricing, Inventory y Supplier por medio del Gateway. Si no hay productos relacionados, se muestra estado vacio. TecnoTelec no copia productos ni precios dentro de sus tablas.

## Implementacion realizada

- Se agrego la tabla `"TecnoTelec"."SolutionDetailSection"`.
- Se agrego serializacion `detailSections`.
- Se agrego prefetch en el detalle de solucion.
- Gateway propaga `detailSections` hacia la web.
- La web agrupa secciones por tipo y las muestra sin contenido estatico.
- El seed `seed_solution_mvp` crea entregables, exclusiones, proceso, garantia y FAQs iniciales para cada solucion.

## Pendiente futuro

El panel de JobCron/Admin debe permitir editar estas secciones sin depender del seed. Tambien debe advertir si una solucion publicada no tiene entregables, exclusiones o proceso.
