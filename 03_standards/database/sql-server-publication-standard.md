# Estandar de nombres SQL Server para tablas publicadas

## Objetivo

Definir la convencion obligatoria de nombres para tablas y campos cuando una tabla, modelo o script se considere publicable para cualquier proyecto del ecosistema.

## Regla principal

Toda tabla publicada debe usar nombres estilo SQL Server en PascalCase.

El entorno local puede usar Django y la base disponible para desarrollo. Esta regla no cambia el motor de base de datos; define como deben nombrarse schemas, tablas, campos, llaves e indices cuando queden documentados o publicados.

## Nomenclatura

| Elemento | Regla |
|---|---|
| Schema | PascalCase por dominio: `Catalog`, `Pricing`, `TecnoTelec`, `JobCron`. |
| Tabla | PascalCase singular o nombre de entidad: `Product`, `PriceList`, `TecnoTelecLeadForm`. |
| Campo | PascalCase: `ProductName`, `CreatedAt`, `IsActive`, `SolutionSlug`. |
| PK | Campo `Id`. |
| FK | PascalCase terminando en `Id`: `ProductId`, `CustomerId`, `PriceListId`. |
| Indices | Prefijos `IX_`, `UX_`, `PK_`, `FK_` con nombres PascalCase. |
| Fechas | `DATETIME2(0)` o `DATETIME2(3)` segun precision necesaria. |
| Texto corto | `NVARCHAR(n)`. |
| Texto largo | `NVARCHAR(MAX)`. |
| Dinero/importes | `DECIMAL(18, 2)` o precision documentada. |
| Booleanos | `BIT NOT NULL DEFAULT 0/1`. |
| JSON | `NVARCHAR(MAX)` con `CHECK (ISJSON(Campo) = 1)` si aplica. |
| Soft delete | `IsActive`, `DeletedAt`, `DeletedBy` si el dominio lo requiere. |
| Auditoria | `CreatedAt`, `CreatedBy`, `UpdatedAt`, `UpdatedBy`. |

## Formatos no permitidos para publicacion

- `snake_case`: `product_name`, `created_at`.
- `camelCase`: `productName`, `createdAt`.
- Nombres abreviados sin significado: `prod_nm`, `usr_id`.
- Mezclar idiomas dentro de una misma tabla salvo acronimos del dominio ya aceptados.

## Plantilla minima

```sql
CREATE TABLE [Schema].[TableName] (
    [Id] UNIQUEIDENTIFIER NOT NULL CONSTRAINT [DF_TableName_Id] DEFAULT NEWID(),
    [Name] NVARCHAR(200) NOT NULL,
    [IsActive] BIT NOT NULL CONSTRAINT [DF_TableName_IsActive] DEFAULT 1,
    [CreatedAt] DATETIME2(0) NOT NULL CONSTRAINT [DF_TableName_CreatedAt] DEFAULT SYSUTCDATETIME(),
    [CreatedBy] NVARCHAR(120) NULL,
    [UpdatedAt] DATETIME2(0) NULL,
    [UpdatedBy] NVARCHAR(120) NULL,
    CONSTRAINT [PK_TableName] PRIMARY KEY CLUSTERED ([Id])
);
```

## Indices

```sql
CREATE UNIQUE INDEX [UX_TableName_Slug]
ON [Schema].[TableName] ([Slug])
WHERE [Slug] IS NOT NULL;

CREATE INDEX [IX_TableName_IsActive]
ON [Schema].[TableName] ([IsActive]);
```

## Foreign keys

Cuando una relacion queda dentro del mismo dominio/base:

```sql
ALTER TABLE [Schema].[ChildTable]
ADD CONSTRAINT [FK_ChildTable_ParentTable_ParentId]
FOREIGN KEY ([ParentId]) REFERENCES [Schema].[ParentTable] ([Id]);
```

Cuando el dato pertenece a otra API/dominio, preferir contrato API, evento o snapshot. No documentar `JOIN` entre dominios como integracion principal.

## Proyectos obligados

- JobCron.
- Tecno Telec.
- Cualquier proyecto nuevo que publique tablas.

## Relacion con Django

Django puede seguir definiendo modelos para desarrollo e implementacion. Cuando el proceso pase a etapa `ready_for_review` o `closed`, la documentacion publicada debe mostrar la equivalencia de nombres en PascalCase estilo SQL Server.

## Estado

Base vigente desde la regla del owner: tablas y campos publicados con nombres PascalCase estilo SQL Server.
