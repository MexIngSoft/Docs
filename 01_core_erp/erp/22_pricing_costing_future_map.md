# Mapa futuro de Pricing, Costing y Rentabilidad

> Estado: vision futura. No todo debe implementarse en MVP.

## Objetivo

Documentar el alcance completo que puede crecer alrededor de listas de precios, costos, rentabilidad, reglas comerciales, devoluciones, logistica, impuestos, promociones y riesgo.

La intencion es evitar que `pricing-api` absorba responsabilidades que pertenecen a costos, logistica, ventas, devoluciones o reglas.

## Principio principal

Pricing y Costing no son lo mismo.

```txt
Costing calcula cuanto cuesta.
Pricing decide cuanto cobrar.
Profitability mide si realmente se gano o perdio.
```

## Motores futuros posibles

En fases avanzadas el ERP puede separar estos motores:

| Motor | Responsabilidad |
|---|---|
| Pricing Engine | Precio final, listas, margenes, redondeo y descuentos. |
| Cost Engine | Costo real o estimado de adquirir, operar, almacenar y entregar. |
| Promotion Engine | Promociones, cupones, bundles, campanas y vigencias. |
| Return/RMA Engine | Devoluciones, garantias, reemplazos, reacondicionamiento y mermas. |
| Tax Engine | Impuestos, retenciones, reglas fiscales por pais/estado/regimen. |
| Freight Engine | Envio, retorno, carriers, fulfillment y costos logisticos. |
| Rules Engine | Reglas condicionales transversales. |
| Profitability Engine | Utilidad real, simulacion, alertas y analisis posterior. |

## Alcance de Costing

Costing puede incluir:

- Costo proveedor.
- Costo de importacion.
- Tipo de cambio.
- Costo logistico.
- Costo de almacenamiento.
- Costo de manipulacion.
- Costo de empaque.
- Seguro.
- Costo financiero.
- Costo de instalacion.
- Costo de garantia.
- Costo de soporte.
- Costo de plataforma.
- Costo marketplace.
- Comisiones de vendedor.
- Impuestos no acreditables.
- Costos operativos distribuidos.

## Costos logisticos

La logistica puede afectar precio y utilidad.

Ejemplos:

- Envio nacional.
- Envio local.
- Envio express.
- Envio consolidado.
- Envio internacional.
- Picking.
- Packing.
- Etiquetado.
- Recoleccion.
- Validacion.
- Paquetes perdidos.
- Robos.
- Danos.
- Rechazos.

## Devoluciones y RMA

Las devoluciones pueden generar perdida aunque el precio original haya sido correcto.

Escenarios:

- Cliente rechaza paquete.
- Producto incorrecto enviado.
- Producto danado.
- Producto abierto.
- Producto no revendible como nuevo.
- Garantia.
- Reemplazo.
- Reparacion.

Costos posibles:

- Envio ida.
- Envio regreso.
- Doble guia.
- Recoleccion.
- Revision.
- Reacondicionamiento.
- Reempaque.
- Tiempo administrativo.
- Soporte.
- Reembolso.
- Perdida del cliente.

Si el producto vuelve como `open box`, `refurbished` o liquidacion, puede entrar a una lista de precios especial.

## Reglas de margen

Pricing debe poder crecer hacia:

- Margen porcentual.
- Margen fijo.
- Margen escalonado por rango de costo.
- Margen minimo permitido.
- Margen por categoria.
- Margen por proveedor.
- Margen por marca.
- Margen por canal.
- Margen por cliente.

Ejemplo:

| Rango de costo | Margen |
|---|---|
| `0-500` | `40%` |
| `500-2000` | `25%` |
| `2000+` | `15%` |

## Redondeo de precios

El redondeo comercial puede incluir:

- Psicologico: `799`, `999`, `1499`.
- Comercial: `850 -> 899`.
- Empresarial: `799.90`.
- Multiplos de `5`, `10`, `49`, `99`.
- Reglas por rango de precio.
- Reglas por canal o lista.

## Descuentos y listas especiales

Pricing puede crecer hacia:

- Precio mayoreo.
- Precio distribuidor.
- Precio instalador.
- Precio VIP.
- Precio proyecto.
- Precio licitacion.
- Descuentos por volumen.
- Descuentos autorizados.
- Descuentos temporales.
- Cupones.

## Precios dinamicos

Fase avanzada.

Variables posibles:

- Stock.
- Demanda.
- Competencia.
- Temporada.
- Tipo de cambio.
- Proveedor.
- Antiguedad de inventario.
- Rotacion.
- Margen minimo.

