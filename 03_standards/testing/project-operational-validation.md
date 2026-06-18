# Validacion operativa del workspace

## Regla

No se valida levantando y bajando un proyecto a la vez. La validacion operativa
debe usar el stack Docker compartido del workspace:

```powershell
docker compose -p comercial_platform -f Docker.DB.PG\docker-compose.master.db.yml -f Docker.API.PY\docker-compose.master.api.yml -f Docker.WEB.NJ\docker-compose.master.web.yml -f Docker.SW.Nginx\docker-compose.master.nginx.yml config --quiet
```

Cuando se ejecute runtime completo, se debe usar `Start-WorkspaceDocker.ps1` o
el comando master equivalente. Si una prueba de proyecto revela un error
transversal, se corrige en el patron comun y se replica en todos los proyectos
afectados.

| Proyecto | Web | Gateway | API dominio | APIs core | Resultado | Errores | Pendientes | Fecha |
|---|---|---|---|---|---|---|---|---|
| JobCron | Build OK | Tests/check OK | Check OK | Auth/Prospecting | OK_CON_OBSERVACIONES | Sin error de build | Validar dentro del stack completo, no aislado | 2026-06-14 |
| TecnoTelec | Build OK con warnings `img` | Check OK | Check OK | Catalog/Pricing/Inventory/Supplier | OK_CON_OBSERVACIONES | Warnings no bloqueantes | Validar dentro del stack completo, no aislado | 2026-06-14 |
| LexNova | Build OK | Check OK | Check OK | Auth/Document | OK_CON_OBSERVACIONES | - | Validar dentro del stack completo, no aislado | 2026-06-14 |
| DocuCore | Build OK | Check OK | Check OK | Auth/Document | OK_CON_OBSERVACIONES | - | Validar dentro del stack completo, no aislado | 2026-06-14 |
| Fiscora | Build OK | Check OK | Check OK | Auth/Fiscal/Document | OK_CON_OBSERVACIONES | - | Validar dentro del stack completo, no aislado | 2026-06-14 |
| Imagrafity | Build OK | Check OK | Check OK | Auth | OK_CON_OBSERVACIONES | - | Validar dentro del stack completo, no aislado | 2026-06-14 |
| LeadHunter | Build OK | Check OK | Check OK | Auth | OK_CON_OBSERVACIONES | - | Sin remoto Git; validar dentro del stack completo si se publica | 2026-06-14 |
| REFAPART | Build y HTTP OK | 15 tests OK | 2 tests y check OK | Auth/Address | OK | - | Pagos y logistica productiva pendientes | 2026-06-14 |

La corrida global compilo las ocho webs y ejecuto `compileall` y
`manage.py check` en las 21 APIs disponibles. REFAPART fue ademas validado en
Docker con PostgreSQL, Auth, Gateway central, API de dominio, Address y web.
