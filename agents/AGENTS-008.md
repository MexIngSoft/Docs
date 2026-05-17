
# 08_api_documentation_agent.md

## Propósito

Ordenar toda la documentación de APIs.

## APIs esperadas

```text
Auth
Catalog
Supplier
Inventory
Pricing
Procurement
Sales
Gateway
Notifications
Documents
Jobs
Billing
Rules Engine
```

## Responsabilidad

* Validar que cada API tenga propósito claro.
* Separar endpoints de lógica de negocio.
* Documentar contratos request/response.
* Evitar repetir modelos de base de datos completos en documentos de API.
* Crear referencia cruzada con Core y Business.

## Estructura recomendada

```text
/docs/core/{api}
  README.md
  api-contract.md
  data-ownership.md
  events.md
  errors.md
  security.md
```

## Prompt para Codex

```text
Actúa como auditor de documentación API.

Revisa todas las APIs documentadas.

Por cada API valida:
- propósito
- responsabilidades
- qué NO debe hacer
- endpoints principales
- request esperado
- response esperado
- errores esperados
- autenticación requerida
- dependencias con otras APIs
- eventos emitidos o consumidos
- owner de datos

No mezcles reglas de empresa dentro de la API Core.
Si una API tiene documentación repetida, marca el documento canónico.
Si falta contrato, crea api-contract.md.
```

---
