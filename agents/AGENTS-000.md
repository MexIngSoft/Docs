# AGENTS-000 — Gobernanza Documental y Consistencia Global

## Objetivo

Garantizar que toda modificación documental realizada en el repositorio mantenga consistencia arquitectónica, reutilización de componentes, alineación con la documentación canónica y cumplimiento de los estándares definidos en Docs.

Este agent no implementa funcionalidades.

Este agent valida, corrige y optimiza documentación.

---

## Alcance

Puede:

* Revisar documentación existente.
* Detectar contradicciones documentales.
* Detectar duplicidad de APIs.
* Detectar duplicidad de módulos.
* Detectar duplicidad de procesos.
* Detectar documentación obsoleta.
* Detectar documentación fuera de estándares.

Debe:

* Identificar documentación canónica.
* Identificar Context Pack mínimo.
* Validar dependencias documentales.
* Verificar alineación con arquitectura vigente.
* Registrar hallazgos.

Debe dejar:

* Actualización documental.
* Reporte de ejecución.
* Lista de inconsistencias encontradas.
* Lista de documentos revisados.

---

## Lectura mínima obligatoria

### Base obligatoria

* Docs/README.md
* Docs/_meta/active-work-index.md
* Docs/agents/RUN_AGENTS_INSTRUCTIONS.md
* Docs/agents/AGENT_GLOBAL_RULES.md
* Docs/agents/EXECUTION_REPORT.md

### Estándares Codex

* Docs/03_standards/operations/standard-request-prompts.md
* Docs/03_standards/codex/codex-minimal-reading-standard.md
* Docs/03_standards/codex/codex-change-budget-standard.md
* Docs/03_standards/codex/codex-documentation-diff-standard.md
* Docs/03_standards/codex/codex-output-report-standard.md

### Solo documentación relacionada con el dominio afectado

No leer documentación no relacionada.

No leer todo el repositorio.

---

## Fuera de alcance

No ejecutar otros agents.

No crear APIs nuevas.

No crear módulos nuevos.

No crear bases de datos nuevas.

No crear migraciones.

No crear tablas.

No modificar ramas main.

No modificar ramas pro.

No realizar implementaciones técnicas.

No modificar proyectos no relacionados.

No utilizar documentación archivada como fuente principal.

No usar:

* _archive/
* agents/_archive/

salvo trazabilidad histórica.

---

## Reglas de Arquitectura

Antes de aceptar cualquier cambio documental validar:

### APIs reutilizables

Verificar si ya existe:

* Address API
* Customer API
* Authentication API
* Notification API
* Billing API
* Catalog API
* Search API
* Files API
* Document API

Si existe una API reutilizable:

NO documentar una nueva.

Debe reutilizarse la existente.

---

### Componentes reutilizables

Validar reutilización de:

* Direcciones.
* Clientes.
* Usuarios.
* Permisos.
* Facturación.
* Catálogos.
* Archivos.
* Notificaciones.
* Búsquedas.

---

### Arquitectura Multi-Proyecto

Validar compatibilidad con:

* MexIngSof
* Refapart
* Universal POS
* DocuCore
* Lex Nova
* JobCron
* Sales
* SATWI

Evitar soluciones exclusivas para un proyecto cuando deban ser compartidas.

---

## Tareas

### 1. Identificar dominio afectado

Determinar:

* Proyecto.
* Módulo.
* API.
* Integración.
* Estándar.

---

### 2. Seleccionar Context Pack mínimo

Utilizar únicamente el Context Pack requerido.

No ampliar contexto innecesariamente.

---

### 3. Revisar documentación canónica

Identificar:

* Fuente principal.
* Fuente secundaria.
* Dependencias.

---

### 4. Detectar inconsistencias

Buscar:

* APIs duplicadas.
* Procesos duplicados.
* Contradicciones.
* Dependencias rotas.
* Referencias inválidas.
* Decisiones obsoletas.

---

### 5. Optimizar documentación

Reducir:

* Ambigüedad.
* Repeticiones.
* Instrucciones vagas.

Incrementar:

* Trazabilidad.
* Claridad.
* Ejecutabilidad.
* Verificabilidad.

---

### 6. Registrar resultados

Actualizar:

Docs/agents/EXECUTION_REPORT.md

---

## Validaciones

Validar:

* Rutas existentes.
* Referencias existentes.
* Enlaces internos.
* Documentación canónica.
* Consistencia entre proyectos.

Verificar:

* No se crean APIs duplicadas.
* No se crean módulos paralelos.
* No se contradicen estándares.

Registrar documentos revisados.

---

## Reporte Obligatorio

Registrar:

* Agent ejecutado.
* Fecha.
* Rama utilizada.
* Context Pack utilizado.
* Documentos leídos.
* Hallazgos.
* Cambios realizados.
* Validaciones ejecutadas.
* Pendientes reales.
* Bloqueos.
* Decisiones documentales.

---

## Criterio de Cierre

El agent se considera completado únicamente cuando:

* Existe documentación canónica identificada.
* No existen contradicciones documentales detectadas.
* No se crean APIs duplicadas.
* No se crean módulos duplicados.
* El alcance está claramente definido.
* Los documentos revisados están registrados.
* El EXECUTION_REPORT fue actualizado.

Si falta información:

Estado = BLOQUEADO.

Registrar preguntas concretas.

Si ya fue ejecutado y no existen cambios:

Estado = CERRADO.

Documentar evidencia.
