# LexNova legal domain research

## Estado

ACTIVE

## Objetivo

Definir la investigacion juridica inicial que debe guiar el modelo de datos de
LexNova para materias, procedimientos, documentos, actores, autoridades, normas,
plazos, evidencia, IA y revision humana.

Este documento complementa:

```text
Docs/02_projects/lexnova/legal-process-data-model.md
```

No reemplaza el modelo implementado en `apps/legal_workspace`. Lo extiende como
roadmap documental para reducir repeticion y permitir que LexNova clasifique,
relacione y analice expedientes de distintas materias con trazabilidad legal.

## Regla de alcance

LexNova debe modelar el caso como unidad de trabajo y el procedimiento como
unidad juridica flexible:

```text
LegalCase
  -> LegalCaseProcedure
  -> LegalProcedureStage
  -> LegalDocument / LegalEvidence / LegalDeadline / LegalEvent
```

Un documento debe poder:

- Estar guardado una sola vez.
- Relacionarse con varios procedimientos.
- Cambiar de clasificacion.
- Tener versiones.
- Conservar origen, hash, cadena de custodia y usuario responsable.
- Tener analisis de IA y revision humana separada.

Una persona debe poder tener varios roles en el mismo caso o en casos distintos:

```text
Person
  -> LegalCaseParty
  -> LegalActorType
```

Las normas, articulos, reformas, criterios, tesis y jurisprudencia deben ser
versionables. Ningun analisis legal debe depender de un texto normativo sin
fecha de vigencia.

## Materias iniciales

| Codigo | Materia | Fuente base | Estado LexNova |
|---|---|---|---|
| CRIMINAL | Penal | CNPP, Ley Nacional de MASC penal | Cubierta parcialmente por modelos penales y `legal_workspace`. |
| FAMILY | Familiar | Codigo Nacional de Procedimientos Civiles y Familiares | Cubierta por modelo flexible; falta catalogo especializado. |
| CIVIL | Civil | Codigo Nacional de Procedimientos Civiles y Familiares | Cubierta por modelo flexible; falta catalogo especializado. |
| COMMERCIAL | Mercantil | Codigo de Comercio y reglas procesales aplicables | Pendiente de investigacion fina. |
| AGRARIAN | Agrario | Ley Agraria y Tribunales Agrarios | Cubierta por modelo flexible; falta catalogo de autoridades agrarias. |
| ADMINISTRATIVE | Administrativo | LFPCA, LGRA y leyes organicas aplicables | Cubierta por modelo flexible; falta separar juicio contencioso y responsabilidades. |
| LABOR | Laboral | Ley Federal del Trabajo | Cubierta por modelo flexible; falta catalogo de audiencias y conciliacion. |
| TAX | Fiscal | CFF y LFPCA | Cubierta por modelo flexible; falta expediente fiscal, acto impugnado y credito. |
| CONSTITUTIONAL_AMPARO | Constitucional / amparo | Ley de Amparo | Cubierta parcialmente; falta version normativa y revisiones especializadas. |
| HUMAN_RIGHTS | Derechos humanos | Ley CNDH y leyes estatales | Cubierta por modelo flexible; falta catalogo estatal por entidad. |

## Catalogo inicial de procedimientos

