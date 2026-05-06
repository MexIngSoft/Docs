# Flujo Git, entornos y validacion

> Estado: base vigente.

## Objetivo

Definir como se desarrollan, validan y publican cambios sin subir trabajo antes de que el owner confirme que funciona.

## Regla principal

No se debe hacer commit ni push de cambios funcionales sin validacion del owner.

Excepciones permitidas:

- El owner pide explicitamente commit o push.
- El cambio es solo documental y el owner pidio documentarlo.
- Se requiere un checkpoint por volumen de cambios, pero debe avisarse antes.

## Flujo de trabajo

1. `draft local`: cambios en disco, sin commit.
2. `validated local`: pruebas locales minimas ejecutadas.
3. `owner review`: el owner revisa que corre y que el comportamiento es correcto.
4. `approved by owner`: el owner confirma que se puede cerrar.
5. `committed`: commits separados por repositorio y responsabilidad.
6. `pushed`: cambios enviados a GitHub.

## Pruebas antes de pedir validacion

La validacion local debe ser proporcional al cambio.

| Tipo de cambio | Validacion minima |
|---|---|
| Documentacion | Revision de consistencia y enlaces/rutas mencionadas. |
| Python/Django aislado | `py_compile`, tests disponibles o comando especifico. |
| Modelos/migraciones | `makemigrations --check` o migracion revisada, segun aplique. |
| Dockerfile/compose/start.sh | `docker compose config` y, si el owner autoriza, build/levantamiento. |
| Nginx | `nginx -t` dentro del contenedor o validacion equivalente. |
| Base de datos | Script idempotente revisado y prueba en entorno local/dev con autorizacion. |

## Cuándo levantar Docker

Docker se debe levantar o reconstruir cuando el cambio afecte:

- `Dockerfile`.
- `docker-compose.yml`.
- `start.sh`.
- Puertos, mounts, variables de entorno o redes.
- Dependencias.
- Nginx.
- Postgres, schemas o scripts de inicializacion.

Para cambios pequenos de documentacion o codigo aislado, primero se valida con comandos ligeros. Docker se levanta cuando el owner pida validar el flujo completo o cuando el analisis indique que ya hay suficiente riesgo de integracion.

## Ramas recomendadas

Para el equipo actual, el flujo recomendado es ligero:

| Rama | Uso | Estado |
|---|---|---|
| `feature/<descripcion>` | Trabajo puntual antes de integrar. | Activa cuando el cambio lo amerite. |
| `dev` | Integracion de desarrollo. | Recomendada para trabajo diario. |
| `main` | Version estable/producible. | Protegida; solo cambios validados. |
| `qa` | Pruebas formales de calidad. | Futuro, cuando exista flujo QA. |
| `uat` | Validacion con datos reales o muy cercanos a reales. | Futuro, cuando existan usuarios validadores. |
| `pro` | Produccion. | Futuro si se decide separar de `main`. |

## Decision para el estado actual

Como el equipo actual es pequeno, no se recomienda crear todas las ramas desde el inicio.

Se recomienda:

- Usar `feature/*` para cambios medianos o grandes.
- Crear `dev` como rama de integracion cuando empecemos a hacer desarrollo continuo.
- Mantener `main` como rama estable.
- Documentar `qa`, `uat` y `pro` como etapas futuras.

Cuando existan despliegues separados, QA formal o usuarios validando, se podran crear `qa`, `uat` y `pro` con reglas de promocion.

## Reglas de promocion

| Origen | Destino | Requisito |
|---|---|---|
| `feature/*` | `dev` | Pruebas locales minimas y revision del owner si aplica. |
| `dev` | `main` | Validacion local completa y aprobacion del owner. |
| `main` | `qa` | Solo cuando exista entorno QA. |
| `qa` | `uat` | QA aprobado. |
| `uat` | `pro` | UAT aprobado por usuario/owner. |

## Entornos de base de datos

La base de datos debe seguir el mismo principio, pero sin crear ambientes innecesarios antes de tiempo.

| Entorno | Uso | Estado actual |
|---|---|---|
| `dev` | Desarrollo local y pruebas tecnicas. | Recomendado ahora. |
| `qa` | Calidad con datos controlados. | Futuro. |
| `uat` | Pruebas con datos reales o muy cercanos a reales. | Futuro. |
| `pro` | Produccion. | Futuro. |

Reglas:

- No mezclar datos productivos con desarrollo.
- No usar credenciales reales en repositorios.
- No ejecutar scripts destructivos sin confirmacion explicita.
- Cada entorno futuro debe tener variables, backups y accesos propios.

## Restricciones recomendadas en GitHub

Para `main`:

- No permitir force push.
- Requerir pull request cuando haya mas de una persona trabajando activamente.
- Requerir checks cuando existan pruebas automatizadas.
- Requerir aprobacion del owner para cambios funcionales.

Para `dev`:

- Permitir integracion rapida.
- Evitar force push.
- Mantener commits pequenos y reversibles.

## Regla de commits

Los commits deben hacerse por repositorio y responsabilidad.

Ejemplos:

- API de dominio.
- Gateway.
- Docker API.
- DB.
- Nginx.
- Docs.

No mezclar cambios no relacionados en el mismo commit si se pueden separar de forma clara.
