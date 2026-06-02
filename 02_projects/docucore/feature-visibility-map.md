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
- El gate frontend oficial vive en `WEB.NJ.NEXT.DocuCore/lib/feature-gates.ts`.
  Cualquier vista, herramienta o accion aplazada debe bloquearse desde ahi
  antes de agregarse a navegacion, upload o workspace.
- Las vistas `development`, `beta`, `internal` y `disabled` no entran a la
  navegacion publica. Pueden existir como rutas tecnicas, pero no deben
  presentarse como flujo activo.
- Las herramientas `planned` pueden mostrarse como tarjeta informativa
  `Proximamente`, pero no deben abrir `/upload`, `/workspace` ni jobs.

## Pendientes

- Conectar permisos reales de Auth para zonas internas.

## Bloqueo MVP DocuCore 2026-06-01

Para salida MVP se aplazan explicitamente OCR, indexacion documental, IA
documental, busqueda por contenido, firma electronica, integraciones cloud,
workflows OCR y acciones de insercion externa.

Reglas aplicadas:

- OCR e indexacion se muestran como `planned` o `Proximamente`, no como
  herramientas ejecutables.
- `WEB.NJ.NEXT.DocuCore/lib/feature-gates.ts` centraliza:
  - herramientas ejecutables;
  - herramientas informativas;
  - acciones de pagina permitidas;
  - vistas navegables publicas.
- `/upload` solo recibe herramientas con backend real y estado ejecutable.
- `/workspace` oculta herramientas y acciones de pagina aplazadas como OCR,
  firmar, marca de agua, numerar, traducir, extraer imagenes e indice.
- La navegacion publica solo muestra features `released` o `mvp` con
  `publicVisible = true`.

Pendientes documentales:

- `AGENTS-005.md`: OCR avanzado queda pendiente hasta existir motor OCR
  productivo y contrato Gateway/Document API.
- `AGENTS-006.md`: acciones futuras por pagina quedan pendientes si requieren
  escritura real de PDF, firma, marca de agua, traduccion o backend.
- `AGENTS-008.md` a `AGENTS-014.md`: secciones, colores, papelera,
  seleccion, marcadores e inteligencia automatica quedan como trabajo futuro
  cuando requieran persistencia, OCR, bookmarks reales o exportacion backend.

## Integracion JobCron 2026-05-30

DocuCore consulta `FeatureAvailability` desde JobCron cuando el API esta
disponible:

```http
GET /api/features/availability/?project=docucore&country=MX&environment=internal
```

Si JobCron no responde, conserva un fallback local seguro para no romper la
navegacion. Ese fallback no autoriza operaciones backend sensibles; solo evita
una pantalla vacia en desarrollo.
