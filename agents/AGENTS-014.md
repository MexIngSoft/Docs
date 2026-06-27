INSTRUCCIÓN PARA CODEX — NORMALIZACIÓN DE LEADHUNTER, ADDRESS, DOCKER Y RAMAS GIT

Trabaja exclusivamente sobre la rama `dev` del repositorio de documentación:

`MexIngSoft/Docs`

Objetivo:
Actualizar la documentación y reglas operativas para que el ecosistema quede alineado con la arquitectura vigente de JobCron, Address API, Docker y gobierno de ramas.

FASE 1 — LECTURA OBLIGATORIA

Antes de modificar cualquier archivo, lee en este orden:

1. `Docs/README.md`
2. `Docs/_meta/active-work-index.md`
3. `Docs/agents/AGENT_GLOBAL_RULES.md`
4. `Docs/agents/RUN_AGENTS_INSTRUCTIONS.md`
5. `Docs/03_standards/operations/git-repository-map.md`
6. `Docs/03_standards/operations/project-docker-dependency-map.md`
7. `Docs/03_standards/api/address-api-standard.md`
8. `Docs/03_standards/frontend/address-form-standard.md`
9. `Docs/02_projects/jobcron/README.md`
10. `Docs/02_projects/refapart/README.md`

FASE 2 — REGLAS A APLICAR

1. LeadHunter ya no debe tratarse como proyecto independiente si fue migrado como módulo real de JobCron.

   * Verifica si la documentación actual todavía lo muestra como Web, API, Docker, proyecto, puerto, overlay o repositorio independiente.
   * Si ya pertenece a JobCron, elimina su tratamiento como proyecto separado.
   * No borres información histórica útil; muévela o márcala como referencia histórica según las reglas de documentación.
   * Si no hay evidencia suficiente de la migración, marca el punto como `PENDIENTE_DE_CONFIRMAR` y no hagas eliminación destructiva.

2. JobCron debe quedar como responsable del módulo LeadHunter.

   * Documenta LeadHunter como módulo interno/operativo de JobCron.
   * Actualiza matrices, dependencias, scripts, puertos, overlays y referencias donde aparezca como app independiente.
   * Elimina o ajusta referencias como `WEB.NJ.NEXT.LeadHunter`, `API.PY.DJANGO.LeadHunter`, `start-leadhunter.ps1`, `stop-leadhunter.ps1` y overlays separados si ya no aplican.
   * Conserva la trazabilidad de que antes existía como proyecto separado.

3. Address API debe quedar documentada con su repositorio real:

   * Repositorio: `API.PY.DJANGO.Address`
   * URL: `https://github.com/MexIngSoft/API.PY.DJANGO.Address.git`
   * Debe ser la fuente reutilizable para direcciones, códigos postales, países, estados, municipios, colonias/asentamientos y normalización de direcciones.
   * Ningún proyecto debe duplicar catálogos geográficos.
   * REFAPART, clientes, facturación, logística, pedidos, proveedores, cotizaciones y envíos deben consumir Address API mediante Gateway General.

4. Docker debe respetar repositorios separados por responsabilidad.

   * Los Docker no deben mezclarse dentro de repositorios de aplicación si ya existe repositorio Docker especializado.
   * Documenta que Nginx tiene su propio repositorio Docker especializado.
   * Actualiza el mapa Docker si hay referencias incorrectas, duplicadas o ambiguas.
   * Mantén la red oficial `jobcron_network`.
   * Mantén el stack oficial `comercial_platform`.
   * No crear redes por proyecto.
   * No crear contenedores alternos por proyecto si la arquitectura indica stack compartido.
   * No usar `docker volume prune`.

5. Gobierno de ramas Git.

   * No deben quedar ramas vivas fuera de:

     * `main`
     * `pro`
     * `dev`
     * `general`
   * La rama `general` debe extender de `dev`.
   * La rama `general` debe quedar como rama default para subir e implementar cambios operativos diarios.
   * `main` y `pro` no deben afectarse sin instrucción explícita.
   * Documenta el flujo esperado:

     * desarrollo base: `dev`
     * integración diaria/general: `general`
     * producción/control: `pro`
     * estable/canónica: `main`
   * Cualquier rama feature, fix, temporal o experimental debe cerrarse, fusionarse o eliminarse solo después de confirmar que sus cambios ya están integrados.

FASE 3 — ARCHIVOS A REVISAR Y ACTUALIZAR

Revisa como mínimo:

1. `Docs/03_standards/operations/git-repository-map.md`
2. `Docs/03_standards/operations/project-docker-dependency-map.md`
3. `Docs/03_standards/api/address-api-standard.md`
4. `Docs/03_standards/frontend/address-form-standard.md`
5. `Docs/02_projects/jobcron/README.md`
6. `Docs/02_projects/refapart/README.md`
7. Cualquier archivo que mencione:

   * `LeadHunter`
   * `leadhunter`
   * `API.PY.DJANGO.LeadHunter`
   * `WEB.NJ.NEXT.LeadHunter`
   * `start-leadhunter`
   * `stop-leadhunter`
   * `Docker.*.leadhunter`
   * `Address`
   * `API.PY.DJANGO.Address`
   * `jobcron_network`
   * `general`
   * ramas Git

FASE 4 — VALIDACIONES

Antes de cerrar:

1. Ejecuta búsqueda local para confirmar que no queden referencias contradictorias de LeadHunter como proyecto independiente.
2. Confirma que Address API aparece con el repositorio correcto.
3. Confirma que REFAPART consume Address API vía Gateway General.
4. Confirma que Docker mantiene `comercial_platform` y `jobcron_network`.
5. Confirma que el mapa Git documenta únicamente las ramas vivas permitidas.
6. No modifiques `main` ni `pro`.
7. No elimines archivos `AGENTS-*.md`; si alguno se cierra, solo vacía su contenido según las reglas del repositorio.

FASE 5 — REPORTE FINAL

Entrega un reporte con:

1. Archivos leídos.
2. Archivos modificados.
3. Cambios aplicados.
4. Referencias de LeadHunter corregidas.
5. Repositorio Address confirmado.
6. Cambios Docker realizados.
7. Gobierno de ramas actualizado.
8. Validaciones ejecutadas.
9. Pendientes reales o bloqueos.
10. Riesgos detectados.

Resultado esperado:
La documentación debe reflejar que LeadHunter ya no vive como proyecto independiente si fue migrado a JobCron, que Address API usa el repositorio `API.PY.DJANGO.Address`, que Docker está separado por responsabilidad y que el flujo Git queda limitado a `main`, `pro`, `dev` y `general`, dejando `general` como rama default operativa.
