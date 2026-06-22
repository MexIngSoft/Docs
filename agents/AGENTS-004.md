Sí. Revisé el repo y **sí existe `02_projects/mexingsof/README.md`**, pero está muy básico. También confirmé que el repo separa Core, Proyectos, Estándares e Integraciones, y pide no duplicar documentos ni mezclar negocio con arquitectura técnica. ([GitHub][1])

Pégale esto a Codex:

Revisa `https://github.com/MexIngSoft/Docs.git` y documenta MexIngSof como consola interna de administración técnica del ecosistema.

Lectura obligatoria:

1. `Docs/README.md`
2. `Docs/_meta/active-work-index.md`
3. `Docs/02_projects/mexingsof/README.md`
4. `Docs/02_projects/_ecosystem/00_ecosystem_overview.md`
5. `Docs/02_projects/_ecosystem/api-version-matrix.md`
6. `Docs/01_core_erp/apis/00_api_index.md`
7. `Docs/03_standards/product/module-catalog.md`
8. `Docs/03_standards/operations/git-repository-map.md`

Objetivo:
Convertir MexIngSof en el proyecto responsable de administrar el inventario vivo de software, APIs, webs, repositorios, despliegues, ambientes, clientes por software, usuarios por plataforma, health checks e incidentes técnicos.

Crear o actualizar estos documentos:

1. `Docs/02_projects/mexingsof/software-control-platform.md`

   * Definir MexIngSof como consola técnica.
   * Aclarar que no reemplaza JobCron.
   * JobCron administra operación/ERP.
   * MexIngSof administra software, APIs, despliegues y estado técnico.

2. `Docs/02_projects/mexingsof/api-contracts.md`

   * Definir `API.PY.DJANGO.MexIngSof` como API sugerida de proyecto.
   * No marcarla como ACTIVA hasta que exista repo ejecutable, migraciones y contrato.
   * Endpoints MVP:

     * `/software/`
     * `/apis/`
     * `/deployments/`
     * `/client-software/`
     * `/platform-users/`
     * `/health-checks/`
     * `/incidents/`

3. `Docs/02_projects/mexingsof/database.md`

   * Documentar tablas sugeridas:

     * `SoftwareProduct`
     * `SoftwareApi`
     * `SoftwareDeployment`
     * `ClientSoftwareAccess`
     * `PlatformUserAccess`
     * `HealthCheckLog`
     * `IncidentLog`
   * Usar nombres PascalCase para tablas/campos publicados.
   * Usar `PENDIENTE_DE_DEFINIR` donde falte dato real.

4. `Docs/02_projects/mexingsof/tasks/01_software_control_mvp.md`

   * Definir tareas MVP:

     * Inventario de software.
     * Inventario de APIs.
     * Registro de ambientes.
     * Registro de despliegues.
     * Clientes por software.
     * Usuarios por plataforma.
     * Health checks.
     * Incidentes.
     * Matriz Gateway/Auth/API por proyecto.

5. Actualizar `Docs/02_projects/_ecosystem/api-version-matrix.md`

   * Agregar MexIngSof como proyecto.
   * Frontend: `WEB.NJ.NEXT.MexIngSof` con estado `PENDIENTE_DE_DEFINIR` si no existe.
   * Gateway: `API.PY.DJANGO.Gateway`.
   * Auth: `Auth v1`.
   * APIs Core: Auth, Gateway, JobCron, Address.
   * API propia: `MexIngSof API` solo como `PENDIENTE_DE_DEFINIR` hasta confirmar repo ejecutable.

6. Actualizar `Docs/03_standards/product/module-catalog.md`

   * Agregar módulo:

     * `MexIngSof Software Control`
     * Tipo: `Independent Product Module / Internal Technical Platform`
     * Owner documental: `02_projects/mexingsof`
     * Estado: `Documentado`

Reglas:

* No duplicar datos comerciales de clientes si pertenecen a JobCron.
* No meter facturación, ventas, inventario físico o POS dentro de MexIngSof.
* No crear APIs nuevas como ACTIVA si no existe repositorio ejecutable.
* No guardar tokens, secretos, passwords ni variables reales.
* El frontend nunca debe consumir APIs core directo; debe usar Gateway.
* Si falta URL, puerto, servidor, rama o dominio, usar `PENDIENTE_DE_DEFINIR`.
* Registrar el resultado con resumen de archivos creados/modificados.

Lo importante: **sí conviene crear una API propia de MexIngSof**, pero documentada primero como pendiente, porque el índice de APIs dice que una API solo existe si tiene repositorio ejecutable, migraciones y contrato. ([raw.githubusercontent.com][2])

[1]: https://github.com/MexIngSoft/Docs "GitHub - MexIngSoft/Docs · GitHub"
[2]: https://raw.githubusercontent.com/MexIngSoft/Docs/main/01_core_erp/apis/00_api_index.md "raw.githubusercontent.com"
