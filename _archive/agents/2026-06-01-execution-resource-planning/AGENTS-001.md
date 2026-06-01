Sí, esta regla es **muy importante** para DocuCore y para todos tus proyectos. La idea correcta sería:

**“Cliente primero cuando sea seguro y viable; servidor como respaldo, auditoría y garantía de resultado.”**

## 1. Regla principal

DocuCore debe decidir cada tarea con este orden:

```text
1. ¿La tarea puede ejecutarse en el navegador?
2. ¿El equipo del usuario tiene recursos suficientes?
3. ¿El archivo permite procesarse localmente sin riesgo?
4. ¿El resultado local es confiable?
5. Si falla, incompleto o lento → fallback al servidor.
```

Esto aplica para DocuCore, LexNova, Imagrafity, ERP y cualquier proyecto nuevo.

## 2. Cómo medir recursos del equipo

Desde el navegador se puede estimar:

* Núcleos lógicos del procesador con `navigator.hardwareConcurrency`. MDN indica que devuelve el número de procesadores lógicos disponibles. ([MDN Web Docs][1])
* Memoria aproximada con `navigator.deviceMemory`, pero no está disponible en todos los navegadores y solo funciona en contextos seguros HTTPS. ([MDN Web Docs][2])
* Trabajo pesado en segundo plano con Web Workers, para no bloquear la interfaz. MDN explica que permiten ejecutar scripts en un hilo separado del hilo principal. ([MDN Web Docs][3])
* Procesamiento casi nativo con WebAssembly. MDN lo describe como código de bajo nivel que corre en navegadores modernos con rendimiento cercano al nativo. ([MDN Web Docs][4])

## 3. Clasificación de equipos

```text
Equipo bajo:
- 1 a 2 núcleos
- memoria baja o desconocida
- móvil viejo
- carga cliente: 0% a 20%

Equipo medio:
- 4 núcleos
- memoria media
- carga cliente: 30% a 60%

Equipo alto:
- 8 núcleos o más
- buena memoria
- escritorio/laptop potente
- carga cliente: 70% a 100%
```

No debe ser una regla fija solamente por núcleos. También debe medirse:

```text
- tamaño del archivo
- número de páginas
- tipo de tarea
- tiempo estimado
- errores previos del navegador
- temperatura/rendimiento percibido
- si el usuario está en móvil o escritorio
```

## 4. Tareas que sí pueden ir del lado del cliente

Para DocuCore:

```text
Muy viables en cliente:
- previsualización de PDF
- reordenar páginas
- seleccionar páginas
- dividir por rangos simples
- unir archivos pequeños
- comprimir imágenes antes de subir
- convertir imágenes a PDF
- extraer metadatos básicos
- validar tamaño, tipo y extensión
- generar miniaturas
- OCR de imágenes o páginas pequeñas
```

OCR en navegador sí es posible con Tesseract.js, que usa una versión WebAssembly de Tesseract y puede ejecutarse en navegador o Node.js. Pero su propio repositorio advierte que no soporta PDF directamente; habría que convertir páginas a imágenes primero. ([GitHub][5])

## 5. Tareas que conviene dejar al servidor

```text
Mejor en servidor:
- OCR masivo de PDFs grandes
- OCR legal o crítico
- documentos de muchas páginas
- conversión Word/PDF compleja
- compresión avanzada
- firma digital
- validación fiscal/XML crítica
- cadena de custodia
- análisis con IA
- documentos confidenciales de LexNova
- tareas que requieren trazabilidad
```

## 6. Regla de fallback

Cada tarea debe tener tres caminos:

```text
A. Cliente
Procesa localmente si el equipo puede.

B. Híbrido
Cliente procesa partes pequeñas; servidor completa lo pesado.

C. Servidor
Se usa si el cliente falla, es débil o el documento requiere seguridad.
```

Ejemplo OCR:

```text
1. Cliente convierte página a imagen.
2. Cliente intenta OCR con Web Worker + WebAssembly.
3. Si tarda demasiado, falla o baja confianza:
   - se manda esa página al servidor.
4. El servidor devuelve texto validado.
5. El resultado se sincroniza con el trabajo local.
```

## 7. Regla global para Codex

Esta instrucción debería quedar así:

```text
Toda nueva función debe evaluar si puede ejecutarse en cliente, servidor o modo híbrido.

Antes de implementar una tarea, Codex debe documentar:

1. Tipo de operación.
2. Costo estimado de CPU, memoria y tiempo.
3. Si puede ejecutarse en navegador.
4. Librerías necesarias.
5. Riesgos de seguridad o privacidad.
6. Condición para usar cliente.
7. Condición para usar servidor.
8. Condición de fallback.
9. Cómo se sincroniza el resultado.
10. Cómo se documenta por proyecto.
```

## 8. Reglas por proyecto

```text
DocuCore:
Prioridad en cliente para previews, selección, ordenamiento, OCR pequeño y conversiones simples.

DocuCore Gateway:
Decide si la tarea va al cliente, servidor o cola.

API DocuCore:
Ejecuta procesos pesados, fallback, auditoría y resultados finales.

API Document:
Guarda estados, versiones, metadatos, historial y trazabilidad.

LexNova:
Debe usar más servidor por seguridad, cadena de custodia y valor probatorio.

Imagrafity:
Puede usar más cliente para edición visual, previews, recortes, filtros y plantillas.

ERP:
Debe decidir reglas, costos, créditos, límites, auditoría y consumo por proyecto.
```

## 9. Regla de créditos y costos

También debe afectar créditos:

```text
Si el cliente procesa:
- menor costo
- menor consumo de créditos
- menos carga del servidor

Si el servidor procesa:
- mayor costo
- más créditos
- más control y garantía

Si es híbrido:
- costo intermedio
```

## 10. Conclusión clara

Sí conviene implementarlo, pero no como una función aislada. Debe ser una **política central de ejecución**:

```text
Execution Policy Engine
```

Ese motor decide:

```text
cliente / híbrido / servidor
```

según:

```text
equipo + archivo + tarea + seguridad + costo + fallos + proyecto
```

Y cada proyecto debe documentar sus propias reglas.

[1]: https://developer.mozilla.org/en-US/docs/Web/API/Navigator/hardwareConcurrency?utm_source=chatgpt.com "Navigator: hardwareConcurrency property - Web APIs | MDN"
[2]: https://developer.mozilla.org/en-US/docs/Web/API/Navigator/deviceMemory?utm_source=chatgpt.com "Navigator: deviceMemory property - Web APIs | MDN"
[3]: https://developer.mozilla.org/en-US/docs/Web/API/Web_Workers_API?utm_source=chatgpt.com "Web Workers API - Web APIs - MDN Web Docs - Mozilla"
[4]: https://developer.mozilla.org/en-US/docs/WebAssembly?utm_source=chatgpt.com "WebAssembly - MDN Web Docs - Mozilla"
[5]: https://github.com/naptha/tesseract.js/?utm_source=chatgpt.com "naptha/tesseract.js: Pure Javascript OCR for more than 100 ..."
