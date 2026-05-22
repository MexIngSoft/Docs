# LexNova definition questionnaire

## Estado

ACTIVE

## Objetivo

Reunir las decisiones de negocio, juridicas y operativas que faltan para
continuar el desarrollo de LexNova sin inventar reglas criticas.

## 1. Expedientes y numeracion

1. Cual debe ser el formato definitivo del numero interno LexNova?
   Ejemplo actual propuesto: `LEX-2026-000001`.
2. El consecutivo debe ser global, por cliente, por materia o por despacho?
3. Que numeros externos son obligatorios en el alta inicial?
   Ejemplos: NUC, causa penal, toca, amparo, expediente familiar, queja.
4. Puede existir un caso sin numero externo conocido?
5. Quien puede corregir o fusionar expedientes duplicados?

## 2. Materias y procedimientos

1. Que materias deben salir primero en produccion?
   Penal, familiar, civil, mercantil, administrativo, laboral, amparo, derechos
   humanos u otras.
2. Que apartados debe mostrar siempre un caso?
   Carpeta de investigacion, causa penal, juicio oral, incidencias, amparo,
   derechos humanos, evidencias, actuaciones, agenda, riesgos.
3. Que procedimientos requieren campos propios y no solo el modelo flexible
   `LegalProceedings`?
4. Que estados procesales deben ser visibles para el cliente?
5. Que estados son internos del equipo legal y no deben mostrarse al cliente?

## 3. Documentos, evidencia y clasificacion

1. Que tipos documentales legales deben formar el catalogo inicial?
2. Que tipos de evidencia deben soportarse primero?
   PDF, imagen, audio, video, Word, XML, ZIP, enlaces externos.
3. Que proveedores externos se deben integrar primero?
   Google Drive, Dropbox, Mega, OneDrive, URL publica/privada u otros.
4. Que usos de evidencia son obligatorios?
   Prueba, anexo, antecedente, referencia, soporte de riesgo, argumento de
   derechos humanos, medida cautelar u otros.
5. Que tipos de relacion documental deben existir?
   Soporta, contradice, deriva de, invalida, reemplaza, referencia, contexto.
6. Que nivel de confianza minimo permite aceptar una clasificacion sin revision
   humana?
7. Que perfiles pueden aprobar, corregir, rechazar, separar o unir documentos?

## 4. OCR, transcripcion y storage

1. Que motor OCR se usara primero?
   Tesseract local, Azure AI Document Intelligence, Google Document AI, AWS
   Textract u otro.
2. Que motor de transcripcion se usara para audio/video?
3. Que idiomas deben soportarse?
4. Donde se almacenaran archivos productivos?
   Local, S3, Azure Blob, Google Cloud Storage u otro.
5. Cual es la politica de cifrado, retencion, borrado logico y versionado?
6. Que archivos deben generar cadena de custodia obligatoria?

## 5. Usuarios, perfiles y acceso

1. Cuales son los perfiles definitivos de LexNova?
   Cliente, abogado, analista, revisor juridico, administrador, perito,
   personal documental u otros.
2. Puede un usuario tener varios perfiles activos?
3. Como debe elegirse o cambiarse el perfil activo?
4. Que datos minimos debe mostrar el perfil por ahora?
5. Que participantes pueden ver documentos sensibles?
6. Que documentos necesitan consentimiento formal de otro participante?
7. Como se revoca acceso a familiares o representantes autorizados?

## 6. Seguimiento visible al cliente

1. Que eventos de timeline debe ver el cliente?
2. Que eventos deben quedar solo internos?
3. Como se deben nombrar estados simples para cliente?
   Recibido, en revision, requiere informacion, en tramite, resuelto.
4. Que acciones puede hacer el cliente desde el seguimiento?
5. El cliente puede descargar documentos originales, versiones con indice o
   solo vistas protegidas?

## 7. Resultados y analisis

1. El resultado debe vivir siempre dentro del detalle del caso?
2. Que componentes debe tener el resultado juridico?
   Resumen, riesgos, fortalezas, contradicciones, pendientes, estrategia,
   documentos clave, plazos.
3. Que resultados pueden generarse por IA y cuales requieren aprobacion humana?
4. Que formato de exportacion se necesita primero?
   PDF, Word, expediente indexado, reporte interno.

## 8. Integraciones y operaciones

1. Que APIs deben quedar conectadas en el MVP?
   Auth, LexNova API, LexNova Gateway, Document API, Notifications.
2. Que eventos deben disparar notificaciones?
3. Que jobs asincronos deben existir primero?
4. Que monitoreo o alertas son indispensables para produccion?
5. Que ambiente sera la fuente de verdad para migraciones iniciales?

## 9. Datos legales y catalogos

1. Que jurisdiccion se debe cubrir primero?
   Federal, estado especifico, varios estados.
2. Que catalogos legales son obligatorios para operar?
   Autoridades, juzgados, delitos, materias, etapas, plazos, documentos.
3. Que fuentes oficiales se usaran para normas, jurisprudencia y plazos?
4. Quien valida cambios legales y catalogos versionables?

## 10. Prioridad de desarrollo

1. Que modulo debe cerrarse primero para uso real?
   Casos, carga documental, revision documental, participantes, seguimiento,
   analisis, usuarios/perfiles.
2. Que flujo debe considerarse MVP indispensable de punta a punta?
3. Que funcionalidades pueden quedar como preparadas pero no visibles?
4. Que datos de prueba reales o anonimizados se pueden usar para validar OCR,
   clasificacion y relaciones?
