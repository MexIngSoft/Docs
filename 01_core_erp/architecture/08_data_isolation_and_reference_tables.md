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

Mientras el sistema crece, es valido compartir PostgreSQL usando schemas por dominio.

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

## Tablas referenciadas en PostgreSQL

PostgreSQL permite consultar tablas remotas usando extensiones como `postgres_fdw`.

Esto puede verse como una "tabla referenciada": una base puede consultar una tabla que vive en otra base como si fuera local.

Ejemplo conceptual:

```sql
CREATE EXTENSION IF NOT EXISTS postgres_fdw;
CREATE SERVER catalog_server
  FOREIGN DATA WRAPPER postgres_fdw
  OPTIONS (host 'catalog-db', dbname 'catalog');

CREATE USER MAPPING FOR app_user
  SERVER catalog_server
  OPTIONS (user 'catalog_readonly', password 'secret');

IMPORT FOREIGN SCHEMA public
  LIMIT TO (product, category, brand)
  FROM SERVER catalog_server
  INTO catalog_ref;
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

1. Schemas por dominio en PostgreSQL mientras el sistema es local/modular.
2. Contratos API documentados desde el inicio.
3. Snapshots en Sales/Quote para precios, impuestos y productos.
4. Eventos o jobs para sincronizacion futura.
5. `postgres_fdw` solo como herramienta de lectura o transicion, no como base principal de integracion.

## Decision operativa

Las APIs deben disenarse como si pudieran separarse manana, aunque hoy compartan base.

Si un modulo necesita datos de otro dominio, debe declarar:

- Que dato necesita.
- Quien es owner del dato.
- Si requiere lectura en tiempo real o snapshot.
- Si la integracion sera API, evento, job o tabla referenciada.
