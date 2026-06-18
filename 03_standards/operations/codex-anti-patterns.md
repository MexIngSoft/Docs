# Anti-patrones Codex

## Objetivo

Listar vicios prohibidos para evitar que Codex duplique arquitectura,
documentacion, APIs o infraestructura.

## Anti-patrones prohibidos

| Anti-patron | Por que es incorrecto | Accion correcta |
|---|---|---|
| Crear API duplicada | Fragmenta responsabilidades reutilizables | Revisar `01_core_erp/apis/reusable-api-contracts.md` |
| Crear API por proyecto como regla general | Convierte cada web en backend obligatorio | API especializada solo si aplica |
| Crear Gateway/BFF por proyecto | Rompe Gateway General unico | Usar `API.PY.DJANGO.Gateway` |
| Crear Auth por proyecto | Duplica identidad y permisos | Usar Auth compartido via Gateway |
| Crear Docker nuevo | Rompe Docker por objetivo | Usar estandares Docker vigentes |
| Crear red Docker por proyecto | Aisla servicios que deben compartir red | Usar `jobcron_network` |
| Usar SQLite o base embebida | Contradice PostgreSQL oficial | Usar PostgreSQL |
| Mezclar proveedor externo con ERP | Contamina modelo interno | Documentar proveedor en `04_integrations` |
| Mezclar proyecto con nucleo | Duplica negocio y capacidades reutilizables | Separar `01_core_erp` y `02_projects` |
| Reescribir documentacion canonica | Pierde decisiones vigentes | Actualizar el documento canonico o enlazarlo |
| Implementar sin revisar contratos | Crea endpoints o datos falsos | Revisar APIs y estandares antes |
| Crear endpoints sin registrar contrato | Rompe trazabilidad | Documentar contrato o usar `PENDIENTE_DE_DEFINIR` |
| Leer todo el repo por defecto | Gasta contexto y aumenta errores | Usar Context Pack minimo |
| Crear frontend sin revisar estandar UI | Duplica patrones visuales | Revisar `03_standards/frontend/` |
| Usar mock si existe API real | Oculta integraciones rotas | Consumir Gateway General o documentar bloqueo |
| Consumir proveedor externo desde frontend | Expone secretos y acopla UI a proveedor | Pasar por Gateway/API/integracion |
| Cambiar arquitectura sin ADR | Pierde trazabilidad | Documentar decision antes del cambio |
| Crear proyecto sin `api-dependencies.md` | Deja dependencias ambiguas | Crear documento o marcar `PENDIENTE_DE_DEFINIR` |
| Crear proveedor externo sin `mappers.md` | Mezcla datos externos con ERP | Documentar mapper o `PENDIENTE_DE_DEFINIR` |

## Regla de bloqueo

Si una instruccion pide un anti-patron, prevalece la documentacion canonica mas
actual. Registrar la contradiccion y aplicar la alternativa correcta.
