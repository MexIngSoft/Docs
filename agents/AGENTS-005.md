Sí. Revisé rutas clave del repositorio público y **sí hay contradicciones activas que el agente debe corregir antes de seguir implementando**.

Las contradicciones más graves están aquí:

| Archivo                                                        | Problema                                                               | Qué hacer                                                                                |
| -------------------------------------------------------------- | ---------------------------------------------------------------------- | ---------------------------------------------------------------------------------------- |
| `README.md`                                                    | Dice “Patron gateway/BFF + API propia por proyecto”                    | Cambiar por “Gateway General único + APIs por responsabilidad” ([GitHub][1])             |
| `01_core_erp/architecture/00_general_architecture.md`          | Define `Project Gateway / BFF API` como arquitectura objetivo          | Reescribir a `Web/App -> Gateway General -> APIs de Dominio -> PostgreSQL` ([GitHub][2]) |
| `01_core_erp/architecture/07_project_api_pattern.md`           | Ordena crear `API.PY.DJANGO.NombreProyecto.Gateway`                    | Eliminar patrón gateway/BFF por proyecto ([GitHub][3])                                   |
| `01_core_erp/database/00_database_overview.md`                 | Deja la base productiva como `PENDIENTE_DE_DEFINIR`                    | Definir PostgreSQL obligatorio ([GitHub][4])                                             |
| `01_core_erp/apis/00_api_index.md`                             | Incluye `tecnotelec-gateway-api` como Gateway/BFF web                  | Quitar gateway por proyecto y agregar Gateway General ([GitHub][5])                      |
| `03_standards/operations/git-repository-map.md`                | Lista gateways por proyecto: TecnoTelec, DocuCore y Fiscora            | Removerlos o marcarlos como rechazados/obsoletos ([GitHub][6])                           |
| `03_standards/frontend/shared-docker-frontend-architecture.md` | Al final dice que el frontend debe seguir consumiendo “su gateway/BFF” | Cambiar a `Gateway General` ([GitHub][7])                                                |
| `02_projects/fiscora/architecture.md`                          | Ordena consumir `API.PY.DJANGO.Fiscora.Gateway`                        | Cambiar a Gateway General ([GitHub][8])                                                  |
| `02_projects/docucore/repositories.md`                         | Documenta `API.PY.DJANGO.DocuCore.Gateway`                             | Eliminar gateway propio y cambiar a Gateway General ([GitHub][9])                        |
| `03_standards/operations/project-closure-standard.md`          | Define nomenclatura oficial para gateways/BFF por proyecto             | Reescribir criterio de cierre sin gateways por proyecto ([GitHub][10])                   |
| `03_standards/operations/django-api-project-compliance.md`     | Marca gateways de DocuCore/Fiscora como “Cumple”                       | Cambiar a “OBSOLETO / debe eliminarse” ([GitHub][11])                                    |

Aquí está el agente completo para Codex:

# AGENTS-006.md

# CORRECCIÓN GLOBAL DE CONTRADICCIONES DOCUMENTALES Y ARQUITECTÓNICAS

## OBJETIVO

Este agente tiene la responsabilidad de eliminar todas las contradicciones activas del repositorio `Docs` antes de continuar con cualquier implementación de APIs, webs, Docker, PostgreSQL o módulos de negocio.

Debe corregir la documentación para que todo el ecosistema quede alineado con la arquitectura oficial:

```text
Cliente
→ Web/App
→ Gateway General
→ APIs de Dominio
→ PostgreSQL
```

Este agente debe ejecutarse después de:

* AGENTS-000
* AGENTS-001
* AGENTS-002
* AGENTS-003
* AGENTS-004
* AGENTS-005

---

# REGLAS CANÓNICAS OBLIGATORIAS

Todo el repositorio debe obedecer:

