SÃ­, de hecho para un entorno de desarrollo y pruebas es mejor dejarlo explÃ­citamente documentado para que Codex no te obligue a exportar variables manualmente cada vez.

Puedes agregar esta secciÃ³n a la instrucciÃ³n:

## ConfiguraciÃ³n de variables de entorno para desarrollo

Durante el desarrollo local y las pruebas en Docker, las credenciales y configuraciones deberÃ¡n cargarse desde los archivos `.env` correspondientes al proyecto.

No serÃ¡ necesario exportar variables manualmente mediante:

```powershell
$env:APIFY_TOKEN=...
$env:APIFY_ACTOR_ID=...
```

excepto para pruebas temporales o entornos especiales.

### Archivos esperados

Backend:

```text
.env
.env.development
.env.local
```

Frontend:

```text
.env.local
.env.development
```

### Variables requeridas

```env
APIFY_TOKEN=xxxxxxxxxxxx
APIFY_ACTOR_ID=compass~crawler-google-places

DATABASE_URL=xxxxxxxxxxxx

DEBUG=True
ENVIRONMENT=development
```

### Docker Compose

Docker deberÃ¡ cargar automÃ¡ticamente las variables desde el archivo `.env`.

Ejemplo:

```yaml
services:
  api-multiproyecto:
    env_file:
      - .env

    environment:
      APIFY_TOKEN: ${APIFY_TOKEN}
      APIFY_ACTOR_ID: ${APIFY_ACTOR_ID}
      DATABASE_URL: ${DATABASE_URL}
```

### Reglas

1. Nunca codificar tokens en el cÃ³digo fuente.
2. Nunca codificar tokens en archivos Python.
3. Nunca codificar tokens en archivos TypeScript.
4. Nunca codificar tokens en Dockerfiles.
5. Nunca solicitar al usuario exportar variables manualmente cuando exista un archivo `.env`.
6. Los servicios deberÃ¡n leer siempre la configuraciÃ³n desde el sistema de configuraciÃ³n centralizado.
7. Si falta una variable obligatoria, registrar error claro indicando cuÃ¡l falta.
8. En entorno de desarrollo, utilizar los valores definidos en `.env`.
9. En producciÃ³n, utilizar las variables proporcionadas por el servidor.
10. Agregar validaciÃ³n de configuraciÃ³n al iniciar la aplicaciÃ³n.

### ValidaciÃ³n al arranque

Al iniciar la API registrar:

```text
APIFY_TOKEN: configurado/no configurado
APIFY_ACTOR_ID: configurado
DATABASE_URL: configurado
ENVIRONMENT: development
```

Sin mostrar valores sensibles completos.

### Criterio de aceptaciÃ³n

La aplicaciÃ³n debe poder iniciarse Ãºnicamente ejecutando:

```bash
docker compose -f Docker.API.PY/docker-compose.yml up -d
```

sin necesidad de exportar variables manualmente desde consola.

De hecho, para tus proyectos (Auth, DocuCore, LeadForge, LexNova, ERP, etc.) yo establecerÃ­a una regla global:

```text
Toda configuraciÃ³n del entorno debe residir en archivos .env y ser cargada automÃ¡ticamente por Docker Compose y la aplicaciÃ³n.

Las variables exportadas manualmente solo se permiten para depuraciÃ³n temporal.
```

Eso te evita muchos problemas cuando Codex genera cÃ³digo nuevo o cuando despliegas varios proyectos a la vez.
datos para desarrollo 

Apify user ID: 
9jIg1FRGUc8u7aimd

Personal API tokens of Google Maps 
[REDACTED_BY_CODEX_DO_NOT_COMMIT_SECRET]

