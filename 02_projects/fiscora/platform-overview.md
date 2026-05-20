# Vision general Fiscora

## Objetivo

Administrar, transformar y automatizar CFDI del SAT desde una sola plataforma.

## Principio de producto

```text
Tus facturas no solo se descargan; se entienden, se ordenan y se transforman.
```

## Experiencia esperada

El usuario debe sentir que el SAT trabaja por el, no que esta lidiando con XML.

## Portal publico

El portal debe comunicar una plataforma fiscal inteligente en funcionamiento:

- Hero con transformacion CFDI visual.
- Demo interactiva sin registro.
- Flujo SAT -> XML -> vista moderna -> PDF.
- Blog SEO fiscal.
- CTA hacia registro o prueba.

## Dashboard cliente

Menu base:

- Inicio.
- Facturas.
- Descargas SAT.
- Reportes.
- Transformacion.
- Automatizaciones.
- Alertas.
- Empresas.
- Creditos.
- Configuracion.
- Cuenta.

## Centro CFDI

Submodulos:

- Emitidas.
- Recibidas.
- Nomina.
- Pagos.
- Traslados.
- Canceladas.
- Relacionadas.
- Favoritas.

Filtros base:

- UUID.
- RFC.
- Metodo de pago.
- Forma de pago.
- Uso CFDI.
- Tipo de comprobante.
- Regimen fiscal.
- Moneda.
- Fecha.
- Estado SAT.

## Monetizacion

Modelo inicial:

- Plan gratis con limites.
- Creditos para operaciones premium.
- Recompensas por publicidad no invasiva.
- Suscripciones futuras.

## MVP aprobado

La primera version funcional debe enfocarse en demostrar valor con bajo riesgo:

- Dashboard con resumen de CFDI, creditos y estado SAT.
- Carga manual de XML como alternativa inicial si la conexion SAT real no esta
  lista.
- Descarga SAT modelada por jobs, aunque el conector real quede por fase.
- Explorador CFDI con busqueda por UUID, RFC, monto, fecha y estado.
- Vista visual y PDF generado desde capa documental sin modificar XML original.
- Plan gratis con limites documentados y creditos para operaciones premium.

Queda fuera del MVP:

- Cancelacion fiscal.
- Declaraciones o cumplimiento fiscal automatizado.
- IA fiscal con recomendaciones normativas.
- Conexion bancaria o contable.
- Progreso falso en procesos SAT productivos.
