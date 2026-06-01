Claro. Te dejo el **agente mejorado**, más claro y listo para pasarlo a Codex.

# Instrucción para Codex: Evaluación de Agents 0 y 1, planeación de DocuCore y módulo ERP

Antes de continuar con el desarrollo de DocuCore, se debe detener cualquier implementación directa y realizar primero una evaluación ordenada de los agents existentes.

## 1. Alcance inmediato

Codex debe revisar únicamente:

```text
AGENT-0
AGENT-1
```

Todos los demás agents deben ignorarse temporalmente porque se consideran en estado bloqueante y no serán atendidos por el momento.

No se debe modificar, ejecutar ni resolver ningún agent distinto a AGENT-0 y AGENT-1, salvo que sea indispensable para entender una dependencia directa de estos dos.

## 2. Evaluación inicial de agents

Codex debe analizar AGENT-0 y AGENT-1 para determinar:

```text
- Qué objetivo tiene cada agent.
- Qué tareas están completas.
- Qué tareas están pendientes.
- Qué tareas están bloqueadas.
- Qué dependencias tiene cada agent.
- Qué documentación canónica debe consultarse.
- Qué cambios afectan directamente a DocuCore.
- Qué cambios afectan al ERP.
- Qué cambios pueden convertirse en estándar para todos los proyectos.
```

Después de analizarlos, Codex debe definir cuál debe atenderse primero y cuál después, justificando el orden.

## 3. Estándar general para agents de todos los proyectos

Codex debe crear o actualizar un estándar común para todos los proyectos donde se indique cómo deben tratarse los agents.

Este estándar debe incluir:

```text
- Formato obligatorio de cada agent.
- Estado del agent: pendiente, en progreso, completado, bloqueado o archivado.
- Prioridad.
- Dependencias.
- Proyecto afectado.
- Alcance permitido.
- Archivos que puede modificar.
- Archivos que no debe modificar.
- Documentación que debe consultar.
- Validaciones obligatorias.
- Criterios para considerar el agent terminado.
- Criterios para bloquearlo.
- Criterios para archivarlo.
- Reglas para reportar avances.
```

El estándar debe servir para proyectos como:

```text
- API.PY.DJANGO.DocuCore.Gateway
- API.PY.DJANGO.DocuCore
- WEB.NJ.NEXT.DocuCore
- API.PY.DJANGO.Document
- LexNova
- Imagrafity
- ERP
- futuros proyectos reutilizables
```

## 4. Cambios de planeación en DocuCore

Una vez evaluados AGENT-0 y AGENT-1, Codex debe realizar los cambios necesarios en la planeación de DocuCore.

Estos cambios deben documentar la nueva política de ejecución de procesos:

```text
- Procesamiento del lado del cliente cuando sea viable.
- Procesamiento del lado del servidor cuando sea necesario.
- Procesamiento híbrido cuando convenga dividir la carga.
- Fallback automático al servidor si el cliente falla.
- Registro de costos reales internos.
- Créditos o precio al usuario independientes del lugar de ejecución.
- Medición del ahorro operativo.
- Evaluación de carga por proyecto.
```

La documentación debe aclarar que el costo para el usuario no cambia automáticamente solo porque una tarea se ejecute en cliente. El ahorro operativo se debe medir internamente y podrá usarse después para tomar decisiones comerciales, como bajar costos generales, otorgar más créditos, mejorar infraestructura o hacer la plataforma más atractiva.

## 5. Evaluación de nuevo módulo en el ERP

Codex debe evaluar y documentar la creación de un nuevo módulo en el ERP encargado de controlar la ejecución, costos, ahorro y carga de procesos por proyecto.

Nombre sugerido:

```text
Execution & Resource Manager
```

También se puede traducir como:

```text
Administrador de Ejecución y Recursos
```

## 6. Objetivo del módulo ERP

El módulo debe permitir que el ERP controle y visualice:

