Sí hay contradicciones que reparar. Las principales:

1. **Docker dice “varios compose separados”, pero también “contenedores multiproyecto”.**
   En `docker.md` se usan `Docker.DB.PG`, `Docker.API.PY`, `Docker.WEB.NJ` y `Docker.SW.Nginx` separados, pero luego se permite agrupar APIs y webs en contenedores multiproyecto. Eso choca con tu regla nueva: **un Docker general, pero compose por proyecto/API y pruebas por proyecto**. ([GitHub][1]) ([GitHub][2])

2. **El índice de APIs no coincide con el resumen de ecosistema de 8 APIs.**
   El repo documenta 8 APIs disponibles en Docker: auth, catalog, inventory, lexnova, pricing, procurement, sales y supplier. ([GitHub][1]) Pero el índice de APIs lista muchas más como `quote-api`, `logistics-api`, `rules-engine-api`, `projects-api`, `cart-api`, `billing-api`, `documents-api`, etc., varias en estado FALTA. ([GitHub][3])

3. **Procurement e Inventory aparecen como proyectos Docker, pero no aparecen completos en el índice de APIs.**
   Docker lista `inventory` y `procurement` como proyectos disponibles. ([GitHub][1]) Pero el índice visible no documenta `inventory-api` ni `procurement-api` como entradas principales, aunque sí documenta `supplier`, `pricing`, `sales`, etc. ([GitHub][3])

4. **Quote está separado, pero Sales dice que también cubre cotización.**
   El índice marca `quote-api` como FALTA, pero en la regla de separación dice que `Sales API = cotizacion, venta, pagos y estado comercial`. Eso duplica responsabilidad. ([GitHub][3])

5. **Gateway/BFF está en núcleo, pero también como API concreta de TecnoTelec.**
   El README dice que el patrón gateway/BFF + API propia por proyecto pertenece al núcleo ERP. ([GitHub][4]) Pero el índice lista `tecnotelec-gateway-api` y `tecnotelec-api` como DRAFT. ([GitHub][3]) Falta aclarar: el patrón va en núcleo; la implementación concreta va en proyecto.

6. **Syscom está bien separado como integración, pero el worker vive dentro de Supplier.**
   La regla general dice que integraciones externas van en `04_integrations`, incluyendo tokens, sync, publish y mappers. ([GitHub][4]) Pero Docker dice que los comandos Syscom viven en `supplier`, y el estándar permite worker Syscom dentro del contenedor de APIs con configuración Supplier. ([GitHub][1]) ([GitHub][2]) Hay que dejar claro: documentación de Syscom en integración; ejecución técnica en Supplier.

7. **Falta una regla definitiva de “compose por proyecto”.**
   El repo sí documenta Docker local, pero todavía manda levantar `Docker.API.PY` completo y `Docker.WEB.NJ` completo. ([GitHub][1]) Debe agregarse una norma superior: `docker-compose.<proyecto>.yml` y `docker-compose.<api-grupo>.yml`, sin levantar todo por defecto.

8. **Hay demasiados módulos FALTA sin estrategia de prioridad real.**
   El índice declara muchas APIs futuras o faltantes, pero no define qué bloque desbloquea al ERP primero. ([GitHub][3]) Debe separarse en: obligatorio MVP, fase 2 y futuro.

Reparación clave: crear un documento rector tipo:

`03_standards/docker/docker-compose-project-standard.md`

y actualizar `docker.md`, `grouped-containers-isolated-config.md` y `01_core_erp/apis/00_api_index.md` para que todos digan lo mismo.

[1]: https://github.com/MexIngSoft/Docs/blob/main/03_standards/docker.md "Docs/03_standards/docker.md at main · MexIngSoft/Docs · GitHub"
[2]: https://github.com/MexIngSoft/Docs/blob/main/03_standards/docker/grouped-containers-isolated-config.md "Docs/03_standards/docker/grouped-containers-isolated-config.md at main · MexIngSoft/Docs · GitHub"
[3]: https://github.com/MexIngSoft/Docs/blob/main/01_core_erp/apis/00_api_index.md "Docs/01_core_erp/apis/00_api_index.md at main · MexIngSoft/Docs · GitHub"
[4]: https://github.com/MexIngSoft/Docs "GitHub - MexIngSoft/Docs · GitHub"




Claro. Este agente es para pegarlo directo en Codex:

# AGENTE 21 — Reparación de contradicciones documentales del repositorio Docs

## Objetivo

Reparar todas las contradicciones actuales del repositorio:

`https://github.com/MexIngSoft/Docs`

La meta es que la documentación quede como fuente única de verdad y Codex no vuelva a crear Docker, APIs, módulos, gateways o proyectos fuera del estándar.

## Regla máxima

Antes de modificar código o documentación, auditar todo el repositorio Docs.

No inventar arquitectura nueva.

No crear estándares paralelos.

No duplicar responsabilidades.

No dejar reglas ambiguas.

