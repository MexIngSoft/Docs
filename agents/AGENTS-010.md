# INSTRUCCIÓN PARA CODEX — OPTIMIZAR AGENTS-010

Trabaja únicamente en la rama `dev`.

No ejecutes todos los agents.
No implementes código.
No modifiques otros `AGENTS-*.md`.

Optimiza únicamente:

`Docs/agents/AGENTS-010.md`

---

# Resumen del agente actual

`AGENTS-010.md` documenta **Innovation Engines Repair** como proyecto nuevo en:

`Docs/02_projects/innovation-engines-repair/`

El agente define una web para taller automotriz con identidad tecnológica/mecánica:

* fondo oscuro;
* acentos azul eléctrico y verde neón;
* enfoque en diagnóstico automotriz avanzado;
* CTA visibles;
* diseño mobile first;
* mock local si no existen APIs reales.

La web debe tener 7 rutas:

```text
/
/servicios
/innovacion
/galeria
/opiniones
/nosotros
/contacto
```

Datos confirmados:

```text
Nombre oficial: Innovation Engines Repair
Teléfono: 771 424 0390
```

Datos faltantes deben marcarse como:

```text
PENDIENTE_DE_DEFINIR
PENDIENTE_DE_REEMPLAZAR
PENDIENTE_DE_CONFIRMAR
```

---

# AGENTS-010 — Innovation Engines Repair

## Objetivo

Optimizar la instrucción documental de Innovation Engines Repair como web comercial de taller automotriz tecnológico, sin inventar datos reales ni conectar APIs inexistentes.

## Alcance

Puede tocar:

* `Docs/agents/AGENTS-010.md`

Debe revisar:

* estructura documental del proyecto;
* rutas web;
* identidad visual;
* contratos API futuros;
* datos faltantes;
* uso de Gateway;
* APIs reutilizables;
* reporte de ejecución.

Debe dejar:

* instrucción optimizada;
* alcance claro;
* tareas verificables;
* validaciones;
* criterio de cierre;
* reporte en `Docs/agents/EXECUTION_REPORT.md`.

## Lectura mínima obligatoria

* `Docs/README.md`
* `Docs/_meta/active-work-index.md`
* `Docs/agents/AGENT_GLOBAL_RULES.md`
* `Docs/agents/EXECUTION_REPORT.md`
* `Docs/03_standards/architecture/api-gateway-standard.md`
* `Docs/03_standards/frontend/ui-ux-standard.md`
* `Docs/03_standards/frontend/nextjs-project-standard.md`
* `Docs/03_standards/product/product-strategy.md`
* `Docs/03_standards/product/module-catalog.md`
* `Docs/01_core_erp/apis/00_api_index.md`
* `Docs/03_standards/codex/codex-output-report-standard.md`
* `Docs/agents/AGENTS-010.md`

## Fuera de alcance

* No ejecutar otros agents.
* No implementar backend.
* No crear APIs nuevas sin contrato.
* No crear schemas, modelos ni migraciones sin decisión documentada.
* No modificar `main` ni `pro`.
* No leer todo `Docs`.
* No tocar proyectos no relacionados.
* No inventar dirección, horarios, correo, reseñas, fotos, precios ni historia del taller.
* No conectar WhatsApp, SMS, email ni Google Maps real sin datos confirmados.
* No publicar testimonios como reales si son placeholder.
* No crear Auth, Gateway, Docker ni API por proyecto como patrón automático.

## Clasificación documental obligatoria

Clasificar así:

```text
Innovation Engines Repair = Independent Project / Taller automotriz
Web = Frontend comercial específico del proyecto
API propia = Conceptual, solo si aplica por citas, servicios, galería, reseñas y configuración pública
Gateway = Entrada única desde frontend
Notifications = API reutilizable para confirmaciones futuras
Address = API reutilizable para dirección del taller o sucursales futuras
Customer/Contact = capacidad reutilizable para datos de contacto si aplica
```

Ubicación documental:

```text
Docs/02_projects/innovation-engines-repair/
```

## Tareas

