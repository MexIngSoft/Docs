# INSTRUCCIÓN PARA CODEX — OPTIMIZAR AGENTS-007

Trabaja únicamente en la rama `dev`.

No ejecutes todos los agents.

No ejecutes la implementación del producto.

No modifiques otros archivos `AGENTS-*.md`.

Optimiza únicamente:

`Docs/agents/AGENTS-007.md`

---

# Resumen del agente actual

`AGENTS-007.md` documenta el proyecto **Radar Empresarial** y su **Motor de Inteligencia de Eventos Financieros / Probability Intelligence Engine**.

El objetivo actual es documentar un sistema que analice eventos sociales, empresariales, económicos, geopolíticos, sectoriales y de mercado para generar alertas probabilísticas, simulaciones, backtesting, paper trading, evaluación de riesgo y explicación de oportunidades.

El agente NO debe convertir el sistema en un “bot mágico de trading”.

El agente NO debe prometer ganancias.

El agente NO debe activar operación con dinero real.

El MVP debe iniciar como:

1. observador;
2. clasificador;
3. analista de impacto;
4. dashboard;
5. paper trading;
6. alertas con trazabilidad.

---

# Objetivo

Optimizar `AGENTS-007.md` para que documente Radar Empresarial de forma concisa, ejecutable y alineada con la documentación canónica del repositorio, sin perder ninguna responsabilidad existente del agente actual.

Debe conservar y ordenar toda la intención original:

* Radar Empresarial como producto independiente;
* Motor de Inteligencia de Eventos Financieros;
* Probability Intelligence Engine como capacidad reutilizable;
* análisis de eventos;
* análisis de impacto económico;
* modelos de probabilidad;
* backtesting;
* paper trading;
* risk management;
* alertas;
* roadmap;
* compliance;
* no promesa de rendimientos.

---

# Lectura mínima obligatoria

Antes de editar, leer únicamente:

* `Docs/README.md`
* `Docs/_meta/active-work-index.md`
* `Docs/agents/RUN_AGENTS_INSTRUCTIONS.md`
* `Docs/agents/AGENT_GLOBAL_RULES.md`
* `Docs/agents/EXECUTION_REPORT.md`
* `Docs/03_standards/operations/standard-request-prompts.md`
* `Docs/03_standards/codex/codex-minimal-reading-standard.md`
* `Docs/03_standards/codex/codex-change-budget-standard.md`
* `Docs/03_standards/codex/codex-documentation-diff-standard.md`
* `Docs/03_standards/codex/codex-output-report-standard.md`
* `Docs/03_standards/product/product-strategy.md`
* `Docs/03_standards/product/module-catalog.md`
* `Docs/03_standards/architecture/api-gateway-standard.md`
* `Docs/01_core_erp/apis/00_api_index.md`
* `Docs/agents/AGENTS-007.md`

No leer todo el repositorio.

No usar `_archive/` ni `agents/_archive/` como fuente vigente, salvo trazabilidad.

---

# Context Pack mínimo

Usar únicamente el Context Pack relacionado con:

* producto nuevo;
* módulo compartido;
* API/Gateway;
* estrategia de producto;
* catálogo de módulos;
* contratos documentales;
* riesgos financieros;
* simulación/backtesting;
* documentación de arquitectura.

No abrir documentación de otros proyectos salvo que Radar Empresarial dependa explícitamente de ellos.

---

# Clasificación documental obligatoria

Clasificar Radar Empresarial como:

* Tipo: `Independent Product`
* Ruta: `Docs/02_projects/radar-empresarial/`
* Estado: `FUTURE_OR_PENDING` o `MVP_CONCEPTUAL`
* Dominio: análisis probabilístico de eventos, mercado, empresas, riesgo y oportunidades.

Clasificar el motor como:

* Nombre: `Probability Intelligence Engine` o `Event Intelligence Engine`
* Tipo: `Shared Module`
* Uso: capacidad reutilizable para análisis de inversiones, eventos empresariales, apuestas analíticas, divisas, commodities y futuros productos que requieran probabilidad, riesgo, backtesting o señales.

