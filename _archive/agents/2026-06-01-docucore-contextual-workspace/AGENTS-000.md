Analicé el ZIP. La instrucción debe quedar así para Codex:

Ejecuta esta tarea siguiendo el estándar del repositorio y sin usar agents.

Usa obligatoriamente:

`Docs/03_standards/documentation-first-workflow.md`

Antes de modificar código:

1. Lee:

   * `Docs/README.md`
   * `Docs/_meta/master-index.md`
   * `Docs/_meta/master-index.yaml`
   * `Docs/_meta/navigation-map.md`
   * `Docs/_meta/active-work-index.md`

2. Luego lee solo la documentación canónica relacionada con DocuCore:

   * `Docs/02_projects/docucore/README.md`
   * `Docs/02_projects/docucore/mvp-roadmap.md`
   * `Docs/02_projects/docucore/tools-catalog.md`
   * `Docs/02_projects/docucore/tool-readiness-and-configuration.md`
   * `Docs/02_projects/docucore/api-contracts.md`
   * `Docs/02_projects/docucore/frontend-navigation-and-ux.md`
   * `Docs/02_projects/docucore/feature-visibility-map.md`
   * `Docs/02_projects/docucore/execution-policy.md`

Objetivo:

Ordenar y validar el estado real de pruebas de herramientas DocuCore, sin habilitar funciones incompletas desde la web.

Alcance:

A. Pruebas backend/Gateway permitidas:

* `pdf-split`
* `pdf-merge`
* `pdf-compress`
* `pdf-word`
* `word-pdf`
* `image-pdf`
* `image-clean`
* `excel-csv`
* `csv-excel`
* `xml-read`
* `zip-extract`

Estas herramientas tienen procesador real en Document API y pueden probarse desde backend/Gateway o con flujo controlado.

B. Pruebas web permitidas desde `/upload -> /workspace`:

* `pdf-split`
* `pdf-merge`
* `pdf-compress`
* `pdf-word`

Estas son las únicas coherentes para prueba visual web completa por ahora, porque el Workspace actual está centrado en PDF.

C. No probar como flujo web completo todavía:

* `word-pdf`
* `image-pdf`
* `image-clean`
* `excel-csv`
* `csv-excel`
* `xml-read`
* `zip-extract`

Aunque pueden ejecutarse por backend/Gateway, no deben validarse como experiencia web completa hasta tener workspace especializado por tipo de archivo.

D. Mantener bloqueadas por feature gates:

* `ocr-image`
* `ocr-batch`
* `ocr-regions`
* `searchable-pdf`
* `document-index`
* `indexed-pdf-export`
* `document-classification`
* `document-segmentation`
* `api-keys`
* `cloud-drive-import`
* workflows OCR
* extracción estructurada
* `extract-images`
* `sign-pdf`
* acciones OCR/firma/watermark/traducción en Workspace

Reglas de implementación:

1. No uses agents.
2. No actives herramientas futuras.
3. No conviertas herramientas planeadas en ejecutables.
4. No cambies el alcance del MVP.
5. No hagas mocks para simular éxito.
6. Si una herramienta no tiene workspace especializado, debe quedar documentada como ejecutable por Gateway pero no recomendada para prueba web completa.
7. Si falta documentación específica, escribe exactamente:
   `No encontrado en la documentacion actual.`
8. Después usa patrones existentes del código, mantén alcance mínimo y documenta la decisión.
9. Revisa `feature-gates.ts` y confirma que las herramientas bloqueadas sigan bloqueadas.
10. Revisa que `/upload` no mande al usuario a flujos engañosos para herramientas no-PDF.
11. Revisa que `/workspace` no prometa aplicar cambios reales si el botón `Aplicar cambios` todavía no está conectado al Gateway.
12. Documenta faltantes, decisiones y validaciones.

Validaciones obligatorias:

* `npm run lint`
* `npm run build`

Si existen pruebas disponibles, ejecútalas también. Si no existen, documenta que no hay comando disponible.

Cierre obligatorio:

Reporta:

* documentos revisados;
* documentos fuera de alcance;
* herramientas probables por Gateway;
* herramientas probables solo visualmente en Workspace PDF;
* herramientas activas pero no recomendadas para prueba web completa;
* herramientas bloqueadas;
* información faltante;
* decisiones tomadas;
* validaciones ejecutadas;
* errores encontrados;
* cambios realizados;
* pendientes para la siguiente fase.

Conclusión: tu criterio está correcto. La regla fuerte debe ser: **11 activas por Gateway, solo 4 PDF por Workspace web, y todo OCR/IA/futuro bloqueado.**
