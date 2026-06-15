# AGENTS-001.md

# AUDITORÍA DOCUMENTAL Y VALIDACIÓN DE CONSISTENCIA DEL ECOSISTEMA

## OBJETIVO

Este agente tiene la responsabilidad de auditar todo el repositorio antes de iniciar cualquier implementación.

Su propósito es detectar:

* Contradicciones documentales.
* Arquitecturas duplicadas.
* APIs duplicadas.
* Módulos duplicados.
* Decisiones obsoletas.
* Dependencias incorrectas.
* Documentación incompleta.
* Diferencias entre la documentación y la implementación real.

Ningún desarrollo debe comenzar hasta finalizar esta auditoría.

---

# RESPONSABILIDADES

Este agente debe revisar:

* README.md
* Carpeta agents
* 01_core_erp
* 02_projects
* 03_standards
* Documentación Docker
* Documentación APIs
* Documentación Webs
* ADRs
* EXECUTION_REPORT.md

---

# VALIDACIÓN DE ARQUITECTURA

Validar que toda la documentación siga la arquitectura oficial:

Cliente
→ Web/App
→ Gateway General
→ APIs de Dominio
→ PostgreSQL

Detectar cualquier referencia a:

* Gateway por proyecto.
* Gateway por web.
* Gateway por cliente.
* BFF por proyecto.
* Arquitecturas paralelas.
* Arquitecturas experimentales activas.

Si se detectan:

Debe documentarse como contradicción.

---

# VALIDACIÓN DE APIS

Verificar:

* Responsabilidad única.
* No duplicación de lógica.
* No duplicación de datos.
* Dependencias correctas.
* Integración correcta con Gateway General.
* Integración correcta con Auth.

Generar lista de:

* APIs correctas.
* APIs incompletas.
* APIs duplicadas.
* APIs faltantes.

---

# VALIDACIÓN DE BASE DE DATOS

Buscar referencias a:

* SQLite
* sqlite
* db.sqlite3
* local database
* embedded database
* fallback database

Si se detectan:

Marcar como error crítico.

Validar que toda la documentación utilice PostgreSQL.

---

# VALIDACIÓN DE DOCKER

Revisar:

* Docker.DB
* Docker.API.PY
* Docker.WEB.NJ

Validar:

* Redes.
* Dependencias.
* Variables.
* Comunicación entre contenedores.
* Health checks.

Detectar documentación contradictoria.

---

# VALIDACIÓN DE AUTH

Verificar que Auth aparezca como:

API compartida.

No debe aparecer como:

* Proyecto web.
* Aplicación independiente.
* Gateway.
* ERP.

Validar que la documentación mantenga esta regla.

---

# VALIDACIÓN DE JOBCRON

Verificar que JobCron aparezca como:

ERP Administrador Central.

Validar:

* Gestión de proyectos.
* Gestión de APIs.
* Gestión de módulos.
* Gestión de configuraciones.
* Gestión de despliegues.
* Gestión de integraciones.

Detectar inconsistencias.

---

# VALIDACIÓN DE PROYECTOS

Auditar:

* Refapart
* LexNova
* DocuCore
* Fiscora
* TecnoTelec
* Imagrafity
* Proyectos futuros

Verificar:

* Arquitectura.
* Dependencias.
* APIs utilizadas.
* Integración con Gateway General.
* Integración con Auth.

---

# VALIDACIÓN DE ESTÁNDARES

Revisar:

* Estándares Docker.
* Estándares Django.
* Estándares Next.js.
* Estándares ETL.
* Estándares UI.
* Estándares ERP.

Detectar:

* Reglas duplicadas.
* Reglas contradictorias.
* Reglas obsoletas.
* Reglas incompletas.

---

# VALIDACIÓN DE AGENTS

Revisar todos los AGENTS.

Verificar:

* Dependencias.
* Orden de ejecución.
* Contradicciones.
* Responsabilidades.
* Duplicaciones.

Clasificar:

CORRECTO
CORREGIR
OBSOLETO
ARCHIVAR

---

# VALIDACIÓN DE IMPLEMENTACIÓN

Comparar:

Documentación
vs
Implementación real

Detectar:

* Funciones documentadas no implementadas.
* APIs documentadas inexistentes.
* Módulos documentados inexistentes.
* Webs documentadas incompletas.
* Funcionalidades implementadas sin documentación.

---

# CLASIFICACIÓN DE HALLAZGOS

Cada hallazgo debe clasificarse como:

CRÍTICO
ALTO
MEDIO
BAJO

CRÍTICO:

* SQLite.
* Gateway por proyecto.
* Arquitectura incorrecta.
* Dependencias rotas.

ALTO:

* APIs duplicadas.
* Responsabilidades incorrectas.
* Seguridad incompleta.

MEDIO:

* Documentación faltante.
* Diagramas incorrectos.

BAJO:

* Nombres.
* Formato.
* Redacción.

---

# REPORTE OBLIGATORIO

Generar:

AUDIT_REPORT.md

Debe contener:

## Arquitectura

## APIs

## Docker

## PostgreSQL

## Auth

## JobCron

## Proyectos

## Agents

## Contradicciones

## Riesgos

## Recomendaciones

## Prioridades

---

# CRITERIOS DE BLOQUEO

No puede marcarse como completado si:

* Existen contradicciones críticas.
* Existen referencias activas a SQLite.
* Existen Gateways por proyecto.
* Existen APIs duplicadas.
* Existen dependencias sin documentar.

---

# RESULTADO ESPERADO

Al finalizar este agente debe existir:

* Una arquitectura única.
* Una documentación coherente.
* Un inventario real de APIs.
* Un inventario real de proyectos.
* Un inventario real de módulos.
* Una lista de contradicciones corregidas.
* Una base documental preparada para continuar con los siguientes agents.
