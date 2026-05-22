# LexNova legal process data model

## Estado

ACTIVE

## Objetivo

Documentar el modelo de base de datos de LexNova para expedientes y procesos
legales, de forma que el desarrollo del API de dominio quede alineado con la
documentacion canonica del repositorio.

Este documento cubre el estado actual de:

- Carpetas de investigacion.
- Causas penales.
- Juicio oral.
- Apelaciones.
- Amparo directo.
- Amparo indirecto.
- Documentos, evidencia y analisis.
- Revision de amparo directo e indirecto.
- Quejas en derechos humanos estatal y nacional.

## Regla arquitectonica

Los datos de proceso legal viven en:

```text
Docker.API.PY/API.PY.DJANGO.LexNova
```

La web debe consumirlos por medio del gateway:

```text
WEB.NJ.NEXT.LexNova
  -> API.PY.DJANGO.LexNova.Gateway
  -> API.PY.DJANGO.LexNova
```

Auth conserva usuarios, roles, permisos y sesiones. LexNova conserva casos,
expedientes, documentos, evidencia, actuaciones y relaciones procesales.

## Cobertura actual

| Necesidad | Estado | Implementacion actual |
|---|---|---|
| Carpetas de investigacion | Cubierto | `apps.investigation_folder` |
| Causa penal | Cubierto | `apps.cause_penal` |
| Juicio oral | Cubierto | `apps.oral_trial` |
| Apelaciones | Cubierto | `apps.appeal` |
| Amparo indirecto | Cubierto | `apps.amparo.IndirectAmparo` |
| Amparo directo | Cubierto | `apps.amparo.DirectAmparo` |
| Conceptos de violacion | Cubierto | `apps.amparo.AmparoConcept` |
| Autoridades responsables | Parcial | `AmparoAuthority` solo esta ligado a `IndirectAmparo` |
| Suspension de amparo | Cubierto | `AmparoSuspension` para amparo indirecto |
| Documentos | Cubierto | `apps.documents` |
| Evidencia, audios, videos y transcripciones | Cubierto | `apps.evidence` |
| Analisis de documentos | Cubierto | `DocumentAnalysis` |
| Analisis de evidencia | Cubierto | `EvidenceAnalysis` |
| Revision de amparo directo | Cubierto en modelo flexible | `LegalWorkspace.LegalProceedings` con `DIRECT_AMPARO_REVIEW` |
| Revision de amparo indirecto | Cubierto en modelo flexible | `LegalWorkspace.LegalProceedings` con `INDIRECT_AMPARO_REVIEW` |
| Queja de derechos humanos estatal | Cubierto en modelo flexible | `LegalWorkspace.LegalProceedings` con `STATE_HUMAN_RIGHTS_COMPLAINT` |
| Queja de derechos humanos nacional | Cubierto en modelo flexible | `LegalWorkspace.LegalProceedings` con `NATIONAL_HUMAN_RIGHTS_COMPLAINT` |

## Modelo optimizado implementado

Para reducir repeticion entre carpetas, causas, juicios, apelaciones, amparos,
revisiones y quejas, se agrego un modulo normalizado:

```text
Docker.API.PY/API.PY.DJANGO.LexNova/apps/legal_workspace
```

Este modulo no elimina los modelos procesales existentes. Funciona como capa
flexible para carga documental, clasificacion, vinculacion y procesamiento
multimedia.

Tablas agregadas:

