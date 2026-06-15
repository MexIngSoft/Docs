Sí: hay base documental suficiente para exigir corrección. La documentación separa núcleo ERP, proyectos, estándares, integraciones y Docker; además marca que el núcleo debe contener arquitectura, contratos entre APIs y patrón gateway/BFF + API propia por proyecto. ([GitHub][1]) También confirma el ecosistema de 8 APIs: Auth, LexNova y 6 comerciales por schemas: Catalog, Inventory, Pricing, Procurement, Sales y Supplier. 

Copia esta instrucción para Codex:

INSTRUCCIÓN OBLIGATORIA PARA CORREGIR Y COMPLETAR JOBCRON, PROYECTOS WEB, APIs Y DOCKER

Objetivo:
Auditar, corregir y completar el desarrollo siguiendo estrictamente la documentación de `https://github.com/MexIngSoft/Docs`, sin omitir módulos, sin crear arquitectura nueva innecesaria y sin romper la regla Docker definida.

Regla principal Docker:
Todo debe correr en Docker, pero separado por proyecto y por tipo.

No se permite crear un Docker aislado nuevo fuera del estándar del repositorio.

Debe existir:

1. Un compose general preparado para proyectos web.
2. Un compose general preparado para APIs.
3. Un compose específico por cada proyecto web.
4. Un compose específico por cada grupo/API cuando aplique.
5. Cada proyecto web debe poder levantarse solo con sus dependencias necesarias.
6. JobCron ERP puede correr junto con el proyecto web requerido cuando sea necesario, pero nunca se deben levantar todos los proyectos juntos por defecto.
7. No mezclar proyectos web distintos en el mismo compose operativo.
8. No mezclar APIs sin justificación funcional.
9. Auth no debe tratarse como proyecto web; Auth es servicio compartido.
10. Gateway/BFF pertenece al proyecto web que lo necesita.
11. Las APIs compartidas deben estar disponibles en una red Docker común controlada, no en redes improvisadas.
12. Si se requiere comunicación entre proyectos/APIs, debe documentarse en el compose correspondiente y en la documentación.

Tareas obligatorias:

1. Auditar primero antes de programar.

   * Revisar `README.md`.
   * Revisar `00_audit`.
   * Revisar `01_core_erp`.
   * Revisar `02_projects`.
   * Revisar `03_standards`.
   * Revisar `04_integrations`.
   * Revisar `agents` en orden numérico ascendente.
   * Registrar qué ya existe, qué falta y qué está incompleto.

2. Validar la arquitectura real contra la documentación.

   * Confirmar módulos del ERP.
   * Confirmar proyectos web existentes.
   * Confirmar APIs existentes.
   * Confirmar gateways/BFF.
   * Confirmar integraciones externas.
   * Confirmar que Syscom quede como integración externa, no como modelo interno mezclado.

3. Completar módulos faltantes del ERP.

   * Núcleo ERP.
   * Usuarios, roles, permisos.
   * Clientes.
   * Cotizador.
   * Ventas.
   * Compras.
   * Inventario.
   * Catálogo.
   * Precios.
   * Proveedores.
   * Logística.
   * Estados del sistema.
   * Notificaciones.
   * Costos.
   * Facturación cuando aplique.
   * Devoluciones.
   * Auditoría.
   * Configuración por proyecto.
   * Rules Engine.
   * Feature visibility / disponibilidad de módulos.
   * Reporting básico.

4. Completar APIs documentadas.

   * Auth.
   * LexNova.
   * Catalog.
   * Inventory.
   * Pricing.
   * Procurement.
   * Sales.
   * Supplier.
   * API propia por proyecto cuando corresponda.
   * Gateway/BFF por proyecto web cuando corresponda.

5. Respetar separación de responsabilidades.

   * Catalog define productos.
   * Inventory controla existencias.
   * Pricing controla precios.
   * Procurement controla compras.
   * Sales controla ventas.
   * Supplier controla proveedores.
   * Auth solo identidad, sesiones, permisos y tokens.
   * LexNova queda aislado del dominio comercial.
   * Syscom solo integración externa, tokens, sync, publish, mappers y reglas del proveedor.

6. Corregir Docker.

   * Eliminar o dejar fuera cualquier Docker nuevo que no siga el estándar.
   * Crear o corregir:

     * `docker-compose.web.yml` o equivalente general web.
     * `docker-compose.api.yml` o equivalente general APIs.
     * `docker-compose.<proyecto>.yml` por proyecto web.
     * `docker-compose.<api-grupo>.yml` cuando aplique.
     * Dockerfile base web.
     * Dockerfile base API.
     * Dockerfile específico por proyecto si se requiere.
   * Cada compose debe tener nombres claros, puertos controlados, variables `.env`, healthchecks, depends_on correcto y red común documentada.
   * No usar nombres genéricos confusos.
   * No duplicar servicios innecesariamente.
   * No levantar todo el ecosistema para probar una sola web.

7. Pruebas obligatorias.

   * Probar cada API en su Docker correspondiente.
   * Probar cada proyecto web en su Docker correspondiente.
   * Probar JobCron ERP cuando sea dependencia del proyecto.
   * Probar Gateway/BFF si existe.
   * Probar login/Auth.
   * Probar comunicación web → gateway → API.
   * Probar healthchecks.
   * Probar migraciones.
   * Probar endpoints principales.
   * Probar variables de entorno.
   * Probar que no haya dependencias rotas.
   * Probar que no se haya usado un Docker externo nuevo.

8. Interfaz de JobCron.

   * Revisar que el ERP sea entendible para usuario normal.
   * Mejorar navegación.
   * Mejorar layout.
   * Mejorar módulos visibles.
   * Evitar pantallas confusas.
   * Agregar estados claros: pendiente, activo, error, sincronizando, completado.
   * Agregar panel de administración por proyecto.
   * Agregar panel de APIs y servicios.
   * Agregar panel de integraciones.
   * Agregar panel de módulos disponibles/no disponibles por proyecto.

9. Documentación obligatoria.

   * Actualizar documentación si se corrige arquitectura.
   * Registrar decisiones técnicas.
   * Registrar compose usado por proyecto.
   * Registrar comandos de arranque.
   * Registrar comandos de prueba.
   * Registrar dependencias.
   * Registrar puertos.
   * Registrar variables `.env`.
   * Registrar qué módulos quedaron completos.
   * Registrar qué módulos quedan pendientes con `PENDIENTE_DE_DEFINIR`.
   * No borrar documentos fuente; mover a `_archive` si algo queda obsoleto.

10. Entregable final obligatorio.
    Crear un reporte con:

* Qué documentación se revisó.
* Qué estaba mal.
* Qué faltaba.
* Qué se corrigió.
* Qué archivos se modificaron.
* Qué Docker/compose se usó.
* Qué pruebas se ejecutaron.
* Resultado de cada prueba.
* Qué queda pendiente.
* Evidencia de que cada web/API corre en su Docker correspondiente.
* Confirmación explícita de que no se creó un Docker nuevo fuera del estándar.

Restricción final:
No se debe dar por terminado el trabajo si:

* No se probó en Docker.
* Se creó un Docker nuevo fuera del estándar.
* No se revisó la documentación.
* No se completaron los módulos documentados.
* No se actualizó documentación.
* No existe reporte final.
* No se puede levantar cada proyecto con su compose correspondiente.

No puedo confirmar exactamente qué hizo Codex en tu código porque no tengo acceso al repositorio de implementación, solo a la documentación y al repositorio Docs público.

[1]: https://github.com/MexIngSoft/Docs "GitHub - MexIngSoft/Docs · GitHub"
