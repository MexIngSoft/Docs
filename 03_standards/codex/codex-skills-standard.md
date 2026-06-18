# Codex Skills Standard

## Objetivo

Definir skills reutilizables para que Codex ejecute flujos repetibles sin
releer toda la documentacion.

## Regla principal

Una skill debe usarse cuando una tarea se repite y requiere siempre el mismo
proceso, los mismos documentos base y las mismas validaciones.

## Skills sugeridas

- `docs-audit`
- `reusable-api-decision`
- `api-contract-first`
- `docker-jobcron`
- `frontend-gateway`
- `integration-etl`
- `agent-runner`

## Ubicacion sugerida

```text
.codex/skills/
```

## Estructura de cada skill

```text
.codex/skills/nombre-skill/SKILL.md
.codex/skills/nombre-skill/templates/
.codex/skills/nombre-skill/scripts/
```

## Reglas

- Cada skill debe tener objetivo claro.
- Cada skill debe indicar documentos minimos a leer.
- Cada skill debe listar validaciones.
- Cada skill debe bloquear anti-patrones.
- Cada skill debe respetar los Context Packs oficiales.
- Cada skill debe usar `PENDIENTE_DE_DEFINIR` si falta informacion real.

## Skills activas en este repositorio

| Skill | Uso | Ruta |
|---|---|---|
| `reusable-api-decision` | Decidir entre API compartida existente y API especializada solo si aplica. | `.codex/skills/reusable-api-decision/SKILL.md` |
| `api-contract-first` | Disenar o modificar APIs con contrato antes de codigo. | `.codex/skills/api-contract-first/SKILL.md` |
| `docker-jobcron` | Aplicar Docker por objetivo con `jobcron_network`. | `.codex/skills/docker-jobcron/SKILL.md` |
