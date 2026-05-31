Sí, le falta esa parte de **autonomía, priorización, control de dependencias y bloqueo por falta de información**. Yo la dejaría así:

# Instrucción General para Ejecutar Agents

Ejecuta todos los archivos `AGENTS-*.md` ubicados en:

`Docs/agents`

Respetando el orden numérico ascendente.

Antes de implementar cualquier cambio, lee obligatoriamente:

1. `Docs/agents/RUN_AGENTS_INSTRUCTIONS.md`
2. `Docs/README.md`
3. `Docs/agents/AGENT_GLOBAL_RULES.md`
4. La documentación canónica relacionada con cada Agent.

---

## 1. Análisis inicial obligatorio

Antes de modificar archivos:

1. Identifica todos los archivos `AGENTS-*.md` existentes.
2. Ordénalos numéricamente.
3. Revisa el contenido de todos los Agents.
4. Detecta dependencias entre Agents.
5. Identifica tareas pendientes, completadas, duplicadas o bloqueadas.
6. Prioriza la ejecución respetando:

   * Orden numérico.
   * Dependencias técnicas.
   * Riesgo de impacto.
   * Alcance declarado.
   * Estado real de avance.

Si existe más de un Agent aplicable, ejecuta primero el que desbloquee más tareas posteriores.

---

## 2. Reglas de ejecución

Ejecuta únicamente tareas no completadas.

No reviertas cambios existentes.

No modifiques funcionalidad fuera del alcance del Agent.

No alteres componentes no relacionados.

No elimines archivos sin justificarlo en el reporte.

No inventes información faltante.

No marques como completada una tarea que no haya sido implementada o documentada.

---

## 3. Autonomía permitida

Puedes resolver de forma autónoma:

* Ajustes menores de documentación.
* Correcciones de formato.
* Organización de archivos.
* Creación de índices.
* Normalización de nombres.
* Corrección de enlaces internos.
* Registro de hallazgos.
* Actualización de reportes.
* Mejora de consistencia documental.
* Separación de contenido duplicado.
* Clasificación de documentos según estándares existentes.

También puedes aplicar criterios razonables cuando la documentación existente sea suficiente para decidir.

---

## 4. Límites de autonomía

No tomes decisiones críticas sin evidencia suficiente.

Si falta información esencial, registra el bloqueo y solicita las preguntas necesarias.

Se considera información esencial:

* Alcance funcional no definido.
* Arquitectura contradictoria.
* Dependencias faltantes.
* Ausencia de documentación canónica.
* Falta de criterios de aceptación.
* Cambios que puedan afectar producción.
* Eliminación de documentos o código relevante.
* Decisiones de seguridad, permisos, facturación o datos sensibles.
* Cambios estructurales mayores entre ERP, API, Gateway o Frontend.

---

## 5. Modo de trabajo paso a paso

Para cada Agent:

1. Leer el Agent completo.
2. Leer la documentación relacionada.
3. Identificar tareas pendientes.
4. Confirmar archivos permitidos y prohibidos.
5. Ejecutar las tareas en orden lógico.
6. Validar cambios.
7. Documentar resultado.
8. Marcar el Agent como:

   * Completado.
   * Parcialmente completado.
   * Bloqueado.
   * No aplicable.

No avances al siguiente Agent si el actual bloquea directamente a los siguientes, salvo que puedas continuar con tareas independientes sin riesgo.

---

## 6. Validaciones obligatorias

Después de cada implementación ejecuta los comandos disponibles:

* Build.
* Lint.
* Test.
* Checks.
* Análisis estático.
* Validaciones CI/CD.

Si algún comando no existe, documenta:

* Comando buscado.
* Motivo por el que no se ejecutó.
* Alternativa aplicada, si existe.

---

## 7. Reporte obligatorio

Documenta cada resultado en:

`Docs/agents/EXECUTION_REPORT.md`

Cada Agent debe registrar:

* Nombre del Agent.
* Fecha de ejecución.
* Estado.
* Tareas detectadas.
* Tareas ejecutadas.
* Archivos modificados.
* Validaciones ejecutadas.
* Resultado de validaciones.
* Problemas encontrados.
* Riesgos detectados.
* Decisiones tomadas.
* Información faltante.
* Preguntas necesarias, si aplica.

---

## 8. Manejo de bloqueos

Si un Agent no puede completarse:

1. No inventes la solución.
2. No fuerces cambios inseguros.
3. Documenta el bloqueo.
4. Explica qué falta.
5. Propón la acción mínima necesaria para desbloquearlo.
6. Genera una lista clara de preguntas para el usuario o responsable técnico.

Formato de preguntas:

* Pregunta.
* Motivo.
* Archivo o módulo afectado.
* Consecuencia si no se responde.

---

## 9. Cierre final

Al finalizar la ejecución de todos los Agents, informa:

### Agents completados

* Nombre.
* Resultado.
* Validaciones aprobadas.

### Agents parcialmente completados

* Nombre.
* Qué se completó.
* Qué falta.

### Agents pendientes o bloqueados

* Nombre.
* Motivo.
* Dependencia faltante.
* Preguntas necesarias.

### Riesgos generales

* Riesgos técnicos.
* Riesgos de documentación.
* Riesgos de arquitectura.
* Riesgos de UI/UX.
* Riesgos de seguridad.

### Limpieza

Si todo quedó correctamente concluido:

* Archiva Agents según indique la documentación.
* Limpia elementos temporales.
* Actualiza índices.
* Actualiza estado final del proyecto.
* Actualiza `EXECUTION_REPORT.md`.

---

## 10. Regla final

Trabaja con autonomía responsable.

Si la documentación permite resolver, resuelve.

Si falta información esencial, no adivines: documenta el bloqueo y entrega preguntas claras para poder continuar.

Esta versión ya le dice a Codex: **analiza primero, prioriza, resuelve paso a paso, documenta todo y solo pregunta cuando realmente falte información crítica.**
