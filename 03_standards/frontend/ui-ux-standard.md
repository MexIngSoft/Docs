# Estandar UI/UX del ecosistema

## Objetivo

Definir reglas visuales y de experiencia para que DocuCore, LexNova,
Imagrafity, Tecno Telec, Fiscora y futuros productos tengan interfaces
profesionales, responsivas y coherentes con su dominio.

## Principios obligatorios

- Mobile first.
- Responsive real en telefono, tablet y escritorio.
- Interfaz util como primera pantalla.
- Acciones primarias visibles.
- Estados de carga, vacio, error, exito y bloqueo.
- No prometer funciones sin motor real.
- No ocultar informacion critica en textos largos.
- Usar componentes de dominio: tablas para datos, toolbars para herramientas,
  previews para documentos, configuradores para personalizacion y dashboards
  para operacion.

## Regla de mockup aprobado

Cuando exista mockup o captura aprobada:

```text
Mockup aprobado > UI actual > preferencia subjetiva del implementador
```

La desviacion debe documentarse en el reporte de ejecucion.

## Patrones por tipo de producto

| Tipo | Experiencia recomendada |
|---|---|
| SaaS operativo | Denso, escaneable, con navegacion clara, tablas, filtros y estados. |
| Herramienta documental | Carga, administracion de archivos, preview funcional, configuracion y resultado. |
| Legal/profesional | Confianza, trazabilidad, privacidad, revision humana y lenguaje claro. |
| E-commerce tecnico | Catalogo, compatibilidad, precio, disponibilidad, cotizacion y compra. |
| Personalizacion creativa | Producto visible, editor, preview, inspiracion, compra y comunidad. |

## DocuCore

- La carga documental no es workspace.
- El workspace solo se abre cuando el usuario elige una accion compatible.
- Toda herramienta debe compartir estructura: herramientas compatibles, preview,
  configuracion, informacion del documento, acciones relacionadas y resultado.
- La preview funcional es requisito critico:
  - PDF: miniaturas reales.
  - Imagen: imagen real.
  - Word: preview temporal o conversion segura.
  - Excel: tabla renderizada.
  - ZIP: arbol de archivos.

## Imagrafity

- El producto personalizado debe verse en el primer viewport.
- El editor/preview tiene prioridad sobre texto promocional.
- La experiencia debe combinar catalogo, inspiracion, personalizacion,
  cotizacion/compra y seguimiento.
- La identidad visual aprobada se documenta en el proyecto y gobierna web,
  redes y piezas comerciales.

## Accesibilidad minima

- Contraste suficiente.
- Navegacion por teclado en controles principales.
- Labels claros en inputs.
- Botones con verbo de accion.
- Iconos con texto o tooltip cuando no sean obvios.
- Texto sin solaparse en mobile.

## Checklist de cierre UI

- La pantalla principal resuelve una tarea real.
- No hay botones duplicados para la misma accion.
- Hay estados de error y vacio.
- Los textos caben en mobile.
- Las acciones deshabilitadas explican por que.
- La funcionalidad visible coincide con backend o roadmap marcado.

## Pantallas no documentadas

Cuando una pantalla no tenga documentacion canonica especifica, aplicar:

```text
Docs/03_standards/frontend/undocumented-modernization-standard.md
```

Esto evita rehacer instrucciones para login, registro, activacion,
recuperacion de contrasena, links secundarios o pantallas antiguas.
