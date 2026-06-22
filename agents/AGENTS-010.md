Sí. Revisé `Docs`. Para **Innovation Engines Repair** debe documentarse como proyecto nuevo en `02_projects/innovation-engines-repair`, porque la documentación indica que lo específico de marca, rutas web, frontend, sistema visual, tareas y decisiones va en `02_projects/<nombre>` .

## APIs necesarias

1. **Gateway**

   * La web no debe pegar directo a APIs internas.
   * Flujo correcto: `Frontend -> API.PY.DJANGO.Gateway -> API propia del proyecto -> Core/Shared`.
   * Esto está marcado como regla obligatoria en Docs .

2. **API propia del proyecto**

   * Para servicios del taller, citas, formularios, galería, reseñas y configuración pública.
   * Docs exige API propia cuando hay marca independiente, datos propios o reglas de negocio propias .

3. **Clientes / Direcciones**

   * Para guardar datos del cliente: nombre, teléfono, email.
   * Para dirección del taller o futuras sucursales usar `CustomerAddress`/direcciones reutilizables: calle, colonia, ciudad, estado, CP, país, latitud y longitud .

4. **Notifications API**

   * Para enviar confirmación de cita por WhatsApp, email o SMS.
   * Docs dice que Notifications centraliza eventos, plantillas, envíos, errores y reintentos .

## Datos que necesito para echarla a andar

* Nombre oficial: **Innovation Engines Repair**.
* Teléfono: **771 424 0390**.
* Dirección real del taller.
* Horarios reales.
* WhatsApp real.
* Correo de contacto.
* Redes sociales.
* Servicios reales y precios si los habrá.
* Tipos de cita: diagnóstico, mantenimiento, reparación, eléctrico, afinación.
* Si aceptará citas automáticas o solo solicitud pendiente.
* Fotos reales del taller, motores, trabajos y equipo.
* Logo final aprobado.
* Textos finales de las 7 páginas.
* Ubicación para Google Maps.
* Política de garantía.
* Aviso de privacidad.

## Datos/API por página

1. **Inicio**

   * Datos públicos del negocio.
   * Servicios destacados.
   * CTA WhatsApp.
   * Reseñas resumidas.

2. **Servicios**

   * Catálogo de servicios.
   * Descripción.
   * Duración estimada.
   * Precio opcional.
   * Botón cotizar/agendar.

3. **Innovación**

   * Herramientas usadas.
   * Proceso de diagnóstico.
   * Beneficios.
   * Casos técnicos.

4. **Galería**

   * Imágenes antes/después.
   * Categoría.
   * Descripción.
   * Fecha.
   * Servicio relacionado.

5. **Opiniones**

   * Reseñas.
   * Calificación.
   * Servicio recibido.
   * Estado: publicada/pendiente.

6. **Nosotros**

   * Historia.
   * Equipo.
   * Misión.
   * Visión.
   * Valores.

7. **Contacto/Cita**

   * Formulario.
   * Datos de cliente.
   * Vehículo.
   * Síntoma.
   * Fecha preferida.
   * Notificación al taller.
   * Confirmación al cliente.

## Dónde documentarlo

Crear:

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

También actualizar:

```text
Docs/_meta/master-index.md
Docs/02_projects/_ecosystem/01_company_portfolio.md
Docs/02_projects/_ecosystem/gateway-matrix.md
```

Y aplicar los estándares UI: mobile first, responsive, acciones visibles, estados de carga/error/vacío y no prometer funciones sin backend real .




Sí. Esta es la **instrucción para Codex** para maquetar la web y dejarla documentada según `Docs`.

# INSTRUCCIÓN PARA CODEX — MAQUETAR WEB INNOVATION ENGINES REPAIR

## Objetivo

Crear la maqueta frontend de **Innovation Engines Repair**, respetando los mockups visuales aprobados en el chat: estilo oscuro, mecánico-tecnológico, luces azul/verde neón, textura metálica/fibra de carbono, botones visibles y enfoque en diagnóstico automotriz avanzado.

La web debe quedar documentada en:

```text
Docs/02_projects/innovation-engines-repair/
```

## Reglas obligatorias

1. No conectar todavía APIs reales si no existen.
2. No inventar datos reales del taller.
3. Usar `PENDIENTE_DE_DEFINIR` para datos faltantes.
4. La maqueta debe ser responsive: móvil, tablet y escritorio.
5. El frontend debe quedar preparado para consumir Gateway, no APIs internas directas.
6. Documentar toda decisión visual, estructura de páginas, rutas, datos requeridos y contratos futuros.

## Estructura web

Crear 7 páginas:

```text
/
 /servicios
 /innovacion
 /galeria
 /opiniones
 /nosotros
 /contacto
```

## Estilo visual aprobado

* Fondo oscuro: negro, carbón, metal.
* Acentos: verde neón y azul eléctrico.
* Tipografía moderna, fuerte, limpia.
* Botones grandes con CTA visible.
* Tarjetas oscuras con borde neón.
* Iconografía mecánica: motor, engrane, escáner, pistón, rayo, herramienta, WhatsApp.
* Inspiración visual: taller tecnológico, diagnóstico digital, escáner automotriz, precisión mecánica.

## Página 1 — Inicio

Ruta:

```text
/
```

Debe contener:

* Hero principal.
* Logo/nombre de marca.
* Frase: “Tecnología, precisión y potencia al servicio de tu motor.”
* Botones:

  * Agendar diagnóstico.
  * Ver servicios.
  * Llamar / WhatsApp.
* Sección “Quiénes somos”.
* Servicios destacados:

  * Diagnóstico Computarizado.
  * Reparación de Motor.
  * Mantenimiento Preventivo.