No marcar APIs como activas si no existe:

* contrato;
* repositorio ejecutable;
* migraciones;
* persistencia;
* seguridad;
* compose;
* pruebas aprobadas.

---

# Alcance

Puede modificar únicamente:

* `Docs/agents/AGENTS-007.md`

Puede indicar que una futura ejecución del agente deberá crear o actualizar:

* `Docs/02_projects/radar-empresarial/README.md`
* `Docs/02_projects/radar-empresarial/product-vision.md`
* `Docs/02_projects/radar-empresarial/architecture.md`
* `Docs/02_projects/radar-empresarial/api-contracts.md`
* `Docs/02_projects/radar-empresarial/database.md`
* `Docs/02_projects/radar-empresarial/event-taxonomy.md`
* `Docs/02_projects/radar-empresarial/impact-analysis.md`
* `Docs/02_projects/radar-empresarial/company-quality-model.md`
* `Docs/02_projects/radar-empresarial/pattern-engine.md`
* `Docs/02_projects/radar-empresarial/probability-model.md`
* `Docs/02_projects/radar-empresarial/risk-management.md`
* `Docs/02_projects/radar-empresarial/paper-trading.md`
* `Docs/02_projects/radar-empresarial/backtesting.md`
* `Docs/02_projects/radar-empresarial/data-sources.md`
* `Docs/02_projects/radar-empresarial/integrations.md`
* `Docs/02_projects/radar-empresarial/technology-stack.md`
* `Docs/02_projects/radar-empresarial/monetization.md`
* `Docs/02_projects/radar-empresarial/compliance-and-disclaimers.md`
* `Docs/02_projects/radar-empresarial/roadmap.md`

Puede indicar que una futura ejecución actualice, solo si aplica y no existe duplicación:

* `Docs/03_standards/product/module-catalog.md`
* `Docs/01_core_erp/apis/00_api_index.md`
* `Docs/_meta/active-work-index.md`
* `Docs/_meta/master-index.md`
* `Docs/agents/EXECUTION_REPORT.md`

---

# Fuera de alcance

No ejecutar otros agents.

No implementar código.

No crear APIs reales.

No crear schemas, modelos ni migraciones.

No crear conectores reales con brokers.

No conectar MT5, Alpaca, IBKR, OANDA ni ningún broker.

No operar con dinero real.

No hacer scraping si viola términos de servicio.

No prometer rentabilidad.

No usar lenguaje de certeza absoluta.

No modificar `main` ni `pro`.

No leer todo `Docs`.

No tocar proyectos no relacionados.

No convertir Radar Empresarial en parte interna de JobCron.

No duplicar responsabilidades ya cubiertas por Core ERP, Gateway, Document API, Address, Fiscal, Search, Notifications, ETL o cualquier API reutilizable vigente.

---

# Reescritura requerida de AGENTS-007.md

Reescribir `Docs/agents/AGENTS-007.md` con esta estructura:

## AGENTS-007 — Radar Empresarial y Motor de Inteligencia de Eventos

## Objetivo

Documentar Radar Empresarial como producto independiente y su motor de inteligencia probabilística como módulo reutilizable, sin implementar código ni prometer rendimientos.

El resultado debe dejar una guía clara para crear documentación canónica de arquitectura, datos, APIs, riesgo, backtesting, paper trading, fuentes, monetización y roadmap.

## Alcance

Puede:

* definir documentación requerida para Radar Empresarial;
* clasificar producto y módulo compartido;
* definir arquitectura documental;
* definir contratos API conceptuales;
* definir modelos de datos conceptuales;
* definir taxonomía de eventos;
* definir reglas de riesgo;
* definir reglas de backtesting y paper trading;
* definir disclaimers y límites de cumplimiento;
* registrar pendientes reales.

Debe revisar:

* estructura documental vigente;
* catálogo de módulos;
* estrategia de producto;
* estándar Gateway/API;
* índice de APIs;
* reporte de ejecución para evitar repetir tareas cerradas.

Debe dejar:

* instrucción optimizada;
* lista de documentos canónicos a crear o actualizar;
* validaciones;
* criterio de cierre;
* reporte en `Docs/agents/EXECUTION_REPORT.md`.

## Lectura mínima obligatoria

* `Docs/README.md`
* `Docs/_meta/active-work-index.md`
* `Docs/agents/AGENT_GLOBAL_RULES.md`
* `Docs/agents/EXECUTION_REPORT.md`
* `Docs/03_standards/product/product-strategy.md`
* `Docs/03_standards/product/module-catalog.md`
* `Docs/03_standards/architecture/api-gateway-standard.md`
* `Docs/01_core_erp/apis/00_api_index.md`
* `Docs/03_standards/codex/codex-output-report-standard.md`

## Fuera de alcance

* No ejecutar otros agents.
* No implementar software.
* No crear APIs nuevas sin contrato.
* No crear schemas, modelos ni migraciones sin decisión documentada.
* No conectar brokers.
* No operar dinero real.
* No prometer ganancias.
* No modificar `main` ni `pro`.
* No leer todo `Docs`.
* No tocar proyectos no relacionados.
* No usar `_archive/` como fuente vigente.

## Tareas

1. Revisar `AGENTS-007.md` completo y preservar todas sus responsabilidades: Radar Empresarial, eventos financieros, Probability Intelligence Engine, impacto económico, patrones, riesgo, paper trading, backtesting, fuentes, monetización, cumplimiento y roadmap.

2. Reordenar el agente para que sea ejecutable por fases:

   * Fase 0: documentación conceptual;
   * Fase 1: observador de eventos;
   * Fase 2: análisis de impacto;
   * Fase 3: backtesting;
   * Fase 4: paper trading;
   * Fase 5: asistente humano;
   * Fase 6: automatización futura limitada;
   * Fase 7: conectores de broker como adaptadores externos.

3. Definir documentación canónica esperada bajo `Docs/02_projects/radar-empresarial/`, incluyendo:

   * `README.md`
   * `product-vision.md`
   * `architecture.md`
   * `api-contracts.md`
   * `database.md`
   * `event-taxonomy.md`
   * `impact-analysis.md`
   * `company-quality-model.md`
   * `pattern-engine.md`
   * `probability-model.md`
   * `risk-management.md`
   * `paper-trading.md`
   * `backtesting.md`
   * `data-sources.md`
   * `integrations.md`
   * `technology-stack.md`
   * `monetization.md`
   * `compliance-and-disclaimers.md`
   * `roadmap.md`

4. Definir arquitectura conceptual obligatoria:

   * Frontend Radar Empresarial
   * API.PY.DJANGO.Gateway
   * API Radar Empresarial, solo si aplica
   * Event Intelligence Engine
   * Probability Intelligence Engine
   * Pattern Engine
   * Risk Manager
   * Alert Engine
   * Paper Trading Engine
   * Backtesting Engine
   * PostgreSQL
   * Redis/Queue, solo si aplica
   * Integraciones externas documentadas

5. Documentar que el frontend nunca debe consumir APIs externas directamente y que todo debe pasar por Gateway.

6. Documentar endpoints conceptuales sin marcarlos como activos:

   * `GET /radar/events`
   * `POST /radar/events/ingest`
   * `GET /radar/opportunities`
   * `GET /radar/assets`
   * `GET /radar/companies/{id}/risk-profile`
   * `GET /radar/patterns/search`
   * `POST /radar/signals/evaluate`
   * `GET /radar/signals`
   * `POST /radar/paper-trades`
   * `GET /radar/paper-portfolio`
   * `POST /radar/backtests/run`
   * `GET /radar/backtests`
   * `GET /radar/alerts`
   * `POST /radar/alerts/acknowledge`
   * `GET /radar/explanations`

7. Documentar endpoints conceptuales del módulo compartido sin marcarlos como activos:

   * `POST /probability/evaluate`
   * `POST /probability/expected-value`
   * `POST /probability/risk-score`
   * `POST /probability/backtest`
   * `POST /probability/signals`
   * `POST /probability/event-impact`
   * `POST /probability/recommendation`

