# Gobierno de ramas y GitHub

> Estado: base vigente.

## Objetivo

Definir las reglas operativas de GitHub para proteger el flujo de ramas del
workspace sin cambiar la comunicacion principal ya definida:

```text
feature/* -> dev -> pro -> main
```

Este documento complementa `git-environments-and-release-flow.md` y
`git-repository-map.md`. No reemplaza esos documentos.

## Principios

- `dev` es la rama de integracion diaria.
- `pro` es la rama de despliegue productivo.
- `main` es copia estable de `pro`.
- El trabajo funcional nace en ramas de tarea creadas desde `dev`.
- Cada repositorio se publica por separado; `Workspace.Comercial` no es un
  monorepo.
- Los cambios deben ser pequenos, reversibles y trazables por repositorio.
- No se suben secretos, credenciales reales ni archivos `.env` con valores
  privados.

## Ramas principales

| Rama | Rol | Regla |
|---|---|---|
| `dev` | Integracion de desarrollo | Recibe PRs desde `feature/*`, `fix/*` y `docs/*`. |
| `pro` | Produccion | Recibe PRs desde `dev` cuando el cambio ya fue validado. |
| `main` | Copia estable de produccion | Recibe PRs desde `pro` cuando produccion queda estable. |

`main` no sustituye a `pro`. `main` conserva el estado estable publicado para
referencia, auditoria y recuperacion.

## Ramas de trabajo

Las ramas de trabajo deben salir de `dev`.

```bash
git checkout dev
git pull origin dev
git checkout -b feature/nombre-del-proceso
```

Prefijos permitidos:

| Prefijo | Uso |
|---|---|
| `feature/*` | Funcionalidad nueva. |
| `fix/*` | Correccion de bug. |
| `docs/*` | Cambio solo documental. |
| `chore/*` | Mantenimiento sin cambio funcional directo. |
| `hotfix/*` | Correccion urgente preparada para produccion. |

Una rama no debe mezclar responsabilidades. Si un cambio toca Docs, API,
Gateway y Web, debe publicarse por repositorio y con commits separados cuando
la separacion sea clara.

## Pull requests

### Hacia `dev`

```text
feature/* -> dev
fix/* -> dev
docs/* -> dev
chore/* -> dev
```

Requisitos:

- descripcion clara del cambio;
- pruebas o checks proporcionales al alcance;
- documentacion actualizada cuando cambie contrato, ruta, modelo, flujo o regla;
- sin secretos ni archivos generados innecesarios;
- sin conflictos con `dev`.

### Hacia `pro`

```text
dev -> pro
```

Requisitos:

- validacion local completa segun el tipo de cambio;
- aprobacion del owner;
- lista de repositorios incluidos;
- resumen de impacto y rollback esperado;
- migraciones revisadas cuando existan cambios de base de datos;
- Docker revisado si cambiaron `Dockerfile`, `docker-compose.yml`, `start.sh`,
  puertos, mounts, redes o dependencias.

### Hacia `main`

```text
pro -> main
```

Requisitos:

- produccion estable;
- aprobacion del owner;
- no incluir cambios nuevos que no hayan pasado por `pro`;
- conservar `main` como espejo estable de lo ya promovido.

## Hotfix

Un hotfix no cambia el flujo principal. Es una excepcion controlada para
corregir produccion.

Flujo recomendado:

```text
hotfix/* -> pro -> main
           \-> dev
```

Reglas:

- crear la rama desde `pro` solo si el bug existe en produccion;
- limitar el cambio a la correccion urgente;
- validar antes de promover;
- despues de publicar, integrar el mismo fix a `dev` para evitar regresiones;
- documentar la excepcion en el PR o reporte operativo.

## Protecciones recomendadas en GitHub

### `main`

- bloquear push directo;
- bloquear force push;
- requerir Pull Request;
- requerir aprobacion del owner;
- requerir rama actualizada antes de merge cuando haya checks;
- requerir checks obligatorios cuando existan pipelines;
- impedir borrar la rama.

### `pro`

- bloquear push directo salvo emergencia aprobada;
- bloquear force push;
- requerir Pull Request desde `dev` o `hotfix/*`;
- requerir aprobacion del owner;
- requerir validacion de despliegue o checklist manual;
- impedir borrar la rama.

### `dev`

- evitar push directo para cambios funcionales cuando haya PR disponible;
- permitir integracion rapida del equipo pequeno cuando el owner lo autorice;
- bloquear force push;
- requerir checks cuando existan;
- mantener commits pequenos y reversibles.

## Checks minimos

| Tipo de cambio | Check minimo |
|---|---|
| Documentacion | `git diff --check` y revision de enlaces/rutas mencionadas. |
| Django API | `python manage.py check` y `python -m compileall .`. |
| Modelos/migraciones | `makemigrations --check` o migracion revisada. |
| Next.js | `npm run build`. |
| Docker compose | `docker compose config`. |
| Nginx | `nginx -t` o validacion equivalente en contenedor. |

Si un check no puede ejecutarse por dependencia local faltante, se debe dejar
registrado el bloqueo y la razon.

## Commits

Los commits deben ser claros, cortos y en ingles.

Ejemplos:

```text
Document GitHub branch governance
Add DocuCore tool catalog MVP
Fix LexNova session validation
Configure Fiscora API services
```

Reglas:

- no usar commits enormes si pueden separarse;
- no mezclar repositorios ni responsabilidades;
- no usar `git add -A` desde `Workspace.Comercial`;
- revisar `git status --short` dentro de cada repo antes de commitear.

## Sincronizacion de ramas activas

Las ramas activas deben actualizarse frecuentemente desde `dev`.

```bash
git fetch origin
git merge origin/dev
```

Si una rama queda demasiado atrasada, debe actualizarse antes del PR para
resolver conflictos fuera de `dev`.

## Versiones y tags

Los tags se crean desde `pro` o `main` despues de validar el release.

Formato recomendado:

```text
<repo>-v<major>.<minor>.<patch>
```

Ejemplo:

```text
docucore-api-v0.1.0
lexnova-web-v0.2.0
```

## Auditoria minima

Cada PR o reporte de publicacion debe indicar:

- repositorio;
- rama origen;
- rama destino;
- commit o rango de commits;
- documentos revisados;
- checks ejecutados;
- pendientes o riesgos;
- aprobacion del owner cuando aplique.

## Informacion pendiente

- Definir si todos los repos usaran protecciones obligatorias desde GitHub o
  si algunas ramas seguiran con control manual mientras el equipo sea pequeno.
- Instalar o habilitar GitHub CLI (`gh`) si se requiere crear PRs desde
  terminal.
- Definir nombres finales para tags de release por producto.