| Schema | Tabla | Uso |
|---|---|---|
| `Cases` | `LegalCases` | Asunto general del cliente. |
| `Cases` | `LegalCaseExternalIdentifiers` | NUC, toca, amparo, apelacion u otros numeros externos vinculados al expediente interno. |
| `Cases` | `CaseParticipants` | Personas/usuarios vinculados al expediente con rol, estado y alcances de acceso. |
| `Cases` | `CaseParticipantAuthorizations` | Autorizaciones explicitas entre participantes. |
| `Cases` | `LegalProceedings` | Proceso juridico flexible dentro del caso. |
| `Cases` | `LegalProceedingContents` | Segmento o contenido de un archivo vinculado a un proceso. |
| `Cases` | `TimelineEvents` | Linea de tiempo del caso o proceso. |
| `Cases` | `CaseAccessAuditEvents` | Historial de acceso a expediente, documentos y acciones sensibles. |
| `Documents` | `DigitalAssets` | Archivo unico: PDF, Word, texto, imagen, video o audio. |
| `Documents` | `CaseDocumentAccessPolicies` | Politicas de visibilidad por documento y participante. |
| `Documents` | `ExtractedFields` | Campos extraidos de contenido documental. |
| `Media` | `MediaConversions` | Conversiones como video a audio o PDF a texto. |
| `Media` | `Transcripts` | Transcripcion completa de un asset. |
| `Media` | `TranscriptSegments` | Segmentos por tiempo y hablante. |
| `Media` | `MediaProcessingLogs` | Logs de procesamiento multimedia/documental. |
| `Clients` | `ClientInvitations` | Invitaciones a clientes para acceder a casos. |
| `LegalCatalog` | `LegalMatters` | Materias juridicas iniciales. |
| `LegalCatalog` | `LegalProcedureTypes` | Catalogo versionable de procedimientos. |
| `LegalCatalog` | `LegalProcedureStages` | Etapas por tipo de procedimiento. |
| `LegalCatalog` | `LegalDocumentTypes` | Tipos documentales juridicos. |
| `LegalCatalog` | `LegalActorTypes` | Roles procesales y responsabilidades. |
| `LegalCatalog` | `LegalAuthorities` | Autoridades administrativas, fiscales, MP y organismos. |
| `LegalCatalog` | `LegalCourts` | Organos jurisdiccionales y competencia. |
| `LegalKnowledge` | `LegalNorms` | Normas, codigos, reglamentos y fuentes. |
| `LegalKnowledge` | `LegalNormVersions` | Versiones normativas por vigencia y fuente. |
| `LegalKnowledge` | `LegalArticles` | Articulos dentro de normas. |
| `LegalKnowledge` | `LegalArticleVersions` | Texto de articulos por periodo de vigencia. |
| `LegalKnowledge` | `LegalReforms` | Reformas y decretos. |
| `LegalKnowledge` | `Jurisprudences` | Jurisprudencia enlazable a hallazgos. |
| `LegalKnowledge` | `Theses` | Tesis aisladas o jurisprudenciales. |
| `LegalKnowledge` | `LegalCriteria` | Criterios internos revisados. |
| `LegalKnowledge` | `LegalDeadlines` | Plazos configurables por procedimiento, supuesto y norma. |
| `Documents` | `LegalDocumentVersions` | Versiones de documentos, OCR, hash y metadata. |
| `Documents` | `LegalDocumentRelations` | Relaciones documento-documento. |
| `Evidence` | `EvidenceUsages` | Uso reutilizable de una evidencia en casos, procedimientos o entidades relacionadas. |
| `Cases` | `LegalGraphRelations` | Relaciones juridicas directas, indirectas, probatorias, contextuales, derivadas o administrativas entre entidades. |
| `Documents` | `DocumentClassificationHistory` | Historial de clasificacion y reclasificacion. |
| `Cases` | `LegalResolutions` | Resoluciones normalizadas. |
| `Cases` | `LegalRemedies` | Medios de impugnacion vinculables. |
| `Cases` | `CaseRisks` | Riesgos procesales, documentales o probatorios. |
| `Reviews` | `AIAnalysisResults` | Resultados de IA con modelo, prompt, confianza y origen. |
| `Reviews` | `HumanReviews` | Revision humana separada del resultado de IA. |
| `Evidence` | `EvidenceChainOfCustody` | Eventos de cadena de custodia para assets. |

Tipos de proceso soportados:

```text
UNKNOWN
INVESTIGATION_FOLDER
CRIMINAL_CASE
ORAL_TRIAL
APPEAL
DIRECT_AMPARO
DIRECT_AMPARO_REVIEW
INDIRECT_AMPARO
INDIRECT_AMPARO_REVIEW
STATE_HUMAN_RIGHTS_COMPLAINT
NATIONAL_HUMAN_RIGHTS_COMPLAINT
```

Estados de clasificacion documental:

```text
PENDING_CLASSIFICATION
CLASSIFIED
RECLASSIFIED
NEEDS_REVIEW
REJECTED
```

Regla central:

```text
DigitalAssets guarda el archivo una sola vez.
LegalCases usa `InternalCaseNumber` como identificador principal interno
preparado para valores tipo `LEX-2026-000001`.
LegalCaseExternalIdentifiers permite registrar NUC, toca, amparo, apelacion y
otros numeros oficiales sin convertirlos en la llave principal.
EvidenceUsages permite que una misma evidencia sirva como prueba, anexo,
antecedente, referencia o soporte en multiples casos/procedimientos.
LegalGraphRelations prepara el mapa relacional juridico para relaciones
documento-documento, caso-procedimiento, procedimiento-procedimiento y
documento-procedimiento, siempre con revision humana cuando venga de IA.
LegalProceedingContents vincula todo o parte del archivo a uno o varios procesos.
ExtractedFields y TimelineEvents guardan informacion estructurada sin crear una tabla por cada formato documental.
CaseParticipants separa usuario autenticado, persona real y rol procesal dentro
del expediente.
CaseDocumentAccessPolicies evita que todos los participantes vean todos los
documentos por defecto.
```

## Participantes y acceso granular

LexNova no debe asumir que el cliente es siempre la victima o titular procesal.
Un expediente puede incluir cliente, victima, imputado, familiar autorizado,
representante legal, abogado, analista, perito y otros actores con accesos
distintos.

Contrato MVP:

```text
Auth.UserAccount  -> referencia logica por UserId
Person.Person     -> persona real del expediente
Cases.LegalCases  -> expediente
Cases.CaseParticipants -> rol y estado dentro del expediente
Cases.CaseParticipantAuthorizations -> autorizacion formal de acceso
Documents.CaseDocumentAccessPolicies -> privacidad por documento
Cases.CaseAccessAuditEvents -> historial de acceso
```

Categorias:

```text
LEGAL
FAMILY_AUTHORIZED
PROCEDURAL
INTERNAL
OTHER
```

Estados:

```text
PENDING
INVITED
ACTIVE
SUSPENDED
REVOKED
```

Alcances de acceso:

```text
TRACKING
DOCUMENT_UPLOAD
DOCUMENT_VIEW
LEGAL_REVIEW
REPRESENTATION
SIGNATURE
ADMINISTRATION
```

Privacidad documental:

```text
PUBLIC_TO_CASE
PARTICIPANTS_ONLY
LEGAL_TEAM_ONLY
VICTIM_ONLY
CUSTOM
```

Documento canonico complementario:

```text
Docs/02_projects/lexnova/case-participants-access.md
```

## Modelo actual por schema

### Person

Tablas:

- `Person.Person`
- `Person.LegalRole`
- `Person.RepresentationType`
- `Person.AuthorityType`
- `Person.Court`

Uso:

- Personas fisicas o actores procesales.
- Roles legales como victima, imputado, testigo, MP, juez u otros.
- Tipos de representacion como defensor particular, defensor publico o asesor
  juridico.
- Tipos de autoridad para actos reclamados, autoridades responsables y organos
  procesales.

### Case

Tablas:

- `Case.Case`
- `Case.CaseUserRole`
- `Case.CaseParty`
- `Case.CaseLink`

Uso:

- Contenedor funcional para agrupar uno o mas procesos legales relacionados.
- Relacion con usuarios de Auth por `UserID` logico, sin foreign key directa.
- Vinculos hacia entidades procesales por `EntityType` y `EntityID`.

Tipos de vinculo actuales:

```text
INVESTIGATION_FOLDER
CAUSE_PENAL
ORAL_TRIAL
APPEAL
AMPARO
```

### InvestigationFolder

Tablas:

- `InvestigationFolder.InvestigationFolder`
- `InvestigationFolder.FolderParticipant`
- `InvestigationFolder.FolderLegalRepresentation`
- `InvestigationFolder.FolderMPAssignment`

Uso:

- Carpeta de investigacion con region, mesa, delito, fecha de inicio, resumen
  y estado.
- Participantes por carpeta.
- Representacion legal por participante.
- Historial de asignacion del Ministerio Publico.

### CausePenal

Tablas:

- `CausePenal.CausePenal`
- `CausePenal.CauseParticipant`
- `CausePenal.CauseLegalRepresentation`
- `CausePenal.CauseMPAssignment`
- `CausePenal.CauseStage`
- `CausePenal.CauseHearing`

Uso:

- Causa penal judicializada desde carpeta de investigacion.
- Participantes, representacion, asignacion de MP, etapas y audiencias.
- Tipos de etapa quedan como texto en `CauseStage.StageType`.

### OralTrial

Tablas:

- `OralTrial.OralTrial`
- `OralTrial.TrialParticipant`
- `OralTrial.TrialHearing`
- `OralTrial.HearingVideo`
- `OralTrial.TrialJudgment`

Uso:

- Juicio oral ligado a una causa penal.
- Participantes, audiencias, videos y sentencia.
- El resultado final se modela en `TrialJudgment`.

### Appeal

Tablas:

- `Appeal.AppealType`
- `Appeal.AppealResult`
- `Appeal.Appeal`

Uso:

- Recurso contra actos o resoluciones.
- Puede vincularse a carpeta de investigacion, causa penal o juicio oral.
- `AppealType` distingue el tipo de apelacion, por ejemplo interlocutoria o
  final.

### Amparo

Tablas:

- `Amparo.AmparoType`
- `Amparo.AmparoResult`
- `Amparo.IndirectAmparo`
- `Amparo.DirectAmparo`
- `Amparo.AmparoAuthority`
- `Amparo.AmparoConcept`
- `Amparo.AmparoSuspension`

Uso:

- `IndirectAmparo` puede ligarse a carpeta, causa, juicio oral o apelacion.
- `DirectAmparo` se liga a una apelacion y a una causa penal.
- `AmparoConcept` puede ligarse a amparo directo o indirecto.
- `AmparoAuthority` registra autoridades responsables del amparo indirecto.
- `AmparoSuspension` registra suspension provisional/definitiva del amparo
  indirecto.

Brecha actual:

- `AmparoAuthority` no soporta amparo directo.
- No hay tabla de revision de amparo directo.
- No hay tabla de revision de amparo indirecto.

### Document

Tablas:

- `Document.Document`
- `Document.DocumentPage`
- `Document.DocumentSection`
- `Document.DocumentAnalysis`
- `Document.DocumentLink`

Uso:

- PDF o archivo legal.
- OCR por pagina.
- Secciones por rango de paginas.
- Analisis juridico por seccion.
- Vinculo logico a cualquier etapa procesal.

Tipos de analisis actuales:

```text
HUMAN_RIGHTS_VIOLATION
CONTRADICTION
OMISSION
ILLEGAL_EVIDENCE
DUE_PROCESS
OTHER
```

### Evidence

Tablas:

- `Evidence.Evidence`
- `Evidence.EvidenceTranscript`
- `Evidence.EvidenceTranscriptSegment`
- `Evidence.EvidenceAnalysis`
- `Evidence.EvidenceLink`

Uso:

- Audio/video.
- Transcripcion completa.
- Segmentos por tiempo y hablante.
- Analisis por segmento.
- Vinculo logico a entidad procesal.

Tipos de analisis actuales:

```text
INTERRUPTION
INDUCTION
THREAT
OMISSION
DUE_PROCESS
CONTRADICTION
OTHER
```

Derechos afectados actuales:

```text
DEFENSE
ADVERSARIAL
IMPARTIALITY
LEGALITY
MOTIVATION
OTHER
```

## Flujo procesal documentado

Flujo base penal:

```text
Case
  -> InvestigationFolder
  -> CausePenal
  -> OralTrial
  -> TrialJudgment
  -> Appeal
  -> DirectAmparo
```

Flujo de amparo indirecto:

```text
Case
  -> InvestigationFolder | CausePenal | OralTrial | Appeal
  -> IndirectAmparo
  -> AmparoAuthority
  -> AmparoConcept
  -> AmparoSuspension
  -> AmparoResult
```

Documentos y evidencia se adjuntan por vinculo logico:

```text
DocumentLink(EntityType, EntityID)
EvidenceLink(EntityType, EntityID)
CaseLink(EntityType, EntityID)
```

## Procesos especializados pendientes

### Revision de amparo directo

Estado: cubierto de forma flexible por `LegalProceedings`.

Pendiente especializado: crear tabla dedicada solo si el negocio necesita
campos procesales exclusivos de revision de amparo directo.

Modelo recomendado futuro:

```text
Amparo.DirectAmparoReview
- DirectAmparoReviewID
- DirectAmparoID
- FilingDate
- CollegiateCourt
- SupremeCourtAttractionRequested
- AdmissionStatus
- ResolutionDate
- ResultCode
- ResolutionSummary
```

Debe agregarse cuando el desarrollo requiera trazabilidad separada entre el
amparo directo y su revision mas alla del modelo flexible.

