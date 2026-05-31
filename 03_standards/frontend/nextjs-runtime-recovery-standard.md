# Estandar de recuperacion runtime Next.js

## Objetivo

Evitar repetir diagnosticos manuales cuando una web Next.js local queda sin
estilos, tarda en cargar, responde `500` despues de cambios o conserva cache
vieja de `.next`.

Este protocolo aplica a webs en `Docker.WEB.NJ`, incluyendo DocuCore,
Imagrafity, Fiscora, LexNova, TecnoTelec y JobCron.

## Sintomas cubiertos

- La pagina responde HTML pero aparece sin estilos.
- Los assets `/_next/static/` responden `404`, `500` o vacios.
- El dev server queda atorado despues de instalar dependencias o cambiar CSS.
- Next muestra errores de React Client Manifest, Fast Refresh o modulos viejos.
- La ruta carga una vez y despues falla hasta reiniciar el servidor.

## Regla principal

Antes de borrar cache manualmente o reiniciar varias veces, ejecutar el
protocolo estandar:

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File Docs\03_standards\operations\scripts\Start-NextLocalWeb.ps1 -Project docucore -CleanCache
```

Para solo diagnosticar CSS sin tocar procesos:

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File Docs\03_standards\operations\scripts\Repair-NextCss.ps1 -Project docucore -Url http://localhost:3004 -Local
```

## Protocolo obligatorio

1. Verificar puerto registrado en `Docs/03_standards/operations/local-port-registry.md`.
2. Ejecutar `npm run lint`.
3. Ejecutar `npm run build`.
4. Detener solo el proceso que escucha el puerto del proyecto.
5. Limpiar `.next` dentro del proyecto afectado.
6. Levantar `npm run dev -- -p <puerto>`.
7. Validar la ruta principal y al menos una ruta funcional.
8. Validar CSS con `Repair-NextCss.ps1`.
9. Documentar si el fallo fue cache, CSS, dependencia, puerto o error runtime.

## Comandos por proyecto

| Proyecto | Comando recomendado |
|---|---|
| DocuCore | `Start-NextLocalWeb.ps1 -Project docucore -CleanCache` |
| Imagrafity | `Start-NextLocalWeb.ps1 -Project imagrafity -CleanCache` |
| Fiscora | `Start-NextLocalWeb.ps1 -Project fiscora -CleanCache` |
| LexNova | `Start-NextLocalWeb.ps1 -Project lexnova -CleanCache` |
| TecnoTelec | `Start-NextLocalWeb.ps1 -Project tecnotelec -CleanCache` |
| JobCron | `Start-NextLocalWeb.ps1 -Project jobcron -CleanCache` |

## Reglas de seguridad

- No detener procesos fuera del puerto del proyecto.
- No borrar `node_modules` como primer intento.
- No ejecutar `npm audit fix --force` dentro de este protocolo.
- No cambiar puertos sin actualizar el registro local.
- No limpiar caches de otros proyectos.
- No asumir que un `500` es bug de UI si `npm run build` aprueba; revisar cache
  de dev server y Client Manifest primero.

## Criterios de cierre

El protocolo queda aprobado cuando:

- `npm run lint` aprueba.
- `npm run build` aprueba.
- La ruta principal responde `200`.
- La ruta funcional responde `200`.
- `Repair-NextCss.ps1` confirma CSS disponible.

## Pendientes

- Integrar captura automatica de logs de Next por proyecto.
- Agregar validacion visual con Playwright cuando el repositorio tenga pruebas
  de navegador estandarizadas.
