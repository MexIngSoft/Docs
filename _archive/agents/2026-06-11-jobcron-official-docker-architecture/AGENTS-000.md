Sí, entonces la arquitectura debe quedar así, ya como regla final para documentar y aplicar:

# Arquitectura Docker oficial para JobCron

## 1. Objetivo

La arquitectura Docker debe permitir dos formas de ejecución:

```text
1. Ejecutar todo el ecosistema completo.
2. Ejecutar un solo proyecto web con sus APIs necesarias.
```

Ningún archivo Docker general debe modificarse para resolver necesidades de un solo proyecto.

---

# 2. Estructura principal

La infraestructura se divide en cuatro carpetas principales:

```text
Docker.DB.PG/
Docker.API.PY/
Docker.WEB.NJ/
Docker.SW.Nginx/
```

## Responsabilidad de cada carpeta

```text
Docker.DB.PG
→ bases de datos, schemas, volúmenes, respaldos e inicialización.

Docker.API.PY
→ todas las APIs Django y sus corridas generales o individuales.

Docker.WEB.NJ
→ todas las webs Next.js y sus corridas generales o individuales.

Docker.SW.Nginx
→ proxy, rutas internas, dominios locales y entrada general del sistema.
```

---

# 3. Archivos máster

Los archivos máster son para correr todo junto.

```text
Docker.DB.PG/docker-compose.master.db.yml
Docker.API.PY/docker-compose.master.api.yml
Docker.WEB.NJ/docker-compose.master.web.yml
Docker.SW.Nginx/docker-compose.master.nginx.yml
```

Estos archivos deben levantar:

```text
Todas las bases necesarias
Todas las APIs
Todas las webs
Nginx / proxy general
```

Ejemplo:

```bash
docker compose \
  -f Docker.DB.PG/docker-compose.master.db.yml \
  -f Docker.API.PY/docker-compose.master.api.yml \
  -f Docker.WEB.NJ/docker-compose.master.web.yml \
  -f Docker.SW.Nginx/docker-compose.master.nginx.yml \
  up -d
```

---

# 4. Archivos por proyecto

Cada proyecto web debe tener su propio compose.

Ejemplo TecnoTelec:

```text
Docker.WEB.NJ/docker-compose.tecnotelec.web.yml
Docker.API.PY/docker-compose.tecnotelec.api.yml
Docker.DB.PG/docker-compose.tecnotelec.db.yml
Docker.SW.Nginx/docker-compose.tecnotelec.nginx.yml
```

Debe poder correr así:

```bash
docker compose \
  -f Docker.DB.PG/docker-compose.tecnotelec.db.yml \
  -f Docker.API.PY/docker-compose.tecnotelec.api.yml \
  -f Docker.WEB.NJ/docker-compose.tecnotelec.web.yml \
  -f Docker.SW.Nginx/docker-compose.tecnotelec.nginx.yml \
  up -d
```

---

# 5. Regla por proyecto web

El proyecto web es el núcleo de decisión.

Cada web define qué necesita correr.

Ejemplo:

```text
TecnoTelec Web
→ TecnoTelec Gateway
→ Auth API
→ Catalog API
→ Supplier API
→ Pricing API
→ Inventory API
→ Sales API
→ TecnoTelec API
→ Base comercial
→ Base auth
```

Ejemplo LexNova:

```text
LexNova Web
→ LexNova Gateway
→ Auth API
→ LexNova API
→ Base auth
→ Base lexnova
```

Ejemplo JobCron:

```text
JobCron Web
→ JobCron Gateway/API
→ Auth API
→ APIs administrativas necesarias
→ Base auth
→ Base jobcron si aplica
```

---

# 6. Dockerfiles

Debe existir un Dockerfile base por tecnología y Dockerfiles específicos solo cuando el proyecto lo necesite.

## APIs

```text
Docker.API.PY/Dockerfile.api.base
Docker.API.PY/Dockerfile.auth
Docker.API.PY/Dockerfile.catalog
Docker.API.PY/Dockerfile.supplier
Docker.API.PY/Dockerfile.tecnotelec
Docker.API.PY/Dockerfile.lexnova
```

## Webs

```text
Docker.WEB.NJ/Dockerfile.web.base
Docker.WEB.NJ/Dockerfile.tecnotelec
Docker.WEB.NJ/Dockerfile.lexnova
Docker.WEB.NJ/Dockerfile.jobcron
```

## Base de datos

```text
Docker.DB.PG/Dockerfile.postgres
```

Solo se crea Dockerfile específico cuando el proyecto requiera instalación, build o configuración diferente.

---

# 7. Variables de entorno

No se deben borrar los archivos `.env.example` ni `.env.local.example`.

La estructura correcta es:

```text
.env.example
→ plantilla documentada sin secretos.

.env.local.example
→ plantilla para desarrollo local.

.env.local
→ valores reales locales, no versionados.

.env.master
→ valores para correr todo el ecosistema.

.env.<proyecto>
→ valores para correr un proyecto individual.

.env.<api>
→ valores para correr una API individual.
```