```text
- Qué proyecto ejecutó una tarea.
- Qué usuario solicitó la tarea.
- Qué tipo de proceso se ejecutó.
- Si se ejecutó en cliente, servidor o modo híbrido.
- Cuánto costó internamente.
- Cuántos créditos se cobraron.
- Cuánto recurso de servidor se ahorró.
- Qué fallos ocurrieron.
- Cuándo se usó fallback.
- Qué tareas son más costosas.
- Qué proyectos consumen más recursos.
- Qué procesos conviene optimizar.
```

## 7. Información que debe recibir el módulo

Cada proyecto deberá enviar al ERP un evento de ejecución con información como:

```json
{
  "project_code": "DOCUCORE",
  "module_code": "PDF_OCR",
  "task_type": "OCR",
  "execution_mode": "CLIENT|SERVER|HYBRID",
  "fallback_used": true,
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

## 8. Información que debe mostrar el ERP

El ERP debe mostrar vistas como:

```text
Dashboard general:
- Procesos ejecutados hoy.
- Costo interno total.
- Créditos cobrados.
- Ahorro estimado por procesamiento en cliente.
- Porcentaje cliente / servidor / híbrido.
- Fallos y fallback.

Vista por proyecto:
- DocuCore
- LexNova
- Imagrafity
- ERP
- otros proyectos

Vista por módulo:
- OCR
- PDF Split
- PDF Merge
- Image Compress
- PDF to Word
- AI Analysis
- Preview Generator

Vista por usuario o cliente:
- Consumo total.
- Créditos usados.
- Procesos más usados.
- Fallos frecuentes.

Vista técnica:
- CPU consumida.
- Memoria consumida.
- tiempo promedio.
- procesos en cola.
- errores.
- uso de fallback.