Toda contradicción debe corregirse en la documentación principal y en los documentos secundarios relacionados.

---

## Archivos que se deben revisar obligatoriamente

Revisar como mínimo:

* `README.md`
* `00_audit/`
* `01_core_erp/`
* `01_core_erp/apis/00_api_index.md`
* `02_projects/`
* `03_standards/`
* `03_standards/docker.md`
* `03_standards/docker/`
* `03_standards/docker/grouped-containers-isolated-config.md`
* `04_integrations/`
* `agents/`

Si existe otro archivo relacionado con Docker, APIs, gateways, proyectos web, JobCron, Syscom, módulos ERP o arquitectura, también debe revisarse y actualizarse.

---

## Contradicciones que se deben reparar

### 1. Docker general vs Docker por proyecto

Corregir la documentación para que quede una sola regla:

* Existe un estándar Docker general.
* Existen archivos base generales para web y APIs.
* Cada proyecto web debe tener su propio compose.
* Cada grupo/API debe tener su propio compose cuando aplique.
* No se debe levantar todo el ecosistema por defecto.
* No se deben crear Dockers nuevos fuera del estándar.
* No se deben mezclar proyectos web distintos en el mismo compose operativo.
* Se permite correr JobCron junto con un proyecto web solo si ese proyecto lo requiere.
* Se permite correr Auth como dependencia compartida.
* Se permite correr Gateway/BFF solo como dependencia del proyecto web correspondiente.

Crear o actualizar una sección que deje claro:

```text
docker-compose.web.yml          # base general web
docker-compose.api.yml          # base general APIs
docker-compose.jobcron.yml      # ERP
docker-compose.<proyecto>.yml   # proyecto web específico
docker-compose.<api-grupo>.yml  # grupo/API específica
```

---

### 2. Contenedores agrupados vs aislamiento por proyecto

Reparar cualquier documento que diga o sugiera que varios proyectos web deben correr juntos por comodidad.

Debe quedar así:

* Agrupar no significa mezclar proyectos.
* Un contenedor base puede compartir tecnología.
* Un compose operativo debe representar un proyecto, una API o un grupo funcional justificado.
* Si un compose levanta varias APIs, debe documentar por qué esas APIs son dependencias reales.
* Las pruebas deben hacerse con el compose correcto, no con un Docker improvisado.

---

### 3. Índice de APIs contradictorio

Reparar `01_core_erp/apis/00_api_index.md`.

Debe separar claramente:

#### APIs base confirmadas

* Auth API
* LexNova API
* Catalog API
* Inventory API
* Pricing API
* Procurement API
* Sales API
* Supplier API

#### APIs / módulos futuros o derivados

* Quote
* Logistics
* Rules Engine
* Projects
* Cart
* Billing
* Documents
* Notifications
* Reporting
* Feature Visibility

Si una API futura todavía no existe, debe marcarse como:

```text
ESTADO: PENDIENTE_DE_DEFINIR
```

No debe aparecer como obligatoria si todavía no tiene contrato, endpoints, tablas y compose.

---

### 4. Cotizaciones duplicadas

Resolver contradicción entre `quote-api` y `sales-api`.

Regla final:

* Sales API administra ventas, órdenes, pagos y estado comercial.
* Cotización puede iniciar dentro de Sales API como módulo interno.
* Quote API solo debe separarse si existe una necesidad real de escalamiento, multi-proveedor o cotización avanzada.
* Mientras no exista contrato formal de Quote API, debe marcarse como `PENDIENTE_DE_DEFINIR`.
* No duplicar endpoints ni tablas entre Sales y Quote.

Actualizar todos los documentos relacionados.

---

### 5. Procurement e Inventory incompletos

Si Docker o arquitectura mencionan Inventory y Procurement como APIs reales, el índice de APIs debe incluirlas formalmente.

Documentar para cada una:

* propósito
* dominio
* responsabilidades
* lo que NO debe hacer
* dependencias
* endpoints mínimos
* tablas mínimas
* compose esperado
* estado documental

---

### 6. Gateway/BFF mal ubicado

Aclarar:

* Gateway/BFF es un patrón arquitectónico del núcleo.
* Cada proyecto web puede tener su propio Gateway/BFF.
* Gateway/BFF no es una API global única para todos los proyectos.
* No debe mezclarse lógica de negocio dentro del Gateway/BFF.
* El Gateway/BFF solo orquesta llamadas, permisos, sesión, adaptación de respuesta y seguridad para el frontend.
* La API propia del proyecto sí contiene lógica específica del negocio del proyecto.

Ejemplo:

```text
TecnoTelec Web
→ TecnoTelec Gateway/BFF
→ APIs compartidas
→ TecnoTelec API propia
→ JobCron administra configuración y operación
```

---

### 7. Auth mal clasificado

Reparar cualquier documento que trate Auth como proyecto web.

Debe quedar:

* Auth no es proyecto web.
* Auth es API compartida.
* Auth puede ser dependencia de cualquier proyecto web.
* Auth no debe contener lógica comercial, legal ni de proyectos.
* Auth solo maneja identidad, usuarios, roles, permisos, JWT, refresh tokens, sesiones y auditoría de acceso.

---

### 8. Syscom integración externa vs Supplier

Dejar clara la regla:

* Syscom se documenta en `04_integrations/`.
* Syscom no debe mezclarse como dominio interno.
* La ejecución técnica puede vivir en Supplier si se trata de sincronización de proveedor.
* Supplier conserva el gobierno de proveedores.
* Catalog recibe productos normalizados.
* Pricing recibe precios normalizados.
* Inventory recibe existencia normalizada.
* Procurement puede usar datos de Supplier para compras.
* Los tokens, mappers, sync, publish, logs y errores deben documentarse como integración externa.

---

### 9. JobCron como ERP rector

Aclarar que JobCron:

* No es una web comercial.
* Es el ERP administrador.
* Administra proyectos, APIs, integraciones, módulos, permisos, visibilidad, estados, costos, logs y operación.
* Puede correr junto con un proyecto web cuando sea necesario.
* No debe absorber lógica específica de cada web.
* No debe mezclar dominios legales, comerciales y de integración sin separación.

---

### 10. Feature Visibility / disponibilidad de módulos

Corregir documentos para que este sistema quede como estándar transversal:

Debe permitir:

* saber si un módulo existe
* saber si está desarrollado
* saber si está visible
* saber si está activo por proyecto
* saber si aplica por país, estado, región o cliente
* ocultar módulos incompletos
* documentar avance de desarrollo
* evitar `if` regados en cada frontend

---

## Documentos nuevos que se deben crear si no existen

Crear estos documentos si no existen:

```text
03_standards/docker/docker-compose-project-standard.md
03_standards/architecture/source-of-truth.md
03_standards/architecture/api-responsibility-map.md
03_standards/architecture/gateway-bff-standard.md
03_standards/architecture/feature-visibility-standard.md
01_core_erp/apis/api-status-matrix.md
```

---

## Actualizaciones obligatorias

Actualizar `README.md` para que diga claramente:

* cuál es la fuente de verdad
* cómo se organiza el ERP
* cómo se organizan APIs
* cómo se organizan proyectos web
* cómo se ejecuta Docker
* qué está confirmado
* qué está pendiente
* dónde están los estándares obligatorios

Actualizar `00_api_index.md` para que no mezcle APIs reales con ideas futuras.

Actualizar Docker docs para que nadie pueda interpretar que puede crear un Docker nuevo fuera del estándar.

Actualizar documentación de integraciones para separar Syscom de Supplier.

Actualizar agentes anteriores si contradicen esta regla.

---

## Criterios de aceptación

El trabajo no está terminado hasta que:

* No existan reglas Docker contradictorias.
* No existan APIs duplicadas sin justificación.
* Auth esté clasificado solo como API compartida.
* Gateway/BFF esté clasificado como patrón por proyecto web.
* Syscom esté documentado como integración externa.
* Supplier no absorba todo Syscom sin explicación.
* JobCron esté definido como ERP rector.
* El índice de APIs separe reales, derivadas y pendientes.
* Cada API real tenga responsabilidades claras.
* Cada módulo pendiente esté marcado como `PENDIENTE_DE_DEFINIR`.
* Cada compose tenga propósito claro.
* Se documente cómo probar una web/API con su Docker correspondiente.
* Se actualice el README.
* Se cree un reporte final.

---

## Reporte final obligatorio

Crear:

```text
00_audit/reports/contradictions_repair_report.md
```

Debe contener:

* contradicción detectada
* archivo donde estaba
* decisión aplicada
* archivos modificados
* documentos nuevos creados
* reglas finales
* pendientes reales
* validación de que no quedan instrucciones contradictorias

---

## Prohibiciones

No crear Docker nuevo fuera del estándar.

No mover módulos sin documentar.

No borrar documentación fuente sin moverla a `_archive`.

No marcar algo como completo si falta contrato, endpoints, tablas o compose.

No duplicar módulos.

No mezclar proyectos web.

No mezclar APIs sin dependencia real.

No tratar Auth como web.

No tratar Gateway/BFF como API global única.

No tratar Syscom como dominio interno.

No dejar frases ambiguas como “puede hacerse de cualquier forma”.

---

## Resultado esperado

Al finalizar, la documentación debe permitir que cualquier agente o desarrollador entienda exactamente:

* qué es JobCron
* qué es un proyecto web
* qué es una API compartida
* qué es una API propia de proyecto
* qué es Gateway/BFF
* cómo se corre Docker
* cómo se prueba cada proyecto
* qué APIs existen realmente
* qué módulos están pendientes
* qué integraciones son externas
* qué no se debe hacer

Con este agente ya le estás cerrando la puerta a que Codex vuelva a “inventar estructura” o levantar cosas fuera del estándar.