1. Existe un solo Gateway General.
2. Está prohibido crear Gateway/BFF por proyecto.
3. Existe un solo Auth compartido.
4. Está prohibido crear Auth por proyecto.
5. Existe un Docker por objetivo.
6. Está prohibido crear Docker por proyecto.
7. PostgreSQL es la única base de datos permitida.
8. Está prohibido SQLite, db.sqlite3 o fallback local.
9. Las APIs se organizan por responsabilidad.
10. Las webs se organizan por proyecto.
11. Las integraciones externas no se consumen desde frontend.
12. Los compose por proyecto solo seleccionan servicios existentes.
13. La documentación contradictoria debe corregirse en su ubicación canonica o
    marcarse como obsoleta segun el estandar documental vigente. Esta regla no
    aplica a `Docs/agents/AGENTS-*.md`, que nunca se eliminan ni se mueven.

---

# FASE 1 - INVENTARIO GLOBAL DE CONTRADICCIONES

Buscar en todo el repositorio:

```text
Gateway/BFF
gateway/BFF
Project Gateway
BFF API
Gateway por proyecto
gateway por proyecto
NombreProyecto.Gateway
API.PY.DJANGO.*.Gateway
tecnotelec-gateway-api
docucore-gateway
fiscora-gateway
su gateway/BFF
Docker por proyecto
Auth por proyecto
SQLite
sqlite
db.sqlite3
PENDIENTE_DE_DEFINIR
```

Generar una lista con:

* archivo
* línea aproximada
* contradicción
* acción requerida
* estado final

---

# FASE 2 - CORREGIR README.md

Archivo:

```text
README.md
```

Problema detectado:

Actualmente indica que al núcleo ERP pertenece:

```text
Patron gateway/BFF + API propia por proyecto.
```

Acción:

Reemplazar por:

```text
Patrón Gateway General único + APIs de dominio por responsabilidad.
```

También agregar regla explícita:

```text
El ecosistema no utiliza Gateway/BFF por proyecto.
Todas las webs consumen el Gateway General.
```

---

# FASE 3 - CORREGIR ARQUITECTURA GENERAL

Archivo:

```text
01_core_erp/architecture/00_general_architecture.md
```

Problema detectado:

Define como arquitectura objetivo:

```text
Web/Mobile/Admin del proyecto
→ Project Gateway / BFF API
→ Project Domain API
→ Core ERP APIs
→ PostgreSQL por schemas de dominio
```

Acción:

Reescribir la arquitectura objetivo como:

```text
Cliente
→ Web/App
→ Gateway General
→ APIs de Dominio
→ PostgreSQL
```

Eliminar:

```text
Project Gateway / BFF API
API intermedia del proyecto
gateway por proyecto
```

Agregar:

```text
El Gateway General es único para todo el ecosistema.
Las APIs especializadas solo existen cuando contienen lógica exclusiva del dominio.
```

---

# FASE 4 - REESCRIBIR PATRÓN DE API POR PROYECTO

Archivo:

```text
01_core_erp/architecture/07_project_api_pattern.md
```

Problema detectado:

Ordena crear:

```text
API.PY.DJANGO.NombreProyecto.Gateway
API.PY.DJANGO.TecnoTelec.Gateway
tecnotelec-gateway-api
```

Acción:

Reemplazar el documento completo por:

```text
# Patrón de consumo de APIs por proyecto

## Arquitectura oficial

Web/App del proyecto
→ Gateway General
→ APIs Compartidas
→ API Especializada si aplica
→ PostgreSQL

## Regla principal

El frontend no debe consumir APIs internas directamente.
El frontend consume únicamente el Gateway General.

## Prohibido

- Gateway por proyecto.
- BFF por proyecto.
- API.PY.DJANGO.NombreProyecto.Gateway.
- tecnotelec-gateway-api.
- docucore-gateway-api.
- fiscora-gateway-api.

## API especializada

Solo se permite una API especializada cuando el proyecto tenga lógica exclusiva.

Ejemplos:

- Refapart API: lógica exclusiva de refacciones.
- LexNova API: lógica exclusiva legal.
- Fiscora API: lógica exclusiva fiscal/contable.

Si una funcionalidad ya existe en una API compartida, no se crea una API nueva.

## APIs compartidas

- Auth
- Gateway General
- Catalog
- Inventory
- Pricing
- Supplier
- Procurement
- Sales
- Search
- Document
- Notification
- FeatureVisibility
- ETL
```