| Codigo | Materia | Procedimiento | Autoridad comun | Estado recomendado |
|---|---|---|---|---|
| INVESTIGATION_FOLDER | Penal | Carpeta de investigacion | Ministerio Publico / Fiscalia | `OPEN`, `JUDICIALIZED`, `CLOSED`. |
| CRIMINAL_COMPLAINT | Penal | Denuncia | Ministerio Publico | `RECEIVED`, `RATIFIED`, `REFERRED`. |
| CRIMINAL_QUERELLA | Penal | Querella | Ministerio Publico | `RECEIVED`, `RATIFIED`, `WITHDRAWN`. |
| INITIAL_HEARING | Penal | Audiencia inicial | Juez de control | `SCHEDULED`, `HELD`, `CONTINUED`. |
| BINDING_TO_TRIAL | Penal | Vinculacion a proceso | Juez de control | `GRANTED`, `DENIED`. |
| PRECAUTIONARY_MEASURE | Penal | Medidas cautelares | Juez de control | `REQUESTED`, `IMPOSED`, `MODIFIED`, `REVOKED`. |
| ORAL_TRIAL | Penal | Juicio oral | Tribunal de enjuiciamiento | `OPEN`, `IN_HEARING`, `JUDGMENT`. |
| CRIMINAL_APPEAL | Penal | Apelacion | Tribunal de alzada | `FILED`, `ADMITTED`, `RESOLVED`. |
| DIRECT_AMPARO | Amparo | Amparo directo | Tribunal colegiado | `FILED`, `ADMITTED`, `RESOLVED`. |
| DIRECT_AMPARO_REVIEW | Amparo | Revision de amparo directo | SCJN / tribunal competente | `FILED`, `ADMISSION_REVIEW`, `RESOLVED`. |
| INDIRECT_AMPARO | Amparo | Amparo indirecto | Juzgado de distrito | `FILED`, `SUSPENSION`, `CONSTITUTIONAL_HEARING`, `RESOLVED`. |
| INDIRECT_AMPARO_REVIEW | Amparo | Revision de amparo indirecto | Tribunal colegiado / SCJN | `FILED`, `ADMITTED`, `RESOLVED`. |
| AMPARO_COMPLAINT | Amparo | Queja | Organo revisor | `FILED`, `ADMITTED`, `RESOLVED`. |
| AMPARO_CLAIM | Amparo | Reclamacion | Organo jurisdiccional | `FILED`, `ADMITTED`, `RESOLVED`. |
| CIVIL_TRIAL | Civil | Juicio civil | Juzgado civil | `FILED`, `ANSWERED`, `EVIDENCE`, `JUDGMENT`. |
| FAMILY_TRIAL | Familiar | Juicio familiar | Juzgado familiar | `FILED`, `PROVISIONAL_MEASURES`, `EVIDENCE`, `JUDGMENT`. |
| COMMERCIAL_TRIAL | Mercantil | Juicio mercantil | Juzgado mercantil | `FILED`, `ANSWERED`, `EVIDENCE`, `JUDGMENT`. |
| AGRARIAN_TRIAL | Agrario | Juicio agrario | Tribunal Unitario Agrario | `FILED`, `HEARING`, `EVIDENCE`, `JUDGMENT`. |
| LABOR_CONCILIATION | Laboral | Conciliacion prejudicial | Centro de conciliacion | `REQUESTED`, `HEARING`, `AGREEMENT`, `NO_AGREEMENT`. |
| LABOR_TRIAL | Laboral | Juicio laboral | Tribunal laboral | `FILED`, `PRELIMINARY_HEARING`, `TRIAL_HEARING`, `JUDGMENT`. |
| ADMINISTRATIVE_TRIAL | Administrativo | Juicio contencioso administrativo | TFJA / tribunal local | `FILED`, `ANSWERED`, `EVIDENCE`, `JUDGMENT`. |
| TAX_REVIEW | Fiscal | Recurso o medio fiscal | SAT / autoridad fiscal / TFJA | `FILED`, `ADMITTED`, `RESOLVED`. |
| CNDH_COMPLAINT | Derechos humanos | Queja nacional | CNDH | `RECEIVED`, `QUALIFIED`, `INVESTIGATION`, `RECOMMENDATION`, `CONCLUDED`. |
| STATE_HR_COMPLAINT | Derechos humanos | Queja estatal | Comision estatal | `RECEIVED`, `QUALIFIED`, `INVESTIGATION`, `RECOMMENDATION`, `CONCLUDED`. |

## Catalogo inicial de documentos

