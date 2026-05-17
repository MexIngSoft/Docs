# Modelo de datos CFDI

## Enfoque

Usar un nucleo comun para CFDI 2.0, 3.0, 3.2, 3.3 y 4.0, con campos opcionales y tablas hijas cuando una version o complemento lo requiera.

No crear tablas duplicadas como `Comprobantes20`, `Comprobantes30` o `Comprobantes40`.

## Esquemas

```text
Cfdi
SatWs
FileStore
Audit
Sat
```

## Nucleo CFDI

Tablas principales:

- `Cfdi.Comprobantes`
- `Cfdi.ComprobanteVersionDetalles`
- `Cfdi.Emisores`
- `Cfdi.Receptores`
- `Cfdi.Conceptos`
- `Cfdi.ConceptoImpuestos`
- `Cfdi.ComprobanteImpuestos`
- `Cfdi.ComprobanteTraslados`
- `Cfdi.ComprobanteRetenciones`
- `Cfdi.CfdiRelacionados`
- `Cfdi.CfdiRelacionadoDetalle`
- `Cfdi.TimbresFiscalesDigitales`
- `Cfdi.InformacionGlobal`
- `Cfdi.InformacionAduanera`
- `Cfdi.CuentaPredial`
- `Cfdi.ACuentaTerceros`
- `Cfdi.Complementos`
- `Cfdi.Addendas`
- `Cfdi.ComprobanteMetadatos`

## Tabla principal

`Cfdi.Comprobantes`:

- `IdComprobante`
- `Version`
- `Serie`
- `Folio`
- `Fecha`
- `Sello`
- `FormaPago`
- `NoCertificado`
- `Certificado`
- `CondicionesDePago`
- `SubTotal`
- `Descuento`
- `Moneda`
- `TipoCambio`
- `Total`
- `TipoDeComprobante`
- `MetodoPago`
- `LugarExpedicion`
- `Exportacion`
- `Confirmacion`
- `XmlOriginal`
- `XmlOriginalText`
- `CreatedAt`
- `UpdatedAt`

## Campos variables por version

`Cfdi.ComprobanteVersionDetalles` permite guardar campos que existen en una version sin convertirlos todavia en columna fija:

- `IdComprobanteVersionDetalle`
- `IdComprobante`
- `VersionCfdi`
- `Campo`
- `Valor`
- `TipoDato`
- `NodoOrigen`
- `CreatedAt`

## SAT Web Services

Tablas base:

- `SatWs.Credenciales`
- `SatWs.Certificados`
- `SatWs.Sesiones`
- `SatWs.Tokens`
- `SatWs.SolicitudesDescarga`
- `SatWs.SolicitudFiltros`
- `SatWs.VerificacionesDescarga`
- `SatWs.PaquetesDescarga`
- `SatWs.PaqueteArchivos`
- `SatWs.DescargaIntentos`
- `SatWs.RespuestasServicio`
- `SatWs.EstatusSolicitud`

## Catalogos SAT

Todos los catalogos deben incluir:

- `IdCatalogo`
- `Clave`
- `Descripcion`
- `VersionCfdiDesde`
- `VersionCfdiHasta`
- `FechaInicioVigencia`
- `FechaFinVigencia`
- `IsActive`
- `CreatedAt`
- `UpdatedAt`