---

# FASE 5 - CORREGIR BASE DE DATOS

Archivo:

```text
01_core_erp/database/00_database_overview.md
```

Problema detectado:

Indica:

```text
Base exacta por ambiente productivo: PENDIENTE_DE_DEFINIR
```

Acción:

Cambiar a:

```text
La base de datos oficial del ecosistema es PostgreSQL.

PostgreSQL es obligatorio para:

- desarrollo
- pruebas integradas
- staging
- producción
- Docker local

Está prohibido usar:

- SQLite
- db.sqlite3
- fallback local
- motores embebidos
```

Agregar estructura:

```text
Base principal:

jobcron

Schemas:

- auth
- catalog
- inventory
- pricing
- supplier
- procurement
- sales
- search
- notification
- document
- feature_visibility
- refapart
- lexnova
- fiscora
```

---

# FASE 6 - CORREGIR ÍNDICE DE APIS

Archivo:

```text
01_core_erp/apis/00_api_index.md
```

Problema detectado:

Incluye:

```text
tecnotelec-gateway-api | DRAFT | Gateway/BFF web
```

Acción:

Eliminar:

```text
tecnotelec-gateway-api
cualquier gateway-api por proyecto
```

Agregar:

```text
general-gateway-api | EXISTE/O_REQUERIDO | Gateway General único del ecosistema | ALTA
feature-visibility-api | REQUERIDO | Visibilidad de módulos por proyecto, región, rol y estado | ALTA
etl-api | REQUERIDO | Sincronizaciones, importaciones, exportaciones y conectores | MEDIA
search-api | REQUERIDO | Búsqueda general, indexación, sugerencias y demanda | ALTA
```

---

# FASE 7 - CORREGIR MAPA DE REPOSITORIOS

Archivo:

```text
03_standards/operations/git-repository-map.md
```

Problema detectado:

Lista como repositorios activos:

```text
API.PY.DJANGO.TecnoTelec.Gateway
API.PY.DJANGO.DocuCore.Gateway
API.PY.DJANGO.Fiscora.Gateway
```

Acción:

Mover esos registros a una sección llamada:

```text
Repositorios rechazados / obsoletos
```

Marcar como:

```text
OBSOLETO - reemplazado por API.PY.DJANGO.Gateway.General
```

Agregar:

```text
API.PY.DJANGO.Gateway.General
```

Regla:

```text
No crear repositorios Gateway por proyecto.
```

También corregir el orden recomendado de subida para quitar:

```text
API.PY.DJANGO.TecnoTelec.Gateway
```

y reemplazar por:

```text
API.PY.DJANGO.Gateway.General
```

---

# FASE 8 - CORREGIR DOCKER FRONTEND COMPARTIDO

Archivo:

```text
03_standards/frontend/shared-docker-frontend-architecture.md
```

Problema detectado:

La última regla indica:

```text
debe seguir consumiendo su gateway/BFF.
```

Acción:

Cambiar por:

```text
Debe seguir consumiendo el Gateway General.
```

Agregar regla:

```text
Docker.WEB.NJ es el contenedor/orquestador objetivo para todas las webs.
No debe crearse Docker.WEB por proyecto.
```

---

# FASE 9 - CORREGIR FISCORA

Archivo:

```text
02_projects/fiscora/architecture.md
```

Problema detectado:

El diagrama contiene:

```text
WEB.NJ.NEXT.Fiscora
→ API.PY.DJANGO.Fiscora.Gateway
```

Acción:

Cambiar por:

```text
WEB.NJ.NEXT.Fiscora
→ API.PY.DJANGO.Gateway.General
→ API.PY.DJANGO.Fiscora
→ API.PY.DJANGO.Fiscal
→ API.PY.DJANGO.Document
```

Eliminar reglas:

```text
El frontend consume solo el gateway Fiscora.
El gateway normaliza errores, sesiones y permisos.
```

Reemplazar por:

```text
El frontend consume solo el Gateway General.
El Gateway General normaliza errores, sesiones y permisos.
```

---

# FASE 10 - CORREGIR DOCUCORE

Archivo:

```text
02_projects/docucore/repositories.md
```

Problema detectado:

Documenta:

```text
API.PY.DJANGO.DocuCore.Gateway
```

Acción:

Eliminarlo de la lista de repositorios activos.

Agregar:

```text
API.PY.DJANGO.Gateway.General
```

Cambiar reglas:

```text
El frontend debe consumir solo API.PY.DJANGO.DocuCore.Gateway.
API.PY.DJANGO.DocuCore.Gateway puede hablar con API.PY.DJANGO.DocuCore y API.PY.DJANGO.Document.
```

Por:

```text
El frontend debe consumir solo API.PY.DJANGO.Gateway.General.
El Gateway General puede enrutar hacia API.PY.DJANGO.DocuCore y API.PY.DJANGO.Document.
```

---

# FASE 11 - CORREGIR ESTÁNDAR DE CIERRE DJANGO

Archivo:

```text
03_standards/operations/project-closure-standard.md
```

Problema detectado:

Define como nomenclatura oficial:

```text
API.PY.DJANGO.NombreProyecto.Gateway
```

Acción:

Eliminar toda regla de cierre para Gateway/BFF por proyecto.

Reemplazar por:

```text
La única nomenclatura permitida para Gateway es:

API.PY.DJANGO.Gateway.General

Está prohibido crear:

API.PY.DJANGO.NombreProyecto.Gateway
```

Cambiar checklist final para bloquear cierre si existe:

```text
Gateway por proyecto
BFF por proyecto
SQLite
Docker por proyecto
Auth por proyecto
```

---

# FASE 12 - CORREGIR CUMPLIMIENTO DJANGO API

Archivo:

```text
03_standards/operations/django-api-project-compliance.md
```

Problema detectado:

Marca como “Cumple”:

```text
API.PY.DJANGO.DocuCore.Gateway
API.PY.DJANGO.Fiscora.Gateway
```

Acción:

Cambiar estado a:

```text
OBSOLETO - debe eliminarse o archivarse.
```

Agregar:

```text
API.PY.DJANGO.Gateway.General | REQUERIDO | Gateway General único del ecosistema.
```

Agregar nota:

```text
Los gateways por proyecto ya no cumplen la arquitectura oficial.
```

---

# FASE 13 - REVISAR AGENTS ACTIVOS

Revisar todos los archivos:

```text
agents/AGENTS-*.md
```

Validar que no contengan:

```text
Gateway por proyecto
BFF por proyecto
Docker por proyecto
SQLite
db.sqlite3
API.PY.DJANGO.NombreProyecto.Gateway
```

Acciones:

* Si un agent está vacío y corresponde a AGENTS-000 a AGENTS-006, pegar la versión canónica correspondiente.
* Si un agent contradice AGENTS-000, corregirlo.
* Si un agent ya no aplica, vaciar su contenido y conservar el archivo original
  en `Docs/agents/`.

---

# FASE 14 - CREAR ADR CANÓNICO

Crear:

```text
01_core_erp/architecture/ADR-001-arquitectura-base-jobcron.md
```

Debe establecer:

```text
Estado: Aceptado

Decisiones:

- Un Docker por objetivo.
- Un Gateway General único.
- Un Auth compartido.
- PostgreSQL obligatorio.
- APIs por responsabilidad.
- Webs por proyecto.
- Integraciones mediante APIs internas.

Rechazado:

- Docker por proyecto.
- Gateway por proyecto.
- BFF por proyecto.
- Auth por proyecto.
- SQLite.
- db.sqlite3.
- Fallback local.
```

---

# FASE 15 - CREAR MATRICES OBLIGATORIAS

Crear o actualizar:

```text
01_core_erp/architecture/docker-objective-matrix.md
01_core_erp/architecture/project-api-dependency-matrix.md
01_core_erp/apis/api-responsibility-matrix.md
03_standards/operations/definition-of-done.md
03_standards/documentation/documentation-cleanup-standard.md
```

Estas matrices deben impedir que los agents futuros vuelvan a crear contradicciones.

---

# FASE 16 - VALIDACIÓN FINAL

Ejecutar búsqueda global.

