# Validacion operativa por proyecto

## Regla

Cada proyecto se valida de forma aislada: dependencias minimas, APIs, Gateway
central y web. Al terminar se baja antes de continuar. La ultima corrida puede
dejar activo un proyecto solo cuando el usuario lo solicite expresamente.

| Proyecto | Web | Gateway | API dominio | APIs core | Resultado | Errores | Pendientes | Fecha |
|---|---|---|---|---|---|---|---|---|
| JobCron | Build OK | Tests/check OK | Check OK | Auth/Prospecting | OK_CON_OBSERVACIONES | Sin error de build | Falta corrida Docker aislada | 2026-06-14 |
| TecnoTelec | Build OK con warnings `img` | Check OK | Check OK | Catalog/Pricing/Inventory/Supplier | OK_CON_OBSERVACIONES | Warnings no bloqueantes | Falta corrida Docker aislada | 2026-06-14 |
| LexNova | Build OK | Check OK | Check OK | Auth/Document | OK_CON_OBSERVACIONES | - | Falta corrida Docker aislada | 2026-06-14 |
| DocuCore | Build OK | Check OK | Check OK | Auth/Document | OK_CON_OBSERVACIONES | - | Falta corrida Docker aislada | 2026-06-14 |
| Fiscora | Build OK | Check OK | Check OK | Auth/Fiscal/Document | OK_CON_OBSERVACIONES | - | Falta corrida Docker aislada | 2026-06-14 |
| Imagrafity | Build OK | Check OK | Check OK | Auth | OK_CON_OBSERVACIONES | - | Falta corrida Docker aislada | 2026-06-14 |
| LeadHunter | Build OK | Check OK | Check OK | Auth | OK_CON_OBSERVACIONES | - | Sin remoto Git; falta runtime aislado | 2026-06-14 |
| REFAPART | Build y HTTP OK | 15 tests OK | 2 tests y check OK | Auth/Address | OK | - | Pagos y logistica productiva pendientes | 2026-06-14 |

La corrida global compilo las ocho webs y ejecuto `compileall` y
`manage.py check` en las 21 APIs disponibles. REFAPART fue ademas validado en
Docker con PostgreSQL, Auth, Gateway central, API de dominio, Address y web.
