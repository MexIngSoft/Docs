Revisa y corrige la documentación del repositorio https://github.com/MexIngSoft/Docs antes de continuar cualquier implementación.

Objetivo principal:
Eliminar contradicciones sobre Gateway y base de datos.

Reglas obligatorias:
1. Debe existir un solo Gateway general/central modular para el ecosistema.
2. No crear ni documentar Gateways/BFF por cada proyecto web, salvo que exista una decisión formal futura y explícita.
3. Las webs consumen el Gateway general cuando necesiten orquestación.
4. Las APIs conservan su responsabilidad propia y no deben duplicar lógica del Gateway.
5. Queda prohibido usar SQLite como base de datos del sistema, incluso temporalmente en Docker o compose enfocado.
6. Todo servicio Django/API debe usar PostgreSQL.
7. Si falta credencial, base, schema o usuario PostgreSQL, se debe crear/documentar correctamente en Docker, .env.example y estándar de base de datos; no sustituir por SQLite.
8. Los tests pueden usar configuración controlada, pero la documentación debe aclarar que el runtime oficial es PostgreSQL.
9. No inventar decisiones del usuario. Si un agent dice “el usuario pidió Gateway por proyecto” o “usar SQLite local”, corregirlo o marcarlo como contradicción anulada.

Tareas:
1. Revisar README.md, 01_core_erp, 03_standards, 02_projects/_ecosystem y todos los archivos en agents/AGENTS-000.md a AGENTS-030.md.
2. Buscar menciones de:
   - Gateway por proyecto
   - BFF por proyecto
   - SQLite
   - sqlite
   - DATABASE_URL local
   - Search con SQLite
   - Gateway para todos mis proyectos
3. Corregir la documentación para dejar como verdad canónica:
   - Gateway general central modular.
   - PostgreSQL obligatorio.
   - Docker de base de datos como única fuente runtime.
   - APIs por dominio/proyecto conectadas por red Docker compartida.
4. Crear o actualizar un ADR canónico:
   01_core_erp/architecture/ADR-gateway-general-y-postgresql.md
   Debe decir:
   - Decisión: Gateway general central modular.
   - Decisión: PostgreSQL obligatorio.
   - Rechazado: Gateways por proyecto.
   - Rechazado: SQLite en runtime.
   - Consecuencia: cualquier agent contrario debe actualizarse antes de ejecutarse.
5. Actualizar agents activos:
   - Si el agent ya fue ejecutado y contiene la contradicción, moverlo a archive o marcarlo como corregido.
   - Si sigue activo, reescribirlo con las reglas anteriores.
6. Actualizar EXECUTION_REPORT.md con:
   - contradicción detectada,
   - archivos corregidos,
   - decisión canónica aplicada,
   - validaciones realizadas.
7. Validar con búsqueda final que no queden instrucciones activas promoviendo SQLite ni Gateways por proyecto.

No implementar nuevas funcionalidades hasta cerrar esta corrección documental.