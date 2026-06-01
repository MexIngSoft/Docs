# Politica de ejecucion DocuCore

## Objetivo

Definir como DocuCore decide si una tarea documental se ejecuta en cliente,
servidor o modo hibrido, sin mezclar esa decision tecnica con el precio visible
al usuario.

## Regla principal

```text
Cliente primero cuando sea seguro y viable.
Servidor como respaldo, auditoria y garantia de resultado.
Modo hibrido cuando convenga dividir carga sin perder trazabilidad.
```

La decision de ejecucion no cambia automaticamente los creditos cobrados al
usuario. Los creditos visibles pertenecen a reglas comerciales; el lugar de
ejecucion pertenece a optimizacion operativa.

## Decision por tarea

Antes de implementar una funcion nueva, DocuCore debe documentar:

| Campo | Regla |
|---|---|
| Tipo de operacion | Preview, OCR, conversion, compresion, split, merge, IA u otra. |
| Costo estimado | CPU, memoria, tiempo, paginas, MB y transferencia. |
| Cliente viable | Si puede correr en navegador sin bloquear UI ni exponer datos. |
| Servidor requerido | Si requiere auditoria, seguridad, trazabilidad o motor pesado. |
| Modo hibrido | Si el cliente puede preparar parte y el servidor completar. |
| Fallback | Condicion que fuerza envio al servidor. |
| Sincronizacion | Como se une el resultado local con el trabajo persistido. |
| Evento ERP | Que metricas se enviaran al Administrador de Ejecucion y Recursos. |

## Criterios del equipo cliente

El frontend puede estimar capacidad local con datos no sensibles:

| Metrica | Uso |
|---|---|
| `navigator.hardwareConcurrency` | Estimar nucleos logicos disponibles. |
| `navigator.deviceMemory` | Estimar memoria aproximada cuando el navegador lo soporte. |
| Tipo de dispositivo | Distinguir movil, tablet, laptop o desktop. |
| Tiempo local observado | Detectar si el proceso se degrada o tarda demasiado. |
| Errores previos | Evitar reintentos locales cuando ya hubo fallo. |

Estas senales nunca deben usarse como unica decision. Tambien importan tamano
de archivo, paginas, tipo de tarea, privacidad, permisos y valor probatorio.

## Clasificacion inicial

| Equipo | Senal orientativa | Uso recomendado |
|---|---|---|
| Bajo | 1-2 nucleos, memoria baja/desconocida o movil antiguo. | Validacion ligera, previews simples y fallback temprano. |
| Medio | 4 nucleos o rendimiento estable. | Preview, miniaturas, seleccion, rangos y conversiones pequenas. |
| Alto | 8+ nucleos o desktop/laptop potente. | Procesos locales mas largos con Web Workers y limite de tiempo. |

## Tareas candidatas a cliente

| Tarea | Condicion |
|---|---|
| Preview PDF | Archivo pequeno/medio y navegador compatible. |
| Miniaturas | Render progresivo por pagina sin bloquear la interfaz. |
| Reordenar paginas | Estado local, sin escritura final de PDF. |
| Seleccionar paginas | Siempre local. |
| Dividir por rangos simples | Preparacion local; exportacion final requiere contrato. |
| Imagen a PDF | Archivos pequenos y sin requisitos de auditoria fuerte. |
| Comprimir imagen | Antes de subir, si no degrada calidad critica. |
| Metadatos basicos | Solo datos no sensibles y necesarios para UX. |
| OCR pequeno | Imagenes o pocas paginas, con timeout y fallback. |

## Tareas candidatas a servidor

| Tarea | Motivo |
|---|---|
| OCR masivo | Alto consumo, colas, trazabilidad y resultados auditables. |
| OCR legal o critico | Cadena de custodia y confiabilidad. |
| Conversion Word/PDF compleja | Dependencias y fidelidad de formato. |
| Firma digital | Seguridad, certificados y auditoria. |
| IA documental | Costo, privacidad, permisos y trazabilidad. |
| Documentos sensibles LexNova | Seguridad y valor probatorio. |
| Escritura final de PDF | Resultado definitivo, versionado y descarga controlada. |

## Fallback obligatorio

Una tarea local debe pasar a servidor cuando:

- el navegador no soporte la libreria requerida;
- el archivo exceda limites de paginas, MB o tiempo;
- el usuario este en equipo bajo;
- el proceso falle, tarde demasiado o devuelva baja confianza;
- el documento requiera auditoria, permisos o cadena de custodia;
- la operacion produzca artefacto final descargable que deba quedar versionado.

## Creditos y precio

Decision canonica:

```text
Los creditos cobrados al usuario son independientes del lugar de ejecucion.
```

El procesamiento local reduce costo interno, no cambia por si solo el precio
visible. El ahorro operativo puede usarse despues para:

- aumentar capacidad;
- otorgar creditos promocionales;
- financiar nuevas funciones;
- reducir costos generales;
- mejorar infraestructura;
- definir promociones explicitas.

## Evento requerido

Cada ejecucion relevante debe generar un evento hacia el ERP:

```json
{
  "execution_id": "uuid",
  "trace_id": "uuid",
  "request_id": "uuid",
  "project_code": "DOCUCORE_WEB",
  "module_code": "PDF_OCR",
  "task_type": "OCR",
  "execution_mode": "CLIENT|SERVER|HYBRID",
  "fallback_used": false,
  "user_id": "internal-user-id",
  "tenant_id": "business-or-client-id",
  "file_count": 1,
  "page_count": 25,
  "input_size_mb": 8.5,
  "output_size_mb": 1.2,
  "client_cpu_score": 75,
  "client_memory_score": 60,
  "server_cpu_ms": 12000,
  "server_memory_mb": 512,
  "estimated_internal_cost": 0.18,
  "credits_charged": 2,
  "status": "SUCCESS|FAILED|PARTIAL",
  "error_code": null,
  "created_at": "timestamp"
}
```

## Datos que no deben enviarse

El evento de ejecucion no debe incluir:

- contenido de documentos;
- texto OCR completo;
- archivos binarios;
- datos personales no necesarios;
- secretos, tokens o rutas internas privadas;
- prompts completos cuando contengan informacion sensible.

Si una metrica necesita relacionarse con archivo o usuario, usar identificadores
internos, `trace_id`, `request_id` y referencias anonimizables.

## Relacion con proyectos

| Proyecto | Regla |
|---|---|
| DocuCore Web | Puede ejecutar preview, seleccion y trabajo local reversible. |
| DocuCore Gateway | Decide rutas cliente/servidor/hibrido y normaliza eventos. |
| DocuCore API | Configura herramientas, limites, historial y consumo. |
| Document API | Guarda archivos, versiones, jobs y trazabilidad documental. |
| LexNova | Prioriza servidor por seguridad, cadena de custodia y valor probatorio. |
| Imagrafity | Puede usar mas cliente para editor visual, previews y plantillas. |
| ERP | Recibe eventos, calcula costo interno, ahorro, fallback y reportes. |

## Pendientes

- Definir limites numericos por herramienta: paginas, MB, tiempo y memoria.
- Definir formula oficial de costo interno por CPU, memoria, storage y ancho de
  banda.
- Definir politica comercial para convertir ahorro operativo en beneficios.
- Implementar envio real de eventos cuando exista el modulo ERP documentado y
  priorizado.
