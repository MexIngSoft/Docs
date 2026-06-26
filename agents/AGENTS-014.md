Sí. Te dejo el agente listo para Codex, con protección para que **main** y **pro** no se toquen.

# AGENTE CODEX — UNIFICACIÓN SEGURA DE RAMAS SECUNDARIAS HACIA `dev`

## OBJETIVO

Unificar todas las ramas secundarias tipo `feature/*`, `fix/*`, `hotfix/*`, `bugfix/*`, `chore/*`, `refactor/*`, `docs/*` o similares que salen de `dev`, tanto en proyectos como en documentación, hacia una rama general de integración.

No se deben modificar, mezclar, borrar ni reescribir las ramas:

* `main`
* `pro`
* `production`
* `prod`

La rama base de trabajo será siempre:

* `dev`

La rama final general de integración deberá llamarse:

* `feature/general-integration-dev`

---

## REGLAS CRÍTICAS

1. No hacer `push` directo a `main`.
2. No hacer `push` directo a `pro`.
3. No hacer merge directo hacia `main`.
4. No hacer merge directo hacia `pro`.
5. No borrar ramas remotas sin confirmación explícita.
6. No usar `git reset --hard` sobre ramas remotas protegidas.
7. No usar `git push --force` salvo que el usuario lo autorice expresamente.
8. Todo cambio debe pasar primero por `dev`.
9. Si hay conflictos, resolverlos priorizando:

   * documentación canónica;
   * código más reciente;
   * compatibilidad con Docker;
   * compatibilidad con Gateway;
   * compatibilidad entre proyectos;
   * estándares existentes del repositorio.
10. Si una rama tiene cambios dudosos, incompletos o peligrosos, no fusionarla automáticamente: documentarla en el reporte.

---

## ALCANCE

Aplicar este proceso a todos los repositorios del workspace que contengan Git, incluyendo:

* proyectos frontend;
* proyectos backend;
* APIs;
* Gateway;
* documentación;
* scripts;
* infraestructura Docker;
* repositorios auxiliares.

---

## FASE 1 — INVENTARIO DE REPOSITORIOS

Buscar todos los repositorios Git dentro del workspace.

Para cada repositorio registrar:

* nombre del repositorio;
* ruta local;
* rama actual;
* ramas locales;
* ramas remotas;
* rama `dev` existente o ausente;
* ramas protegidas detectadas;
* ramas candidatas a unificación.

Comando sugerido:

```bash
find . -name ".git" -type d
```

---

## FASE 2 — VALIDACIÓN PREVIA POR REPOSITORIO

Para cada repositorio:

1. Verificar estado limpio:

```bash
git status
```

2. Si existen cambios sin commit:

   * no descartarlos;
   * crear respaldo en una rama temporal:

```bash
git checkout -b backup/uncommitted-before-general-integration
git add .
git commit -m "backup: preserve uncommitted changes before branch unification"
```

3. Actualizar referencias remotas:

```bash
git fetch --all --prune
```

4. Confirmar existencia de `dev`.

Si `dev` no existe:

* no crearla automáticamente desde `main`;
* documentar el caso;
* continuar con el siguiente repositorio.

---

## FASE 3 — IDENTIFICAR RAMAS CANDIDATAS

Considerar candidatas las ramas locales o remotas que cumplan alguna de estas condiciones:

* nacen de `dev`;
* contienen trabajo pendiente;
* tienen nombres como:

  * `feature/*`
  * `features/*`
  * `fix/*`
  * `bugfix/*`
  * `hotfix/*`
  * `chore/*`
  * `refactor/*`
  * `docs/*`
  * `agent/*`
  * `codex/*`
  * `integration/*`

Excluir siempre:

* `main`
* `master`
* `pro`
* `prod`
* `production`
* `dev`
* `release/*`, salvo autorización explícita.

Validar origen aproximado con:

```bash
git merge-base dev <branch>
git log --oneline dev..<branch>
git diff --stat dev..<branch>
```

---

## FASE 4 — CREAR RAMA GENERAL DESDE `dev`

Actualizar `dev`:

```bash
git checkout dev
git pull origin dev
```

Crear rama general:

```bash
git checkout -b feature/general-integration-dev
```

Si ya existe:

```bash
git checkout feature/general-integration-dev
git pull origin feature/general-integration-dev || true
git merge dev
```

