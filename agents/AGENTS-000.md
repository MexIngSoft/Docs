````md id="w8q2ms"
# Instrucción para Codex: Implementación de tolerancia a fallos y recuperación automática en ETLs SYSCOM

Analiza toda la arquitectura actual de los ETLs de SYSCOM y diseña un sistema completo de tolerancia a fallos, recuperación automática y continuidad operativa para el primer llenado y sincronización continua de la base de datos.

La prioridad principal de esta tarea es garantizar que los ETLs puedan:

- recuperarse automáticamente,
- continuar después de errores,
- evitar corrupción de datos,
- reiniciar tareas pendientes,
- detectar fallos,
- registrar errores,
- reanudar sincronizaciones,
- y completar el llenado inicial sin intervención manual.

La tarea NO debe enfocarse en frontend ni diseño visual.

---

# Objetivo principal

Garantizar que el sistema ETL pueda operar de manera resiliente incluso si:

- Docker inicia lentamente,
- PostgreSQL tarda en levantar,
- una API externa falla,
- SYSCOM responde lentamente,
- hay timeout,
- hay pérdida de conexión,
- el contenedor se reinicia,
- el ETL se interrumpe,
- o existen errores parciales.

El sistema debe poder continuar automáticamente hasta completar el llenado inicial y las sincronizaciones posteriores.

---

# Primer llenado obligatorio automático

## Requisito

Si el sistema detecta que es la primera ejecución o que la base de datos está vacía, debe iniciar automáticamente el proceso ETL completo unos minutos después de levantar Docker.

## Objetivo

Evitar que el usuario tenga que ejecutar manualmente:

```bash id="d4h7ff"
sync_syscom_all
````

## Reglas

El sistema debe:

1. Esperar que:

   * Docker esté estable,
   * PostgreSQL responda,
   * APIs internas estén disponibles,
   * migraciones estén completas.

2. Esperar un tiempo prudente antes de iniciar.

## Tiempo recomendado

```txt id="6p9yq8"
2 a 5 minutos después del arranque
```

Codex debe determinar el tiempo más seguro según la arquitectura actual.

---

# Detección de primer llenado

Codex debe implementar una estrategia confiable para detectar:

* si la BD está vacía,
* si el catálogo nunca se sincronizó,
* si existen tablas parcialmente llenas,
* si el ETL quedó inconcluso,
* si hubo corrupción,
* si la sincronización quedó a medias.

## Ejemplos válidos

* Conteo de productos.
* Conteo de categorías.
* Tabla de estado ETL.
* Tabla de metadata.
* Marca de sincronización inicial.

---

# Continuidad automática

## Requisito crítico

Si el ETL falla, NO debe reiniciar desde cero innecesariamente.

Debe:

* identificar qué falló,
* registrar el error,
* continuar desde el último punto válido,
* evitar duplicados,
* evitar reprocesamiento excesivo.

---

# Ejemplos esperados

## Caso 1

Si:

```txt id="ghr4gk"
sync_syscom_products
```

procesó:

```txt id="f9bg3f"
12,000 productos
```

y falla en:

```txt id="jz3f9i"
12,001
```

el sistema debe continuar desde:

```txt id="3mmsb4"
12,001
```

y NO volver a empezar desde cero.

---

# Caso 2

Si falla:

```txt id="z2yo4o"
publish_syscom_prices
```

el sistema debe:

* registrar el lote fallido,
* reintentarlo,
* continuar lotes pendientes,
* evitar republicar innecesariamente.

---

# Tolerancia a fallos obligatoria

Codex debe diseñar mecanismos para:

## Retry automático

Con:

* límite de reintentos,
* backoff progresivo,
* retry inteligente.

---

# Manejo de timeout

Detectar:

* timeout API,
* timeout DB,
* timeout publish,
* timeout red.

Y recuperarse automáticamente.

---

# Manejo de desconexión

Si:

* Docker reinicia,
* PostgreSQL cae,
* Redis cae,
* la API externa falla,

el ETL debe:

* esperar recuperación,
* reconectar,
* continuar.

---

# Manejo de corrupción parcial

Si existen:

* productos incompletos,
* relaciones corruptas,
* categorías huérfanas,
* precios sin producto,

el sistema debe:

* detectarlo,
* registrarlo,
* intentar repararlo,
* marcar inconsistencias.

---

# Locks y concurrencia

El sistema debe impedir:

* múltiples full sync simultáneos,
* doble publicación,
* duplicados,
* corrupción por concurrencia.

Codex debe implementar:

* locks,
* estados de ejecución,
* validaciones de proceso activo.

---

# Estado del ETL

Codex debe proponer una tabla o sistema de estado ETL.

Ejemplo:

```txt id="j3mjlwm"
ETLStatus
├── ProcessName
├── Status
├── StartedAt
├── FinishedAt
├── LastProcessedId
├── LastProcessedPage
├── RetryCount
├── ErrorMessage
├── IsRunning
└── Metadata
```

---

# Registro obligatorio de errores

Todos los errores deben registrar:

* fecha,
* ETL,
* endpoint,
* lote,
* página,
* producto,
* excepción,
* traceback,
* reintentos,
* duración.

---

# Recuperación automática

Codex debe diseñar cómo:

* reanudar ETLs,
* continuar páginas,
* continuar lotes,
* continuar productos,
* reintentar publicaciones.

---

# Limpieza controlada de catálogos

## Requisito

Después de implementar el sistema de tolerancia a fallos, limpiar las tablas relacionadas al ETL para validar el llenado automático desde cero.

## Importante

La limpieza debe ser:

* controlada,
* documentada,
* reversible si aplica,
* segura.

---

# Tablas relacionadas

Codex debe identificar todas las tablas relacionadas con:

* categorías,
* marcas,
* productos,
* stock,
* precios,
* relacionados,
* publicación,
* staging,
* sincronización.

---

# Validación esperada

Después de limpiar tablas:

1. Docker debe iniciar.
2. El sistema debe esperar automáticamente.
3. Debe detectar catálogo vacío.
4. Debe iniciar ETL automáticamente.
5. Debe continuar aunque existan fallos.
6. Debe completar sincronización.
7. Debe registrar errores y reintentos.
8. Debe poder verse trabajando en logs.

---

# Logs obligatorios

Debe poder visualizarse claramente:

```txt id="dz69r2"
[WAITING FOR POSTGRES]
[WAITING FOR API]
[FIRST SYNC DETECTED]
[STARTING FULL ETL]
[PROCESSING CATEGORY]
[PROCESSING PAGE]
[RETRYING]
[RECOVERED]
[PUBLISHING]
[SYNC COMPLETED]
```

---

# Estrategia recomendada

Codex debe evaluar:

* cron,
* Celery,
* workers,
* colas,
* locks distribuidos,
* recovery queue,
* checkpoints,
* eventos.

Y proponer la mejor arquitectura según el estado actual del proyecto.

---

# Restricciones

No reiniciar ETLs completos innecesariamente.

No eliminar información válida sin documentarlo.

No depender de intervención manual constante.

No asumir que la API externa siempre responderá bien.

No asumir infraestructura perfecta.

---

# Entregables obligatorios

Codex debe generar:

1. Documento completo de tolerancia a fallos.
2. Estrategia de recuperación automática.
3. Estrategia de retry.
4. Estrategia de checkpoints.
5. Estrategia de locks.
6. Estrategia de reanudación.
7. Estrategia de primer llenado.
8. Estrategia de limpieza controlada.
9. Tabla o modelo de estado ETL.
10. Estrategia de logs.
11. Riesgos detectados.
12. Problemas actuales encontrados.
13. Recomendaciones de producción.
14. Flujo completo de recuperación.
15. Validación automática post Docker.

---

# Resultado esperado

La tarea estará completa cuando el sistema ETL pueda:

* arrancar automáticamente,
* detectar primer llenado,
* sincronizar completamente,
* continuar después de fallos,
* recuperarse automáticamente,
* evitar duplicados,
* evitar corrupción,
* registrar errores correctamente,
* y operar de manera resiliente sin intervención manual constante.

