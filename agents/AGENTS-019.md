# AGENT — Orquestador de ejecución de agents por impacto en Refapart

## Objetivo

Ejecutar, implementar, documentar y limpiar los agents activos de `Docs/agents` priorizando el impacto sobre Refapart, sus APIs dependientes, proyectos nuevos, bases de datos oficiales y estándares reutilizables.

No ejecutar pruebas, no correr Docker, no levantar APIs y no probar servicios por ahora. Solo implementar código/documentación cuando el agent lo requiera y registrar validaciones omitidas con motivo real.

## Rama obligatoria

Trabajar en `general`, confirmando que extiende de `dev`.

No modificar `main` ni `pro`.

## Lectura obligatoria inicial

Leer en este orden:

```text
Docs/README.md
Docs/_meta/master-index.md, si existe y tiene contenido útil
Docs/_meta/active-work-index.md
Docs/agents/RUN_AGENTS_INSTRUCTIONS.md
Docs/agents/AGENT_GLOBAL_RULES.md
Docs/agents/EXECUTION_REPORT.md
Docs/02_projects/refapart/README.md
Docs/02_projects/refapart/frontend.md
Docs/02_projects/refapart/architecture.md
Docs/02_projects/refapart/security/auth-migration.md, si existe
Docs/02_projects/refapart/security/auth-email-branding.md, si existe
Docs/02_projects/refapart/tasks/, si existe
```

## Inventario obligatorio de agents

Antes de ejecutar, leer todos los archivos:

```text
Docs/agents/AGENTS-000.md
Docs/agents/AGENTS-001.md
...
Docs/agents/AGENTS-030.md
```

Registrar en `Docs/agents/EXECUTION_REPORT.md`:

```text
Agent
Estado
Proyecto afectado
API afectada
Frontend afectado
DB afectada
Impacto en Refapart
Dependencias
Si se ejecuta ahora
Motivo
Resultado
Pendientes
```

Si un agent está vacío, marcar:

```text
Sin instrucciones
```

No inventar tareas para agents vacíos.

## Orden de ejecución por impacto Refapart

### Fase 1 — Bloqueadores directos de Refapart Auth

Ejecutar primero:

```text
AGENTS-000
AGENTS-001
AGENTS-012
AGENTS-017
```

Objetivo:

* Corregir flujo Auth de Refapart.
* Confirmar Gateway obligatorio.
* Confirmar `NEXT_PUBLIC_APPLICATION_CODE=REFAPART`.
* Confirmar pantallas Djoser obligatorias.
* Confirmar activación de cuenta.
* Confirmar reset password.
* Confirmar reenvío de activación.
* Confirmar errores visibles al usuario.
* Confirmar que SES/email no depende rígidamente de LexNova.
* Confirmar que cada proyecto tenga variables propias de email.
* Confirmar que las plantillas Auth no vivan duplicadas sin estándar.
* Confirmar que Refapart no muestre proveedores internos al cliente.

No probar Docker, APIs ni servicios.

Registrar pruebas omitidas así:

```text
NO_EJECUTADO_POR_INSTRUCCION_DEL_USUARIO: no correr Docker, no probar APIs, no ejecutar pruebas por ahora.
```

### Fase 2 — Infraestructura documental crítica

Ejecutar después:

```text
AGENTS-014
AGENTS-015
AGENTS-016
```

Objetivo:

* Normalizar LeadHunter como módulo de JobCron si ya aplica.
* Confirmar Address API como repositorio real reutilizable.
* Confirmar que Refapart consume Address vía Gateway.
* Prohibir DBs inventadas como `test_comercial`.
* Documentar que DBs se crean en Docker DB.
* Documentar que tablas/columnas se migran desde Django.
* Normalizar ramas vivas: `main`, `pro`, `dev`, `general`.
* Confirmar que `general` queda como rama operativa diaria.

No borrar ramas sin revisar cambios.

No ejecutar comandos destructivos.

### Fase 3 — Mapa obligatorio de acciones de código

Ejecutar:

```text
AGENTS-018
```

Objetivo:

Crear estándar de mapa de acciones de código.

Para Refapart crear o actualizar:

```text
Docs/02_projects/refapart/technical/code-actions-map.md
Docs/02_projects/refapart/frontend/code-actions-map.md, si aplica
Docs/02_projects/refapart/api/code-actions-map.md, si aplica
```

Acciones mínimas Refapart:

```text
REFAPART.AUTH.REGISTER
REFAPART.AUTH.LOGIN
REFAPART.AUTH.LOGOUT
REFAPART.AUTH.ACTIVATE_ACCOUNT
REFAPART.AUTH.RESEND_ACTIVATION
REFAPART.AUTH.FORGOT_PASSWORD
REFAPART.AUTH.RESET_PASSWORD
REFAPART.AUTH.CHANGE_PASSWORD
REFAPART.AUTH.ME
REFAPART.AUTH.PERMISSIONS
REFAPART.QUOTE.CREATE_REQUEST
REFAPART.QUOTE.SEARCH_PART
REFAPART.QUOTE.SEND_TO_SUPPLIERS
REFAPART.SUPPLIER.INTERNAL_RESPONSE
REFAPART.ADDRESS.SEARCH
REFAPART.PAYMENT.REQUEST, si aplica futuro
```

Cada acción debe documentar:

```text
Ruta frontend
Archivo frontend
Servicio frontend
Ruta Gateway
API destino
Endpoint real o conceptual
Permiso requerido
Modelos/tablas afectadas
Estados UI
Errores esperados
Estado: vigente / pendiente / obsoleto
```