### Revision de amparo indirecto

Estado: cubierto de forma flexible por `LegalProceedings`.

Pendiente especializado: crear tabla dedicada solo si el negocio necesita
campos procesales exclusivos de revision de amparo indirecto.

Modelo recomendado futuro:

```text
Amparo.IndirectAmparoReview
- IndirectAmparoReviewID
- IndirectAmparoID
- FilingDate
- ReviewingCourt
- AppealedResolution
- AdmissionStatus
- ResolutionDate
- ResultCode
- ResolutionSummary
```

Debe agregarse para recursos de revision contra resoluciones del amparo
indirecto cuando el modelo flexible ya no sea suficiente.

### Quejas en derechos humanos

Estado: cubierto de forma flexible por `LegalProceedings`.

Pendiente especializado: crear tabla dedicada solo si el negocio necesita
campos exclusivos de comisiones, recomendaciones y seguimiento institucional.

Modelo recomendado futuro:

```text
HumanRights.HumanRightsComplaint
- HumanRightsComplaintID
- Scope
- CommissionName
- ComplaintNumber
- FilingDate
- ComplainantPersonID
- AffectedPersonID
- AuthorityName
- AuthorityTypeID
- Facts
- AffectedRights
- Status
- ResolutionDate
- RecommendationSummary
```

Valores recomendados para `Scope`:

```text
STATE
NATIONAL
```

Uso recomendado:

- Quejas ante comisiones estatales de derechos humanos.
- Quejas ante la comision nacional.
- Vinculacion con casos, documentos y evidencia por `CaseLink`,
  `DocumentLink` y `EvidenceLink`.

Mientras no exista tabla especializada, usar:

```text
LegalProceedings.ProceedingType = STATE_HUMAN_RIGHTS_COMPLAINT
LegalProceedings.ProceedingType = NATIONAL_HUMAN_RIGHTS_COMPLAINT
DigitalAssets / LegalProceedingContents / ExtractedFields
```

## Criterios para el siguiente desarrollo

1. No duplicar usuarios ni roles de Auth en LexNova.
2. Mantener `UserID` como referencia logica hacia Auth cuando el dato sea un
   usuario del sistema.
3. Usar foreign keys reales solo entre modelos del API de dominio LexNova.
4. Publicar tablas con nombres PascalCase y schema explicito.
5. Mantener documentos y evidencia como recursos vinculables a cualquier etapa.
6. Usar `LegalProceedings` para procesos flexibles y crear modelos
   especializados solo cuando existan campos exclusivos y reglas propias.
7. Exponer cualquier contrato a la web solo por el Gateway LexNova.

## Informacion faltante

Las siguientes decisiones quedan como `PENDIENTE_DE_DEFINIR` antes de cerrar un
CRUD productivo:

| Tema | Falta definir |
|---|---|
| Cliente canonico | Si `ClientId` apuntara a un modelo propio de LexNova, a Auth, a una futura API de clientes o a JobCron. |
| Catalogo documental final | Catalogo inicial sembrado en `LegalDocumentTypes`; falta validacion final por materia y por entidad. |
| Motor OCR | Proveedor, estados finos, reintentos y almacenamiento de errores. |
| Motor de transcripcion | Proveedor, diarizacion, idioma, confianza minima y costo por procesamiento. |
| Politica de storage | S3/local definitivo, cifrado, retencion, borrado logico y versionado de archivos. |
| Publicacion al cliente | Que campos y avances puede ver el cliente y bajo que permiso. |
| Consentimiento de participantes | Documento, firma o evidencia necesaria para autorizar familiares y representantes. |
| Revocacion de acceso | Reglas para suspender o revocar participantes, invitaciones y accesos temporales. |
| Auditoria sensible | Retencion, exportacion y alertas de accesos a expedientes con victimas, menores o datos sensibles. |
| Metricas de IA | `AIAnalysisResults` y `HumanReviews` ya guardan trazabilidad base; falta definir rangos oficiales de confianza y severidad. |
| Modelos especializados | Cuando separar tablas dedicadas para revisiones de amparo y quejas de derechos humanos. |

## Estado de documentacion

Este documento es la fuente canonica inicial para el modelo procesal de
LexNova. Si se agregan tablas nuevas, deben actualizarse este documento, el
indice maestro y el reporte de ejecucion correspondiente.
