Sí, **sí leí el repositorio Docs en rama `general`**. La respuesta es **sí conviene crear el estándar**, porque Docs ya exige lectura mínima por Context Pack, cambios trazables, contratos API antes de implementar y documentación por módulo; pero falta un estándar explícito para **mapear acciones del código por proyecto**. ([GitHub][1])

# AGENT — Estandarizar mapa de acciones de código por proyecto

## Objetivo

Crear un estándar obligatorio para que cada proyecto documente, mantenga y permita encontrar rápidamente sus acciones reales de código: pantallas, rutas, servicios, endpoints, eventos, permisos, flujos, comandos, tareas programadas, integraciones y acciones administrativas.

Este estándar debe acelerar el trabajo de Codex, evitar búsquedas largas en el código, evitar duplicidad de lógica y dejar trazabilidad entre documentación, frontend, Gateway, APIs, permisos y base de datos.

## Confirmación documental obligatoria

Antes de modificar cualquier proyecto, leer únicamente:

1. `README.md`
2. `_meta/active-work-index.md`
3. `00_audit/codex-context-map.md`
4. `03_standards/operations/context-packs.md`
5. `03_standards/operations/codex-execution-standard.md`
6. `03_standards/codex/codex-minimal-reading-standard.md`
7. `03_standards/codex/codex-documentation-diff-standard.md`
8. `03_standards/api/api-contract-first-standard.md`
9. `03_standards/frontend/nextjs-project-standard.md`
10. `templates/frontend-module-template.md`

No leer todo `Docs` salvo auditoría documental justificada.

## Nuevo estándar a crear

Crear el documento:

`Docs/03_standards/code-actions/code-actions-map-standard.md`

Contenido mínimo:

# Estándar de mapa de acciones de código

## Objetivo

Todo proyecto debe tener un mapa navegable de acciones reales para que cualquier desarrollador o Codex pueda encontrar rápidamente dónde vive cada acción del sistema.

## Regla principal

Ninguna acción funcional importante debe quedar únicamente en el código sin referencia documental.

## Qué se considera acción

Una acción es cualquier operación que el usuario, sistema, API o tarea automática pueda ejecutar.

Incluye:

* Página o ruta visual.
* Formulario.
* Botón.
* Evento de UI.
* Servicio frontend.
* Hook.
* Cliente Gateway.
* Endpoint Gateway.
* Endpoint API.
* Serializer.
* ViewSet.
* Permission class.
* Modelo afectado.
* Migración.
* Señal.
* Job.
* Cron.
* Comando Django.
* Script operativo.
* Acción Docker.
* Integración externa.
* Envío de correo.
* Evento Auth.
* Acción administrativa.

## Archivo obligatorio por proyecto

Cada proyecto debe tener:

`Docs/02_projects/<proyecto>/technical/code-actions-map.md`

Si el proyecto tiene frontend y API separados, también puede dividirse así:

`Docs/02_projects/<proyecto>/frontend/code-actions-map.md`
`Docs/02_projects/<proyecto>/api/code-actions-map.md`

Pero siempre debe existir un índice principal:

`Docs/02_projects/<proyecto>/technical/code-actions-map.md`

## Formato obligatorio por acción

Cada acción debe documentarse así:

| Campo                          | Valor                                                                                |
| ------------------------------ | ------------------------------------------------------------------------------------ |
| Código de acción               | `<PROJECT>.<DOMAIN>.<ACTION>`                                                        |
| Nombre visible                 | PENDIENTE_DE_DEFINIR                                                                 |
| Tipo                           | page / form / button / service / endpoint / job / command / integration / auth-event |
| Proyecto                       | PENDIENTE_DE_DEFINIR                                                                 |
| Módulo                         | PENDIENTE_DE_DEFINIR                                                                 |
| Frontend ruta                  | PENDIENTE_DE_DEFINIR                                                                 |
| Frontend archivo               | PENDIENTE_DE_DEFINIR                                                                 |
| Servicio frontend              | PENDIENTE_DE_DEFINIR                                                                 |
| Gateway route                  | PENDIENTE_DE_DEFINIR                                                                 |
| API destino                    | PENDIENTE_DE_DEFINIR                                                                 |
| Endpoint API                   | PENDIENTE_DE_DEFINIR                                                                 |
| Método HTTP                    | PENDIENTE_DE_DEFINIR                                                                 |
| Permiso requerido              | PENDIENTE_DE_DEFINIR                                                                 |
| Modelos/tablas afectadas       | PENDIENTE_DE_DEFINIR                                                                 |
| Estados UI                     | loading / empty / error / success                                                    |
| Errores esperados              | PENDIENTE_DE_DEFINIR                                                                 |
| Validación mínima              | PENDIENTE_DE_DEFINIR                                                                 |
| Documento canónico relacionado | PENDIENTE_DE_DEFINIR                                                                 |
| Estado                         | vigente / pendiente / obsoleto                                                       |
| Última revisión                | YYYY-MM-DD                                                                           |

## Código de acción obligatorio

Formato:

`<PROJECT>.<MODULE>.<ACTION>`

Ejemplos:

* `REFAPART.AUTH.REGISTER`
* `REFAPART.AUTH.ACTIVATE_ACCOUNT`
* `REFAPART.AUTH.RESEND_ACTIVATION`
* `REFAPART.AUTH.RESET_PASSWORD`
* `REFAPART.QUOTE.CREATE_REQUEST`
* `DOCUCORE.PDF.SPLIT`
* `JOBCron.PRODUCT.SYNC_STOCK`

Reglas:

* Debe escribirse en mayúsculas.
* No debe duplicarse.
* Debe existir en documentación si existe en código.
* Si una acción se elimina del código, debe marcarse como `obsoleto` antes de borrarse de la documentación.
* Si falta información real, usar `PENDIENTE_DE_DEFINIR`.

## Ubicación en código frontend

Todo frontend Next.js debe mantener sus acciones ubicables en:

* `app/` para rutas y páginas.
* `features/<modulo>/` para lógica funcional.
* `features/<modulo>/services/` para consumo Gateway.
* `features/<modulo>/components/` para componentes del módulo.
* `features/<modulo>/types/` para tipos del módulo.
* `lib/api/` para cliente Gateway compartido.

Prohibido esconder acciones de negocio en componentes genéricos sin documentarlas.

## Ubicación en código Django API

Toda API Django debe mantener sus acciones ubicables en:

* `apps/<modulo>/models.py`
* `apps/<modulo>/serializers.py`
* `apps/<modulo>/views.py`
* `apps/<modulo>/urls.py`
* `apps/<modulo>/permissions.py`
* `apps/<modulo>/services.py`
* `apps/<modulo>/tasks.py`
* `apps/<modulo>/management/commands/`

Si el proyecto usa estructura distinta, documentarla en el mapa y justificarla.

## Relación obligatoria con Gateway

Toda acción que consuma API desde frontend debe documentar:

* ruta frontend;
* servicio frontend;
* ruta Gateway;
* API destino;
* endpoint real;
* permiso;
* errores esperados.

El frontend no debe consumir APIs directas fuera del Gateway.

## Relación obligatoria con permisos

Toda acción protegida debe documentar:

* permiso requerido;
* rol esperado;
* comportamiento si no hay sesión;
* comportamiento si no hay permiso;
* pantalla o mensaje de error.

## Relación obligatoria con Auth

Si el proyecto usa Auth, documentar todas las acciones Auth disponibles:

* registro;
* login;
* logout;
* refresh session;
* activación de cuenta;
* reenviar activación;
* reset password;
* confirm reset password;
* cambio de contraseña;
* cambio de email si aplica;
* confirmación de email si aplica;
* validación de sesión;
* recuperación de usuario actual;
* errores de Gateway/Auth;
* pantallas públicas y privadas relacionadas.

