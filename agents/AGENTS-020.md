# Investigación técnica integral del stack y roadmap de MexIngSoft

## Revisión del repositorio y arquitectura actual

Sí revisé la rama `general` usada como base de esta investigación y, sobre esa revisión, la conclusión más importante es que la documentación ya tiene una dirección arquitectónica bastante sólida: las webs en Next.js no deben consumir Auth, APIs core ni base de datos de forma directa; el límite canónico es **Frontend Web → API.PY.DJANGO.Gateway → APIs compartidas o especializadas → PostgreSQL**. Esa regla aparece explícitamente en el estándar de login del ecosistema y se repite en arquitecturas de LexNova, REFAPART, DocuCore e Imagrafity. La capa Docker también está definida como infraestructura compartida en cuatro bloques canónicos: `Docker.DB.PG`, `Docker.API.PY`, `Docker.WEB.NJ` y `Docker.SW.Nginx`. citeturn44view8turn43view1turn44view1turn44view4turn43view3turn44view7

En términos de producto, la documentación confirma además que **JobCron** es el ERP central del ecosistema; **DocuCore** concentra capacidades documentales reutilizables; **Fiscora** se apoya en Gateway, Fiscal y Document; **REFAPART** aísla la experiencia comercial de la operación profunda en JobCron; **LexNova** aísla LegalTech sobre su propia API de dominio; **TecnoTelec** se documenta como plataforma de soluciones, no marketplace genérico; **PhoneShop** es el canal especializado para telefonía y accesorios; y **MexIngSoft** ya contempla una web corporativa Next.js separada del resto. citeturn44view2turn44view3turn43view0turn44view0turn43view1turn43view2turn43view5turn43view4

Mi lectura técnica, integrando lo anterior con toda la conversación previa de este chat, es que la base mínima que ustedes vienen empujando —**Docker + Nginx compartido + Node.js/Next.js compartido + Python/Django compartido + PostgreSQL compartido**— no solo es viable: **es exactamente la dirección correcta para el MVP**. La recomendación no es complicarla desde el día uno, sino endurecerla bien, cerrar fronteras con Gateway/Auth y agregar componentes únicamente cuando una necesidad real lo exija. citeturn44view7turn44view8turn44view1turn44view4

## Stack definitivo recomendado

### Veredicto ejecutivo

Mi recomendación final es **conservar** Docker, Docker Compose, Nginx, Next.js, Django, Django REST Framework, PostgreSQL y pgvector como columna vertebral; **migrar** de Redis a **Valkey** cuando aparezcan caché y colas; **subir** la base de Node.js del repositorio porque Node 20 ya está en **EOL** y Node recomienda usar solo versiones **Active LTS** o **Maintenance LTS** en producción; **subir** Python porque Python 3.10 ya está en fase **security fixes only** hasta octubre de 2026; y **actualizar** Nginx 1.24 porque ya figura como rama **legacy**, mientras la estable actual es 1.30.x. PostgreSQL 16 sí puede mantenerse, porque PostgreSQL soporta cada major durante cinco años y 16 sigue dentro de soporte. citeturn18view5turn18view6turn30search7turn31search0turn34search0

En una sola frase: **el stack correcto para MexIngSoft es monolitos modulares y servicios especializados sobre Django + Next.js + PostgreSQL, con Gateway único, y con capacidades adicionales entrando por etapas**. No recomiendo brincar temprano a microservicios puros, Kubernetes, RabbitMQ, Qdrant clusters, Airflow o múltiples motores de búsqueda, porque hoy aumentarían costo operativo antes de aumentar valor. Esa conclusión está alineada con la documentación del repo y con las recomendaciones oficiales de las herramientas evaluadas. citeturn44view7turn44view8turn18view4turn18view8turn34search3

### Matriz de decisión por tecnología