## Ubicación recomendada

```text
Docker.DB.PG/.env.master.db
Docker.API.PY/.env.master.api
Docker.WEB.NJ/.env.master.web
Docker.SW.Nginx/.env.master.nginx
```

Por proyecto:

```text
Docker.DB.PG/.env.tecnotelec.db
Docker.API.PY/.env.tecnotelec.api
Docker.WEB.NJ/.env.tecnotelec.web
Docker.SW.Nginx/.env.tecnotelec.nginx
```

---

# 8. Regla para agregar variables

Cada variable nueva debe agregarse en todos los lugares donde aplique:

```text
1. .env.example
2. .env.local.example
3. .env.local
4. .env.master correspondiente
5. .env.<proyecto> correspondiente
```

Ejemplo:

```text
CATALOG_API_URL
```

Debe existir en:

```text
Docker.API.PY/.env.master.api
Docker.WEB.NJ/.env.tecnotelec.web
Docker.API.PY/.env.tecnotelec.api
.env.example
.env.local.example
```

---

# 9. Regla de secretos

Cada API debe tener sus propias variables.

Incorrecto:

```text
DJANGO_SECRET_KEY=...
```

Correcto:

```text
AUTH_DJANGO_SECRET_KEY=...
CATALOG_DJANGO_SECRET_KEY=...
SUPPLIER_DJANGO_SECRET_KEY=...
LEXNOVA_DJANGO_SECRET_KEY=...
TECNOTELEC_DJANGO_SECRET_KEY=...
```

Esto evita que todas las APIs dependan de una sola llave global.

---

# 10. Bases de datos

La base se gestiona desde:

```text
Docker.DB.PG/
```

Bases principales:

```text
auth
lexnova
comercial
jobcron, si aplica
```

La base comercial puede dividirse por schemas:

```text
catalog
inventory
pricing
procurement
sales
supplier
tecnotelec
customization
```

---

Sí, tienes razón. La regla 11 debe cambiar: **no conviene crear redes aisladas por proyecto**, porque las APIs compartidas como `Auth`, `Catalog`, `Supplier`, etc., deben poder ser reutilizadas por varias webs sin romper comunicación.

La regla corregida quedaría así:

# 11. Redes Docker y reutilización de servicios compartidos

## 11.1 Regla principal

Debe existir una red Docker compartida y estable para todo el ecosistema local:

```text
jobcron_network
```

Esta red será la red principal de comunicación interna entre:

```text
Webs
Gateways
APIs Core
APIs propias de proyecto
Bases de datos
Nginx
Servicios auxiliares
```

No se deben crear redes aisladas por proyecto web como regla general, porque una API compartida puede ser usada por más de un proyecto al mismo tiempo.

Ejemplo:

```text
TecnoTelec Web usa Auth API
LexNova Web usa Auth API
JobCron Web usa Auth API
```

Si cada proyecto levantara su propia red aislada, las webs no podrían reutilizar correctamente una API ya levantada por otro proyecto.

---

## 11.2 Regla de comunicación

Todos los servicios que necesiten comunicarse entre sí deben estar conectados a:

```text
jobcron_network
```

La comunicación interna debe hacerse usando el nombre del servicio Docker, no `localhost`.

Correcto:

```text
http://api-auth:8000
http://api-catalog:8000
http://api-supplier:8000
http://api-tecnotelec-gateway:8000
```

Incorrecto:

```text
http://localhost:8000
http://127.0.0.1:8000
```

---

## 11.3 Red externa persistente

La red `jobcron_network` debe declararse como red externa compartida:

```yaml
networks:
  jobcron_network:
    external: true
```

Antes de levantar cualquier proyecto, debe existir la red:

```bash
docker network create jobcron_network
```

Si la red ya existe, no se debe recrear ni eliminar.

---

## 11.4 Regla para levantar proyectos individuales

Cuando se levante un proyecto web individual, el compose del proyecto debe:

```text
1. Conectarse a jobcron_network.
2. Revisar qué APIs necesita.
3. Levantar solo las APIs que no existan.
4. Reutilizar las APIs que ya estén levantadas.
5. No duplicar servicios compartidos.
```

Ejemplo:

```text
TecnoTelec ya levantó Auth API.
LexNova necesita Auth API.
LexNova debe reutilizar Auth API, no crear otra Auth API.
```

---

## 11.5 Regla cuando una API ya existe

Si un proyecto necesita una API que ya está levantada, debe validarse:

```text
1. Si la API existe y no tiene cambios pendientes:
   → dejarla corriendo.

2. Si la API existe pero tiene cambios de código, Dockerfile, dependencias o variables:
   → detener solo esa API.
   → reconstruirla.
   → levantarla de nuevo.

3. Si la API no existe:
   → levantarla.

4. Si la API existe pero está detenida:
   → iniciarla.

5. Si la API existe pero está fallando:
   → revisar logs.
   → reiniciarla o reconstruirla según el error.
```