### Fase 4 — Pagos futuros y separación de responsabilidades

Ejecutar:

```text
AGENTS-002
```

Objetivo:

* Documentar Payments como `PENDIENTE_DE_DISEÑO_PRIORITARIO`.
* Refapart no debe integrar Openpay, Mercado Pago, BBVA, Stripe ni otro proveedor directo.
* Refapart debe consumir Payments futuro vía Gateway.
* No crear API Payments activa si no existe contrato, repo, migraciones, seguridad, compose y pruebas.

### Fase 5 — Document/Image API si Refapart requiere archivos o evidencias

Ejecutar:

```text
AGENTS-003
```

Objetivo:

* Confirmar que Refapart no duplica OCR ni procesamiento documental.
* Si Refapart requiere imágenes, evidencias o documentos, debe usar Document API/Image API según corresponda.
* No marcar APIs como activas si son conceptuales.

### Fase 6 — Inventario operativo

Ejecutar:

```text
AGENTS-004
```

Objetivo:

* Documentar MexIngSof Software Control como consola interna.
* Registrar Refapart, sus APIs, webs, repos, ambientes, health checks conceptuales e incidentes.
* No duplicar JobCron, Gateway ni Auth.

### Fase 7 — Proyectos posteriores a Refapart

Ejecutar después de cerrar bloqueadores Refapart:

```text
AGENTS-005
AGENTS-006
AGENTS-008
AGENTS-009
AGENTS-010
AGENTS-011
```

Objetivo:

* Universal POS.
* Network Control/SatWi.
* Buildora.
* Innovation Engines Repair.
* ContentHub/Publishing.

Estos no deben bloquear Refapart salvo que compartan API, Gateway, Address, Auth, Payments o DB.

### Fase 8 — Baja prioridad para Refapart

Ejecutar al final o dejar pendiente documentado:

```text
AGENTS-007
AGENTS-013
```

Motivo:

* Radar Empresarial y framework broker-agnóstico no impactan directamente la salida de Refapart.

### Fase 9 — Agents vacíos

Registrar como sin instrucciones:

```text
AGENTS-020
AGENTS-021
AGENTS-022
AGENTS-023
AGENTS-024
AGENTS-025
AGENTS-026
AGENTS-027
AGENTS-028
AGENTS-029
AGENTS-030
```

No crear tareas nuevas.

Nota: `AGENTS-019` es este orquestador y no debe registrarse como vacio
mientras conserve instrucciones.

## Regla de limpieza

Cuando un agent quede completamente ejecutado:

1. Registrar cierre en `Docs/agents/EXECUTION_REPORT.md`.
2. Vaciar el contenido del archivo `Docs/agents/AGENTS-XXX.md`.
3. No borrar el archivo.
4. No moverlo.
5. No limpiar agents bloqueados, parciales o pendientes.

## Reglas de implementación

Para cada agent:

1. Leer documentación mínima.
2. Identificar proyecto afectado.
3. Identificar APIs afectadas.
4. Identificar frontend afectado.
5. Identificar DB afectada.
6. Determinar impacto en Refapart.
7. Ejecutar solo el menor cambio necesario.
8. Documentar lo implementado.
9. Documentar lo pendiente.
10. Documentar validaciones no ejecutadas por instrucción del usuario.

## Prohibiciones

No correr Docker.

No probar APIs.

No ejecutar pruebas automatizadas por ahora.

No inventar bases de datos.

No crear APIs activas sin contrato.

No crear Gateway por proyecto.

No crear Auth por proyecto.

No conectar frontend directo a APIs internas.

No guardar secretos en documentación.

No usar `_archive` como fuente vigente salvo trazabilidad explícita.

No borrar `AGENTS-*.md`.

No limpiar agents incompletos.

No afectar `main` ni `pro`.

## Reporte final obligatorio

Actualizar:

```text
Docs/agents/EXECUTION_REPORT.md
```

Formato mínimo:

```text
# Ejecución agents por impacto Refapart

Fecha:
Rama:
Repositorio:
Executor:

## Resumen

Agents leídos:
Agents ejecutados:
Agents completados:
Agents pendientes:
Agents vacíos:
Validaciones no ejecutadas por instrucción:

## Orden aplicado

1.
2.
3.

## Detalle por agent

### AGENTS-000

Estado:
Impacto Refapart:
Proyecto afectado:
API afectada:
Frontend afectado:
DB afectada:
Archivos leídos:
Archivos modificados:
Código implementado:
Documentación actualizada:
Validaciones ejecutadas:
Validaciones omitidas:
Pendientes:
Bloqueos:
Limpieza aplicada: sí/no

## Pendientes Refapart derivados

- Auth:
- Gateway:
- Djoser:
- SES:
- Address:
- Payments:
- DB:
- Code actions:
- Frontend:
- Documentación:

## Cierre

Agents completados y limpiados:
Agents pendientes:
Agents bloqueados:
Agents vacíos:
Próximo agent recomendado:
```

## Criterio de cierre

Este orquestador queda completado solo si:

* Todos los agents fueron leídos.
* Se priorizó Refapart correctamente.
* Los agents vacíos quedaron marcados como sin instrucciones.
* Los agents completados fueron limpiados sin borrar archivos.
* `EXECUTION_REPORT.md` quedó actualizado.
* Refapart quedó con pendientes claros por Auth, Gateway, Address, Payments, DB y acciones de código.
* No se ejecutaron pruebas, Docker ni APIs.
* Todo pendiente técnico quedó documentado, no oculto.
