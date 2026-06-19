# Pull Request Checklist

## Tipo de cambio

- [ ] Documentacion
- [ ] API
- [ ] Frontend
- [ ] Docker
- [ ] Integracion externa
- [ ] Agent
- [ ] Otro

## Contexto Codex

Context Pack usado:

```text
PENDIENTE_DE_DEFINIR
```

Documentos leidos:

```text
PENDIENTE_DE_DEFINIR
```

Documentos fuera de alcance:

```text
PENDIENTE_DE_DEFINIR
```

## Reutilizacion de APIs

- [ ] Revise APIs reutilizables antes de crear o modificar APIs.
- [ ] No cree API nueva si una API compartida cubre la responsabilidad.
- [ ] Si propuse API especializada, existe API Decision Record.
- [ ] Si agregue endpoint, existe contrato o actualizacion de contrato.
- [ ] Si agregue ruta frontend, existe ruta Gateway registrada.

API reutilizada:

```text
PENDIENTE_DE_DEFINIR
```

API nueva o especializada:

```text
NO_APLICA
```

Justificacion si aplica:

```text
PENDIENTE_DE_DEFINIR
```

## Gateway

- [ ] No cree Gateway/BFF por proyecto.
- [ ] El frontend consume Gateway General.
- [ ] No consume APIs internas directamente desde frontend.
- [ ] No consume proveedores externos directamente desde frontend.

## Docker

- [ ] No cree Docker por proyecto.
- [ ] Use Docker por objetivo.
- [ ] Use red `jobcron_network`.
- [ ] No use `crejo`.
- [ ] No use SQLite ni `db.sqlite3`.

## PostgreSQL

- [ ] La API usa PostgreSQL.
- [ ] Hay migracion si cambio modelo.
- [ ] Hay schema documentado si aplica.
- [ ] No hay fallback local.

## Frontend

- [ ] No deje mocks si existe API real.
- [ ] Si hay mock temporal, esta marcado como `MOCK_TEMPORAL`.
- [ ] La pantalla esta ligada a ruta Gateway o queda como pendiente.
- [ ] Build/lint ejecutado si aplica.

## Validaciones ejecutadas

```text
PENDIENTE_DE_DEFINIR
```

Resultado:

```text
PENDIENTE_DE_DEFINIR
```

## Archivos modificados

```text
PENDIENTE_DE_DEFINIR
```

## Pendientes reales

```text
PENDIENTE_DE_DEFINIR
```

## Confirmacion final

- [ ] No repeti documentacion existente.
- [ ] No deje contradicciones activas.
- [ ] No modifique documentos fuera de alcance.
- [ ] Actualice `EXECUTION_REPORT.md` si el cambio viene de un agent.