Vista financiera:
- costo interno estimado.
- ingresos por créditos.
- margen aproximado.
- ahorro operativo.
```

## 9. Ruta sugerida en el ERP

Codex debe proponer y documentar una ruta inicial para este módulo.

Ruta sugerida:

```text
/erp/execution-resources
```

Subrutas sugeridas:

```text
/erp/execution-resources/dashboard
/erp/execution-resources/projects
/erp/execution-resources/modules
/erp/execution-resources/costs
/erp/execution-resources/fallbacks
/erp/execution-resources/rules
/erp/execution-resources/settings
```

## 10. Cómo identificar de qué proyecto viene cada información

Cada proyecto debe tener un identificador obligatorio:

```text
project_code
```

Ejemplos:

```text
DOCUCORE_WEB
DOCUCORE_API
DOCUCORE_GATEWAY
DOCUMENT_API
LEXNOVA
IMAGRAFITY
ERP_CORE
```

Cada módulo debe tener:

```text
module_code
```

Ejemplos:

```text
PDF_OCR
PDF_SPLIT
PDF_MERGE
IMAGE_TO_PDF
PDF_PREVIEW
AI_LEGAL_ANALYSIS
PRODUCT_DESIGN_PREVIEW
```

Cada evento debe tener:

```text
execution_id
trace_id
request_id
tenant_id
user_id
project_code
module_code
task_type
```

Esto permitirá saber:

```text
- qué proyecto generó el evento,
- qué módulo lo ejecutó,
- qué usuario lo solicitó,
- qué cliente o negocio lo consumió,
- qué proceso se ejecutó,
- cuánto costó,
- si hubo fallo,
- si hubo fallback,
- y qué resultado produjo.
```

## 11. Preguntas que Codex debe resolver o documentar

Durante la evaluación, Codex debe responder o dejar documentadas estas preguntas:

```text
1. ¿Qué procesos de DocuCore pueden ejecutarse en cliente?
2. ¿Qué procesos deben quedarse en servidor?
3. ¿Qué procesos pueden ejecutarse en modo híbrido?
4. ¿Qué métricas debe enviar cada proyecto al ERP?
5. ¿Qué información es obligatoria y cuál opcional?
6. ¿Cómo se calcula el ahorro operativo?
7. ¿Cómo se calcula el costo interno?
8. ¿Los créditos se cobran antes o después de confirmar resultado?
9. ¿Qué pasa si el cliente falla y el servidor termina el proceso?
10. ¿Cómo se evita cobrar dos veces?
11. ¿Cómo se audita el fallback?
12. ¿Cómo se relaciona cada evento con un archivo, usuario y proyecto?
13. ¿Qué datos no deben enviarse al ERP por privacidad?
14. ¿Qué datos deben anonimizarse?
15. ¿Qué permisos debe tener un usuario del ERP para ver estos datos?
16. ¿Qué reportes serán necesarios para administración?
17. ¿Qué reportes serán necesarios para soporte técnico?
18. ¿Qué reportes serán necesarios para decisiones comerciales?
```

## 12. Reglas de implementación

Codex debe seguir estas reglas:

```text
- No implementar todavía el módulo ERP si no está documentado.
- No modificar agents bloqueados.
- No continuar con desarrollo funcional de DocuCore sin actualizar la planeación.
- No cambiar precios o créditos automáticamente.
- No asumir que todo debe ir al cliente.
- No asumir que todo debe ir al servidor.
- Documentar cada decisión.
- Crear tareas separadas si algo queda fuera del alcance.
- Mantener compatibilidad con proyectos existentes.
```

## 13. Resultado esperado

Al finalizar, Codex debe entregar:

```text
1. Evaluación de AGENT-0.
2. Evaluación de AGENT-1.
3. Orden recomendado de ejecución.
4. Estándar general para agents de todos los proyectos.
5. Planeación actualizada de DocuCore.
6. Propuesta documentada del módulo ERP Execution & Resource Manager.
7. Rutas sugeridas del ERP.
8. Estructura mínima de eventos.
9. Preguntas pendientes o decisiones necesarias.
10. Reporte de cambios realizados.
```

## 14. Reporte obligatorio

Codex debe registrar el resultado en:

```text
Docs/agents/EXECUTION_REPORT.md
```

El reporte debe indicar:

```text
- Agents revisados.
- Agents ignorados por bloqueo.
- Cambios realizados.
- Documentos modificados.
- Decisiones tomadas.
- Pendientes.
- Riesgos encontrados.
- Siguientes pasos recomendados.
```

También puedes agregarle una frase de control al inicio del agent:

```text
Este agent es de planeación y documentación. No debe implementar lógica productiva hasta que la planeación, estándares y módulo ERP hayan quedado documentados.
```
Sí, **recomiendo crear otra API**, pero no para procesar archivos.

La nueva API sería para el ERP:

```text
API.PY.DJANGO.ExecutionResourceManager
```

o dentro del ERP como módulo:

```text
ERP.ExecutionResourceManager
```

## Recomendación

```text
DocuCore API
Procesa archivos.

DocuCore Gateway
Decide rutas de ejecución.

Document API
Guarda documentos, metadatos y trazabilidad.

Execution Resource Manager API
Registra costos, cargas, fallbacks, métricas, créditos y ahorro operativo.

ERP Web
Muestra dashboards, reportes y configuración.
```

## Por qué sí conviene

Porque esta lógica no pertenece solo a DocuCore. También aplicará a:

```text
LexNova
Imagrafity
ERP
futuros proyectos
```

Si la metes dentro de DocuCore, después todo quedará amarrado a DocuCore.

## Qué recibiría esta API

```text
- eventos de ejecución
- consumo de servidor
- modo usado: cliente, servidor o híbrido
- fallback
- créditos cobrados
- costo interno estimado
- proyecto origen
- módulo origen
- usuario
- cliente/tenant
```

## Qué NO debería hacer

```text
- no procesar PDFs
- no hacer OCR
- no convertir archivos
- no guardar archivos pesados
- no reemplazar DocuCore
```

## Mi propuesta final

Sí crearla como API separada o módulo desacoplado del ERP:

```text
API.PY.DJANGO.ExecutionResourceManager
```

Y que el ERP solo consuma esa API para mostrar la información.

Así queda más limpio, reutilizable y preparado para todos los proyectos.
