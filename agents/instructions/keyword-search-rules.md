# Reglas de busqueda por palabra clave

## Herramienta

Usar `rg` antes que busquedas lentas.

## Patrones utiles

```powershell
rg -n "PENDIENTE_DE_DEFINIR|TODO|FIXME|BLOQUEADO" Docs
rg -n "api/gateway|localhost/api|fetch\\(" Docker.WEB.NJ
rg -n "sqlite|db.sqlite3" Docker.API.PY Docker.DB.PG
rg -n "proxy_pass|upstream" Docker.SW.Nginx
rg -n "X-Application-Code|application_code" Docker.API.PY Docker.WEB.NJ
```

## Regla

No tomar coincidencias historicas de `_archive` como estado vigente salvo que se
justifique en el reporte.