| Tecnología | Qué es y para qué sirve | Ventajas | Desventajas | Licencia / modelo | Recomendación | Etapa |
|---|---|---|---|---|---|---|
| Docker | Base de contenedorización del stack compartido. El proyecto Moby es Apache-2.0. citeturn26view0turn26view0 | Estándar, portable, ideal para single-host y despliegue progresivo. | No resuelve solo orquestación multi-host compleja. | Apache-2.0 en Moby. citeturn26view0 | **Mantener sin cambios.** | Inicial |
| Docker Compose | Herramienta para definir y correr aplicaciones multi-contenedor; simplifica servicios, redes y volúmenes en YAML y soporta single-host production. citeturn32search11turn32search5turn27view0 | Perfecto para el MVP de un solo servidor. | No es la mejor capa para HA multi-nodo. | Apache-2.0. citeturn27view0 | **Mantener sin cambios.** | Inicial |
| Nginx | Web server, reverse proxy, load balancer y API gateway ligero. La 1.24 ya aparece como legacy; la estable actual es 1.30.3. citeturn31search1turn31search0turn27view1 | Muy maduro, bajo consumo, excelente como borde compartido. | Configuración más manual que Traefik/Caddy. | BSD-2-Clause. citeturn27view1 | **Mantener**, pero **subir a 1.30.x estable**. | Inicial |
| Next.js | Framework React full-stack para las webs del ecosistema. citeturn18view4turn27view2 | SSR/SSG/híbrido, buena DX, consistente con la documentación del repo. | Si se abusa de server actions o lógica propia, se puede contaminar el frontend. | MIT. citeturn27view2 | **Mantener sin cambios.** | Inicial |
| Node.js | Runtime del frontend y tooling. Node recomienda producción solo sobre ramas LTS; Node 20 ya está EOL. citeturn18view5turn18view6turn28search19 | Ecosistema enorme, integración natural con Next.js. | El repo hoy está atrasado si sigue en Node 20. | MIT. citeturn28search8 | **Cambiar base a Node 22 LTS**; 24 LTS puede evaluarse después. | Inicial |
| Python | Runtime principal de APIs y procesamiento. Python 3.10 está en security-fixes-only hasta octubre de 2026. citeturn30search7turn30search20turn29search0 | Excelente para Django, OCR, documentos e IA. | 3.10 ya no es la mejor base nueva. | PSF License v2. citeturn29search0 | **Subir base a Python 3.12**. | Inicial |
| Django | Framework backend principal del ecosistema. citeturn18view7turn27view5 | Madurez, admin, ORM, seguridad y velocidad de desarrollo. | Puede volverse monolito desordenado si no se modulariza bien. | BSD-3-Clause. citeturn27view5 | **Mantener sin cambios.** | Inicial |
| Django REST Framework | Toolkit para construir APIs web en Django. citeturn18view8turn28search3 | Natural para Gateway y APIs compartidas. | Si todo se modela como CRUD simple, se queda corto en orquestación sin diseño extra. | Licencia visible en repo oficial. citeturn27view6 | **Mantener sin cambios.** | Inicial |
| PostgreSQL | Base de datos principal; potente, extensible y soportada 5 años por major. citeturn34search3turn34search0 | Una sola fuente de verdad para el MVP; excelente relación valor/operación. | No conviene convertirla en bus de colas, blob store y analytics masivo al mismo tiempo. | PostgreSQL License. citeturn34search7 | **Mantener en 16.x latest minor** por ahora. | Inicial |
| pgvector | Extensión de búsqueda vectorial para Postgres. citeturn18view10turn21view21 | Permite empezar RAG sin añadir otra base. | En gran escala vectorial puede quedarse corto frente a motores dedicados. | Licencia visible en repo oficial. citeturn25view0 | **Mantener** como primera opción vectorial. | Inicial tardía / Stage 2 |
| Redis | Cache / broker tradicional, pero Redis 8 usa tri-license RSAL/SSPL/AGPL. citeturn23view2 | Madurez técnica y ecosistema enorme. | La situación de licenciamiento lo vuelve peor opción para una base “open-source-first”. | RSAL/SSPL/AGPL en versiones recientes. citeturn23view2 | **No lo usaría en nuevas instalaciones propias**. | Descartado como nuevo estándar |
| Valkey | Datastore key/value BSD, respaldado por Linux Foundation; compatible con Redis OSS 7.2 y anteriores. citeturn35search2turn23view3turn35search0 | Más alineado con costo-control y stack propio. | Ecosistema algo más joven que Redis histórico, aunque ya muy compatible. | BSD-3-Clause. citeturn23view3 | **Nuevo estándar recomendado** para caché y broker liviano. | Stage 2 |
| Celery | Cola de tareas distribuida; task queue con scheduling y gran comunidad. citeturn18view12turn22view0 | Encaja perfecto con Django y el propio repo ya la anticipa para procesamiento pesado. | Requiere disciplina operativa en retries, idempotencia y monitoreo. | New BSD. citeturn22view0 | **Mantener**; backend en Valkey. | Stage 2 |
| MinIO | Object storage S3-compatible de alto rendimiento. citeturn20search7turn18view13 | Muy buena opción self-hosted para archivos. | Añade un servicio nuevo; innecesario si aún no existen uploads reales. | AGPL-3.0. citeturn20search7 | **Usarlo**, pero no desde el día uno. | Stage 2 |
| LlamaIndex | Framework para context augmentation, RAG y agentes sobre datos privados. citeturn39search3turn39search8 | Encaja con LexNova, DocuCore y Fiscora. | No debe entrar antes de tener bien resueltos documentos, permisos e índices. | Open source; docs y repo oficiales activos. citeturn39search0turn39search4 | **Mantener** como capa de orquestación de IA. | Stage 2 |
| OpenAI API | API comercial para modelos, embeddings, herramientas y vector stores. citeturn17search1turn40search8 | Calidad y time-to-value muy altos. | Costo variable y dependencia de proveedor externo. | API comercial. citeturn40search8 | **Usar selectivamente**, detrás de una abstracción interna. | Stage 2 |
| Ollama | Runtime local para modelos abiertos. citeturn21view15turn23view4 | Privacidad, control local y buen complemento de OpenAI. | Requiere CPU/GPU y no siempre iguala calidad/latencia SaaS. | MIT. citeturn23view4 | **Mantener**, pero solo cuando ya exista caso local claro. | Stage 3 |
| Prefect | Orquestación de workflows en Python. citeturn21view3turn22view3 | Mucho más simple que Airflow para el tipo de pipelines que ustedes realmente tendrán. | Es overhead si aún no existen pipelines cross-service reales. | Apache-2.0. citeturn22view3 | **Conservar como opción preferida**, no como obligación temprana. | Stage 3 |
| n8n | Plataforma de automatización visual con código e integraciones. citeturn21view4turn22view4turn19view13 | Excelente para integraciones externas, CRM, notificaciones, webhooks y tareas no core. | No debe alojar lógica transaccional crítica del negocio. | Sustainable Use / enterprise licensing. citeturn22view4 | **Sí**, pero solo para automatización periférica. | Stage 2 |
| LibreOffice Headless | Suite ofimática útil para conversiones sin UI. citeturn14view18turn23view9 | Muy útil para DocuCore/Fiscora cuando haya DOCX/XLSX/PDF reales. | Pesado para el MVP si aún no procesan archivos complejos. | GPL/LGPL/MPL múltiples. citeturn23view9 | **Agregar solo con carga documental real.** | Stage 2 |
| python-docx | Librería para leer/crear/actualizar DOCX. citeturn23view7 | Ligera y muy útil para plantillas simples. | No convierte bien todo el universo Office. | MIT. citeturn23view7 | **Sí**, muy recomendable en módulos documentales. | Stage 2 |
| docxtpl | Plantillas Jinja sobre DOCX. citeturn23view8 | Ideal para contratos, reportes y salidas reutilizables. | No reemplaza un motor documental completo. | LGPL-2.1. citeturn23view8 | **Sí**, complementar a python-docx. | Stage 2 |
| Tesseract OCR | OCR open source. citeturn19view0turn23view6 | Muy costo-eficiente para OCR base. | Baja cuando el layout es muy complejo o la calidad de imagen es mala. | Apache-2.0. citeturn23view6 | **Sí**, como OCR base self-hosted. | Stage 2 |
| Apache Tika | Extracción de texto y metadatos de miles de formatos. citeturn21view16turn23view5 | Gran valor para ingestión documental. | No sustituye OCR ni clasificación semántica. | Apache-2.0. citeturn23view5 | **Sí**, muy recomendable para DocuCore/Fiscora/LexNova. | Stage 2 |
| Typesense | Motor de búsqueda typo-tolerant, rápido, con filtros y sorting. citeturn21view2turn37search1turn37search18 | Muy adecuado para búsquedas comerciales y catálogos. | Licencia GPL, y una tecnología más a operar. | GPL en repositorio oficial. citeturn22view2 | **Motor de búsqueda recomendado** del ecosistema. | Stage 2 |
| Meilisearch | Search engine MIT con full-text, semantic e hybrid search. citeturn21view1turn37search0turn22view1 | Muy atractivo y simple, especialmente para hybrid search. | Duplicaría función si ya eliges Typesense. | MIT. citeturn22view1 | **No lo estandarizaría**; conservaría uno solo. | Descartado como estándar |
| Grafana | Observabilidad y visualización de métricas/logs/traces. citeturn21view5turn22view5 | Muy flexible; encaja con Prometheus y Loki. | Overkill en MVP. | AGPL-3.0. citeturn22view5 | **Sí**, pero después del MMR operativo. | Stage 3 |
| Prometheus | Monitoring y series temporales. citeturn21view6turn22view6 | Estándar para métricas backend/infra. | Requiere disciplina de instrumentation. | Apache-2.0. citeturn22view6 | **Sí**, junto con Grafana. | Stage 3 |
| Loki | Logs agregados, muy alineado con Grafana. citeturn21view7turn22view7 | Más simple y natural que ELK para este stack. | No necesario al día uno. | AGPL-3.0. citeturn22view7 | **Sí**, para centralizar logs cuando haya varios servicios. | Stage 3 |
| PostHog | Product analytics, flags, replay y más. citeturn21view8 | Muy potente para funnels de negocio. | Puede distraer si aún no hay tráfico o hipótesis que medir. | Licencia visible en repo oficial. citeturn22view8 | **Sí**, pero cuando ya haya usuarios reales. | Stage 3 |
| Sentry | Error tracking y distributed tracing. citeturn19view8turn36search10 | Gran DX, muy maduro. | Self-hosted es pesado: mínimo 4 CPU, 16 GB RAM + 16 GB swap. citeturn36search0 | Fuente disponible / SaaS, según modalidad. citeturn22view9turn36search2 | **SaaS sí; self-hosted no lo priorizaría**. | Stage 2 opcional / Stage 3 |
| GlitchTip | Error tracking open source compatible con SDKs de Sentry; Docker-friendly. citeturn16search0turn16search6turn16search9 | Mucho más alineado con self-host barato. | Ecosistema menor que Sentry. | Open source; frontend MIT; backend abierto. citeturn16search8turn16search9 | **Mejor opción self-hosted** si quieren todo propio. | Stage 3 |
| GitHub Actions | CI/CD y automatización en GitHub. citeturn19view9turn21view0 | Debe entrar desde el día uno. | Si se sobrecarga con despliegues complejos, también exige disciplina. | Servicio GitHub. citeturn19view9 | **Obligatorio desde el inicio.** | Inicial |
| RabbitMQ | Broker de mensajería y streaming maduro. citeturn41search5turn41search4 | Excelente si luego necesitan colas complejas, streams o multi-protocolo. | Demasiado para el MVP frente a Valkey+Celery. | Apache-2.0 / MPL-2.0. citeturn23view0 | **Diferir** hasta necesidad clara. | Stage 3 o 4 |
| Qdrant | Vector DB dedicada, AI-native. citeturn33search13turn23view1 | Mejor que pgvector cuando el vector search ya domina la carga. | Extrae otra base operativa antes de ser necesaria. | Apache-2.0. citeturn23view1 | **Diferir**; primero pgvector. | Stage 3 |
| Open WebUI | UI self-hosted para operar modelos con Ollama/OpenAI. citeturn25view1turn21view22 | Muy útil como consola interna cuando adopten modelos locales. | No aporta valor al MVP de producto. | Licenciamiento múltiple propio del proyecto. citeturn25view1 | **Nueva sugerencia útil**, solo para operación interna de IA. | Stage 3 |