---

## FASE 5 — FUSIONAR RAMAS SECUNDARIAS

Fusionar una por una las ramas candidatas hacia:

```bash
feature/general-integration-dev
```

Usar merge sin squash inicialmente para preservar historial:

```bash
git merge --no-ff <branch> -m "merge: integrate <branch> into general dev integration"
```

Después de cada merge:

1. ejecutar pruebas disponibles;
2. ejecutar build si existe;
3. revisar conflictos;
4. revisar archivos críticos;
5. confirmar que no se modificó configuración productiva sensible.

Archivos sensibles a revisar:

* `.env`
* `.env.production`
* `docker-compose*.yml`
* `Dockerfile`
* archivos de CI/CD
* configuración de Gateway
* configuración de Auth
* configuración de CORS
* configuración de base de datos
* scripts de despliegue
* documentación canónica.

---

## FASE 6 — RESOLUCIÓN DE CONFLICTOS

Si hay conflictos:

1. No resolver a ciegas.
2. Leer ambos lados del conflicto.
3. Priorizar lo que sea compatible con `dev`.
4. No eliminar funcionalidad sin justificarlo.
5. Si el conflicto es documental, mantener la versión más completa y actual.
6. Si el conflicto es de código, mantener la versión funcional y compatible con pruebas.
7. Si hay duda, dejar comentario técnico y documentar en el reporte.

Después de resolver:

```bash
git add .
git commit
```

---

## FASE 7 — VALIDACIONES OBLIGATORIAS

Ejecutar lo que aplique según el repositorio:

### Node / Next.js

```bash
npm install
npm run lint
npm run typecheck
npm run build
```

Si usa pnpm:

```bash
pnpm install
pnpm lint
pnpm typecheck
pnpm build
```

### Python / Django

```bash
python manage.py check
python manage.py test
```

### Docker

```bash
docker compose config
```

Si existe script de health:

```bash
./scripts/health.sh
```

---

## FASE 8 — MERGE FINAL HACIA `dev`

Cuando la rama general esté validada:

```bash
git checkout dev
git pull origin dev
git merge --no-ff feature/general-integration-dev -m "merge: unify secondary branches into dev"
```

Ejecutar nuevamente validaciones.

Si todo pasa:

```bash
git push origin dev
git push origin feature/general-integration-dev
```

---

## FASE 9 — LIMPIEZA CONTROLADA DE RAMAS

No borrar ramas automáticamente.

Generar lista de ramas que podrían eliminarse porque ya fueron integradas:

```bash
git branch --merged dev
git branch -r --merged origin/dev
```

Clasificar ramas en:

* integradas correctamente;
* integradas con conflictos resueltos;
* no integradas por error;
* no integradas por duda técnica;
* protegidas;
* candidatas a eliminación posterior.

Solo sugerir eliminación, no ejecutarla sin autorización.

---

## FASE 10 — REPORTE FINAL

Crear un archivo:

```text
BRANCH_UNIFICATION_REPORT.md
```

Debe contener:

1. Repositorios analizados.
2. Ramas encontradas.
3. Ramas fusionadas.
4. Ramas excluidas.
5. Ramas protegidas.
6. Conflictos encontrados.
7. Cómo se resolvió cada conflicto.
8. Pruebas ejecutadas.
9. Builds ejecutados.
10. Errores pendientes.
11. Ramas que podrían eliminarse después.
12. Confirmación de que `main` y `pro` no fueron modificadas.
13. Estado final de `dev`.
14. Estado final de `feature/general-integration-dev`.

---

## RESULTADO ESPERADO

Al finalizar:

* `dev` debe contener la unificación validada de las ramas secundarias.
* `feature/general-integration-dev` debe conservarse como rama general de integración.
* `main` no debe cambiar.
* `pro` no debe cambiar.
* Las ramas secundarias no deben borrarse sin aprobación.
* Debe existir reporte final.
* Cada repositorio debe quedar documentado.
* Si algo no pudo fusionarse, debe quedar claramente explicado.

Yo no pondría “que al final solo quede main”, porque eso puede ser peligroso. Lo más seguro sería que queden al menos:

`main`, `pro`, `dev` y `feature/general-integration-dev`.

Después, ya con el reporte, decides qué ramas viejas sí se eliminan.
