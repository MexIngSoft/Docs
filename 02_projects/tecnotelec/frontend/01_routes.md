# Rutas frontend

| Ruta | Pagina | Objetivo | Consume API | Estado |
|---|---|---|---|---|
| `/` | Inicio | Presentar Tecno Telec y soluciones. | Gateway | PROPUESTA |
| `/soluciones` | Soluciones | Listar servicios/soluciones. | Gateway | PROPUESTA |
| `/soluciones/[slug]` | Detalle solucion | Explicar solucion y CTA de cotizacion. | Gateway | PROPUESTA |
| `/cotizador` | Cotizador | Elegir tipo de solucion. | Gateway/Projects | PROPUESTA |
| `/cotizador/[solution]` | Formulario solucion | Capturar necesidades. | Gateway/Projects/Rules | PROPUESTA |
| `/carrito` | Carrito | Intencion de compra web. | Gateway/Cart | PROPUESTA |
| `/checkout` | Checkout | Confirmar datos, precio, envio y pago. | Gateway/Sales | PROPUESTA |
| `/mi-cuenta` | Cuenta cliente | Ver proyectos, cotizaciones y ordenes. | Gateway/Auth/Sales | PROPUESTA |
| `/login` | Login | Acceso cliente/admin. | Gateway/Auth | PROPUESTA |
| `/admin` | Admin | Operacion interna. | Gateway/Auth | PROPUESTA |
| `/dashboard` | Dashboard | Indicadores operativos. | Gateway | PROPUESTA |
| `/contacto` | Contacto | Solicitar informacion, cotizacion o WhatsApp. | Gateway/Notifications | PROPUESTA |
| `/licitaciones` | Licitaciones | Registrar o revisar oportunidades de licitacion. | Gateway/GovernmentTender | FUTURO |