1. Reescribir `AGENTS-010.md` preservando toda la intención actual:

   * web de Innovation Engines Repair;
   * estilo oscuro mecánico-tecnológico;
   * neón azul/verde;
   * 7 páginas;
   * frontend preparado para Gateway;
   * mock local controlado;
   * contratos API futuros;
   * datos faltantes marcados correctamente.

2. Documentar estructura web obligatoria:

```text
/             Inicio
/servicios    Catálogo de servicios
/innovacion   Diagnóstico y tecnología
/galeria      Trabajos, antes/después y casos visuales
/opiniones    Reseñas y testimonios
/nosotros     Historia, misión, visión y valores
/contacto     Contacto, cita y formulario
```

3. Documentar estilo visual aprobado:

```text
Fondo: negro, carbón, metal, fibra de carbono
Acentos: verde neón, azul eléctrico
Sensación: taller tecnológico, diagnóstico digital, precisión mecánica
Botones: grandes, visibles, CTA claros
Tarjetas: oscuras, borde neón, buena lectura
Iconografía: motor, engrane, escáner, pistón, rayo, herramienta, WhatsApp
```

4. Documentar contenido por página:

Inicio:

* hero principal;
* nombre/logo;
* frase: “Tecnología, precisión y potencia al servicio de tu motor.”;
* CTA Agendar diagnóstico;
* CTA Ver servicios;
* CTA Llamar / WhatsApp;
* quiénes somos;
* servicios destacados;
* opiniones resumidas;
* footer.

Servicios:

* Diagnóstico Computarizado;
* Reparación de Motor;
* Mantenimiento Preventivo;
* Sistema Eléctrico y Electrónico;
* Afinación y Ajustes Finos;
* Servicio Express;
* botón cotizar/agendar.

Innovación:

* herramientas usadas;
* escáner automotriz profesional;
* pruebas de compresión digitales;
* sensores;
* software de análisis;
* proceso tecnológico;
* informe digital;
* beneficios.

Galería:

* imágenes antes/después;
* tarjetas de proyectos;
* casos destacados;
* fotos placeholder con `PENDIENTE_DE_REEMPLAZAR`.

Opiniones:

* calificación general;
* testimonios;
* resultados medibles;
* formulario/botón para opinión;
* placeholder marcado como no verificado.

Nosotros:

* historia;
* línea de tiempo con `PENDIENTE_DE_CONFIRMAR`;
* equipo con `PENDIENTE_DE_DEFINIR`;
* misión;
* visión;
* valores.

Contacto:

* teléfono `771 424 0390`;
* dirección `PENDIENTE_DE_DEFINIR`;
* correo `PENDIENTE_DE_DEFINIR`;
* horario `PENDIENTE_DE_DEFINIR`;
* formulario;
* vehículo;
* síntoma;
* fecha preferida;
* mapa placeholder.

5. Documentar componentes reutilizables del frontend:

```text
Header
Footer
HeroSection
CTAButton
ServiceCard
FeatureCard
TestimonialCard
ProjectGalleryCard
ContactForm
MapPlaceholder
SectionTitle
NeonCard
```

6. Documentar API futura como contrato conceptual, no como activa:

```text
GET /public/site-config
GET /public/services
GET /public/gallery
GET /public/testimonials
POST /public/appointments
POST /public/contact
POST /public/reviews
```

7. Documentar flujo obligatorio:

```text
Frontend Innovation Engines Repair
↓
API.PY.DJANGO.Gateway
↓
API propia del proyecto, solo si aplica
↓
Core/Shared APIs
```

Prohibido:

```text
Frontend -> API interna directa
Frontend -> Base de datos
Frontend -> Notifications directo
Frontend -> Address directo
```

8. Documentar datos faltantes:

