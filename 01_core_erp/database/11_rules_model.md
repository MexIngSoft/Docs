# Modelo de datos: Rules

## Schema

```text
Rules
```

## Tablas principales

```text
Rules.BusinessRules
Rules.RuleExecutions
Rules.RuleVersions
```

## Campos clave

```text
BusinessRules
- Code
- Name
- RuleType
- Priority
- ConditionJson
- ActionJson
- IsActive
```

```text
RuleExecutions
- RuleId
- ContextType
- ContextId
- InputJson
- OutputJson
- WasApplied
```

## Regla

Toda regla que afecte precio, stock, descuento o aprobacion debe quedar versionada.

