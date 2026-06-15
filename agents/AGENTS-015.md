Correcto. Esta instrucción debe quedar así:

Ejecuta una validación operativa proyecto por proyecto después de los cambios realizados en el ecosistema.

Objetivo:
Comprobar que cada web, gateway, API de dominio y API core funcione correctamente sin levantar todo el ecosistema al mismo tiempo.

Regla principal:
No se deben correr todos los proyectos juntos. Se debe levantar un proyecto, probarlo, registrar resultados, bajarlo completamente y continuar con el siguiente.

Orden obligatorio de prueba:

1. Preparación general:

* Leer `MexIngSoft/Docs`.
* Revisar estándares de Docker, frontend, backend, logs, healthchecks y repositorios.
* Confirmar variables `.env` y `.env.example`.
* Confirmar que no existan secretos reales versionados.
* Confirmar red Docker compartida.
* Confirmar base de datos requerida.
* Confirmar puertos disponibles.

2. Por cada proyecto web:
   Ejecutar este ciclo:

```txt
Subir dependencias mínimas
Subir APIs core necesarias
Subir Project Domain API si aplica
Subir Project Gateway/BFF
Subir web
Probar funcionamiento
Revisar logs
Revisar healthchecks
Registrar resultado
Bajar web
Bajar gateway
Bajar API de dominio
Bajar dependencias no compartidas
Limpiar contenedores huérfanos
Pasar al siguiente proyecto
```

3. Proyectos a validar:

* JobCron.
* TecnoTelec.
* LexNova.
* DocuCore.
* Fiscora.
* Refapart si ya existe.
* Cualquier otra web detectada en la documentación.

4. APIs core a validar:

* Auth.
* Catalog.
* Inventory.
* Pricing.
* Procurement.
* Sales.
* Supplier.
* Document.
* Fiscal.
* Notifications si existe.
* Logistics si existe.
* Rules Engine si existe.

5. APIs de proyecto a validar:

* TecnoTelec.
* TecnoTelec Gateway.
* DocuCore.
* DocuCore Gateway.
* Fiscora.
* Fiscora Gateway.
* Refapart.
* Refapart Gateway.

6. APIs fuera del flujo proyecto:
   Las APIs que todavía no pertenezcan a un proyecto activo deben probarse por separado con:

* build.
* migrate.
* healthcheck.
* test de endpoints principales.
* test de permisos.
* test de logs.
* test de errores.
* revisión de conexión a base de datos.

7. Pruebas mínimas por web:

* La web levanta sin error.
* Carga página pública.
* Carga login.
* Carga dashboard si aplica.
* Consume solo su Gateway/BFF.
* No consume APIs core directamente.
* Muestra errores claros.
* No muestra trazas internas.
* Tiene favicon.
* Tiene metadata.
* Tiene título correcto.
* Tiene navegación funcional.
* No rompe responsive básico.

8. Pruebas mínimas por gateway:

* `/health/`.
* `/version/`.
* Login o validación de sesión.
* Endpoint principal del dashboard.
* Endpoint principal de catálogo/cotización/documentos según proyecto.
* Manejo de error cuando una API dependiente está caída.
* Logs con `request_id`.
* Validación de permisos.

9. Pruebas mínimas por API:

* Contenedor levanta.
* Migraciones corren.
* `/health/`.
* `/health/db/`.
* `/version/`.
* Endpoint principal.
* Error controlado.
* Logs correctos.
* Permisos correctos.
* No expone secretos.
* No imprime tokens completos.

10. Logs obligatorios a revisar:

* Inicio del servicio.
* Conexión a base de datos.
* Request recibido.
* Response enviada.
* Error controlado.
* Error inesperado.
* Tiempo de respuesta.
* Servicio origen.
* Servicio destino.
* Usuario si aplica.
* `request_id`.

11. Registro de resultado:
    Crear o actualizar un documento en:

```txt
03_standards/testing/project-operational-validation.md
```

Con esta tabla:

```txt
Proyecto | Web | Gateway | API dominio | APIs core | Resultado | Errores | Pendientes | Fecha
```

12. Resultado permitido:

* `OK`.
* `OK_CON_OBSERVACIONES`.
* `FALLA_BLOQUEANTE`.
* `NO_APLICA`.
* `PENDIENTE_DE_DEFINIR`.

13. Regla de cierre:
    Un proyecto solo se considera validado cuando:

* Web levanta.
* Gateway responde.
* APIs requeridas responden.
* Logs funcionan.
* Healthchecks funcionan.
* No hay errores críticos.
* Se puede bajar limpio.
* No deja contenedores huérfanos.
* No rompe el siguiente proyecto.

14. Si un proyecto falla:

* Registrar error exacto.
* Registrar contenedor afectado.
* Registrar comando usado.
* Registrar fragmento relevante del log.
* No continuar sin documentar.
* Si la falla no bloquea otros proyectos, marcar `OK_CON_OBSERVACIONES`.
* Si bloquea el arranque o flujo principal, marcar `FALLA_BLOQUEANTE`.

15. Comandos base sugeridos:

```bash
docker compose -f docker-compose-<proyecto>.yml up --build
docker compose -f docker-compose-<proyecto>.yml ps
docker compose -f docker-compose-<proyecto>.yml logs --tail=200
docker compose -f docker-compose-<proyecto>.yml down
docker container prune -f
```

16. No modificar arquitectura durante la prueba.
    Si se detecta un error estructural, documentarlo primero y corregirlo en una tarea separada.

Esto va alineado con tu estándar: cada frontend debe consumir solo su gateway , cada proyecto debe separar Web/Gateway/API/Core , y los repos se deben manejar por responsabilidad, no como un monorepo mezclado .
ss