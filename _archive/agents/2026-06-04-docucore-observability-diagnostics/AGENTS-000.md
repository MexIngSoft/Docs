Para DocuCore no lo llamaría únicamente "logs". Lo documentaría como un módulo completo llamado:

# DocuCore Observability & Diagnostics Standard (DODS)

Porque realmente abarca:

```txt
Logs
Diagnóstico
Errores
Trazabilidad
Auditoría
Métricas
Issues
Monitoreo
Alertas
Limpieza
```

---

# 1. Objetivo

## Propósito

Permitir identificar:

* Qué hizo el usuario.
* Qué hizo DocuCore.
* Qué servicio intervino.
* Dónde ocurrió un fallo.
* Por qué ocurrió.
* Cuándo debe escalarse a issue.
* Cómo resolverlo.

Sin generar una carga excesiva de almacenamiento o procesamiento.

---

# 2. Principios

## Principio 1

Todo proceso debe ser rastreable.

## Principio 2

Todo error debe ser identificable.

## Principio 3

No todo error genera un issue.

## Principio 4

No todo evento debe almacenarse indefinidamente.

## Principio 5

Los usuarios no deben ver información técnica sensible.

## Principio 6

El sistema debe poder autolimpiarse.

---

# 3. Arquitectura

```txt
Usuario
   │
   ▼
Workspace
   │
   ▼
Gateway
   │
   ▼
DocuCore API
   │
   ├── PDF Engine
   ├── Word Engine
   ├── Excel Engine
   ├── Image Engine
   ├── OCR Engine
   ├── ZIP Engine
   └── XML Engine
   │
   ▼
Storage
```

Cada nivel genera eventos.

---

# 4. Identificadores

## Request ID

Identifica una operación.

Ejemplo:

```txt
REQ-20260604-000001
```

---

## Session ID

Identifica una sesión.

```txt
SES-20260604-000001
```

---

## Project ID

Identifica un proyecto.

```txt
PROJ-20260604-000001
```

---

## Issue ID

Identifica un problema.

```txt
ISSUE-20260604-000001
```

---

# 5. Tipos de eventos

## Operación

```txt
UPLOAD
DOWNLOAD
PROCESS
CONVERT
COMPRESS
MERGE
SPLIT
DELETE
RESTORE
```

---

## Sistema

```txt
SERVICE_START
SERVICE_STOP
SERVICE_RESTART
DATABASE_CONNECT
DATABASE_DISCONNECT
```

---

## Seguridad

```txt
LOGIN
LOGOUT
PERMISSION_DENIED
TOKEN_EXPIRED
```

---

## Diagnóstico

```txt
WARNING
ERROR
CRITICAL
```

---

# 6. Niveles

## INFO

Actividad normal.

Ejemplo:

```txt
PDF cargado correctamente.
```

---

## SUCCESS

Proceso terminado.

```txt
PDF dividido correctamente.
```

---

## WARNING

Situación anormal.

```txt
PDF protegido por contraseña.
```

---

## ERROR

Proceso falló.

```txt
No se pudo leer el PDF.
```

---

## CRITICAL

Servicio afectado.

```txt
Storage no disponible.
```

---

# 7. Etapas estándar

Todos los motores deben usar las mismas etapas.

```txt
RECEIVED
VALIDATING
PROCESSING
GENERATING
STORING
COMPLETED
FAILED
```

---

# 8. Flujo PDF

Ejemplo:

```txt
UPLOAD_STARTED
UPLOAD_RECEIVED

VALIDATION_STARTED
VALIDATION_COMPLETED

PDF_READ_STARTED
PDF_READ_COMPLETED

PREVIEW_STARTED
PREVIEW_COMPLETED

STORAGE_STARTED
STORAGE_COMPLETED

PROCESS_COMPLETED
```

---

# 9. Tabla docucore_logs

```sql
id
request_id
session_id
project_id
user_id

service_name
tool_name

event_type
stage

status

file_name
file_type
file_size

message

error_code
error_detail

created_at
```

---

# 10. Tabla docucore_errors

Agrupa errores.

```sql
id

fingerprint

error_code

tool_name

stage

first_seen_at
last_seen_at

occurrence_count

affected_users_count

status

priority

issue_id
```

---

# 11. Fingerprint

Permite agrupar errores iguales.

Ejemplo:

```txt
PDF_READ_FAILED
```

y

```txt
pdf-preview
```

generan:

```txt
PDF_PREVIEW_FAILED
```

---

# 12. Catálogo de errores PDF

## Lectura

```txt
PDF_READ_FAILED
PDF_CORRUPTED
PDF_PASSWORD_PROTECTED
```

---

## Preview

```txt
PDF_PREVIEW_FAILED
PDF_RENDER_FAILED
```

---

## División

```txt
PDF_SPLIT_FAILED
```

---

## Unión

```txt
PDF_MERGE_FAILED
```

---

## Compresión

```txt
PDF_COMPRESS_FAILED
```

---

## Descarga

```txt
PDF_DOWNLOAD_FAILED
```

---

# 13. Catálogo Word

```txt
WORD_READ_FAILED
WORD_CONVERT_FAILED
WORD_SAVE_FAILED
```

---

# 14. Catálogo Excel

```txt
EXCEL_READ_FAILED
EXCEL_EXPORT_FAILED
```

---

# 15. Catálogo OCR

```txt
OCR_ENGINE_FAILED
OCR_LANGUAGE_NOT_FOUND
OCR_TIMEOUT
```

---

# 16. Prioridades

## P0

Sistema caído.

```txt
Storage fuera de servicio.
```

---

## P1

Herramienta inutilizable.

```txt
PDF no procesa nada.
```

---

## P2

Muchos usuarios afectados.

---

## P3

Error aislado.

---

## P4

Mejora.

---

# 17. Reglas para crear Issues

## Crear automáticamente

Cuando:

```txt
5 errores iguales en 1 hora.
```

o

```txt
3 usuarios distintos afectados.
```

o

```txt
Error crítico.
```

---

## No crear

Cuando:

```txt
Archivo corrupto del usuario.
```

```txt
Archivo demasiado grande.
```

```txt
Usuario canceló.
```

---

# 18. Dashboard de Diagnóstico

Sección:

```txt
Workspace
 └── Diagnóstico
```

Debe mostrar:

```txt
Request ID

Documento

Herramienta

Etapa

Estado

Código de error

Descripción

Frecuencia

Usuarios afectados

Issue relacionado
```

---

# 19. Vista Usuario

Ejemplo:

```txt
No se pudo abrir el PDF.

Posible causa:
El archivo está dañado o protegido.

Código:
PDF_READ_FAILED

Request:
REQ-20260604-000001
```

---

# 20. Vista Administrador

Además:

```txt
Stack Trace

Servicio

Motor

Tiempo de respuesta

Payload

Nodo

Versión
```

---

# 21. Retención

## INFO

15 días

---

## SUCCESS

15 días

---

## WARNING

30 días

---

## ERROR

90 días

---

## CRITICAL

Hasta resolución

---

# 22. Limpieza Automática

Job:

```txt
job_cleanup_docucore_logs
```

Ejecutar:

```txt
02:00 AM
```

Funciones:

```txt
Eliminar INFO antiguos
Eliminar SUCCESS antiguos
Archivar WARNING
Conservar ERROR activos
Conservar CRITICAL
```

---

# 23. Métricas

DocuCore debe medir:

```txt
Archivos procesados

Archivos fallidos

Tiempo promedio

Tiempo máximo

Herramienta más usada

Herramienta con más errores

Errores por día

Errores por usuario

Errores por versión
```

---

# 24. Integración con ERP Administrativo (JobCron)

El ERP administrativo debe consumir:

```txt
Errores abiertos

Issues abiertos

Errores recurrentes

Herramientas inestables

Consumo de almacenamiento de logs

Estado de limpieza

Alertas críticas
```

---

# 25. Regla Final de DocuCore

Todo módulo nuevo (PDF, Word, Excel, XML, ZIP, OCR, IA, Storage, API, Gateway o Workspace) está obligado a:

```txt
Generar Request ID.
Registrar eventos.
Usar códigos de error oficiales.
Usar etapas oficiales.
Integrarse con Diagnóstico.
Integrarse con Issues.
Integrarse con Limpieza Automática.
Integrarse con Métricas.
```

Con esta especificación tendrías un estándar transversal para todo el ecosistema DocuCore y también reutilizable en LexNova, Imagrafity, TecnoTelec y cualquier otro proyecto basado en tu ERP.
