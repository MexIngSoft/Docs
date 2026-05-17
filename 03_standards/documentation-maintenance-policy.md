# Politica de mantenimiento documental

## Cuando crear documento nuevo

- El tema no existe en `Docs/_meta/master-index.md`.
- El tema tiene owner, audiencia y uso claro.
- No duplica un documento canonico.

## Cuando actualizar

- El documento canonico existe.
- La nueva informacion corrige, completa o reemplaza informacion vigente.
- El cambio no pertenece a otro dominio.

## Cuando fusionar

- Dos documentos explican el mismo proceso.
- Un documento contiene solo variaciones menores.
- Hay solapamiento conceptual fuerte.

## Cuando archivar

- El documento conserva valor historico.
- La informacion ya no guia implementacion actual.
- Existe documento canonico vigente.

## Cuando eliminar

Solo con aprobacion explicita y despues de:

1. clasificar,
2. fusionar informacion unica,
3. archivar si tiene valor,
4. registrar en `delete_candidates.md`.

## Naming

- Usar minusculas y guiones.
- Evitar fechas en nombres salvo reportes historicos.
- Preferir `README.md` para entrada de carpeta.

## Indice

Toda documentacion nueva debe actualizar o quedar cubierta por:

```text
Docs/_meta/master-index.md
Docs/_meta/document-relations.md
```

## Revision periodica

- Mensual para docs activas.
- Por release para APIs/DB/frontend.
- Por cambio de proveedor para integraciones.