No deben existir menciones activas de:

```text
Project Gateway
BFF API
Gateway por proyecto
NombreProyecto.Gateway
tecnotelec-gateway-api
docucore-gateway
fiscora-gateway
su gateway/BFF
Docker por proyecto
Auth por proyecto
SQLite
sqlite
db.sqlite3
```

Excepción:

Solo pueden aparecer en:

* ADR como decisión rechazada.
* Documentos dentro de `_archive`.
* Reporte de corrección indicando que fueron eliminados.

---

# FASE 17 - REPORTE FINAL

Actualizar:

```text
EXECUTION_REPORT.md
```

Debe incluir:

* Archivos corregidos.
* Contradicciones detectadas.
* Contradicciones eliminadas.
* Documentos archivados.
* ADR creado.
* Matrices creadas.
* Agents corregidos.
* Validaciones ejecutadas.
* Pendientes reales.

---

# CRITERIOS DE CIERRE

Este agente no puede cerrarse si:

* `README.md` sigue mencionando Gateway/BFF por proyecto.
* `00_general_architecture.md` sigue mencionando Project Gateway.
* `07_project_api_pattern.md` sigue ordenando crear Gateway por proyecto.
* `00_database_overview.md` mantiene PostgreSQL como pendiente.
* `00_api_index.md` mantiene tecnotelec-gateway-api activo.
* `git-repository-map.md` mantiene gateways por proyecto activos.
* `shared-docker-frontend-architecture.md` dice “su gateway/BFF”.
* Fiscora o DocuCore siguen consumiendo gateway propio.
* Los estándares Django siguen permitiendo `NombreProyecto.Gateway`.
* Quedan referencias activas a SQLite o db.sqlite3.

---

# RESULTADO ESPERADO

Al finalizar:

* Toda la documentación queda alineada.
* No existen gateways por proyecto activos.
* No existe Docker por proyecto.
* No existe Auth por proyecto.
* PostgreSQL queda como base oficial.
* El Gateway General queda como único punto de entrada.
* Las APIs quedan organizadas por responsabilidad.
* Las webs quedan organizadas por proyecto.
* Las integraciones externas quedan detrás de APIs internas.
* Los agentes futuros ya no tendrán instrucciones contradictorias.

Este AGENTS-006 es el que yo usaría para limpiar el repositorio **sin dejar “versiones viejas activas”**.

[1]: https://github.com/MexIngSoft/Docs.git "GitHub - MexIngSoft/Docs · GitHub"
[2]: https://raw.githubusercontent.com/MexIngSoft/Docs/main/01_core_erp/architecture/00_general_architecture.md "raw.githubusercontent.com"
[3]: https://raw.githubusercontent.com/MexIngSoft/Docs/main/01_core_erp/architecture/07_project_api_pattern.md "raw.githubusercontent.com"
[4]: https://raw.githubusercontent.com/MexIngSoft/Docs/main/01_core_erp/database/00_database_overview.md "raw.githubusercontent.com"
[5]: https://raw.githubusercontent.com/MexIngSoft/Docs/main/01_core_erp/apis/00_api_index.md "raw.githubusercontent.com"
[6]: https://raw.githubusercontent.com/MexIngSoft/Docs/main/03_standards/operations/git-repository-map.md "raw.githubusercontent.com"
[7]: https://raw.githubusercontent.com/MexIngSoft/Docs/main/03_standards/frontend/shared-docker-frontend-architecture.md "raw.githubusercontent.com"
[8]: https://raw.githubusercontent.com/MexIngSoft/Docs/main/02_projects/fiscora/architecture.md "raw.githubusercontent.com"
[9]: https://raw.githubusercontent.com/MexIngSoft/Docs/main/02_projects/docucore/repositories.md "raw.githubusercontent.com"
[10]: https://raw.githubusercontent.com/MexIngSoft/Docs/main/03_standards/operations/project-closure-standard.md "raw.githubusercontent.com"
[11]: https://raw.githubusercontent.com/MexIngSoft/Docs/main/03_standards/operations/django-api-project-compliance.md "raw.githubusercontent.com"