| Codigo | Uso | Puede vincularse a |
|---|---|---|
| ID_DOCUMENT | Identificacion de persona | Caso, parte, representante. |
| POWER_OF_ATTORNEY | Representacion | Parte, abogado, procedimiento. |
| COMPLAINT_WRITING | Denuncia o queja inicial | Penal, derechos humanos. |
| QUERELLA_WRITING | Querella | Penal. |
| FACT_STATEMENT | Relato de hechos | Cualquier materia. |
| EVIDENCE_OFFER | Ofrecimiento de pruebas | Procedimiento y etapa. |
| HEARING_MINUTES | Acta de audiencia | Etapa, evento, plazo. |
| HEARING_AUDIO | Audio de audiencia | Evidencia, transcripcion. |
| HEARING_VIDEO | Video de audiencia | Evidencia, transcripcion. |
| EXPERT_REPORT | Dictamen pericial | Evidencia, actor perito. |
| AUTHORITY_REPORT | Informe de autoridad | Amparo, administrativo, derechos humanos. |
| CLAIMED_ACT | Acto reclamado o impugnado | Amparo, fiscal, administrativo. |
| SUSPENSION_REQUEST | Solicitud de suspension | Amparo indirecto. |
| JUDGMENT | Sentencia o laudo | Procedimiento, resolucion. |
| APPEAL_WRITING | Medio de impugnacion | Apelacion, revision, queja. |
| HUMAN_RIGHTS_RECOMMENDATION | Recomendacion | Derechos humanos. |
| SETTLEMENT_AGREEMENT | Convenio o acuerdo | MASC, laboral, civil, familiar. |
| UNKNOWN | Documento no clasificado | Bandeja de clasificacion. |

## Actores

| Codigo | Rol |
|---|---|
| CLIENT | Cliente de LexNova. |
| VICTIM | Victima u ofendido. |
| ACCUSED | Imputado, acusado o sentenciado. |
| PLAINTIFF | Actor o promovente. |
| DEFENDANT | Demandado. |
| COMPLAINANT | Quejoso. |
| THIRD_PARTY | Tercero interesado o tercero. |
| LAWYER | Abogado particular. |
| PUBLIC_DEFENDER | Defensor publico. |
| LEGAL_ADVISOR | Asesor juridico. |
| PROSECUTOR | Ministerio Publico o fiscal. |
| JUDGE | Juez. |
| MAGISTRATE | Magistrado. |
| COURT_CLERK | Secretario, actuario o funcionario judicial. |
| EXPERT | Perito. |
| WITNESS | Testigo. |
| AUTHORITY | Autoridad responsable o demandada. |
| HUMAN_RIGHTS_VISITOR | Visitador o personal de organismo de derechos humanos. |
| MEDIATOR | Mediador, conciliador o facilitador. |

## Matriz actor-responsabilidad

| Actor | Responsabilidades registrables |
|---|---|
| Cliente | Autorizar carga, consultar avances, aportar documentos, aprobar estrategia visible. |
| Abogado | Crear caso, clasificar documentos, presentar escritos, validar plazos. |
| Analista | Extraer hechos, detectar contradicciones, proponer clasificacion. |
| Revisor | Aprobar resultados de IA, confirmar riesgos, cerrar hallazgos. |
| Autoridad | Emitir actos, informes, resoluciones, constancias y notificaciones. |
| Organo jurisdiccional | Admitir, acordar, celebrar audiencia, dictar sentencia o resolucion. |
| Perito | Emitir dictamen, comparecer y aclarar. |
| Testigo | Declarar y comparecer. |
| Organismo de derechos humanos | Recibir queja, investigar, conciliar, recomendar o concluir. |

## Matriz procedimiento-documento

| Procedimiento | Documentos minimos |
|---|---|
| Carpeta de investigacion | Denuncia/querella, identificacion, entrevistas, datos de prueba, acuerdo de inicio, determinaciones. |
| Audiencia inicial | Solicitud, acta, audio/video, resolucion de situacion juridica, medidas cautelares. |
| Juicio oral | Auto de apertura, pruebas admitidas, audios/videos, sentencia. |
| Apelacion | Escrito de agravios, resolucion impugnada, constancias, sentencia de alzada. |
| Amparo indirecto | Demanda, acto reclamado, autoridades, informe previo/justificado, suspension, sentencia. |
| Amparo directo | Demanda, sentencia reclamada, conceptos de violacion, informe, sentencia. |
| Revision de amparo | Recurso, resolucion recurrida, agravios, acuerdo de admision, resolucion. |
| Civil/familiar | Demanda, contestacion, pruebas, medidas provisionales cuando apliquen, sentencia. |
| Mercantil | Demanda, documentos base de la accion, contestacion, pruebas, sentencia. |
| Agrario | Demanda, documentos agrarios, acta de audiencia, pruebas, sentencia. |
| Laboral | Constancia de conciliacion o no conciliacion, demanda, contestacion, pruebas, sentencia. |
| Administrativo/fiscal | Acto impugnado, demanda, expediente administrativo, contestacion, pruebas, sentencia. |
| Derechos humanos | Escrito de queja, identificacion, relato, evidencias, informes de autoridad, recomendacion o cierre. |