8. Definir tablas conceptuales mínimas sin crear migraciones:

   * `Sources`
   * `RawSignals`
   * `NormalizedSignals`
   * `Events`
   * `EventTypes`
   * `EventSources`
   * `EventMentions`
   * `EventImpacts`
   * `Companies`
   * `CompanyFinancialProfiles`
   * `CompanyAdaptabilityScores`
   * `Sectors`
   * `Assets`
   * `Markets`
   * `MarketPrices`
   * `OddsSnapshots`
   * `PriceSnapshots`
   * `EconomicIndicators`
   * `SocialSentimentSnapshots`
   * `EconomicImpactChains`
   * `Beneficiaries`
   * `AffectedEntities`
   * `HistoricalPatterns`
   * `PatternOutcomes`
   * `Signals`
   * `SignalScores`
   * `Predictions`
   * `ProbabilityAssessments`
   * `RiskAssessments`
   * `ExpectedValueAssessments`
   * `PaperTrades`
   * `PaperPortfolios`
   * `BacktestRuns`
   * `BacktestResults`
   * `Recommendations`
   * `UserRiskProfiles`
   * `PortfolioExposures`
   * `Alerts`
   * `DecisionLogs`
   * `AuditLogs`

9. Documentar taxonomía de eventos:

   * sociales;
   * empresariales;
   * económicos;
   * geopolíticos;
   * sectoriales;
   * tecnológicos;
   * reputacionales;
   * regulatorios;
   * cadena de suministro;
   * mercado financiero;
   * consumo humano.

10. Documentar motor de impacto económico con la pregunta central:

* qué pasó;
* a quién afecta;
* quién gana dinero;
* quién pierde dinero;
* si el impacto es temporal o estructural;
* qué sectores se benefician;
* qué sectores se perjudican;
* qué casos históricos similares existen;
* qué hizo el mercado después;
* qué decisión habría tomado el sistema;
* qué riesgo tiene la decisión.

11. Documentar evaluación de empresas:

* innovación;
* adaptabilidad;
* salud financiera;
* caja;
* deuda;
* flujo;
* rentabilidad;
* márgenes;
* liderazgo;
* patentes;
* I+D;
* nuevos mercados;
* dependencia de clientes;
* dependencia de proveedores;
* riesgo regulatorio;
* historial de crisis;
* capacidad de recuperación;
* riesgo de desplazamiento tecnológico.

12. Documentar modelos probabilísticos:

* probabilidad implícita;
* valor esperado;
* ROI;
* drawdown;
* closing line value, si aplica;
* error de calibración;
* porcentaje de acierto;
* profit factor;
* comparación contra benchmarks;
* diferencia entre oportunidad real, euforia peligrosa, trampa de valor y deterioro estructural.

13. Documentar reglas de riesgo:

* no invertir todo de golpe;
* entradas escalonadas;
* liquidez mínima;
* pérdida máxima por operación;
* exposición máxima por empresa;
* exposición máxima por sector;
* bloqueo por deterioro estructural;
* bloqueo por baja confianza;
* no operar si EV <= 0;
* no operar si no hay datos suficientes;
* no operar con noticias críticas sin confirmar;
* no operar real sin backtesting y paper trading.

14. Documentar paper trading como fase obligatoria antes de dinero real:

* recolectar eventos;
* clasificar eventos;
* generar señales;
* simular compras/ventas;
* comparar contra benchmarks;
* medir errores;
* registrar decisiones.

15. Documentar fuentes de datos posibles:

* noticias;
* reportes financieros;
* comunicados corporativos;
* SEC/EDGAR;
* precios históricos;
* indicadores económicos;
* tasas de interés;
* inflación;
* empleo;
* commodities;
* cuotas deportivas, solo si aplica;
* clima, lesiones y alineaciones, solo para módulo experimental;
* tendencias;
* redes sociales solo si es legal y permitido por términos;
* Google Trends si aplica;
* brokers solo como fase futura.

16. Documentar que toda fuente debe indicar:

* proveedor;
* costo;
* límite de uso;
* licencia;
* confiabilidad;
* frecuencia de actualización;
* uso permitido;
* retención;
* restricciones legales.

17. Documentar stack recomendado:

* Python;
* Django o FastAPI;
* DRF si se usa Django;
* PostgreSQL;
* Redis/Queue si aplica;
* Prefect para pipelines;
* DuckDB/Parquet para analítica;
* pgvector si hay embeddings;
* LlamaIndex si hay análisis documental;
* scikit-learn, XGBoost, LightGBM, statsmodels o Prophet solo si se justifica;
* Next.js;
* TypeScript;
* Tailwind;
* RTK Query si aplica al estándar;
* Metabase o Superset para dashboards;
* Docker;
* scripts `start/stop/status/health`;
* logs y observabilidad.

18. Documentar monetización:

* freemium;
* suscripción;
* créditos por análisis pesado;
* reportes premium;
* alertas avanzadas;
* enterprise;
* publicidad opcional, no principal en MVP.

19. Documentar compliance:

* no es asesoría financiera;
* no garantiza ganancias;
* no promueve apuestas irresponsables;
* debe mostrar riesgo;
* debe mostrar fuentes;
* debe mostrar incertidumbre;
* debe permitir decisión humana;
* debe evitar lenguaje absoluto como “compra seguro”, “apuesta seguro” o “ganancia garantizada”.

20. Actualizar `Docs/agents/EXECUTION_REPORT.md` registrando:

* agent revisado;
* documentos leídos;
* cambios realizados;
* validaciones;
* pendientes reales;
* bloqueos;
* decisiones documentales;
* APIs reutilizadas;
* APIs no creadas y motivo.

## Validaciones

Ejecutar solo validaciones documentales aplicables:

* validar que no se modificaron otros agents;
* validar que `AGENTS-007.md` conserva la intención original;
* validar que no duplica reglas globales;
* validar que no pide leer todo el repositorio;
* validar que no marca APIs conceptuales como activas;
* validar que no promete ganancias;
* validar que no habilita operación real;
* validar que no contradice Gateway/API;
* validar rutas y enlaces modificados;
* registrar documentos leídos;
* ejecutar `git diff --check` si el entorno lo permite;
* ejecutar validador documental/front matter solo si existe y aplica.

No declarar validaciones no ejecutadas.

Si una validación no puede ejecutarse, registrar causa exacta.

## Reporte obligatorio

Actualizar:

`Docs/agents/EXECUTION_REPORT.md`

Debe registrar:

* `AGENTS-007.md`;
* documentos leídos;
* Context Pack usado;
* documentos fuera de alcance;
* cambios realizados;
* APIs reutilizadas;
* APIs no creadas y motivo;
* validaciones ejecutadas;
* resultado de validaciones;
* pendientes reales con `PENDIENTE_DE_DEFINIR`;
* bloqueos;
* decisiones documentales;
* estado final del agent.

## Criterio de cierre

El agent queda listo solo si:

* la instrucción es más corta y ejecutable que la original;
* no pierde responsabilidades del agente actual;
* no duplica reglas globales;
* tiene lectura mínima;
* tiene alcance claro;
* tiene tareas verificables;
* indica qué queda fuera;
* define validaciones;
* define dónde reportar;
* conserva Radar Empresarial como producto independiente;
* conserva Probability Intelligence Engine como módulo reutilizable;
* no promete rendimientos;
* no activa operación real;
* no crea APIs sin contrato;
* no inventa schemas ni migraciones;
* deja trazabilidad en `EXECUTION_REPORT.md`.

## Reglas finales

Si `AGENTS-007.md` está vacío, no inventar tareas; dejarlo como `Sin instrucciones`.

Si el agent ya fue ejecutado y no hay cambios nuevos, documentar que está cerrado.

Si falta información esencial, marcar `Bloqueado` y dejar preguntas concretas.

No eliminar, mover ni renombrar `Docs/agents/AGENTS-007.md`.

No limpiar el contenido del agent.

Esta tarea solo optimiza la instrucción del agent; no ejecuta Radar Empresarial ni crea su implementación.
