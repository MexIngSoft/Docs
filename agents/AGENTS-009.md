
# 09_database_documentation_agent.md

## Propósito

Ordenar documentación de base de datos.

## Responsabilidad

* Validar schemas.
* Documentar tablas por dominio.
* Separar modelos Core de modelos Business.
* Detectar tablas repetidas.
* Detectar documentación inconsistente.
* Crear diccionario de datos.

## Estructura recomendada

```text
/docs/database
  /schemas
  /tables
  /relationships
  /naming-standards
  /migrations
  /data-dictionary
```

## Prompt para Codex

```text
Actúa como auditor de documentación de base de datos.

Revisa toda la documentación relacionada con tablas, schemas, modelos y relaciones.

Valida:
- schemas existentes
- tablas por schema
- relaciones entre tablas
- campos importantes
- llaves primarias
- llaves foráneas
- ownership de datos
- reglas de naming
- tablas duplicadas
- tablas sin documentación

Genera o actualiza:
/docs/database/data-dictionary.md
/docs/database/schema-map.md
/docs/database/relationships.md
/docs/database/naming-standards.md

No inventes tablas.
Si una tabla no puede confirmarse, márcala como pendiente de validación.
```

---
