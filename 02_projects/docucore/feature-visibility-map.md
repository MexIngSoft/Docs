# Mapa de visibilidad DocuCore

## Objetivo

Definir que partes de DocuCore pueden mostrarse como producto, cuales solo
deben verse en desarrollo interno y cuales deben quedar ocultas hasta tener
motor real.

La regla base es:

```text
Si una capacidad no tiene implementacion real o contrato cerrado, no se muestra
como disponible publicamente.
```

## Estados

| Estado | Uso |
|---|---|
| `released` | Puede mostrarse al usuario final. |
| `mvp` | Puede mostrarse si ejecuta una accion real y comunica limites. |
| `beta` | Solo usuarios internos o controlados. |
| `development` | Maqueta o flujo en construccion. |
| `internal` | Operacion administrativa o tecnica. |
| `disabled` | No mostrar. |

## Mapa inicial

| Area | Feature key | Estado | Publico | Desarrollo | Nota |
|---|---|---|---|---|---|
| Dashboard | `docucore.dashboard` | `released` | Si | Si | Consume catalogo, jobs e historial desde Gateway. |
| Upload/proceso | `docucore.upload_processing` | `released` | Si | Si | Sube archivo, crea job y permite descargar artefacto. |
| Landing PDF a Word | `docucore.landing.pdf_word` | `mvp` | Si | Si | Debe enviar al flujo real `pdf-word`. |
| Workspace | `docucore.workspace` | `development` | No | Si | Falta preview real, persistencia de documento activo y recomendaciones backend. |
| Cuenta/creditos | `docucore.account_credits` | `development` | No | Si | Falta Auth, planes, cobro y facturacion. |
| Resultados | `docucore.results_center` | `mvp` | Si | Si | Puede apoyarse en jobs/artifacts existentes. |
| Constructor de procesos | `docucore.workflow_builder` | `development` | No | Si | Falta engine de workflows, cola y reintentos. |
| IA documental | `docucore.ai_view` | `internal` | No | Si | Falta motor IA productivo, privacidad y revision humana. |
| Comparador | `docucore.compare_documents` | `development` | No | Si | Falta diff real por texto/pagina. |
| Extraccion estructurada | `docucore.structured_extraction` | `development` | No | Si | Falta plantillas por tipo documental. |
| Expediente/indice | `docucore.casefile_tools` | `beta` | No | Si | Depende de OCR y segmentacion productiva. |
| API portal | `docucore.api_portal` | `internal` | No | Si | Falta API keys, cuotas, logs y documentacion publica. |
| Integraciones cloud | `docucore.integrations` | `disabled` | No | No | Falta OAuth, scopes, revocacion y auditoria. |
| Admin | `docucore.admin` | `internal` | No | Si | Debe quedar detras de permisos y JobCron/FeatureAvailability. |

## Reglas de UI

- Las capacidades `released` o `mvp` pueden aparecer como accion normal.
- Las capacidades `development`, `beta` o `internal` deben mostrar badge visible.
- Las capacidades `disabled` no deben aparecer en navegacion publica.
- Ninguna landing SEO debe prometer una salida que el procesador no pueda
  generar realmente.
- Si una herramienta depende de OCR real y OCR no esta disponible, la pantalla
  debe explicarlo como limite y no como falla inesperada.

## Pendientes

- Consumir `FeatureAvailability` desde JobCron cuando exista API.
- Sustituir el mapa local de maqueta por configuracion central.
- Definir pais, estado/region y modo de desarrollo por feature.
- Conectar permisos reales de Auth para zonas internas.