### Tecnologías descartadas o diferidas

No recomiendo estandarizar **Redis** como nueva base por el cambio de licenciamiento reciente y porque **Valkey** ofrece una ruta más congruente con un ecosistema “propio” y open-source-first, además de una migración corta desde Redis OSS 7.2. Tampoco estandarizaría **Meilisearch** junto con **Typesense**, porque operar dos motores de búsqueda para casos muy parecidos aumenta costo sin una ganancia proporcional. **RabbitMQ**, **Qdrant**, **Airflow**, **Dagster**, **Kibana**, **SeaweedFS**, **Traefik** y **Caddy** no están rechazados por malos; simplemente **no ganan todavía** frente a la simplicidad exigida para el arranque. citeturn23view2turn35search0turn23view3turn21view2turn37search1turn37search0turn41search5turn33search13turn42search0turn24view9turn32search16turn21view28

## Comparativas técnicas clave

| Comparativa | Hallazgo principal | Recomendación para MexIngSoft |
|---|---|---|
| Redis vs Valkey | Redis 8 opera bajo tri-license RSAL/SSPL/AGPL, mientras Valkey es BSD, respaldado por Linux Foundation y compatible con Redis OSS 7.2/anteriores. citeturn23view2turn35search2turn35search0 | **Valkey gana** para nuevos despliegues. |
| Meilisearch vs Typesense | Meilisearch CE es MIT y ofrece full-text/semantic/hybrid search; Typesense prioriza typo tolerance, filtros y baja latencia para búsquedas comerciales. citeturn37search0turn37search7turn37search1turn37search18 | **Typesense gana** para comercio, catálogos y búsqueda tolerante a errores; Meilisearch solo si el caso dominante fuera hybrid search documental. |
| Celery vs Dramatiq vs Huey | Celery es la cola distribuida más madura y con gran comunidad; Dramatiq enfatiza simplicidad, confiabilidad y performance; Huey es deliberadamente ligera. citeturn18view12turn22view0turn38view0turn24view6 | **Celery gana** para el estándar del ecosistema; Dramatiq es segunda opción si se quisiera máximo minimalismo; Huey solo para apps muy pequeñas. |
| Prefect vs Dagster vs Airflow | Prefect se presenta como orquestación resiliente en Python; Dagster como plataforma para data assets; Airflow como plataforma para author/schedule/monitor workflows. citeturn21view3turn22view3turn24view3turn21view25turn38view2 | **Prefect gana** para MexIngSoft cuando realmente aparezcan workflows cross-service; Dagster y Airflow son más pesados para el contexto actual. |
| pgvector vs Qdrant | pgvector permite vector search dentro de Postgres; Qdrant es una vector DB dedicada para semantic search y RAG. citeturn18view10turn33search13turn23view1 | **pgvector gana primero** por simplicidad y reutilización de Postgres; **Qdrant** entra solo cuando el vector search sea un pilar operativo. |
| Grafana vs Kibana | Grafana está orientado a observabilidad composable con múltiples fuentes; Kibana está estrechamente centrado en datos almacenados en Elasticsearch. citeturn21view5turn42search0turn42search8 | **Grafana gana** como estándar por menor acoplamiento al stack. |
| Sentry vs GlitchTip | Sentry entrega una experiencia muy madura, pero su self-host mínimo oficial ya es pesado; GlitchTip es open source, compatible con SDKs de Sentry y fácil de correr con Docker. citeturn36search0turn36search10turn16search0turn16search6turn16search9 | **GlitchTip gana** si desean self-host; **Sentry SaaS** gana si aceptan un servicio externo. |
| MinIO vs SeaweedFS | MinIO es S3-compatible y de alto rendimiento; SeaweedFS está diseñado para billones de archivos y escalado horizontal muy agresivo. citeturn20search7turn21view30turn24view9 | **MinIO gana** para la mayoría de los casos del ecosistema; SeaweedFS solo si llegan a escala extrema de archivos pequeños. |
| Nginx vs Caddy vs Traefik | Nginx sigue siendo el reverse proxy más sobrio y maduro; Caddy destaca por automatic HTTPS; Traefik destaca por autodiscovery y soporte nativo a orquestadores y Docker. citeturn31search1turn21view28turn32search16turn32search4 | **Nginx gana** para el MVP y el single-host inicial; **Traefik** solo cuando haya autodiscovery real o Kubernetes; **Caddy** no gana aquí porque ustedes ya tienen estándar documental en Nginx. |

