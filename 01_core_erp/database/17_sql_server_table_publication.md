# Publicacion de nombres de tablas estilo SQL Server

## Regla

Todo modelo o tabla del ERP que se considere publicable debe tener nombres documentales estilo SQL Server, usando PascalCase para schemas, tablas, campos, llaves e indices.

Documento canonico:

```txt
Docs/03_standards/database/sql-server-publication-standard.md
```

## Alcance

Aplica a:

- Core ERP.
- JobCron.
- Tecno Telec.
- Proyectos futuros.
- Scripts DDL entregables.
- Documentacion de modelos cerrados.

## Nota sobre entorno local

El entorno local actual puede seguir usando la base disponible por Docker/Django para desarrollo. Eso no cambia la regla documental: lo publicado debe mostrar nombres PascalCase estilo SQL Server.

## Ejemplo Tecno Telec

```sql
CREATE TABLE [TecnoTelec].[TecnoTelecLeadForm] (
    [Id] UNIQUEIDENTIFIER NOT NULL CONSTRAINT [DF_TecnoTelecLeadForm_Id] DEFAULT NEWID(),
    [Name] NVARCHAR(160) NOT NULL,
    [Phone] NVARCHAR(40) NULL,
    [Email] NVARCHAR(254) NULL,
    [SolutionSlug] NVARCHAR(120) NULL,
    [Source] NVARCHAR(60) NOT NULL CONSTRAINT [DF_TecnoTelecLeadForm_Source] DEFAULT N'WEB',
    [Message] NVARCHAR(MAX) NULL,
    [Consent] BIT NOT NULL CONSTRAINT [DF_TecnoTelecLeadForm_Consent] DEFAULT 0,
    [Status] NVARCHAR(40) NOT NULL CONSTRAINT [DF_TecnoTelecLeadForm_Status] DEFAULT N'NEW',
    [CreatedAt] DATETIME2(0) NOT NULL CONSTRAINT [DF_TecnoTelecLeadForm_CreatedAt] DEFAULT SYSUTCDATETIME(),
    [CreatedBy] NVARCHAR(120) NULL,
    [UpdatedAt] DATETIME2(0) NULL,
    [UpdatedBy] NVARCHAR(120) NULL,
    CONSTRAINT [PK_TecnoTelecLeadForm] PRIMARY KEY CLUSTERED ([Id])
);
```

## Pendientes

- Convertir nombres de tablas y campos documentales existentes a PascalCase estilo SQL Server cuando pasen a `ready_for_review`.
- Mantener equivalencia con modelos Django sin mezclar responsabilidades.