```text
PENDIENTE_DE_DEFINIR:
- Dirección real
- Horarios reales
- WhatsApp real si difiere del teléfono
- Correo oficial
- Redes sociales
- Servicios finales
- Precios si aplican
- Política de garantía
- Aviso de privacidad
- Ubicación exacta Google Maps
- Textos finales de las páginas

PENDIENTE_DE_REEMPLAZAR:
- Fotos reales del taller
- Fotos de motores
- Fotos de trabajos
- Fotos del equipo
- Logo final si no está aprobado

PENDIENTE_DE_CONFIRMAR:
- Historia del taller
- Línea de tiempo
- Reseñas reales
- Equipo real
```

9. Documentar archivos canónicos esperados:

```text
Docs/02_projects/innovation-engines-repair/README.md
Docs/02_projects/innovation-engines-repair/business.md
Docs/02_projects/innovation-engines-repair/frontend.md
Docs/02_projects/innovation-engines-repair/visual-identity.md
Docs/02_projects/innovation-engines-repair/api-contracts.md
Docs/02_projects/innovation-engines-repair/database.md
Docs/02_projects/innovation-engines-repair/security.md
Docs/02_projects/innovation-engines-repair/repositories.md
Docs/02_projects/innovation-engines-repair/local-runbook.md
Docs/02_projects/innovation-engines-repair/tasks/01_mvp.md
```

También puede proponer actualizar, solo si aplica:

```text
Docs/_meta/master-index.md
Docs/02_projects/_ecosystem/01_company_portfolio.md
Docs/02_projects/_ecosystem/gateway-matrix.md
```

10. Actualizar `Docs/agents/EXECUTION_REPORT.md` registrando:

* agent revisado;
* documentos leídos;
* Context Pack usado;
* cambios realizados;
* validaciones;
* pendientes reales;
* bloqueos;
* decisiones documentales;
* APIs reutilizadas;
* APIs no creadas y motivo.

## Validaciones

Ejecutar solo validaciones documentales aplicables:

* validar que solo se modificó `Docs/agents/AGENTS-010.md`;
* validar que no se modificaron otros agents;
* validar que no se creó API nueva;
* validar que no se crearon migraciones;
* validar que no se inventaron datos reales;
* validar que los placeholders están marcados;
* validar que frontend queda preparado para Gateway;
* validar que no hay conexión directa a APIs internas;
* validar que las 7 rutas están documentadas;
* validar que los contratos API están como futuros/conceptuales;
* validar rutas y enlaces modificados;
* registrar documentos leídos;
* ejecutar `git diff --check` si el entorno lo permite.

No declarar validaciones no ejecutadas.

Si una validación no puede ejecutarse, registrar causa exacta.

## Reporte obligatorio

Actualizar:

`Docs/agents/EXECUTION_REPORT.md`

Debe registrar:

* `AGENTS-010.md`;
* documentos leídos;
* Context Pack elegido;
* documentos fuera de alcance;
* cambios realizados;
* validaciones ejecutadas;
* resultado de validaciones;
* pendientes reales con `PENDIENTE_DE_DEFINIR`;
* bloqueos;
* decisiones documentales;
* estado final del agent.

## Criterio de cierre

El agent queda listo solo si:

* la instrucción es más clara y ejecutable;
* no pierde ninguna decisión del agente actual;
* conserva Innovation Engines Repair como proyecto independiente;
* conserva la web de 7 páginas;
* conserva el estilo visual oscuro/neón;
* conserva el teléfono `771 424 0390`;
* no inventa datos reales;
* no conecta APIs inexistentes;
* no crea backend sin contrato;
* no duplica APIs reutilizables;
* define lectura mínima;
* define alcance;
* define fuera de alcance;
* define tareas verificables;
* define validaciones;
* define dónde reportar.

## Reglas finales

Si `AGENTS-010.md` está vacío, no inventar tareas; dejarlo como `Sin instrucciones`.

Si el agent ya fue ejecutado y no hay cambios nuevos, documentar que está cerrado.

Si falta información esencial, marcar `Bloqueado` y dejar preguntas concretas.

No eliminar, mover ni renombrar `Docs/agents/AGENTS-010.md`.

No limpiar el contenido del agent.

Esta tarea solo optimiza la instrucción del agent; no ejecuta Innovation Engines Repair ni crea su implementación.