## Matriz etapa-plazo

Los plazos deben modelarse como datos configurables, no como constantes en
codigo:

```text
LegalDeadline
- ProcedureTypeId
- StageId
- LegalBasisId
- TriggerEventCode
- CalendarType
- Amount
- Unit
- IsBusinessDays
- JurisdictionScope
- ValidFrom
- ValidTo
```

| Procedimiento | Evento detonante | Plazo |
|---|---|---|
| Amparo indirecto | Conocimiento del acto | `PENDIENTE_DE_VALIDAR_POR_SUPUESTO`. |
| Amparo directo | Notificacion de sentencia | `PENDIENTE_DE_VALIDAR_POR_SUPUESTO`. |
| Revision de amparo | Notificacion de resolucion | `PENDIENTE_DE_VALIDAR_POR_SUPUESTO`. |
| Fiscal/administrativo | Notificacion de acto | `PENDIENTE_DE_VALIDAR_SEGUN_LEY_ESPECIAL`. |
| Derechos humanos nacional | Hecho presuntamente violatorio | `PENDIENTE_DE_VALIDAR_EXCEPCIONES`. |
| Laboral | Acto laboral o constancia de conciliacion | `PENDIENTE_DE_VALIDAR_SEGUN_ACCION`. |

La razon de dejar estos plazos pendientes es evitar codificar reglas
incompletas. Cada plazo requiere norma, articulo, version, supuesto,
interrupciones, suspensiones y dias inhabiles.

## Propuesta de modelo optimizado

### Catalogos juridicos

| Tabla propuesta | Estado | Relacion con modelo actual |
|---|---|---|
| `LegalMatter` | Implementado | Normaliza materia de `LegalProceeding.ProceedingType`. |
| `LegalProcedureType` | Implementado | Reemplaza enums rigidos por catalogo versionable. |
| `LegalProcedureStage` | Implementado | Permite etapas por tipo de procedimiento. |
| `LegalDocumentType` | Implementado | Normaliza `DeclaredDocumentType` y `DetectedDocumentType`. |
| `LegalActorType` | Implementado | Normaliza roles de personas. |
| `LegalAuthority` | Implementado sin semilla estatal | Autoridades administrativas, fiscales, MP, organismos. |
| `LegalCourt` | Implementado sin semilla estatal | Organos jurisdiccionales y competencia. |

### Expediente y relacionamiento

| Tabla propuesta | Estado | Regla |
|---|---|---|
| `LegalCase` | Implementado parcialmente | Ya existe en `legal_workspace`. |
| `LegalCaseProcedure` | Implementado parcialmente | Equivale a `LegalProceeding`; conviene renombrar solo si se acepta migracion. |
| `LegalCaseParty` | Existe en modelo previo | Requiere integrarse a roles flexibles. |
| `LegalRepresentative` | Existe por modulos penales | Conviene normalizar para todas las materias. |
| `LegalDocument` | Implementado como `DigitalAsset` | Mantener archivo unico. |
| `LegalDocumentVersion` | Implementado | Versionar archivo, OCR, texto y metadata. |
| `LegalDocumentRelation` | Implementado | Extiende `LegalProceedingContent` a relacion documento-documento. |
| `LegalEvidence` | Existe en `apps.evidence` | Integrar con `DigitalAsset`. |
| `EvidenceChainOfCustody` | Implementado | Critico para audio, video, documentos y evidencias fisicas. |

