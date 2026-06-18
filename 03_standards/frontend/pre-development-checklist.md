# Checklist previo a desarrollo frontend

## Objetivo

Evitar iniciar una interfaz sin tener claros sus contratos, permisos, datos, rutas y criterios de escalabilidad.

## Checklist obligatorio

| Area | Validacion | Estado esperado |
|---|---|---|
| Proyecto | Nombre canonico `WEB.NJ.NEXT.NombreProyecto`. | Definido |
| Repositorio | Carpeta propia y repo Git propio o separable. | Definido |
| Docker | Puerto, contenedor y red compartida vigente `crejo`; `jobcron_network` solo como migracion futura coordinada. | Definido |
| Gateway | Gateway General. | Definido |
| Project API | API especializada del proyecto si hay procesos/tablas especificas. | Definida |
| Core APIs | APIs ERP reutilizables requeridas. | Inventariadas |
| Auth | Login, sesion, refresh y logout. | Contrato definido |
| Roles | Roles y permisos por vista. | Matriz definida |
| Endpoints | Endpoints necesarios para cada ruta. | Contrato definido |
| Versionado | Estrategia de version API. | Definida |
| Errores | Formato de error para UI. | Definido |
| SEO | Rutas publicas, metadata e indexacion. | Definido |
| Rendimiento | Imagenes, caching, lazy loading y bundle. | Definido |
| Archivos | Uploads, imagenes y CDN si aplica. | Definido |
| Notificaciones | Email, WhatsApp, in-app o websocket. | Definido |
| Analitica | Conversiones y eventos clave. | Definido |
| Observabilidad | Monitoreo de errores frontend. | Definido |
| Pruebas | Lint, build, unitarias/e2e segun riesgo. | Definido |
| UI/UX | Sistema visual y componentes base. | Definido |

## Regla de avance

Si un punto de la tabla no esta definido, se marca como:

```text
PENDIENTE_DE_DEFINIR
```

No debe convertirse en codigo hasta que tenga owner, alcance y contrato claro.

## Salidas esperadas

Antes de programar, el proyecto debe tener:

- Documento de vision frontend.
- Rutas publicas, privadas y admin.
- Layouts principales.
- Componentes base.
- Flujo de autenticacion.
- Flujo principal de conversion.
- Matriz de APIs.
- Matriz de permisos.
- Propuesta visual inicial.
- Criterio de MVP.
