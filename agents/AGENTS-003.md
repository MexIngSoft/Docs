CORRECCIÓN OBLIGATORIA DE CONTRADICCIONES DOCUMENTALES

Objetivo:
Eliminar definitivamente todas las referencias contradictorias relacionadas con Gateway por proyecto, BFF por proyecto, SQLite y cualquier arquitectura no aprobada.

Regla principal:
Si una instrucción contradice una decisión canónica vigente, debe eliminarse completamente del repositorio. No debe quedar texto ambiguo, notas históricas, ejemplos antiguos ni referencias indirectas que puedan ser interpretadas nuevamente por agentes futuros.

Tareas obligatorias:

FASE 1 - INVENTARIO

Buscar en TODO el repositorio:

* Gateway
* BFF
* Backend For Frontend
* SQLite
* sqlite
* DATABASE_URL
* local database
* embedded database
* file database
* Search service
* search module
* PostgreSQL
* Postgres

Generar listado completo de archivos afectados.

---

FASE 2 - ELIMINACIÓN DE GATEWAYS POR PROYECTO

Eliminar completamente cualquier texto que indique o sugiera:

* Un Gateway por proyecto web.
* Un BFF por proyecto web.
* Gateways independientes por aplicación.
* Gateways específicos para LexNova.
* Gateways específicos para Refapart.
* Gateways específicos para Fiscora.
* Gateways específicos para cualquier otro proyecto.

Sustituir por:

ARQUITECTURA CANÓNICA:

* Existe un único Gateway General del ecosistema.
* El Gateway General es modular.
* Los proyectos consumen el Gateway General.
* Las APIs mantienen su responsabilidad propia.
* El Gateway no debe duplicar lógica de negocio.

No deben quedar referencias históricas.

---

FASE 3 - ELIMINACIÓN DE SQLITE

Eliminar completamente:

* sqlite
* SQLite
* db.sqlite3
* fallback SQLite
* temporary SQLite
* local SQLite
* SQLite para desarrollo
* SQLite para pruebas documentadas
* SQLite mientras llega PostgreSQL

Eliminar ejemplos:

ENGINE=sqlite
sqlite:///...
db.sqlite3

Eliminar docker compose que lo mencionen.

Eliminar diagramas que lo muestren.

Eliminar ejemplos de agentes.

Eliminar ADRs que lo sugieran.

---

FASE 4 - REEMPLAZO POR POSTGRESQL

Establecer como única verdad documental:

Base de datos oficial:

PostgreSQL

Reglas:

* Todas las APIs usan PostgreSQL.
* Todos los entornos usan PostgreSQL.
* Docker Database es la fuente oficial.
* Ningún servicio puede cambiar a SQLite por ausencia de configuración.
* Si falta configuración PostgreSQL se debe corregir la configuración.
* No se permiten cambios de motor de base de datos para resolver errores temporales.

Agregar ejemplos:

DB_HOST=
DB_PORT=
DB_NAME=
DB_USER=
DB_PASSWORD=

Agregar ejemplos Docker.

Agregar ejemplos Django.

Agregar ejemplos FastAPI.

---

FASE 5 - CORRECCIÓN DE AGENTS

Revisar:

agents/AGENTS-000.md
hasta
agents/AGENTS-999.md

Para cada agent:

Eliminar instrucciones que indiquen:

* Crear Gateway por proyecto.
* Crear BFF por proyecto.
* Usar SQLite.
* Crear db.sqlite3.
* Usar SQLite temporal.

Si el agent ya fue ejecutado:

* Marcar como OBSOLETO.
* Mover a archive.
* Crear versión corregida.

Si el agent sigue activo:

* Reescribirlo completamente.

---

FASE 6 - NUEVO ADR CANÓNICO

Crear:

01_core_erp/architecture/ADR-001-gateway-general-y-postgresql.md

Contenido obligatorio:

DECISIÓN:

1. Gateway General único para todo el ecosistema.
2. PostgreSQL obligatorio.
3. Docker Database obligatorio.

RECHAZADO:

1. Gateway por proyecto.
2. BFF por proyecto.
3. SQLite.
4. Bases embebidas.
5. Fallback a SQLite.

CONSECUENCIA:

Toda documentación futura debe alinearse con esta decisión.

---

FASE 7 - VALIDACIÓN FINAL

Ejecutar búsqueda global.

No debe existir:

SQLite
sqlite
db.sqlite3
Gateway por proyecto
BFF por proyecto

excepto dentro del ADR de decisiones rechazadas.

Generar reporte final:

* Archivos corregidos.
* Archivos eliminados.
* Agents corregidos.
* Contradicciones eliminadas.
* Validación realizada.

No continuar con nuevas implementaciones hasta cerrar completamente estas correcciones documentales.