Roadmap de implementación por etapas
Etapa inicial
La etapa inicial debe incluir solo lo indispensable para arrancar y validar negocio real. Mi stack mínimo recomendado es este:

Componente	Decisión	Por qué entra aquí
Docker + Compose	Sí	La documentación del repo ya los define como base canónica del stack compartido y Compose soporta despliegues de producción en single-host. 
Nginx compartido	Sí	Ya es el borde estándar del ecosistema y basta para routing, proxy y dominios locales/remotos iniciales. 
Node.js compartido + Next.js	Sí	Todas las webs del ecosistema se apoyan en esta frontera. 
Python compartido + Django + DRF	Sí	Son la base canónica de Gateway y APIs del dominio. 
PostgreSQL compartido	Sí	Debe ser la única base principal al inicio. 
Gateway General	Sí	Toda web nueva debe pasar por Gateway; el frontend no debe hablar ni con Auth ni con Core. 
Auth	Sí	El estándar del ecosistema obliga que cualquier panel, cuenta, compra o ruta privada pase por Auth vía Gateway. 
GitHub Actions	Sí	CI mínimo desde el día uno para lint, tests, build y smoke deploy. 
Monitoreo mínimo	Sí, pero austero	stdout/stderr, logs estructurados JSON, healthchecks, rotación de logs, backups de Postgres y alertas sencillas. No hace falta levantar todavía toda la torre Prometheus/Grafana/Loki. Esa parte es una recomendación operativa basada en la comparación oficial entre herramientas. 
Almacenamiento de archivos	No como servicio dedicado	En el MVP, usar volúmenes locales del host para archivos si realmente existen uploads. MinIO puede esperar mientras el sistema siga siendo single-host y sin gran volumen documental. 