### Normativa y criterios

| Tabla propuesta | Estado | Regla |
|---|---|---|
| `LegalNorm` | Implementado | Ley, codigo, reglamento, acuerdo. |
| `LegalNormVersion` | Implementado | Fecha DOF, vigencia, fuente oficial, hash. |
| `LegalArticle` | Implementado | Articulo dentro de norma. |
| `LegalArticleVersion` | Implementado | Texto vigente por periodo. |
| `LegalReform` | Implementado | Decreto de reforma y efectos. |
| `Jurisprudence` | Implementado | Fuente SCJN/SJF, registro, epoca, organo. |
| `Thesis` | Implementado | Tesis aislada o jurisprudencial. |
| `LegalCriterion` | Implementado | Criterios internos aprobados por revisor humano. |

### Operacion, IA y revision

| Tabla propuesta | Estado | Regla |
|---|---|---|
| `LegalDeadline` | Implementado sin plazos finales | Plazos versionados por norma y supuesto. |
| `LegalEvent` | Implementado como `TimelineEvent` | Mantener timeline por caso/procedimiento. |
| `LegalResolution` | Implementado | Resoluciones normalizadas por efecto. |
| `LegalRemedy` | Implementado | Medios de impugnacion disponibles. |
| `CaseRisk` | Implementado | Riesgo procesal, documental, probatorio, plazo. |
| `CaseTimeline` | Implementado parcialmente | Derivado de eventos. |
| `AIAnalysisResult` | Implementado | Extiende `DocumentAnalysis`/`EvidenceAnalysis`. |
| `HumanReview` | Implementado | Separar revision humana de resultado IA. |
| `DocumentClassificationHistory` | Implementado | Historial de clasificacion y reclasificacion. |

## Reglas para IA juridica

1. IA puede proponer clasificacion; no debe cerrar clasificacion final sin
   revision humana cuando afecte plazos, derechos o estrategia.
2. Todo resultado debe guardar modelo, version, prompt/template, fecha,
   documento origen, fragmento analizado y confianza.
3. Toda conclusion juridica debe guardar fuente normativa o criterio usado.
4. Las contradicciones deben quedar como hallazgos revisables.
5. La IA debe marcar documentos desconocidos como `UNKNOWN`, no forzar un tipo.
6. La IA documental para OCR, clasificacion, segmentacion e indice pertenece a
   la API documental reusable; LexNova la consume por Gateway y conserva la
   relacion con caso, expediente, seguimiento y revision humana.

## Riesgos

| Riesgo | Mitigacion |
|---|---|
| Codificar plazos incompletos | Guardar plazos como catalogo versionado con fuente y supuesto. |
| Duplicar documentos por procedimiento | Mantener `DigitalAsset` unico y relaciones multiples. |
| Perder vigencia normativa | Versionar normas, articulos, reformas y criterios. |
| Confundir actor con usuario | Separar usuario Auth, persona legal y rol procesal. |
| Usar IA sin control humano | Requerir `HumanReview` en decisiones sensibles. |
| Mezclar materia estatal y federal | Guardar `JurisdictionScope`, entidad federativa y autoridad. |
| Desconocer tipo documental | Bandeja `UNKNOWN` con historial de reclasificacion. |

## Roadmap documental y tecnico

1. Completar semilla estatal de autoridades, tribunales, organismos de
   derechos humanos y calendarios.
2. Validar y cargar plazos exactos por supuesto, excepcion y autoridad.
3. Definir ingestion oficial de jurisprudencia/tesis del SJF.
4. Exponer endpoints de escritura para carga, clasificacion y revision por
   Gateway cuando se cierre el contrato de permisos.
5. Construir panel web de reclasificacion, timeline y mapa de actores.

## Pendientes de investigacion

