Sí. Revisé la estructura del repo. La documentación dice que lo reutilizable va en `01_core_erp`, lo específico por producto va en `02_projects/<proyecto>`, los estándares en `03_standards` y las integraciones externas en `04_integrations`.  También exige evitar duplicación: si afecta varias empresas va a Core/Standards; si es una marca/producto va a Projects.

Aquí tienes la instrucción lista para Codex:

INSTRUCCIÓN PARA CODEX — DOCUMENTAR MOTOR DE INTELIGENCIA DE EVENTOS FINANCIEROS / RADAR EMPRESARIAL

Repositorio objetivo:
[https://github.com/MexIngSoft/Docs.git](https://github.com/MexIngSoft/Docs.git)

Objetivo:
Documentar formalmente el nuevo sistema de análisis de inversiones basado en eventos sociales, comportamiento humano, patrones históricos, cadenas económicas, salud empresarial y gestión de riesgo. Este sistema no debe documentarse como “bot mágico de trading”, sino como un Motor de Inteligencia de Eventos Financieros que primero observa, clasifica, simula y alerta; solo después podría operar con capital real.

Reglas previas obligatorias:

1. Leer `README.md`.
2. Leer `_meta/active-work-index.md`.
3. Leer `_meta/master-index.md`.
4. Leer `03_standards/product/product-strategy.md`.
5. Leer `03_standards/product/module-catalog.md`.
6. Leer `03_standards/architecture/api-gateway-standard.md`.
7. No duplicar documentación existente.
8. No crear implementación todavía; primero documentar arquitectura, datos, riesgos, módulos y roadmap.
9. No prometer rendimientos financieros.
10. Toda mención de inversión debe indicar que primero se validará con backtesting, paper trading y métricas reales.

Clasificación documental:
Crear o preparar documentación como proyecto nuevo bajo:

`02_projects/radar-empresarial/`

Y documentar capacidades reutilizables como shared/core cuando apliquen:

* Motor de eventos: puede ser Shared Module si después se reutiliza en otros productos.
* Scheduler/jobs: debe apoyarse en JobCron/Core Scheduler.
* Notificaciones: usar Notifications API/Core.
* Documentos/reportes: puede apoyarse en DocuCore si se generan reportes PDF/Excel.
* Gateway/API: debe seguir Frontend -> Gateway -> API propia del proyecto -> Core/Shared/Integraciones.

Documentos a crear o actualizar:

1. `02_projects/radar-empresarial/README.md`
   Debe definir:

* Nombre: Radar Empresarial.
* Submódulo: Motor de Inteligencia de Eventos Financieros.
* Objetivo: detectar eventos sociales, empresariales, económicos y de mercado para generar alertas de inversión basadas en patrones.
* Estado: FUTURE_OR_PENDING / MVP_CONCEPTUAL.
* No opera dinero real en fase inicial.
* Primer entregable: observador + clasificador + dashboard + paper trading.

2. `02_projects/radar-empresarial/architecture.md`
   Debe documentar arquitectura:

Frontend Radar Empresarial
→ API.PY.DJANGO.Gateway
→ Radar Empresarial API
→ Event Intelligence Engine
→ Pattern Engine
→ Risk Manager
→ Alert Engine
→ Paper Trading Engine
→ PostgreSQL
→ Redis/Queue
→ Integraciones externas

El sistema debe correr en Linux + Docker.
No depender inicialmente de MT5.
No operar real en MVP.
Broker/connectors serán adaptadores futuros.

3. `02_projects/radar-empresarial/api-contracts.md`
   Documentar endpoints propuestos:

* `GET /events`
* `POST /events/ingest`
* `GET /events/{id}`
* `GET /companies/{id}/risk-profile`
* `GET /patterns/search`
* `POST /signals/evaluate`
* `GET /signals`
* `POST /paper-trades`
* `GET /paper-portfolio`
* `GET /alerts`
* `POST /alerts/acknowledge`
* `GET /backtests`
* `POST /backtests/run`

No exponer secretos.
No conectar frontend directo a APIs externas.
Todo debe pasar por Gateway.

4. `02_projects/radar-empresarial/database.md`
   Documentar modelo de datos mínimo:

Tablas sugeridas:

* `Companies`
* `CompanyFinancialProfiles`
* `CompanyAdaptabilityScores`
* `Sectors`
* `Assets`
* `MarketPrices`
* `Events`
* `EventTypes`
* `EventSources`
* `EventMentions`
* `SocialSentimentSnapshots`
* `EconomicImpactChains`
* `Beneficiaries`
* `AffectedEntities`
* `HistoricalPatterns`
* `PatternOutcomes`
* `Signals`
* `SignalScores`
* `RiskEvaluations`
* `PaperTrades`
* `PaperPortfolios`
* `Backtests`
* `Alerts`
* `DecisionLogs`

Cada evento debe poder responder:

* Qué pasó.
* A quién afecta.
* Quién gana dinero.
* Quién pierde dinero.
* Si el impacto es temporal o estructural.
* Si existen casos históricos similares.
* Qué hizo el mercado después.
* Qué decisión habría tomado el sistema.

5. `02_projects/radar-empresarial/event-taxonomy.md`
   Crear taxonomía de eventos:

Eventos sociales:

* Pánico
* Euforia
* Escasez
* Boicot
* Viralidad
* Moda
* Cambio de consumo
* Crisis reputacional

Eventos empresariales:

* Lanzamiento de producto
* Retiro de producto
* Demanda
* Fraude
* Cambio de CEO
* Fusiones/adquisiciones
* Quiebra
* Reestructura
* Contrato relevante
* Pérdida de cliente clave

Eventos económicos:

* Inflación
* Tasas de interés
* Tipo de cambio
* Petróleo
* Materias primas
* Empleo
* PIB
* Recesión

Eventos geopolíticos:

* Guerra
* Sanciones
* Regulación
* Elecciones
* Bloqueos comerciales
* Restricciones tecnológicas

Eventos sectoriales:

* Accidentes aéreos
* Huelgas
* Ciberataques
* Fallas de cadena de suministro
* Cambios de proveedor
* Disrupción tecnológica
* Sustitución de producto

6. `02_projects/radar-empresarial/impact-analysis.md`
   Documentar el motor de impacto económico.

Regla central:
No preguntar solo “qué producto sube”, sino “quién captura el dinero”.

Ejemplo:
Pánico por papel higiénico
→ sube demanda
→ posibles beneficiados:

* fabricantes de papel
* celulosa
* logística
* maquinaria
* empaques
* retail
  → posibles perjudicados:
* empresas sin inventario
* empresas con costos altos
* empresas con logística débil

El sistema debe separar:

* Beneficiados directos
* Beneficiados indirectos
* Perjudicados directos
* Perjudicados indirectos
* Primer orden
* Segundo orden
* Tercer orden

7. `02_projects/radar-empresarial/company-quality-model.md`
   Documentar cómo evaluar empresas.

Factores obligatorios:

* Innovación
* Adaptabilidad
* Salud financiera
* Caja disponible
* Deuda
* Flujo de efectivo
* Rentabilidad
* Márgenes
* Liderazgo
* Patentes
* I+D
* Nuevos mercados
* Dependencia de clientes
* Dependencia de proveedores
* Riesgo regulatorio
* Historial de crisis
* Capacidad de recuperación
* Riesgo de desplazamiento tecnológico

Clasificación:

* Empresa adaptable
* Empresa desplazada
* Empresa innovadora
* Empresa en crisis temporal
* Empresa en deterioro estructural
* Empresa sobrevalorada por euforia
* Empresa defensiva
* Empresa cíclica
* Empresa especulativa

Ejemplos conceptuales:

* Kodak como caso de empresa desplazada.
* Nokia como caso de empresa que perdió un mercado pero se adaptó a telecomunicaciones/redes.

8. `02_projects/radar-empresarial/pattern-engine.md`
   Documentar el motor de patrones.

El sistema debe comparar:

Evento actual

* empresa
* sector
* país
* momento económico
* sentimiento social
* reacción de mercado
* casos históricos similares

Debe calcular:

* Caída promedio histórica
* Subida promedio histórica
* Tiempo promedio de recuperación
* Probabilidad de recuperación
* Probabilidad de deterioro
* Máxima pérdida observada
* Mejor punto histórico de entrada
* Mejor punto histórico de salida
* Condiciones donde el patrón falló

No asumir:
“Mala noticia = comprar”.
Debe distinguir:

* Sobre reacción temporal
* Problema estructural
* Trampa de valor
* Oportunidad real
* Euforia peligrosa

9. `02_projects/radar-empresarial/risk-management.md`
   Documentar reglas de riesgo.

Reglas mínimas:

* No invertir todo de golpe.
* Usar entradas escalonadas.
* Mantener liquidez.
* Definir pérdida máxima por operación.
* Definir exposición máxima por empresa.
* Definir exposición máxima por sector.
* Bloquear empresas con deterioro estructural.
* Bloquear señales con baja confianza.
* No operar real sin backtesting y paper trading.
* Registrar toda decisión.
* Permitir modo observador, modo asistente y modo automático futuro.

Estrategia conceptual de entrada:
Capital dividido en partes.
Primera entrada pequeña.
Aumentar solo si:

* la tesis sigue válida;
* el sentimiento mejora;
* el mercado confirma;
* el riesgo sigue controlado.

Estrategia conceptual de salida:
Vender o reducir si:

* la tesis se rompe;
* el evento se vuelve estructural;
* el mercado confirma deterioro;
* aparece deterioro financiero;
* el sentimiento empeora de forma sostenida;
* hay mejor oportunidad;
* se alcanza pérdida máxima.

10. `02_projects/radar-empresarial/paper-trading.md`
    Documentar fase obligatoria de simulación.

Antes de dinero real:

* recolectar eventos;
* clasificar eventos;
* generar señales;
* simular compras/ventas;
* comparar contra benchmarks;
* medir resultados;
* registrar errores.

Métricas:

* rentabilidad simulada;
* drawdown máximo;
* porcentaje de aciertos;
* relación ganancia/pérdida;
* tiempo de recuperación;
* precisión de clasificación;
* señales falsas;
* señales perdidas;
* comparación contra comprar y mantener;
* comparación contra ETFs.

11. `02_projects/radar-empresarial/integrations.md`
    Documentar integraciones futuras.

Fuentes posibles:

* APIs de noticias.
* APIs financieras.
* reportes SEC/EDGAR.
* comunicados corporativos.
* datos de mercado.
* redes sociales cuando sea legal y permitido por términos.
* Google Trends si aplica.
* fuentes macroeconómicas.
* APIs de brokers solo en fase futura.

No almacenar datos obtenidos en contra de términos de servicio.
No depender de scraping frágil para decisiones reales.
No usar una sola fuente como verdad absoluta.

12. `02_projects/radar-empresarial/roadmap.md`
    Roadmap:

Fase 0 — Documentación

* arquitectura
* datos
* taxonomía
* reglas de riesgo
* integración con Gateway

Fase 1 — Observador

* recolectar eventos
* clasificar eventos
* guardar historial
* dashboard básico

Fase 2 — Analista

* generar impacto económico
* detectar beneficiados/perjudicados
* comparar patrones históricos
* generar alertas

Fase 3 — Paper Trading

* cartera simulada
* señales simuladas
* métricas
* comparación contra benchmarks

Fase 4 — Asistente humano

* alertas accionables
* usuario aprueba/rechaza
* bitácora de decisiones

Fase 5 — Automatización limitada

* solo después de métricas suficientes
* límites estrictos
* capital pequeño
* monitoreo humano

Fase 6 — Broker/connectors

* conectores separados
* no acoplar core al broker
* OANDA/IBKR/Alpaca/MT5 como adaptadores posibles, no como núcleo.

13. Actualizar `03_standards/product/module-catalog.md`
    Agregar entrada:

| Radar Empresarial Event Intelligence | Independent Product / Shared Analytical Module | `02_projects/radar-empresarial` | FUTURE_OR_PENDING |

Solo agregar si no existe previamente.

14. Actualizar `_meta/master-index.md`
    Agregar los documentos nuevos del proyecto Radar Empresarial con estado FUTURE_OR_PENDING o MVP_CONCEPTUAL.

15. Validaciones obligatorias
    Codex debe validar:

* No duplicar contenido existente.
* No mover documentos de otros proyectos.
* No documentar promesas de ganancias.
* No indicar que el sistema garantiza rentabilidad.
* No activar operación real.
* Mantener lenguaje de análisis, simulación y riesgo.
* Respetar patrón Gateway/API.
* Mantener Docker/Linux como arquitectura preferente.
* Separar motor de análisis de conectores de broker.
* Registrar pendientes en roadmap.

Resultado esperado:
Una carpeta `02_projects/radar-empresarial/` con documentación completa, clara, modular y lista para que después se implemente un MVP de observación, análisis de eventos, patrones históricos, paper trading y alertas de inversión.

No implementar código todavía salvo que el repositorio de Docs ya tenga plantillas o scripts documentales necesarios para registrar índices.

También confirmo algo importante: el estándar del repo exige que cada proyecto con dominio propio tenga API propia, datos, permisos e integraciones documentadas cuando aplique.  Y el catálogo de módulos exige clasificar tipo, owner, consumidores, datos, permisos y monetización antes de agregar un módulo.



Sí. Revisé `MexIngSoft/Docs`. No encontré documentación existente de **Radar Empresarial**, así que debe entrar como **nuevo producto independiente** y su motor probabilístico como **Shared Module**, para no duplicar lógica entre inversiones, apuestas y divisas.

La documentación debe respetar estas reglas del repo: el README separa núcleo reutilizable, proyectos, estándares e integraciones ; el índice activo exige leer solo documentos del dominio afectado y evitar duplicación ; y cada módulo nuevo debe clasificarse, tener owner, API/Gateway, datos, permisos y monetización .

## Instrucción completa para Codex

```text
OBJETIVO
Documentar Radar Empresarial como nuevo producto independiente dentro de Docs, basado en el chat actual sobre probabilidad, estadística, apuestas, inversiones, divisas, riesgo, datos sociales, económicos y motor de inteligencia probabilística.

NO implementar código todavía. Solo documentar arquitectura, módulos, datos, APIs, riesgos, reglas de decisión, monetización y roadmap.

REPOSITORIO
https://github.com/MexIngSoft/Docs.git

PRE-FLIGHT OBLIGATORIO
Antes de editar:
1. Leer Docs/README.md.
2. Leer Docs/_meta/active-work-index.md.
3. Leer Docs/03_standards/product/product-strategy.md.
4. Leer Docs/03_standards/product/module-catalog.md.
5. Leer Docs/03_standards/architecture/api-gateway-standard.md.
6. Leer Docs/01_core_erp/apis/00_api_index.md.
7. No leer todo el repositorio.
8. No duplicar documentación existente.
9. Si algo afecta varios productos, documentarlo como Shared Module.
10. Si algo es propio de Radar Empresarial, documentarlo en 02_projects/radar-empresarial.

CLASIFICACIÓN
Crear:
1. Producto independiente:
   - Nombre: Radar Empresarial.
   - Ruta: Docs/02_projects/radar-empresarial/
   - Tipo: Independent Product.

2. Módulo compartido:
   - Nombre: Probability Intelligence Engine.
   - Tipo: Shared Module.
   - Uso: motor reutilizable para inversiones, apuestas deportivas, divisas, commodities y análisis de eventos.
   - Debe poder ser consumido por Radar Empresarial y futuros productos.

DOCUMENTOS A CREAR

Crear carpeta:
Docs/02_projects/radar-empresarial/

Crear estos archivos:

1. README.md
Debe explicar:
- Qué es Radar Empresarial.
- Qué problema resuelve.
- Qué NO promete.
- Que no garantiza ganancias.
- Que mide probabilidad, riesgo, valor esperado y evidencia.
- Que el sistema no debe decir “compra seguro”, “apuesta seguro” o “ganancia garantizada”.
- Que el enfoque es análisis probabilístico con trazabilidad.

2. product-vision.md
Incluir:
- Visión del producto.
- Usuario objetivo:
  - analistas de datos,
  - pequeños inversionistas,
  - negocios,
  - traders disciplinados,
  - apostadores analíticos,
  - analistas de riesgo.
- Casos de uso:
  - detectar eventos que afecten empresas,
  - evaluar acciones,
  - evaluar apuestas con valor esperado,
  - evaluar divisas,
  - evaluar commodities,
  - explicar quién gana y quién pierde ante un evento.
- Diferenciar entre:
  - inversión,
  - trading,
  - apuesta,
  - divisas,
  - análisis económico.

3. architecture.md
Documentar arquitectura:

Frontend Radar Empresarial
-> API.PY.DJANGO.Gateway
-> API Radar Empresarial
-> Probability Intelligence Engine
-> Core/Shared APIs
-> Integraciones externas

Respetar el estándar:
Frontend -> Gateway -> API propia del proyecto -> Core/Shared/Integraciones.

Módulos principales:
- DataCollector
- SignalNormalizer
- EventEngine
- ProbabilityEngine
- RiskEngine
- BacktestingEngine
- ExplanationEngine
- PortfolioExposureEngine
- AlertEngine
- AuditTrail

4. api-contracts.md
Documentar APIs necesarias:

API Radar Empresarial:
- /radar/opportunities/
- /radar/events/
- /radar/assets/
- /radar/bets/
- /radar/fx/
- /radar/commodities/
- /radar/risk-profile/
- /radar/backtests/
- /radar/alerts/
- /radar/explanations/

Shared Probability Intelligence Engine:
- /probability/evaluate/
- /probability/expected-value/
- /probability/risk-score/
- /probability/backtest/
- /probability/signals/
- /probability/event-impact/
- /probability/recommendation/

Cada endpoint debe documentar:
- request,
- response,
- errores normalizados,
- permisos,
- si es síncrono o asíncrono,
- si requiere datos externos.

5. database.md
Documentar tablas conceptuales:

- Source
- RawSignal
- NormalizedSignal
- Event
- EventImpact
- Asset
- Market
- OddsSnapshot
- PriceSnapshot
- EconomicIndicator
- SocialSignal
- Prediction
- ProbabilityAssessment
- RiskAssessment
- ExpectedValueAssessment
- BacktestRun
- BacktestResult
- Recommendation
- UserRiskProfile
- PortfolioExposure
- AuditLog

Cada tabla debe indicar:
- propósito,
- campos principales,
- relaciones,
- datos sensibles,
- retención,
- si es compartida o propia del proyecto.

6. probability-model.md
Documentar la lógica matemática:

Conceptos:
- Probabilidad implícita:
  P_implícita = 1 / cuota
- Margen de seguridad:
  P_mínima = P_implícita + margen
- Valor esperado:
  EV = (P_modelo × ganancia) - ((1 - P_modelo) × pérdida)
- ROI:
  ROI = ganancia_neta / capital_apostado
- Drawdown:
  caída máxima desde un pico de capital.
- Closing Line Value:
  comparar cuota tomada contra cuota final cuando aplique.

Reglas:
- No apostar/invertir si EV <= 0.
- No operar si no hay datos suficientes.
- No operar si hay noticias críticas sin confirmar.
- No operar si la ventaja es menor al margen mínimo definido.
- No usar solo porcentaje de acierto como métrica principal.
- Medir ROI, drawdown, EV, tasa de acierto, error de calibración y consistencia.

7. risk-management.md
Documentar estructura de riesgo:

Banco ejemplo: 100,000 MXN.

Niveles:
- Nivel 0: sin ventaja clara, apostar/invertir 0%.
- Nivel 1: ventaja baja, máximo 0.25%.
- Nivel 2: ventaja aceptable, máximo 0.50%.
- Nivel 3: buena ventaja, máximo 1%.
- Nivel 4: ventaja fuerte, máximo 1.5%.
- Nivel 5: ventaja extraordinaria, máximo 2%.

Reglas:
- Nunca arriesgar más del 2% del banco en una sola operación.
- No exponer más del 5% al 8% del banco en una ronda.
- No operar 10 oportunidades si solo 3 tienen valor matemático.
- Apostar/invertir solo cuando la probabilidad del modelo supere a la probabilidad implícita más margen de seguridad.
- Bloquear operaciones con riesgo excesivo aunque tengan ganancia potencial alta.

8. data-sources.md
Documentar fuentes posibles:

Mercados financieros:
- precios históricos,
- reportes financieros,
- noticias empresariales,
- indicadores económicos,
- tasas de interés,
- inflación,
- empleo,
- commodities.

Apuestas:
- cuotas históricas,
- cuotas actuales,
- resultados,
- lesiones,
- alineaciones,
- clima,
- calendario,
- localía,
- rendimiento reciente.

Divisas:
- tasas de bancos centrales,
- inflación,
- empleo,
- balanza comercial,
- eventos geopolíticos,
- volatilidad.

Social/económico:
- noticias,
- tendencias,
- redes sociales,
- búsquedas,
- sentimiento,
- eventos virales,
- huelgas,
- pandemias,
- guerras,
- regulaciones.

Regla:
Toda fuente debe tener:
- proveedor,
- costo,
- límite de uso,
- confiabilidad,
- actualización,
- licencia,
- uso permitido.

9. technology-stack.md
Documentar stack recomendado:

Backend:
- Python
- Django o FastAPI
- DRF si se usa Django

Pipelines:
- Prefect

Base principal:
- PostgreSQL

Analítica:
- DuckDB
- Parquet

Embeddings:
- pgvector

IA/documentos:
- LlamaIndex

Modelos:
- scikit-learn
- XGBoost
- LightGBM
- statsmodels
- Prophet
- PyTorch Forecasting solo si se justifica

Frontend:
- Next.js
- TypeScript
- Tailwind
- RTK Query si aplica al estándar actual

Dashboards:
- Metabase o Superset

Infra:
- Docker
- scripts start/stop/status/health
- observabilidad y logs

10. backtesting.md
Documentar:
- Cómo validar contra históricos.
- Separación train/test.
- Evitar overfitting.
- No aceptar modelos probados solo con datos elegidos a mano.
- Métricas mínimas:
  - ROI,
  - EV,
  - drawdown,
  - hit rate,
  - calibration error,
  - Sharpe si aplica,
  - profit factor,
  - número mínimo de muestras.
- Requisito: no declarar estrategia válida con pocas muestras.

11. monetization.md
Documentar modelos:
- Freemium limitado.
- Suscripción mensual.
- Créditos por análisis pesado.
- Enterprise para equipos.
- Publicidad opcional, no principal en MVP.
- Reportes premium.
- Alertas avanzadas.

12. roadmap.md
Orden recomendado:
Fase 0: documentación y modelo conceptual.
Fase 1: Radar Empresarial para eventos y empresas.
Fase 2: backtesting financiero.
Fase 3: apuestas deportivas como módulo experimental.
Fase 4: commodities.
Fase 5: divisas, solo después de validar el motor.
Fase 6: alertas, reportes y monetización.

13. compliance-and-disclaimers.md
Incluir:
- No es asesoría financiera.
- No garantiza ganancias.
- No promueve apuestas irresponsables.
- Debe mostrar riesgo.
- Debe mostrar fuentes.
- Debe mostrar incertidumbre.
- Debe permitir al usuario decidir.
- Debe evitar lenguaje de certeza absoluta.

ACTUALIZACIONES A ARCHIVOS EXISTENTES

1. Actualizar Docs/03_standards/product/module-catalog.md
Agregar:
- Radar Empresarial | Independent Product | 02_projects/radar-empresarial | Documentado
- Probability Intelligence Engine | Shared Module | 02_projects/radar-empresarial/probability-model.md o futura ruta compartida | Documentado

2. Actualizar Docs/01_core_erp/apis/00_api_index.md
Agregar como pendiente de definir:
- Probability Intelligence API | PENDIENTE_DE_DEFINIR
- Market Data API | PENDIENTE_DE_DEFINIR
- Event Signal API | PENDIENTE_DE_DEFINIR
- Backtesting API | PENDIENTE_DE_DEFINIR

No marcarlas como activas porque no existe repositorio ejecutable, migraciones ni contrato validado.

3. Actualizar Docs/_meta/active-work-index.md
Agregar ruta rápida:
Trabajar Radar Empresarial:
- 02_projects/radar-empresarial/README.md
- architecture.md
- api-contracts.md
- probability-model.md
- risk-management.md
- data-sources.md
- backtesting.md

REGLAS DE REDACCIÓN
- No prometer 75% de acierto.
- No documentar ganancias garantizadas.
- Usar lenguaje probabilístico.
- Cada recomendación debe tener explicación, fuente y nivel de riesgo.
- Separar apuestas, inversiones y divisas.
- Forex/divisas debe quedar como fase avanzada por alta dificultad.
- El MVP debe empezar por análisis empresarial/eventos, no por Forex.

CRITERIO DE CIERRE
La tarea queda completa cuando:
1. Existe carpeta 02_projects/radar-empresarial.
2. Existen todos los documentos anteriores.
3. module-catalog.md queda actualizado.
4. api_index.md queda actualizado sin marcar APIs como activas.
5. active-work-index.md incluye ruta de trabajo.
6. No hay duplicación con Core ERP ni estándares.
7. El sistema queda documentado como análisis probabilístico, no como promesa de ganancia.
```

Esto deja **Radar Empresarial** bien separado: producto propio en `02_projects`, motor probabilístico reutilizable como `Shared Module`, y APIs nuevas solo como pendientes hasta que existan contrato, persistencia y pruebas.
Sí. Revisé la estructura del repo y **Radar Empresarial debe documentarse como `Independent Product` dentro de `02_projects/radar-empresarial`**, porque la documentación actual separa Core ERP, Proyectos, Estándares e Integraciones, y los proyectos con marca/producto propio van en `02_projects/<nombre>`.

También debe cumplir el estándar mínimo de proyecto: `architecture.md`, `api-contracts.md`, `database.md`, `security.md`, repositorios, puertos y dependencias con Gateway/Core/Integraciones.

Copia esto a Codex:

INSTRUCCIÓN PARA CODEX — DOCUMENTAR RADAR EMPRESARIAL EN DOCS

Repositorio:

[https://github.com/MexIngSoft/Docs.git](https://github.com/MexIngSoft/Docs.git)

Objetivo:

Crear la documentación completa del nuevo proyecto Radar Empresarial, sin duplicar información existente, respetando la estructura canónica del repositorio y dejando el proyecto listo para desarrollo posterior.

Nombre del producto:

Radar Empresarial

Nombre interno del motor:

Radar Engine

Nombre del algoritmo:

Radar Score

Clasificación:

Independent Product

Ubicación principal:

Docs/02_projects/radar-empresarial/

Antes de documentar, leer obligatoriamente:

1. Docs/README.md
2. Docs/_meta/master-index.md
3. Docs/_meta/active-work-index.md
4. Docs/03_standards/product/product-strategy.md
5. Docs/03_standards/product/module-catalog.md
6. Docs/03_standards/architecture/api-gateway-standard.md
7. Docs/03_standards/global-governance.md
8. Docs/03_standards/operations/module-lifecycle-and-feature-flags.md
9. Docs/01_core_erp/architecture/scheduling/scheduler-architecture.md
10. Docs/01_core_erp/architecture/events/event-driven-architecture.md
11. Docs/01_core_erp/architecture/events/event-catalog.md
12. Docs/04_integrations/README.md

Reglas:

* No leer todo el repositorio.
* No duplicar documentación existente.
* Si algo aplica a varios proyectos, documentarlo como dependencia Core/Shared, no dentro de Radar Empresarial.
* Si algo depende de una API externa, documentarlo en 04_integrations o referenciarlo desde Radar Empresarial.
* No inventar proveedores, costos ni límites de APIs. Marcar como VERIFY_OFFICIAL_SOURCE cuando no esté confirmado.
* No presentar Radar Empresarial como asesor financiero.
* El producto debe ser de análisis, inteligencia empresarial y señales públicas, no de recomendaciones garantizadas.
* No usar frases como “compra”, “vende”, “garantizado”, “seguro sube” o “ganancia asegurada”.
* Usar lenguaje tipo: “señal positiva”, “riesgo detectado”, “tendencia emergente”, “probable impacto”, “requiere validación humana”.

Crear estos archivos:

Docs/02_projects/radar-empresarial/README.md
Docs/02_projects/radar-empresarial/vision.md
Docs/02_projects/radar-empresarial/architecture.md
Docs/02_projects/radar-empresarial/api-contracts.md
Docs/02_projects/radar-empresarial/database.md
Docs/02_projects/radar-empresarial/scoring-model.md
Docs/02_projects/radar-empresarial/event-impact-engine.md
Docs/02_projects/radar-empresarial/value-chain-engine.md
Docs/02_projects/radar-empresarial/social-behavior-engine.md
Docs/02_projects/radar-empresarial/technology-displacement-engine.md
Docs/02_projects/radar-empresarial/apis-and-integrations.md
Docs/02_projects/radar-empresarial/frontend.md
Docs/02_projects/radar-empresarial/security.md
Docs/02_projects/radar-empresarial/monetization.md
Docs/02_projects/radar-empresarial/legal-disclaimer.md
Docs/02_projects/radar-empresarial/roadmap.md
Docs/02_projects/radar-empresarial/tasks/README.md
Docs/02_projects/radar-empresarial/tasks/mvp.md

Actualizar, si aplica:

Docs/_meta/master-index.md
Docs/_meta/active-work-index.md
Docs/03_standards/product/module-catalog.md

No actualizar si no corresponde o si ya existe una entrada equivalente.

CONTENIDO BASE DEL PROYECTO

1. README.md

Debe explicar:

Radar Empresarial es una plataforma de inteligencia empresarial que analiza noticias, datos financieros, tendencias sociales, cadenas de valor, eventos económicos, comportamiento colectivo, innovación, sustitución tecnológica y riesgos de mercado.

El objetivo no es decirle al usuario qué comprar o vender. El objetivo es mostrar señales explicables para que cada usuario forme sus propias expectativas.

Radar Empresarial debe detectar no solo el evento visible, sino quién gana dinero directa o indirectamente.

Ejemplo central:

Durante una crisis de papel de baño, el análisis superficial dice:

* suben las ventas de papel de baño.

Radar Empresarial debe analizar:

* fabricantes de papel;
* productores de celulosa;
* empresas forestales;
* químicos usados en producción;
* empaques;
* logística;
* supermercados;
* maquinaria industrial;
* energía;
* proveedores de materia prima.

El producto debe responder:

¿Quién se beneficia realmente?
¿Quién gana más margen?
¿Quién tiene más capacidad de capturar valor?
¿Quién solo tiene demanda temporal?
¿Quién queda expuesto a riesgo de saturación o escasez?

2. vision.md

Documentar:

Misión:

Detectar señales económicas y empresariales antes de que sean evidentes para el público general, usando fuentes públicas y modelos explicables.

Propuesta de valor:

* convertir noticias en mapas de impacto;
* convertir tendencias sociales en señales de demanda;
* convertir eventos en cadenas de beneficiarios;
* identificar empresas innovadoras;
* detectar empresas en riesgo de desplazamiento;
* separar ruido mediático de señales útiles;
* mostrar rankings públicos y análisis explicables.

Usuarios objetivo:

* emprendedores;
* analistas de datos;
* inversionistas minoristas;
* negocios que quieren entender tendencias;
* medios económicos;
* anunciantes financieros;
* empresas que quieren visibilidad sectorial.

3. architecture.md

Usar patrón obligatorio:

Frontend Radar Empresarial
-> API.PY.DJANGO.Gateway
-> API.PY.DJANGO.RadarEmpresarial
-> Core ERP / Shared Modules / Integraciones externas

Componentes:

* Web pública.
* API propia del proyecto.
* Gateway.
* Workers de recolección.
* Scheduler.
* Motor de scoring.
* Motor de eventos.
* Motor de cadena de valor.
* Motor de comportamiento social.
* Motor de desplazamiento tecnológico.
* Base PostgreSQL.
* Cache opcional Redis.
* Integraciones externas.

La API propia debe existir porque el proyecto tiene:

* datos propios;
* reglas de negocio propias;
* integraciones específicas;
* procesos asincrónicos;
* monetización propia;
* dominio o marca independiente.

4. api-contracts.md

Documentar endpoints iniciales:

GET /radar/health/
GET /radar/companies/
GET /radar/companies/{id}/
GET /radar/companies/{id}/score/
GET /radar/sectors/
GET /radar/sectors/{id}/score/
GET /radar/rankings/companies/
GET /radar/rankings/sectors/
GET /radar/news/
GET /radar/signals/
GET /radar/alerts/
GET /radar/events/
GET /radar/events/{id}/impact/
GET /radar/value-chains/
GET /radar/public-reports/

Admin:

POST /radar/admin/companies/
POST /radar/admin/sectors/
POST /radar/admin/sources/
POST /radar/admin/jobs/run/
POST /radar/admin/scoring/recalculate/

Reglas:

* Todo endpoint público debe pasar por Gateway.
* No exponer API keys.
* No exponer payloads crudos de proveedores al frontend.
* Normalizar errores.
* Versionar contratos.

5. database.md

Crear modelo conceptual con estas tablas:

companies
sectors
company_sectors
news_articles
data_sources
external_api_accounts
financial_snapshots
trend_signals
social_signals
event_catalog
event_instances
event_impacts
value_chain_nodes
value_chain_edges
company_relationships
supply_dependencies
technology_displacements
raw_ingestion_logs
normalized_signals
scoring_results
score_explanations
alerts
public_reports
user_watchlists
audit_logs

Campos clave:

companies:

* id
* name
* ticker
* exchange
* country
* sector_id
* industry
* website
* description
* status
* created_at
* updated_at

event_instances:

* id
* event_type
* title
* description
* country
* sector_id
* detected_at
* source_confidence
* impact_confidence
* status

event_impacts:

* id
* event_id
* affected_entity_type
* company_id
* sector_id
* commodity
* impact_direction
* impact_level
* impact_horizon
* explanation
* confidence_score

value_chain_nodes:

* id
* name
* node_type
* sector_id
* description

value_chain_edges:

* id
* from_node_id
* to_node_id
* relation_type
* dependency_level
* notes

technology_displacements:

* id
* old_technology
* new_technology
* affected_sector_id
* beneficiary_company_id
* harmed_company_id
* evidence
* confidence_score

scoring_results:

* id
* company_id
* sector_id
* score_total
* score_news
* score_financial
* score_social
* score_innovation
* score_value_chain
* score_displacement
* score_risk
* explanation
* calculated_at

6. scoring-model.md

Documentar Radar Score de 0 a 100.

Factores:

* Noticias: 10%
* Datos financieros: 15%
* Tendencias sociales: 20%
* Innovación/adaptación: 15%
* Cadena de valor: 20%
* Desplazamiento tecnológico: 10%
* Riesgo regulatorio/geopolítico: 10%

Clasificación:

85-100: señal muy fuerte
70-84: señal positiva
50-69: observación neutral
30-49: riesgo medio
0-29: riesgo alto

Regla importante:

El score no debe venderse como predicción absoluta. Debe ser una señal analítica con explicación, fecha, fuentes y nivel de confianza.

7. event-impact-engine.md

Documentar el Motor de Impacto.

Función:

Convertir eventos públicos en impactos económicos.

Ejemplos:

Evento: escasez de papel de baño.

Impacto directo:

* papel higiénico;
* supermercados;
* fabricantes de papel.

Impacto indirecto:

* celulosa;
* madera;
* químicos;
* empaques;
* logística.

Impacto terciario:

* maquinaria industrial;
* energía;
* mantenimiento;
* transporte pesado.

El motor debe evaluar:

* dirección del impacto: positivo, negativo, mixto;
* horizonte: inmediato, corto plazo, mediano plazo, largo plazo;
* nivel de confianza;
* beneficiario real;
* margen probable;
* riesgo de saturación.

8. value-chain-engine.md

Documentar el Motor de Cadena de Valor.

Objetivo:

No quedarse en el producto final. Detectar qué parte de la cadena captura más valor.

Preguntas:

* ¿Quién fabrica el producto final?
* ¿Quién provee materia prima?
* ¿Quién controla distribución?
* ¿Quién tiene escasez de oferta?
* ¿Quién puede subir precios?
* ¿Quién tiene mayor margen?
* ¿Quién depende de terceros?
* ¿Qué empresa es reemplazable y cuál es crítica?

Ejemplo:

IA generativa no solo beneficia apps de IA. También puede beneficiar:

* GPUs;
* centros de datos;
* energía;
* enfriamiento;
* semiconductores;
* nube;
* memoria;
* redes;
* ciberseguridad.

9. social-behavior-engine.md

Documentar:

Este módulo detecta comportamiento colectivo.

Señales:

* búsquedas crecientes;
* compras de pánico;
* cambios de consumo;
* miedo social;
* modas;
* escasez percibida;
* conversación en redes;
* crecimiento de reseñas;
* aparición de nuevos negocios;
* demanda por ciudad o país.

Fuentes posibles:

* Google Trends no oficial;
* Google News RSS;
* Reddit API;
* YouTube Data API;
* RSS;
* datos internos de búsqueda;
* fuentes futuras de redes sociales.

10. technology-displacement-engine.md

Documentar:

Este módulo detecta empresas que se adaptan y empresas que son desplazadas.

Ejemplos:

* DVD -> streaming;
* taxi tradicional -> apps de movilidad;
* SMS -> mensajería instantánea;
* fotografía analógica -> fotografía digital;
* gasolina -> vehículos eléctricos;
* software local -> SaaS;
* call centers simples -> automatización IA.

Reglas:

* No marcar una empresa como perdedora sin evidencia.
* Diferenciar caída temporal de desplazamiento estructural.
* Detectar adaptación, como cambio de modelo de negocio, nuevos productos, adquisiciones, patentes o alianzas.

11. apis-and-integrations.md

Documentar APIs candidatas por categoría.

Noticias:

* GNews API
* NewsData.io
* NewsAPI.org
* Google News RSS
* SerpApi Google News API, solo como opción posterior por costo

Finanzas:

* Financial Modeling Prep
* Finnhub
* Alpha Vantage
* SEC EDGAR
* Yahoo Finance no oficial, solo como apoyo experimental

Macroeconomía:

* World Bank API
* FRED API
* INEGI API

Social/tendencias:

* Google Trends no oficial
* Reddit API
* YouTube Data API
* RSS
* scraping controlado solo si cumple términos y robots.txt

Reglas de integración:

* Cada proveedor debe tener adaptador propio.
* Ningún proveedor debe quedar acoplado al motor.
* Guardar raw_payload solo para auditoría interna.
* Normalizar datos antes de scoring.
* Registrar fecha de consulta.
* Registrar límite, costo estimado y condiciones de uso.
* No depender de una sola fuente.
* Marcar proveedor como FREE_DEV, FREE_LIMITED, PAID, OFFICIAL_PUBLIC, UNOFFICIAL o EXPERIMENTAL.

12. frontend.md

Pantallas públicas:

* Home.
* Ranking de empresas.
* Ranking de sectores.
* Perfil de empresa.
* Perfil de sector.
* Señales recientes.
* Noticias relevantes.
* Explicación de Radar Score.
* Reportes públicos.
* Aviso legal.

Pantallas privadas/admin:

* Administración de empresas.
* Administración de sectores.
* Administración de fuentes.
* Jobs de ingesta.
* Logs.
* Recalcular scoring.
* Validación manual de señales.
* Control de visibilidad pública.

13. security.md

Reglas:

* No exponer API keys.
* No exponer payloads completos de proveedores.
* No permitir manipulación pública de scores.
* Separar usuarios públicos, premium y admin.
* Registrar auditoría de cambios manuales.
* Validar fuentes.
* Evitar difamación o afirmaciones no verificadas.
* Mostrar fecha y fuente del análisis.
* Evitar recomendaciones financieras directas.

14. monetization.md

Modelos posibles:

* Freemium.
* Publicidad opcional.
* Suscripción premium.
* Créditos para reportes avanzados.
* API para terceros.
* Enterprise.

Regla:

Publicidad puede existir como modelo, pero no debe ser el ingreso principal del MVP si no hay tráfico suficiente.

Plan gratuito:

* rankings públicos;
* señales generales;
* noticias principales;
* explicación básica.

Plan premium futuro:

* alertas;
* watchlist;
* historial extendido;
* comparador;
* reportes descargables;
* análisis por país;
* análisis por sector;
* API.

15. legal-disclaimer.md

Texto base:

Radar Empresarial no ofrece asesoría financiera, legal, fiscal ni bursátil. La información publicada es de carácter informativo y analítico. Las puntuaciones, señales, alertas y reportes no garantizan resultados futuros. Cada usuario es responsable de verificar la información y tomar sus propias decisiones.

16. roadmap.md

Fase 1 MVP:

* estructura documental;
* API propia;
* DB base;
* CRUD empresas;
* CRUD sectores;
* ingesta Google News RSS;
* integración inicial GNews o NewsData.io;
* score básico;
* ranking público;
* perfil empresa;
* aviso legal.

Fase 2:

* datos financieros;
* SEC EDGAR;
* historial score;
* alertas;
* explicación de score;
* jobs programados.

Fase 3:

* cadena de valor;
* eventos;
* comportamiento social;
* Google Trends experimental;
* Reddit/YouTube;
* desplazamiento tecnológico.

Fase 4:

* premium;
* watchlist;
* API pública;
* publicidad;
* reportes descargables;
* enterprise.

17. tasks/mvp.md

Checklist:

* Crear carpeta Docs/02_projects/radar-empresarial.
* Crear documentos base.
* Registrar en master-index si aplica.
* Registrar en module-catalog como Independent Product.
* Definir arquitectura Frontend -> Gateway -> API propia -> Integraciones.
* Definir DB.
* Definir endpoints.
* Definir fuentes iniciales.
* Definir Radar Score.
* Definir disclaimer legal.
* Definir roadmap.
* Marcar como FUTURE_OR_PENDING cualquier integración no validada.

Validación final:

* No hay duplicación con Core ERP.
* No hay APIs externas inventadas.
* No hay promesas de inversión.
* No hay recomendaciones financieras directas.
* El proyecto queda listo para desarrollo posterior.

APIs verificadas para considerar: **GNews** tiene plan gratis de desarrollo con 100 requests/día y no permite uso comercial en free; **NewsAPI** tiene plan Developer gratis con 100 requests/día y Business desde USD 449/mes; **SEC EDGAR** ofrece APIs JSON sin API key para filings y XBRL; **World Bank** documenta su Indicators API pública. ([GNews API][1]) ([News API][2]) ([SEC][3]) ([Data Helpdesk][4])

[1]: https://gnews.io/pricing "Pricing - GNews API"
[2]: https://newsapi.org/pricing "Pricing - News API"
[3]: https://www.sec.gov/search-filings/edgar-application-programming-interfaces "SEC.gov | EDGAR Application Programming Interfaces (APIs)"
[4]: https://datahelpdesk.worldbank.org/knowledgebase/articles/889392-about-the-indicators-api-documentation "About the Indicators API Documentation – World Bank Data Help Desk"