Lo que no es indispensable desde el primer día es igualmente importante: no metería aún Valkey, Celery, MinIO, OCR, motores de búsqueda, IA, Qdrant, RabbitMQ, Prefect ni observabilidad completa, salvo que el primer proyecto público lo exija de inmediato. El principio rector aquí es una sola base, un solo gateway, un solo borde y el mínimo de servicios auxiliares. 

Etapa de valor operativo
La segunda etapa debe empezar cuando el sistema ya procese trabajo real y el MVP genere fricción visible. Aquí sí recomiendo incorporar Valkey + Celery para tareas asíncronas; MinIO para archivos; el stack documental de Tika + Tesseract + LibreOffice Headless + python-docx + docxtpl para DocuCore, Fiscora y LexNova; Typesense para catálogos, refacciones y comercio; pgvector + LlamaIndex + OpenAI API para RAG y búsqueda semántica donde sí aporte valor; y n8n para automatizaciones de borde como CRM, mensajería, notificaciones y sincronizaciones con terceros. Todo esto tiene encaje documental y técnico claro, pero solo después de que existan procesos reales que justifiquen su operación. 

Etapa de crecimiento
La tercera etapa es donde recomiendo meter Prometheus + Grafana + Loki para observabilidad completa; PostHog para producto/marketing analytics; Ollama y Open WebUI para pruebas o operaciones locales de IA; Prefect si aparecen pipelines transversales serios; GlitchTip como error tracking self-hosted o Sentry SaaS si prefieren menos operación; y, de manera selectiva, Qdrant o RabbitMQ si la carga semántica o de mensajería ya no cabe cómodamente en pgvector y Valkey/Celery. Ese es el momento donde cada servicio nuevo sí empieza a pagar su costo operativo. 

