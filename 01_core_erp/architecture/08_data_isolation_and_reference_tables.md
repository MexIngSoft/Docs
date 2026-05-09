# Aislamiento de datos y tablas referenciadas

## Objetivo

Definir como preparar las APIs para trabajar separadas por proyecto, repositorio y base de datos sin romper la comunicacion entre dominios.

## Principio

Cada API debe poder operar como unidad independiente cuando el crecimiento lo requiera.

La separacion puede ocurrir por:

- Sobrecarga de trabajo.
- Necesidad de escalar una API.
- Seguridad o aislamiento de datos.
- Separacion por equipo o repositorio.
- Requerimientos de disponibilidad.

## Estrategia inicial

Mientras el sistema crece, es valido compartir una base local usando dominios separados.

Cuando una tabla se publique como contrato documental, sus tablas y campos deben expresarse con nombres PascalCase estilo SQL Server.

La condicion es mantener fronteras logicas claras:

- Una API no debe depender de modelos internos de otra API.
- Una API no debe escribir directamente tablas de otro dominio.
- Los contratos entre APIs deben documentarse.
- Los datos compartidos deben pasar por API, evento, job o vista controlada.

## Estrategia al separar bases

Cuando una API se mueva a base propia:

1. Crear base de datos propia.
2. Migrar sus tablas y schemas.
3. Mantener endpoints o eventos para intercambio de informacion.
4. Sustituir joins directos por contratos.
5. Definir sincronizacion o referencias de lectura cuando aplique.
6. Documentar ownership de datos.

## Ownership de datos

| Dominio | Dueno del dato | Forma recomendada de compartir |
| --- | --- | --- |
| Auth | `auth-api` | API o token/claims. |
| Supplier | `supplier-api` | Eventos, publish o API interna. |
| Catalog | `catalog-api` | API interna y snapshots. |
| Pricing | `pricing-api` | API de calculo y snapshots. |
| Inventory | `inventory-api` | API de disponibilidad/reserva. |
| Sales | `sales-api` | API comercial y eventos. |
| Projects | `projects-api` | API de proyecto/cotizador. |
| Tecno Telec | `tecnotelec-api` | Gateway/BFF y contratos core. |

## Tablas referenciadas entre bases

Las tablas referenciadas entre bases son herramienta de lectura o transicion, no la integracion principal entre dominios.

En SQL Server, una referencia de lectura puede documentarse conceptualmente como linked server, synonym o vista controlada, pero los flujos de negocio deben preferir APIs, eventos, jobs o snapshots.

Ejemplo conceptual:

```sql
CREATE SYNONYM [CatalogRef].[Product]
FOR [CatalogServer].[CatalogDb].[Catalog].[Product];
```

## Uso permitido de tablas referenciadas

Usar tablas referenciadas solo para:

- Lectura de datos maestros.
- Reportes.
- Migraciones controladas.
- Transicion mientras se separan servicios.
- Backoffice interno de bajo riesgo.

## Uso no recomendado

Evitar tablas referenciadas para:

- Escrituras de negocio.
- Flujos criticos de venta.
- Reservas de inventario.
- Pagos.
- Consistencia transaccional entre APIs.
- Reemplazar contratos HTTP/eventos.

## Recomendacion actual

Para este ERP, la ruta recomendada es:

1. Dominios separados mientras el sistema es local/modular.
2. Contratos API documentados desde el inicio.
3. Snapshots en Sales/Quote para precios, impuestos y productos.
4. Eventos o jobs para sincronizacion futura.
5. Tablas referenciadas solo como herramienta de lectura o transicion, no como base principal de integracion.
6. Tablas y campos publicados documentados con nombres PascalCase estilo SQL Server.

## Decision operativa

Las APIs deben disenarse como si pudieran separarse manana, aunque hoy compartan base.

Si un modulo necesita datos de otro dominio, debe declarar:

- Que dato necesita.
- Quien es owner del dato.
- Si requiere lectura en tiempo real o snapshot.
- Si la integracion sera API, evento, job o tabla referenciada.
