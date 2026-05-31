Listo. Te dejé en el documento una estructura completa de **21 agents**, del `00` al `20`, para que Codex optimice toda la documentación paso por paso.

La idea central es esta:

```text
/docs/agents
  00_master_router_agent.md
  01_zip_inventory_agent.md
  02_document_classifier_agent.md
  03_structure_architect_agent.md
  04_duplicate_detector_agent.md
  05_canonical_document_agent.md
  06_core_vs_business_agent.md
  07_business_documentation_agent.md
  08_api_documentation_agent.md
  09_database_documentation_agent.md
  10_frontend_documentation_agent.md
  11_etl_jobs_documentation_agent.md
  12_events_scheduler_agent.md
  13_security_auth_permissions_agent.md
  14_navigation_index_agent.md
  15_cleanup_archive_agent.md
  16_template_standardizer_agent.md
  17_quality_gate_agent.md
  18_codex_execution_plan_agent.md
  19_final_review_agent.md
  20_documentation_maintenance_agent.md
```

Lo más importante es que Codex trabaje así:

```text
Inventariar → Clasificar → Detectar duplicados → Crear canónicos → Separar Core/Business → Crear índice → Limpiar → Validar
```

Con eso evitas que Codex lea todo de golpe o empiece a modificar sin orden.

Tu modelo de 21 agents está mejor para ordenar documentación existente. El mío es más útil como regla global permanente.

La mejora ideal es combinar ambos:

Tu modelo debe quedarse como flujo de ejecución.
Mi propuesta debe quedar como documentación obligatoria que todos los agents leen.

Quedaría así:

/docs
  README.md
  ARCHITECTURE.md
  SYSTEM_BOUNDARIES.md
  UI_UX_STANDARDS.md
  PRODUCT_STRATEGY.md
  MODULE_CATALOG.md

/docs/agents
  AGENT_GLOBAL_RULES.md
  RUN_AGENTS_INSTRUCTIONS.md
  EXECUTION_REPORT.md

  00_master_router_agent.md
  01_zip_inventory_agent.md
  02_document_classifier_agent.md
  03_structure_architect_agent.md
  04_duplicate_detector_agent.md
  05_canonical_document_agent.md
  06_core_vs_business_agent.md
  07_business_documentation_agent.md
  08_api_documentation_agent.md
  09_database_documentation_agent.md
  10_frontend_documentation_agent.md
  11_etl_jobs_documentation_agent.md
  12_events_scheduler_agent.md
  13_security_auth_permissions_agent.md
  14_navigation_index_agent.md
  15_cleanup_archive_agent.md
  16_template_standardizer_agent.md
  17_quality_gate_agent.md
  18_codex_execution_plan_agent.md
  19_final_review_agent.md
  20_documentation_maintenance_agent.md

La mejora que yo le haría a tu modelo es esta:

00_master_router_agent.md

Debe ser el único que decide:

1. Qué agents aplican.
2. En qué orden correrlos.
3. Qué documentos globales leer.
4. Qué archivos puede tocar cada agent.
5. Qué archivos no puede tocar.
6. Cuándo detenerse por ambigüedad.
7. Qué registrar en EXECUTION_REPORT.md.

Y agregaría este archivo:

/docs/agents/AGENT_GLOBAL_RULES.md

Ahí van las reglas que no quieres repetir:

- API propia por proyecto web.
- Gateway propio por proyecto web.
- Mobile First.
- UI responsive.
- Estándar visual para todas las webs.
- Separación ERP vs proyectos.
- Productización de módulos.
- Reutilización.
- Seguridad.
- Validaciones obligatorias.
- No modificar fuera del alcance.

Conclusión: no reemplaces tus 21 agents. Están bien planteados. Solo les falta una capa superior de reglas globales para no repetir instrucciones y para que Codex siempre tenga el mismo marco de arquitectura, UI y documentación.