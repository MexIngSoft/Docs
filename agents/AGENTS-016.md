Sí, confirmé lectura de `MexIngSoft/Docs` en rama `general`. El nombre correcto y único es **`general`**, creada desde **`dev`**; no se debe usar `feature/general-integration-dev` ni ninguna variante.

Copia esto para Codex:

INSTRUCCIÓN CODEX — NORMALIZAR RAMAS DEV Y GENERAL

OBJETIVO

Normalizar todos los repositorios del ecosistema para que la única rama operativa diaria sea:

```text
general
```

La rama `general` debe estar basada en `dev` y debe mantenerse siempre alineada con `dev`.

No se permite crear ni conservar variantes como:

```text
feature/general-integration-dev
general-dev
dev-general
general-integration
feature/general
feature/dev-general
```

RAMAS VIVAS OFICIALES

Cada repositorio solo puede conservar estas ramas persistentes:

```text
main
pro
dev
general
```

Cualquier otra rama debe revisarse, integrarse si tiene cambios válidos y eliminarse.

LECTURA OBLIGATORIA

Antes de ejecutar cambios, leer en `MexIngSoft/Docs`, rama `general`:

```text
README.md
_meta/active-work-index.md
agents/AGENT_GLOBAL_RULES.md
03_standards/operations/git-repository-map.md
```

REGLA CENTRAL

`general` es la rama operativa diaria.

`dev` es la base de desarrollo validada.

`general` debe nacer de `dev`.

`dev` y `general` deben terminar con los mismos cambios.

No debe quedar ningún commit exclusivo en `dev`.

No debe quedar ningún commit exclusivo en `general`.

No debe quedar ningún cambio pendiente en ramas secundarias.

PROCEDIMIENTO POR CADA REPOSITORIO

Entrar al repositorio:

```bash
cd <ruta-del-repo>
```

Actualizar referencias:

```bash
git fetch --all --prune
```

Revisar estado:

```bash
git status --short
git branch -a
```

Si hay cambios locales sin commit, clasificarlos antes de continuar:

```bash
git diff
git diff --staged
```

No mezclar responsabilidades. Hacer commits por repositorio y por cambio lógico.

Configurar identidad Git esperada:

```bash
git config user.name "1CASH1"
git config user.email "7905831+1CASH1@users.noreply.github.com"
```

VALIDAR DEV

```bash
git checkout dev
git pull origin dev
```

VALIDAR O CREAR GENERAL

Si `general` existe:

```bash
git checkout general
git pull origin general
```

Si `general` no existe:

```bash
git checkout dev
git pull origin dev
git checkout -b general
git push -u origin general
```

INTEGRAR RAMAS SECUNDARIAS

Listar ramas remotas:

```bash
git branch -r
```

Para cada rama que no sea `origin/main`, `origin/pro`, `origin/dev` u `origin/general`:

1. Revisar si tiene commits no integrados:

```bash
git log --oneline origin/dev..<rama-remota>
git log --oneline origin/general..<rama-remota>
```

2. Si tiene cambios válidos, integrar primero en `dev`:

```bash
git checkout dev
git pull origin dev
git merge --no-ff <rama-remota>
```

3. Resolver conflictos si existen.

4. Validar estado limpio:

```bash
git status --short
```

5. Subir `dev`:

```bash
git push origin dev
```

6. Alinear `general` con `dev`:

```bash
git checkout general
git pull origin general
git merge --no-ff dev
git push origin general
```

7. Eliminar la rama secundaria ya integrada:

```bash
git push origin --delete <nombre-rama-remota>
```

Si existe rama local:

```bash
git branch -d <nombre-rama-local>
```

ALINEACIÓN FINAL ENTRE DEV Y GENERAL

Al terminar todas las integraciones:

```bash
git fetch origin
git checkout dev
git pull origin dev
git checkout general
git pull origin general
git merge --no-ff dev
git push origin general
```

Validar que no haya diferencias:

```bash
git log --oneline origin/dev..origin/general
git log --oneline origin/general..origin/dev
git diff origin/dev..origin/general
```

Resultado esperado:

```text
Sin commits exclusivos.
Sin diferencias.
```

Si hay diferencias, no cerrar la tarea hasta resolverlas.

COMMITS

Los commits deben estar en inglés, cortos y por responsabilidad.

Ejemplos:

```bash
git commit -m "Align dev and general branches"
git commit -m "Remove merged temporary branches"
git commit -m "Document branch governance rules"
```

PROHIBICIONES

No usar `git add -A` desde `Workspace.Comercial`.

No convertir `Workspace.Comercial` en monorepo.

No subir `.env`, `.env.local`, secretos, tokens ni credenciales.

No crear ramas nuevas permanentes.

No recrear `feature/general-integration-dev`.

No eliminar `main`, `pro`, `dev` ni `general`.

No forzar push salvo autorización explícita.

REPORTE FINAL OBLIGATORIO

Al terminar, entregar reporte por repositorio:

```text
Repositorio:
Ramas encontradas:
Ramas oficiales conservadas:
Ramas integradas:
Ramas eliminadas:
Commits realizados:
Push ejecutados:
Conflictos:
Validación dev..general:
Validación general..dev:
Diff final:
Estado final:
Pendientes o bloqueos:
```

ESTADO FINAL ESPERADO

Cada repositorio debe quedar únicamente con:

```text
origin/main
origin/pro
origin/dev
origin/general
```

Y `dev` + `general` deben tener los mismos cambios.

Si GitHub no permite cambiar la rama default a `general`, registrar:

```text
PENDIENTE_DE_DEFINIR: cambiar default branch requiere permiso administrativo.
```

La documentación también establece que los commits y pushes deben hacerse por repositorio, no como monorepo desde `Workspace.Comercial`.