Etapa empresarial
La cuarta etapa debe existir solo cuando haya requerimientos reales de alta disponibilidad, múltiples servidores, escalado horizontal, colas robustas, vector search de gran escala o muchos equipos desplegando en paralelo. Recién ahí tiene sentido evaluar Traefik por autodiscovery con orquestadores, SeaweedFS para horizontabilidad extrema en archivos, clusters de Qdrant, clusters de RabbitMQ, y eventualmente una plataforma multi-host tipo Kubernetes. Antes de eso, introducir esta complejidad sería prematuro.

Arquitectura por proyecto
Proyecto	Tecnologías obligatorias	Tecnologías opcionales	Tecnologías futuras	Servicios compartidos / propios	Recomendación concreta
LexNova	Next.js, Gateway, Auth, API.PY.DJANGO.LexNova, PostgreSQL. 
pgvector, DocuCore/Document, Valkey+Celery.	LlamaIndex, OpenAI API, MinIO, Ollama.	Compartidos: Gateway, Auth, PostgreSQL. Propio: API LexNova.	Mantener LexNova como dominio legal propio y consumir todo lo transversal por Gateway; análisis jurídico y RAG solo después de estabilizar casos, expedientes y permisos. 
Refapart	Next.js, Gateway, Auth, API.PY.DJANGO.RefaPart, JobCron, PostgreSQL. 
Typesense, Valkey+Celery, n8n, MinIO.	IA para normalización de piezas, recomendadores, matching proveedor-demanda.	Compartidos: Gateway, Auth, JobCron, Address. Propio: API comercial REFAPART.	Éste es uno de los proyectos donde Typesense entra antes que en otros, porque la propia doc habla de búsqueda rápida y búsqueda tolerante a errores. 
JobCron	Django, DRF, PostgreSQL, Gateway, Auth, módulos core de catálogo, pricing, ventas, reglas. 
Valkey+Celery, PostHog, Grafana stack.	RabbitMQ, Prefect, Qdrant si el ERP centraliza flujos avanzados.	Compartidos: prácticamente todos. Propio: ERP central.	Debe seguir siendo el núcleo compartido; no duplicar APIs core por proyecto. 
DocuCore	Next.js, Gateway, API DocuCore, API Document, PostgreSQL. 
Tika, Tesseract, python-docx, docxtpl, Valkey+Celery.	MinIO, pgvector, LlamaIndex, OpenAI API, Ollama.	Compartidos: Gateway, PostgreSQL. Propios: DocuCore + Document.	Es el proyecto que justifica antes el stack documental; aquí sí conviene consolidar OCR, parsing y jobs reutilizables. 
Fiscora	Next.js, Gateway, API Fiscora, API Fiscal, API Document, PostgreSQL. 
Valkey+Celery, Tika, Tesseract, MinIO.	pgvector, LlamaIndex, OpenAI API para explicaciones fiscales y búsquedas semánticas internas.	Compartidos: Gateway, Fiscal, Document. Propio: Fiscora.	Debe explotar al máximo capacidades compartidas de Fiscal y Document; no necesita stack extra hasta que haya cargas reales de CFDI/documentos. 
Universal POS	No encontré un documento canónico propio en la rama revisada; por eso esta asignación es una inferencia a partir de JobCron, Pagora, Stockara y PhoneShop. 
Next.js PWA, Gateway, Auth, APIs de Sales/Inventory/Payments/POS.	Kotlin para Android POS dedicado y Swift si el canal iOS realmente lo exige.	Compartidos: JobCron, Stockara, Pagora, Gateway, Auth. Propio: API POS delgada solo si el flujo lo pide.	Empezaría como web/PWA Next.js sobre JobCron; solo migraría a nativo cuando hardware, offline real o integración profunda lo exijan.
TecnoTelec	Next.js, Gateway, PostgreSQL, catálogo/precios/cotización desde APIs compartidas. 
Typesense, n8n, MinIO.	API propia de soluciones si el ensamblado dinámico se vuelve complejo.	Compartidos: Gateway, JobCron core. Propio: inicialmente solo web; API propia después.	La doc es clara: vender soluciones y proyectos, no simple marketplace; por eso conviene exprimir primero el core compartido y abrir API propia después. 
Imagrafity	Next.js, Gateway, API Imagrafity, PostgreSQL. 
MinIO, Valkey+Celery, Typesense si el catálogo crece.	Pipeline de render/archivos, integración con producción y logística, IA para asistencia creativa.	Compartidos: Gateway, PostgreSQL, luego Document/Storage y JobCron. Propio: API Imagrafity.	El MVP puede vivir con catálogo/editor/preview/cotización; uploads, producción física y pagos reales ya están documentados como fuera de alcance. 
MexIngSoft	Next.js corporativo, PostgreSQL y, cuando exista panel privado, Gateway y Auth. 
PostHog, n8n, GlitchTip/Sentry SaaS.	CRM/lead scoring, cotizaciones integradas con JobCron.	Compartidos: Gateway/Auth cuando exista admin real. Propio: web corporativa.	La web corporativa puede seguir ligera al principio; el backend propio entra cuando el sitio deje de ser solo marketing y capture operación. 
PhoneShop	Next.js, Gateway, catálogo, pricing, inventory, sales, POS y PostgreSQL. 
Typesense, n8n, Valkey+Celery, MinIO para imágenes/servicios.	API propia para reparaciones/soporte si crece el flujo de servicio técnico.	Compartidos: JobCron core, Stockara, Pagora, Gateway/Auth. Propio: web/canal y luego API de servicio.	Aquí sí tiene sentido que productos como teléfonos/accesorios sean el eje principal; comparte mucho con POS y con catálogo comercial. 

