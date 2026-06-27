Confirmo lectura de la documentación en rama `dev` de `MexIngSoft/Docs`. La regla debe documentarse principalmente en PostgreSQL, arquitectura de APIs por proyecto, scripts DB e inventario operativo.

## Puntos a desarrollar

1. Regla base: proyecto web/móvil puede tener DB propia solo si sus datos son exclusivos.
2. Prohibición: no inventar bases fuera de la documentación.
3. Docker DB: creación de DB, usuarios y permisos vive en el Docker de base de datos.
4. Django: tablas, columnas, schemas y migraciones viven en el proyecto/API Django correspondiente.
5. Gateway/JobCron/APIs compartidas: primero se evalúa si ya cubren la necesidad.
6. Documentación obligatoria: dónde registrar cada decisión.
7. Qué sí documentar y qué no.
8. Instrucción para Codex.

## Desarrollo

### 1. Regla principal

Cada proyecto puede tener web, móvil o admin, pero todos representan el mismo dominio funcional. La documentación ya establece que los clientes web/móvil/admin deben pasar por `API.PY.DJANGO.Gateway`, luego APIs compartidas y solo usar API especializada si aplica. También dice que no se debe crear una API por proyecto como patrón general. ([GitHub][1])

La regla nueva debe quedar así:

```text
Un proyecto solo puede tener base de datos propia cuando:
- JobCron no cubre el estándar requerido.
- Ninguna API compartida puede guardar correctamente esos datos.
- Los datos son exclusivos del proyecto, marca, canal o vertical.
- La decisión queda documentada antes de crear la DB.
```

### 2. Prohibición de DB inventadas

La documentación actual enumera bases oficiales: `auth`, `comercial`, `jobcron`, `lexnova` y `postgres` solo para administración local. También indica que no se debe usar `postgres` para negocio. ([GitHub][2])

Debe agregarse esta regla:

```text
Queda prohibido crear bases de datos temporales, experimentales o por ocurrencia fuera de la matriz documentada.
Ejemplos prohibidos:
- test_comercial
- comercial_test
- prueba_refapart
- db_tmp
```

### 3. Dónde va el código de creación de DB

Debe vivir en el Docker de DB, no en cada API Django:

```text
Docker DB:
- Crear base de datos.
- Crear usuario.
- Asignar permisos.
- Crear extensiones PostgreSQL si aplican.
- Registrar scripts operativos seguros.
```

Esto empata con el estándar actual: `db-postgresql` es el contenedor PostgreSQL oficial y los scripts operativos de DB viven en `Docs/03_standards/operations/scripts/database/`. ([GitHub][2])

### 4. Dónde van tablas y columnas

Las tablas, columnas, constraints, índices y relaciones deben vivir en las migraciones Django del proyecto/API dueña:

```text
API Django correspondiente:
- models.py
- migrations/
- constraints
- indexes
- relaciones
- schemas funcionales
```

La matriz actual ya marca que las migraciones son “Aplicacion Django migrations existentes” para Auth, Catalog, Inventory, Pricing, RefaPart, TecnoTelec y JobCron. ([GitHub][3])

### 5. Archivos donde debe implementarse en Docs

Actualizar estos archivos:

```text
Docs/03_standards/database/postgresql-project-users-and-schemas.md
Docs/03_standards/operations/scripts/database/README.md
Docs/01_core_erp/architecture/07_project_api_pattern.md
Docs/_meta/project-operational-inventory.md
Docs/_meta/active-work-index.md
```

El índice activo ya señala esos documentos como rutas correctas para DB, scripts e inventario operativo. ([GitHub][4])

### 6. Qué sí vale la pena documentar

```text
- Nombre oficial de la DB.
- Proyecto/API dueña.
- Motivo de crear DB propia.
- Por qué JobCron no aplica.
- Por qué una API compartida no aplica.
- Usuario PostgreSQL autorizado.
- Docker DB donde se crea.
- API Django donde viven migraciones.
- Schemas permitidos.
- Fecha y rama de implementación.
```

### 7. Qué no documentar

```text
- Passwords.
- Dumps completos.
- Datos reales.
- Tokens.
- Scripts improvisados.
- Bases temporales como si fueran oficiales.
- Tablas creadas manualmente sin migración Django.
```

### 8. Instrucción para Codex

```text
Trabajar únicamente en rama dev de Docs.

Objetivo:
Estandarizar la creación y gobierno de bases de datos por proyecto.

Reglas:
1. Leer Docs/README.md.
2. Leer Docs/_meta/active-work-index.md.
3. Leer Docs/03_standards/database/postgresql-project-users-and-schemas.md.
4. Leer Docs/03_standards/operations/scripts/database/README.md.
5. Leer Docs/01_core_erp/architecture/07_project_api_pattern.md.
6. Leer Docs/_meta/project-operational-inventory.md.
7. Documentar que un proyecto web/móvil/admin solo puede tener DB propia si sus datos son exclusivos y JobCron/APIs compartidas no cumplen el estándar.
8. Prohibir DBs no documentadas.
9. Establecer que la creación de DB, usuarios y permisos vive en Docker DB.
10. Establecer que tablas y columnas viven en migraciones Django del proyecto/API correspondiente.
11. Agregar criterio de aprobación antes de crear nueva DB.
12. Registrar ejemplos prohibidos como test_comercial.
13. No guardar passwords, dumps ni datos reales.
14. Actualizar inventario operativo si se agrega una DB oficial.

Criterio de cierre:
No debe existir ninguna base fuera de la matriz documentada. Toda DB debe tener dueño, usuario, motivo, Docker DB y API Django responsable de migraciones.
```

[1]: https://github.com/MexIngSoft/Docs/blob/dev/01_core_erp/architecture/07_project_api_pattern.md "Docs/01_core_erp/architecture/07_project_api_pattern.md at dev · MexIngSoft/Docs · GitHub"
[2]: https://github.com/MexIngSoft/Docs/blob/dev/03_standards/operations/scripts/database/README.md "Docs/03_standards/operations/scripts/database/README.md at dev · MexIngSoft/Docs · GitHub"
[3]: https://github.com/MexIngSoft/Docs/blob/dev/03_standards/database/postgresql-project-users-and-schemas.md "Docs/03_standards/database/postgresql-project-users-and-schemas.md at dev · MexIngSoft/Docs · GitHub"
[4]: https://github.com/MexIngSoft/Docs/blob/dev/_meta/active-work-index.md "Docs/_meta/active-work-index.md at dev · MexIngSoft/Docs · GitHub"