| Tema | Pendiente |
|---|---|
| Legislacion estatal | Levantar leyes procesales y de derechos humanos por entidad federativa. |
| Plazos por supuesto | Validar plazos de amparo, fiscal, laboral, civil/familiar y derechos humanos por norma y excepcion. |
| Mercantil | Completar catalogo de documentos y etapas por via ordinaria, oral, ejecutiva y especial. |
| Agrario | Completar catalogo de autoridades, organos y documentos agrarios. |
| Criterios SCJN | Definir ingestion oficial del SJF y versionado de tesis/jurisprudencia. |
| Dias inhabiles | Integrar calendario por autoridad, entidad y organo jurisdiccional. |
| OCR/storage | Definir proveedor, cifrado, retencion, hash y conservacion. |
| Document Intelligence | Cerrar contrato con `API.PY.DJANGO.Document` para OCR, segmentacion, indice JSON y PDF indexado opcional. |

## Fuentes oficiales consultadas

Consulta inicial realizada el 2026-05-18. Las fuentes deben revalidarse antes
de codificar reglas juridicas productivas.

| Fuente | Uso en LexNova | URL |
|---|---|---|
| Camara de Diputados - CNPP | Procedimiento penal, carpeta, audiencias, prueba y juicio oral. | `https://www.diputados.gob.mx/LeyesBiblio/pdf/CNPP.pdf` |
| Camara de Diputados - Ley Nacional de MASC penal | Acuerdos reparatorios, mediacion, conciliacion y junta restaurativa penal. | `https://www.diputados.gob.mx/LeyesBiblio/pdf/LNMASCMP.pdf` |
| Camara de Diputados - Codigo Nacional de Procedimientos Civiles y Familiares | Procedimientos civiles y familiares. | `https://www.diputados.gob.mx/LeyesBiblio/pdf/CNPCF.pdf` |
| Camara de Diputados - Ley General de MASC | Mecanismos alternativos no penales y administrativos. | `https://www.diputados.gob.mx/LeyesBiblio/pdf/LGMASC.pdf` |
| Camara de Diputados - Ley de Amparo | Amparo directo, indirecto, suspension, revision, queja y reclamacion. | `https://www.diputados.gob.mx/LeyesBiblio/pdf/Ley_Amparo.pdf` |
| Camara de Diputados - Ley Federal del Trabajo | Conciliacion y procedimiento laboral. | `https://www.diputados.gob.mx/LeyesBiblio/pdf/LFT.pdf` |
| Camara de Diputados - Ley Agraria | Juicio y documentos agrarios base. | `https://www.diputados.gob.mx/LeyesBiblio/pdf/LAgra.pdf` |
| Camara de Diputados - LFPCA | Juicio contencioso administrativo. | `https://www.diputados.gob.mx/LeyesBiblio/pdf/LFPCA.pdf` |
| Camara de Diputados - CFF | Actos fiscales, creditos, recursos y base fiscal. | `https://www.diputados.gob.mx/LeyesBiblio/pdf/CFF.pdf` |
| Camara de Diputados - LGRA | Responsabilidades administrativas y procedimientos sancionadores. | `https://www.diputados.gob.mx/LeyesBiblio/pdf/LGRA.pdf` |
| Camara de Diputados - Ley CNDH | Competencia y procedimiento nacional de queja/inconformidad. | `https://www.diputados.gob.mx/LeyesBiblio/pdf/LCNDH.pdf` |
| CNDH | Quejas, orientacion, inconformidades y visitadurias. | `https://www.cndh.org.mx/` |
| SCJN / SJF | Jurisprudencia, tesis y criterios. | `https://sjf2.scjn.gob.mx/` |
| Tribunales Agrarios | Organos agrarios y competencia especializada. | `https://www.tribunalesagrarios.gob.mx/` |

## Decision documental

La documentacion queda en dos niveles:

- `legal-process-data-model.md`: que existe hoy en base de datos y que modulo
  flexible usa LexNova.
- `legal-domain-research.md`: que debe existir para convertir investigacion
  juridica en catalogos, versionado normativo, plazos y reglas futuras.
- `document-intelligence.md`: que define la frontera entre LexNova y la API
  documental reusable para OCR, clasificacion, segmentacion, indice y revision
  humana.

Todo desarrollo posterior debe revisar ambos documentos antes de modificar
modelos, migraciones, endpoints o interfaz legal.
