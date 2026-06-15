# AGENTS-000.md

# AUTORIDAD ARQUITECTÓNICA Y VALIDACIÓN GLOBAL DEL ECOSISTEMA

## OBJETIVO

Este agente es la máxima autoridad documental del repositorio.

Su función es validar que toda implementación, documentación, API, web, módulo, estándar, Docker, ETL, base de datos y proyecto cumpla con la arquitectura oficial del ecosistema JobCron.

Ningún documento, agente o implementación puede contradecir este documento.

Si existe una contradicción entre este documento y cualquier otro archivo, prevalece AGENTS-000.

---

# OBJETIVOS PRINCIPALES

1. Mantener una arquitectura consistente.
2. Evitar duplicación de responsabilidades.
3. Evitar arquitecturas paralelas.
4. Evitar documentación contradictoria.
5. Mantener interoperabilidad entre proyectos.
6. Garantizar escalabilidad.
7. Garantizar reutilización de APIs.
8. Garantizar uso correcto de Docker.
9. Garantizar uso correcto de PostgreSQL.
10. Garantizar integración mediante Gateway General.

---

# REGLAS GENERALES

Antes de realizar cualquier cambio:

* Leer documentación relacionada.
* Leer arquitectura relacionada.
* Leer estándares relacionados.
* Leer proyectos relacionados.
* Leer APIs relacionadas.
* Leer reportes previos.

Está prohibido realizar cambios sin validar primero la documentación existente.

---

# ARQUITECTURA OFICIAL

La arquitectura oficial del ecosistema es:

Cliente
→ Web/App
→ Gateway General
→ APIs de Dominio
→ PostgreSQL

No existe ninguna arquitectura alternativa autorizada.

---

# GATEWAY GENERAL

Existe únicamente un Gateway General para todo el ecosistema.

Responsabilidades:

* Enrutamiento.
* Autenticación.
* Autorización.
* Orquestación.
* Agregación de información.
* Control de acceso.
* Observabilidad.
* Auditoría.
* Rate Limiting.
* Versionado.

El Gateway General no contiene lógica de negocio específica.

---

# PROHIBICIONES DE GATEWAY

Está prohibido:

* Gateway por proyecto.
* Gateway por web.
* Gateway por cliente.
* Gateway por dominio.
* BFF por proyecto.
* BFF por web.
* BFF por cliente.
* BFF por módulo.

Si existe documentación indicando lo anterior:

Debe eliminarse.

No debe archivarse como documentación activa.

No debe reutilizarse.

---

# APIS DE DOMINIO

Cada API debe tener responsabilidad única.

Ejemplos:

Auth API
Catalog API
Inventory API
Pricing API
Supplier API
Procurement API
Sales API
Search API
Document API
Notification API

Las APIs no deben duplicar responsabilidades.

---

# BASE DE DATOS OFICIAL

La base de datos oficial del ecosistema es PostgreSQL.

No existen excepciones.

---

# PROHIBICIONES DE BASE DE DATOS

Está prohibido:

SQLite
db.sqlite3
SQLite temporal
SQLite de desarrollo
SQLite de pruebas documentadas
Fallback SQLite
Motores embebidos
Bases locales por archivo

Si un documento indica alguna de estas opciones:

Debe corregirse.

---

# POSTGRESQL

Toda API debe utilizar PostgreSQL.

Toda documentación debe asumir PostgreSQL.

Todo Docker Compose debe asumir PostgreSQL.

Todo .env.example debe asumir PostgreSQL.

Toda migración debe asumir PostgreSQL.

---

# DOCKER

La infraestructura oficial utiliza Docker.

Estructura principal:

Docker.DB
Docker.API.PY
Docker.WEB.NJ

Cada proyecto debe integrarse a esta arquitectura.

---

# REDES DOCKER

Debe existir una red compartida para permitir comunicación entre servicios.

No se deben crear arquitecturas aisladas que impidan interoperabilidad.

La comunicación entre proyectos debe estar documentada.

---

# AUTH

Auth es compartido.

Auth no es una web.

Auth no es un proyecto independiente para usuarios finales.

Auth es una API central.

Responsabilidades:

* Usuarios.
* Roles.
* Permisos.
* JWT.
* Refresh Tokens.
* Sesiones.
* Auditoría.

---

# JOBCRON

JobCron es el ERP administrador.

Responsabilidades:

* Gestión de proyectos.
* Gestión de APIs.
* Gestión de módulos.
* Gestión de permisos.
* Gestión de configuraciones.
* Gestión de despliegues.
* Gestión de integraciones.
* Gestión de documentación funcional.

---

# ESTÁNDARES DE IMPLEMENTACIÓN

Todo desarrollo debe:

* Tener documentación.
* Tener estructura definida.
* Tener responsabilidades claras.
* Tener validaciones.
* Tener logs.
* Tener manejo de errores.
* Tener auditoría cuando aplique.
* Tener health checks.

---

# DOCUMENTACIÓN OBSOLETA

Si una decisión arquitectónica cambia:

La documentación anterior debe:

* Eliminarse.
  o
* Moverse a archive.

Nunca debe permanecer activa junto a la nueva.

---

# VALIDACIÓN OBLIGATORIA

Antes de cerrar cualquier agent:

Validar:

* Arquitectura.
* Docker.
* PostgreSQL.
* APIs.
* Webs.
* Dependencias.
* Permisos.
* Documentación.
* Contradicciones.

---

# CRITERIOS DE BLOQUEO

Un agent no puede darse por concluido si:

* Usa SQLite.
* Crea Gateway por proyecto.
* Duplica APIs.
* Duplica módulos.
* Contradice documentación oficial.
* No documenta cambios.
* No actualiza reportes.

---

# REPORTE FINAL OBLIGATORIO

Todo agent debe actualizar:

EXECUTION_REPORT.md

Incluyendo:

* Cambios realizados.
* Archivos modificados.
* Archivos eliminados.
* APIs afectadas.
* Webs afectadas.
* Riesgos detectados.
* Pendientes reales.

---

# REGLA FINAL

Si una instrucción no está alineada con este documento:

Debe corregirse antes de continuar cualquier implementación.