Arquitectura final del ecosistema, dependencias y prioridades
La arquitectura lógica recomendada para todo MexIngSoft queda así: el usuario entra siempre por una web Next.js; Nginx hace de borde compartido; el frontend habla solo con el Gateway Django; el Gateway enruta a Auth, APIs compartidas del ERP o APIs especializadas por proyecto; todo persiste primero en PostgreSQL; y los servicios auxiliares se conectan lateralmente solo cuando son necesarios. Esa forma no es una invención nueva: es la síntesis más fiel entre la documentación del repositorio y la validación técnica del stack actual. 

text
Copiar
Usuarios
   ↓
Webs Next.js
   ↓
Nginx compartido
   ↓
API.PY.DJANGO.Gateway
   ↓
┌─────────────────────────────────────────────────────────────┐
│ APIs compartidas                                            │
│ Auth | Catalog | Pricing | Sales | Inventory | Address     │
│ Document | Fiscal | Payments | Rules | otros módulos core  │
└─────────────────────────────────────────────────────────────┘
   ↓
┌─────────────────────────────────────────────────────────────┐
│ APIs especializadas cuando sí hagan falta                   │
│ LexNova | Refapart | Fiscora | Imagrafity | POS | otras    │
└─────────────────────────────────────────────────────────────┘
   ↓
PostgreSQL compartido
   ↘ pgvector

Servicios laterales por etapa:
- Valkey → caché / broker
- Celery → jobs y procesamiento pesado
- MinIO → objetos/archivos
- Typesense → búsqueda comercial
- Tika / Tesseract / LibreOffice / python-docx / docxtpl → documentos
- LlamaIndex + OpenAI API / Ollama → IA y RAG
- n8n / Prefect → automatización y pipelines
- Prometheus / Grafana / Loki / GlitchTip o Sentry → observabilidad
Dependencias entre servicios