Ejemplos:

- Si queda poco stock, subir precio.
- Si un producto lleva meses sin moverse, bajar precio.
- Si el dolar sube mas de cierto porcentaje, recalcular.
- Si SYSCOM publica nuevo tipo de cambio, recalcular productos dependientes de USD segun politica.

## Costos financieros

El ERP debe contemplar que el metodo de pago tambien puede afectar utilidad.

Ejemplos:

- Meses sin intereses.
- Comision bancaria.
- Interes absorbido.
- Riesgo de fraude.
- Credito.
- Riesgo de morosidad.
- Cobranza.
- Financiamiento.

## Impuestos

El calculo fiscal puede variar por:

- Pais.
- Estado.
- Regimen.
- Tipo de producto.
- Importacion.
- Cliente empresarial.
- Exportacion.
- Retenciones marketplace.

En MVP se puede mantener IVA basico. Tax Engine queda como futuro.

## Marketplaces

Si se venden productos en Amazon, Mercado Libre u otros canales, se deben contemplar:

- Comision marketplace.
- Comision financiera.
- IVA retenido.
- Publicidad.
- Fulfillment.
- Devoluciones.
- Penalizaciones.

Estos costos pueden vivir en Costing/Profitability y alimentar Pricing por canal.

## Costos operativos generales

Fase avanzada.

Gastos que pueden distribuirse entre ventas:

- Renta.
- Internet.
- Sistemas.
- Empleados.
- Luz.
- Software.
- Servidores.
- Herramientas.

Debe definirse una politica de asignacion antes de usarlos para precio.

## Reglas de rentabilidad

El ERP puede evolucionar a reglas como:

- No vender si margen menor a `10%`.
- No vender si utilidad menor a `$100`.
- Bloquear venta si el envio hace perder dinero.
- Sugerir precio recomendado.
- Alertar producto con perdida.
- Alertar producto de alta devolucion.
- Simular escenarios.
- Medir rentabilidad por cliente.

## Historial y versionado

Pricing debe conservar historial:

- Quien cambio.
- Cuando cambio.
- Precio anterior.
- Precio nuevo.
- Motivo.
- Proveedor origen.
- Lista afectada.
- Vigencia.

Las listas pueden versionarse:

- Publica.
- Distribuidor.
- Gobierno.
- Mayoreo.
- Instaladores.
- Black Friday.
- Open box.
- Liquidacion.

## Reglas especiales futuras

Ejemplos:

- No ser mas caro que Amazon + `5%`.
- No bajar debajo de MAP.
- Subir precio si stock menor a `3`.
- Aplicar margen especial por proveedor.
- Aplicar envio especial por categoria.
- Bloquear descuento si rompe margen.

## Perdidas, mermas y garantia

Costing/Profitability debe contemplar:

- Productos danados.
- Robo.
- Caducidad.
- Errores humanos.
- Devoluciones irreparables.
- Paquetes perdidos.
- Costo de garantia.
- Reemplazos.
- Reparaciones.

Si historicamente cierto porcentaje regresa por garantia, Pricing puede usarlo como colchon preventivo, pero la perdida real vive en Profitability.

## Motor de reglas

Rules Engine puede evaluar reglas como:

```txt
SI:
- proveedor = SYSCOM
- categoria = redes
- stock < 5
- dolar sube > 3%
- cliente = distribuidor

ENTONCES:
- margen = 22%
- redondeo = 99
- aplicar envio especial
```

## Separacion recomendada por fases

### MVP

- Precio publico.
- Precio especial.
- Margen basico.
- Aumento fijo.
- Precio fijo manual.
- Redondeo comercial.
- Descuento por volumen basico.
- IVA basico.
- Snapshot de cotizacion/venta.

### Fase 2

- Historial de precios.
- Versionado de listas.
- Costos logisticos estimados.
- Colchon de devolucion/garantia.
- Reporte de utilidad por venta.
- Reglas de margen por categoria/proveedor.

### Fase 3

- Cost Engine separado.
- Promotion Engine.
- Return/RMA Engine.
- Profitability Engine.
- Marketplace fees.
- Simulador de utilidad.

### Fase futura

- Dynamic Pricing.
- Tax Engine avanzado.
- Competencia externa.
- Reglas regionales.
- Rentabilidad por cliente.
- Costo publicitario por producto.

## Decision actual

Para Tecno Telec se debe iniciar con Pricing MVP.

Costing avanzado, promociones, RMA, marketplace, impuestos complejos y rentabilidad profunda quedan documentados como futuro.
