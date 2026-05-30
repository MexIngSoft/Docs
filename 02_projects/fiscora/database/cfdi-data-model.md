# Modelo de datos CFDI

## Enfoque

Usar un nucleo comun para CFDI 2.0, 3.0, 3.2, 3.3 y 4.0, con campos opcionales y tablas hijas cuando una version o complemento lo requiera.

No crear tablas duplicadas como `Comprobantes20`, `Comprobantes30` o `Comprobantes40`.

La regla de persistencia completa es hibrida:

1. Guardar XML original sin modificar.
2. Guardar hash SHA-256 del XML.
3. Normalizar campos comunes para busqueda, reportes y dashboard.
4. Guardar nodos repetibles en tablas hijas.
5. Guardar el arbol XML completo en JSON para conservar datos no normalizados.
6. Guardar atributos variables por version en una tabla flexible.

Esto permite soportar CFDI 2.0, 3.3 y 4.0 sin perder datos ni romper el modelo
cuando SAT agregue campos o complementos.

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
- `Cfdi.Partes`
- `Cfdi.Conceptos`
- `Cfdi.Impuestos`
- `Cfdi.Relaciones`
- `Cfdi.Complementos`
- `Cfdi.ComprobanteVersionDetalles`
- `Sat.CatalogEntries`

En la implementacion Django actual los nombres publicados son:

| Tabla publicada | Modelo Django | Uso |
|---|---|---|
| `Fiscal.CfdiDocuments` | `CfdiDocument` | Cabecera, XML original, hash, UUID/timbre, resumen y arbol completo. |
| `Fiscal.CfdiParties` | `CfdiParty` | Emisor, receptor y datos fiscales asociados. |
| `Fiscal.CfdiConcepts` | `CfdiConcept` | Conceptos del comprobante. |
| `Fiscal.CfdiTaxes` | `CfdiTax` | Impuestos de concepto y de comprobante, traslados y retenciones. |
| `Fiscal.CfdiRelations` | `CfdiRelation` | CFDI relacionados y tipo de relacion. |
| `Fiscal.CfdiComplements` | `CfdiComplement` | Timbre, pagos, nomina, carta porte, comercio exterior u otros complementos. |
| `Fiscal.CfdiVersionAttributes` | `CfdiVersionAttribute` | Campos variables por version o nodo. |
| `Fiscal.SatCatalogEntries` | `SatCatalogEntry` | Catalogos SAT versionables cargados desde fuentes oficiales o dumps validados. |

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
- `XmlSha256`
- `XmlOriginal`
- `RawTree`
- `Metadata`
- `CreatedAt`
- `UpdatedAt`

Campos 4.0 obligatorios o relevantes:

- `Exportacion`
- `RegimenFiscalReceptor`
- `DomicilioFiscalReceptor`
- `ObjetoImp` a nivel concepto
- `ACuentaTerceros` como complemento/nodo variable

Campos de versiones anteriores se conservan en `CfdiVersionAttributes` y
`RawTree` si no son parte del nucleo comun.

## Fuente del agent y PDFs revisados

`Docs/agents/AGENTS-000.md` contiene un dump SQL historico con catalogos y
tablas como `tbClaveProdServ`, `tbClaveUnidad`, `tbCodigoPostal`,
`tbComprobante`, `tbConcepto`, `tbEmisor`, `tbReceptor`, `tbImpuesto`,
`tbRelacionado`, `tbRelacionados`, `tbTimbreFiscalDigital`, `tbTipoComprobante`,
`tbTipoFactor`, `tbTipoRelacion`, `tbUsoCFDI` y `tbVersion`.

Ese dump no se copia como modelo final porque mezcla catalogos, datos operativos
y nombres legacy. Se usa como insumo para confirmar entidades y catalogos que
deben existir.

PDFs revisados:

- `Docs/agents/Anexo_20_Guia_de_llenado_CFDI.pdf`
- `Docs/agents/CFDI-4-0-MAYO-2022.pdf`

Decisiones derivadas:

- El modelo debe conservar emisor, receptor, conceptos, impuestos, complementos
  y timbre fiscal digital.
- CFDI 4.0 exige tratar `Nombre`, `RegimenFiscalReceptor`,
  `DomicilioFiscalReceptor`, `Exportacion` y `ObjetoImp` como datos de primera
  clase para validacion y UI.
- Los complementos no deben convertirse todos en columnas desde el inicio; se
  guardan como payload estructurado y se normalizan por prioridad.

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

## Contrato API Fiscal implementado

La carga manual XML usa:

```http
POST /api/fiscal/xml/upload/
Content-Type: multipart/form-data
```

Body:

```text
tenant=<uuid>
source=manual_upload
file=<cfdi.xml>
```

Tambien acepta `xml` o `xml_text` en JSON para pruebas.

El detalle de CFDI devuelve el arbol completo, partes, conceptos, impuestos,
relaciones, complementos y atributos variables:

```http
GET /api/fiscal/cfdi/{uuid}/
```

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

## Tratamiento para Fiscora Web

Fiscora Web no debe parsear XML ni consultar `API.PY.DJANGO.Fiscal`
directamente. Debe operar asi:

```text
WEB.NJ.NEXT.Fiscora
  -> API.PY.DJANGO.Fiscora.Gateway
  -> API.PY.DJANGO.Fiscal
```

La web debe recibir datos ya normalizados:

- dashboard: conteos, totales, creditos y estado SAT;
- centro CFDI: UUID, fecha, RFC emisor/receptor, nombre, total, moneda, estado;
- detalle: conceptos, impuestos, complementos y XML descargable controlado;
- vista PDF: se solicita a Gateway y se genera por Document API en fase
  posterior.

La UI debe tratar `RawTree`, XML original y payloads tecnicos como datos
internos, no como experiencia principal.

## Pendientes

- Importar catalogos SAT oficiales en `SatCatalogEntry` desde fuentes
  versionables.
- Completar normalizacion especializada para complementos de Pagos, Nomina,
  Carta Porte y Comercio Exterior.
- Conectar `WEB.NJ.NEXT.Fiscora` con el Gateway para carga manual XML real.
- Generar PDF visual por Document API sin modificar XML original.
- Definir validaciones oficiales por version contra XSD/cadena original.