* Sección “Por qué elegirnos”.
* CTA intermedio.
* Opiniones resumidas.
* Footer.

## Página 2 — Servicios

Ruta:

```text
/servicios
```

Debe contener tarjetas para:

* Diagnóstico Computarizado.
* Reparación de Motor.
* Mantenimiento Preventivo.
* Sistema Eléctrico y Electrónico.
* Afinación y Ajustes Finos.
* Servicio Express.

Cada tarjeta debe tener:

* Ícono.
* Título.
* Descripción corta.
* Lista breve.
* Botón: “Más información” o “Cotizar”.

Agregar sección:

* “Tu motor analizado con precisión digital.”
* Beneficios:

  * Diagnóstico certero.
  * Tiempos claros.
  * Refacciones de calidad.
  * Trato transparente.

## Página 3 — Innovación

Ruta:

```text
/innovacion
```

Debe contener:

* Hero: “Innovación y Tecnología Automotriz”.
* Herramientas:

  * Escáner Automotriz Profesional.
  * Pruebas de Compresión Digitales.
  * Medidores y Sensores Electrónicos.
  * Software de Análisis y Reporte.
* Proceso tecnológico:

  1. Escaneo inicial.
  2. Pruebas físicas/electrónicas.
  3. Interpretación de datos.
  4. Informe digital.
  5. Reparación precisa.
* Beneficios:

  * Más precisión.
  * Menos gastos innecesarios.
  * Ahorro.
  * Transparencia.
* Casos reales simulados como contenido placeholder.

## Página 4 — Galería

Ruta:

```text
/galeria
```

Debe contener:

* Hero: “Nuestros Proyectos y Resultados Reales”.
* Galería antes/después.
* Tarjetas de proyectos.
* Sección “Tecnología en acción”.
* Casos destacados.
* Testimonios visuales.
* CTA: “Tu vehículo puede ser el próximo caso de éxito.”

Usar imágenes placeholder si no hay fotos reales, pero marcarlas como `PENDIENTE_DE_REEMPLAZAR`.

## Página 5 — Opiniones

Ruta:

```text
/opiniones
```

Debe contener:

* Hero: “Lo que opinan nuestros clientes”.
* Calificación general.
* Testimonios.
* Resultados medibles.
* Formulario o botón para dejar opinión.
* CTA final.

Datos placeholder permitidos, pero marcarlos como no verificados hasta tener reseñas reales.

## Página 6 — Nosotros

Ruta:

```text
/nosotros
```

Debe contener:

* Hero: “Somos innovación, precisión y confianza.”
* Historia del taller.
* Línea de tiempo:

  * 2015 — PENDIENTE_DE_CONFIRMAR.
  * 2019 — PENDIENTE_DE_CONFIRMAR.
  * 2023 — PENDIENTE_DE_CONFIRMAR.
* Equipo:

  * Nombre: PENDIENTE_DE_DEFINIR.
  * Cargo: PENDIENTE_DE_DEFINIR.
  * Foto: PENDIENTE_DE_REEMPLAZAR.
* Misión.
* Visión.
* Valores:

  * Precisión.
  * Transparencia.
  * Innovación.
  * Profesionalismo.
  * Compromiso.
* CTA final.

## Página 7 — Contacto / Cita

Ruta:

```text
/contacto
```

Debe contener:

* Hero: “Agenda tu diagnóstico hoy mismo.”
* Botones:

  * Contactar por WhatsApp.
  * Llamar ahora.
  * Agendar cita.
* Formulario:

  * Nombre completo.
  * Teléfono / WhatsApp.
  * Correo opcional.
  * Marca, modelo y año del vehículo.
  * Síntoma o servicio requerido.
  * Fecha preferida.
* Datos del taller:

  * Teléfono: 771 424 0390.
  * Dirección: PENDIENTE_DE_DEFINIR.
  * Correo: PENDIENTE_DE_DEFINIR.
  * Horario: PENDIENTE_DE_DEFINIR.
* Mapa placeholder.
* Recomendaciones antes de la cita.
* CTA final.

## Componentes reutilizables

Crear componentes:

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

## Documentación obligatoria

Crear estos documentos:

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

También actualizar:

```text
Docs/_meta/master-index.md
Docs/02_projects/_ecosystem/01_company_portfolio.md
Docs/02_projects/_ecosystem/gateway-matrix.md
```

## API futura requerida

Documentar como contrato futuro:

* `GET /public/site-config`
* `GET /public/services`
* `GET /public/gallery`
* `GET /public/testimonials`
* `POST /public/appointments`
* `POST /public/contact`
* `POST /public/reviews`

No implementar backend falso si no existe. Solo dejar mock local controlado.

## Datos faltantes

Registrar en documentación:

```text
PENDIENTE_DE_DEFINIR:
- Dirección real.
- Horarios reales.
- Correo oficial.
- Redes sociales.
- Fotos reales.
- Equipo real.
- Servicios reales finales.
- Precios si aplican.
- Política de garantía.
- Aviso de privacidad.
- Ubicación exacta de Google Maps.
```

## Validación final

Antes de cerrar:

* Todas las rutas cargan.
* Mobile first correcto.
* Botones principales visibles.
* No hay textos rotos.
* No hay datos inventados como reales.
* Mockups visuales respetados.
* Documentación creada.
* Contratos API documentados.
* Pendientes marcados claramente.

La base documental va en `02_projects/<proyecto>` porque Docs separa identidad, frontend, rutas, sistema visual y tareas específicas por proyecto ahí. También debe seguir el flujo `Frontend -> Gateway -> API propia -> Core/Shared`, como marca el estándar de Gateway.