## Relación obligatoria con base de datos

Si una acción crea, modifica o elimina datos, documentar:

* tabla;
* columnas principales;
* migración relacionada;
* si pertenece al Core ERP, API compartida o proyecto específico;
* si requiere nueva base de datos o debe usar una existente.

Prohibido inventar bases de datos fuera de documentación vigente.

## Actualización durante desarrollo

Cada vez que se agregue, cambie o elimine una acción, Codex debe actualizar el `code-actions-map.md` correspondiente en el mismo cambio.

No se acepta implementar primero y documentar después como tarea futura.

## Checklist obligatorio para PR

Antes de cerrar un cambio:

* [ ] ¿La acción nueva aparece en `code-actions-map.md`?
* [ ] ¿La ruta frontend está documentada?
* [ ] ¿El servicio frontend está documentado?
* [ ] ¿La ruta Gateway está documentada?
* [ ] ¿El endpoint API está documentado?
* [ ] ¿Los permisos están documentados?
* [ ] ¿Los modelos/tablas están documentados?
* [ ] ¿Los estados UI están documentados?
* [ ] ¿Los errores esperados están documentados?
* [ ] ¿La validación fue ejecutada o justificada?
* [ ] ¿No se duplicó una acción ya existente?

## Validaciones

Ejecutar según aplique:

* Documentación: `python scripts/build_master_index.py`
* Documentación: `python scripts/validate_frontmatter.py`
* Documentación: `git diff --check`
* Frontend: `npm run lint`
* Frontend: `npm run build`
* Django: `python manage.py check`
* Docker: `docker compose config --quiet`

Si no se puede ejecutar una validación, registrar motivo real.

## Archivos adicionales a crear

Crear plantilla:

`Docs/templates/code-actions-map-template.md`

Crear sección en:

`Docs/README.md`

Agregar referencia en:

`Docs/_meta/active-work-index.md`
`Docs/03_standards/operations/context-packs.md`
`Docs/03_standards/codex/codex-minimal-reading-standard.md`
`Docs/03_standards/codex/codex-documentation-diff-standard.md`
`Docs/03_standards/frontend/nextjs-project-standard.md`
`Docs/03_standards/api/api-contract-first-standard.md`

## Aplicación en proyectos existentes

Auditar todos los proyectos existentes y crear su mapa inicial:

* Refapart
* LexNova
* TecnoTelec
* DocuCore
* JobCron
* Universal POS
* PhoneShop
* Imagrafity
* Innovation Engines Repair
* saTwi
* Radar Empresarial

Si un proyecto no tiene código disponible o no tiene acciones implementadas, crear el archivo con `PENDIENTE_DE_DEFINIR`.

## Aplicación en proyectos nuevos

Todo proyecto nuevo debe nacer con:

* `technical/code-actions-map.md`
* `frontend/code-actions-map.md` si tiene web
* `api/code-actions-map.md` si tiene API
* referencia a Gateway
* referencia a permisos
* referencia a Auth si aplica
* relación con base de datos si aplica

No se debe iniciar implementación funcional sin mapa mínimo.

## Reporte final obligatorio

Actualizar:

`Docs/agents/EXECUTION_REPORT.md`

Reportar:

* documentos leídos;
* Context Pack usado;
* archivos creados;
* archivos modificados;
* proyectos auditados;
* acciones encontradas;
* acciones pendientes;
* validaciones ejecutadas;
* validaciones no ejecutadas y motivo;
* contradicciones encontradas;
* recomendaciones de limpieza.

Mi recomendación directa: **sí debe existir este estándar**, porque ya tienes reglas para lectura mínima, contratos API, frontend por módulos y documentación trazable, pero falta el “índice operativo” que diga: **esta acción vive aquí, consume esto, usa este permiso y toca esta tabla**. Eso es justo lo que más acelera a Codex.

[1]: https://github.com/MexIngSoft/Docs/tree/general "GitHub - MexIngSoft/Docs at general · GitHub"
