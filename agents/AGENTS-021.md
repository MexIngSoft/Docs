
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
