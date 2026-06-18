# API Decision Record Standard

## Objetivo

Evitar que Codex cree APIs nuevas o especializadas si una API compartida ya
resuelve el caso.

## Regla principal

Toda API nueva o especializada requiere un API Decision Record antes de
implementarse.

## Lectura obligatoria previa

Antes de proponer una API nueva, leer:

- `Docs/01_core_erp/apis/api-decision-matrix.md`
- `Docs/01_core_erp/apis/reusable-api-contracts.md`
- `Docs/01_core_erp/apis/api-responsibility-matrix.md`
- `Docs/01_core_erp/architecture/project-api-dependency-matrix.md`
- `Docs/03_standards/architecture/api-gateway-standard.md`

Si alguno de estos documentos no existe, registrar `PENDIENTE_DE_DEFINIR` en el
record y no inventar su contenido.

## Preguntas obligatorias

Antes de crear una API nueva responder:

1. Que responsabilidad exacta tendra?
2. Que API compartida se reviso primero?
3. Por que Auth no cubre esto?
4. Por que Catalog no cubre esto?
5. Por que Inventory no cubre esto?
6. Por que Pricing no cubre esto?
7. Por que Supplier no cubre esto?
8. Por que Procurement no cubre esto?
9. Por que Sales no cubre esto?
10. Por que Search no cubre esto?
11. Por que Document no cubre esto?
12. Por que Notification no cubre esto?
13. Por que FeatureVisibility no cubre esto?
14. Por que ETL no cubre esto?
15. Que proyecto la consumira?
16. Que rutas Gateway expondra?
17. Que tablas o schemas requiere?
18. Que permisos requiere?
19. Que frontend la consumira?
20. Que validacion Docker/PostgreSQL se ejecutara?

## Criterio de autorizacion

Solo se permite crear API nueva si:

- ninguna API compartida cubre la responsabilidad;
- existe logica exclusiva;
- existe contrato documentado;
- existe ruta Gateway documentada;
- existe justificacion anti-duplicacion;
- existe validacion minima definida.

## Bloqueo

No crear API nueva si el API Decision Record esta incompleto.