Dependencias entre servicios
Servicio	Depende de	Usado por	Nota
Nginx compartido	Docker/Compose	Todas las webs y APIs expuestas	Debe seguir siendo el único borde al inicio. 
Gateway General	Django, DRF, Auth, APIs de dominio	Todas las webs con cuenta/panel o UX privada	Es la frontera obligatoria del ecosistema. 
Auth	PostgreSQL	Gateway y todos los proyectos con sesión	No debe exponerse directo al frontend. 
PostgreSQL	Docker volume y backups	Todo el ecosistema	Una sola base principal en el MVP. 
Valkey	Docker/Compose	Celery, caché de APIs, notificaciones	Entra cuando aparezcan jobs/caché reales. 
Celery	Django + Valkey	DocuCore, Fiscora, Imagrafity, Jobs ERP	El propio repo ya lo anticipa para procesamiento pesado fuera del MVP. 
MinIO	Docker/Compose	DocuCore, Fiscora, LexNova, Imagrafity	Para archivos y blobs, no para el día uno. 
Typesense	Docker/Compose	REFAPART, TecnoTelec, PhoneShop, Imagrafity	Motor estándar de búsqueda comercial. 
Document stack	Tika, Tesseract, LibreOffice, python-docx, docxtpl	DocuCore primero; luego Fiscora y LexNova	Debe centralizarse, no duplicarse. 
IA stack	pgvector, LlamaIndex, OpenAI API, Ollama	LexNova, DocuCore, Fiscora y quizá REFAPART	Primero provider abstraction; luego casos de uso. 
Observabilidad	Prometheus, Grafana, Loki, GlitchTip/Sentry	Todas las APIs y workers	No desde el día uno; sí desde crecimiento real. 

Riesgos técnicos
El riesgo más serio no es “elegir mal una tecnología nueva”; es romper la frontera del Gateway y permitir que los frontends hablen directo con Auth o Core. El repo es muy claro en que eso no debe pasar. El segundo riesgo es arrancar con runtimes atrasados: Node 20 ya está fuera de soporte y Python 3.10 ya va de salida. El tercero es sobrecargar PostgreSQL antes de introducir servicios auxiliares adecuados. El cuarto es meter lógica crítica en n8n en lugar de dejarla en APIs versionadas. El quinto es duplicar stacks —por ejemplo, Meilisearch y Typesense a la vez, o pgvector y Qdrant sin necesidad real—. 

Estrategia de escalabilidad a tres y cinco años
La ruta razonable es esta. Primer tramo: single-host robusto con Docker Compose, Gateway único, PostgreSQL único, CI básico y backups fuertes. Segundo tramo: separar trabajo pesado a Celery/Valkey, mover archivos a MinIO y habilitar Typesense/pgvector donde sí paguen su costo. Tercer tramo: agregar observabilidad integral, pipelines selectivos, y operación híbrida de IA con OpenAI/Ollama. Cuarto tramo: solo si el tamaño del negocio lo exige, dividir almacenamiento, mensajería, vector search y despliegue multi-host con componentes clusterizables. Esa ruta reduce costo inicial sin cerrar la puerta al crecimiento. 

Recomendaciones finales priorizadas
Prioridad	Recomendación	Impacto	Costo de implementación
Alta	Congelar el estándar arquitectónico: frontend solo por Gateway; Auth nunca directo; Postgres como única base principal al inicio. 
Muy alto	Bajo
Alta	Actualizar runtimes base a Node 22 LTS, Python 3.12 y Nginx 1.30.x. 
Muy alto	Bajo
Alta	Arrancar el MVP solo con Docker, Compose, Nginx, Next.js, Django/DRF, PostgreSQL, Gateway, Auth y GitHub Actions. 
Muy alto	Bajo
Media alta	Estandarizar Valkey en lugar de Redis para caché y broker futuros. 
Alto	Bajo
Media alta	Introducir Celery + Valkey + MinIO cuando aparezcan jobs y archivos reales. 
Alto	Medio
Media	Elegir un solo motor de búsqueda: Typesense como estándar comercial. 
Alto	Medio
Media	Centralizar todo el stack documental en DocuCore/Document y reutilizarlo desde Fiscora y LexNova. 
Alto	Medio
Media	Diseñar una abstracción interna de IA para poder alternar OpenAI y Ollama sin reescribir producto. 
Alto	Medio
Baja por ahora	Diferir RabbitMQ, Qdrant, Airflow, Dagster, SeaweedFS, Traefik y Kubernetes hasta que exista necesidad demostrable. 
Evita complejidad	Muy bajo

Preguntas abiertas y límites
Hay un punto que sí debo marcar con transparencia: no encontré en la rama revisada un documento canónico específico para “Universal POS”. Por eso la arquitectura de ese proyecto la traté como una inferencia de alta probabilidad a partir de JobCron, Stockara, Pagora y PhoneShop. Si después aparece un documento oficial de POS dentro del repo, conviene alinear esa parte del roadmap con ese contrato canónico. 

Si reduzco todo el informe a una decisión única, sería esta: empiecen con un ecosistema shared-services muy disciplinado sobre Django + Next.js + PostgreSQL, fortalezcan Gateway/Auth, y hagan que cada servicio nuevo tenga que “ganarse” su lugar por necesidad operativa real. Esa es la ruta más barata, más mantenible y más coherente con la documentación actual de MexIngSoft. 