---

## 11.6 Regla para evitar duplicados

No deben existir dos contenedores activos para la misma API compartida.

Incorrecto:

```text
api-auth-tecnotelec
api-auth-lexnova
api-auth-jobcron
```

Correcto:

```text
api-auth
```

La API compartida debe tener un nombre único y estable.

---

## 11.7 Nombres estables de servicios

Los servicios compartidos deben usar nombres únicos:

```text
api-auth
api-catalog
api-supplier
api-pricing
api-inventory
api-sales
api-procurement
db-postgres
nginx-jobcron
```

Los servicios propios de proyecto sí pueden usar nombre del proyecto:

```text
web-tecnotelec
api-tecnotelec
api-tecnotelec-gateway

web-lexnova
api-lexnova
api-lexnova-gateway

web-jobcron
api-jobcron
api-jobcron-gateway
```

---

## 11.8 Regla de dependencias entre proyectos

Un proyecto web no es dueño de una API compartida.

Ejemplo:

```text
TecnoTelec puede necesitar Auth API.
LexNova también puede necesitar Auth API.
JobCron también puede necesitar Auth API.
```

Por tanto:

```text
Auth API pertenece al ecosistema, no a TecnoTelec.
Catalog API pertenece al ecosistema comercial, no a TecnoTelec.
Supplier API pertenece al ecosistema comercial, no a TecnoTelec.
```

---

## 11.9 Regla de actualización de APIs compartidas

Cuando una API compartida cambia, se debe actualizar como servicio global.

Ejemplo:

```text
Auth API cambió.
```

Entonces se debe:

```text
1. Detener api-auth.
2. Reconstruir api-auth.
3. Levantar api-auth.
4. Validar healthcheck.
5. Continuar levantando los proyectos que dependan de ella.
```

No se debe levantar otra copia de Auth para cada proyecto.

---

## 11.10 Regla de healthcheck

Toda API compartida debe tener healthcheck.

Ejemplo:

```text
/api/health/
```

Antes de que un proyecto use una API compartida, debe validar que esté saludable.

Si no está saludable:

```text
1. Revisar logs.
2. Reiniciar.
3. Reconstruir si hubo cambios.
4. Continuar solo cuando el healthcheck responda correctamente.
```

---

## 11.11 Regla final

La red oficial será:

```text
jobcron_network
```

Esta red será compartida, persistente y usada por todos los compose.

No se deben crear redes por proyecto salvo casos excepcionales y documentados.

La prioridad es:

```text
Comunicación estable
Reutilización de APIs compartidas
No duplicar contenedores
Levantar solo lo necesario
Reconstruir solo lo que cambió
```


# 12. Puertos

Los puertos externos deben exponerse solo cuando sean necesarios.

Correcto:

```text
Nginx expone puertos públicos.
Webs pueden exponerse en local.
APIs internas no deben exponerse públicamente.
Postgres no debe exponerse públicamente en producción.
```

---

# 13. Perfiles Docker

Los compose pueden usar perfiles para ejecutar partes específicas:

```text
profiles:
  - master
  - tecnotelec
  - lexnova
  - jobcron
  - auth
  - commercial
```

Ejemplo:

```bash
docker compose --profile tecnotelec up -d
```

---

# 14. Regla de modificación

Los archivos máster solo se modifican cuando:

```text
1. Se agrega una nueva API global.
2. Se agrega una nueva web global.
3. Se agrega una nueva base global.
4. Se cambia una regla general del ecosistema.
```

No se modifican cuando:

```text
1. Solo falla TecnoTelec.
2. Solo falla LexNova.
3. Solo cambia una variable de un proyecto.
4. Solo se agrega una dependencia individual.
5. Solo se cambia un puerto local de una web.
```

---

# 15. Flujo correcto de trabajo

Cuando se crea un nuevo proyecto web:

```text
1. Crear Dockerfile del proyecto web si lo necesita.
2. Crear docker-compose.<proyecto>.web.yml.
3. Crear docker-compose.<proyecto>.api.yml.
4. Crear docker-compose.<proyecto>.db.yml si requiere base propia.
5. Crear .env.<proyecto>.
6. Conectar su Gateway.
7. Definir qué APIs necesita.
8. Probar corrida individual.
9. Agregar al compose máster solo cuando ya funcione.
10. Documentar la arquitectura del proyecto.
```

---

# 16. Regla final

La arquitectura oficial queda así:

```text
Máster = corre todo.
Proyecto = corre solo lo necesario.
API = corre una API individual.
DB = administra bases y schemas.
Nginx = entrada y ruteo.
.env.example = documentación.
.env.local = desarrollo local.
.env.master = corrida general.
.env.<proyecto> = corrida individual.
```

Los Dockerfile y docker-compose generales representan la infraestructura completa.

Los Dockerfile y docker-compose por proyecto representan una ejecución aislada, controlada y segura.
