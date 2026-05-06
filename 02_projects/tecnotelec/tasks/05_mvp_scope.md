# Alcance MVP Tecno Telec

## Objetivo

Definir la primera version funcional minima de Tecno Telec.

MVP significa `Minimum Viable Product`: la version inicial que ya permite validar negocio, captar prospectos y generar cotizaciones sin construir todo el ERP completo.

## Entra en MVP

| Area | Incluye | Motivo |
| --- | --- | --- |
| Home | Presentacion clara de Tecno Telec y sus soluciones. | Dar contexto y confianza. |
| Soluciones | Listado de soluciones principales. | Guiar al cliente por necesidad, no solo por producto. |
| Detalle de solucion | Descripcion, beneficios, productos o paquetes relacionados. | Preparar cotizacion consultiva. |
| Cotizador basico | Formulario por necesidad/solucion. | Captar requerimientos y generar propuesta inicial. |
| Contacto | Formulario y datos de contacto. | Convertir prospectos. |
| WhatsApp directo | Boton visible hacia WhatsApp de la empresa. | Reducir friccion y acelerar asesoria. |
| Catalogo publicado | Productos normalizados desde Supplier/Catalog/Pricing. | Mostrar oferta tecnica vendible. |
| Gateway Tecno Telec | Punto unico para frontend. | Evitar que el frontend consuma APIs core directamente. |
| TecnoTelec API | Configuracion propia del proyecto. | Guardar reglas y formularios especificos. |
| Medicion basica | Eventos de contacto, cotizacion y WhatsApp. | Saber que funciona desde el inicio. |

## No entra en MVP inicial

| Area | Estado recomendado |
| --- | --- |
| Carrito completo | Fase posterior. |
| Checkout/pago en linea | Fase posterior. |
| POS | Fase posterior. |
| Facturacion CFDI completa | Fase posterior, despues de definir proveedor fiscal. |
| Licitaciones | Futuro. |
| App movil | Futuro. |
| Multi-tenant avanzado | Futuro. |
| Chat en sitio | Futuro, despues de validar volumen de conversaciones. |

## WhatsApp directo

El frontend debe incluir un boton directo a WhatsApp de la empresa.

Reglas:

- Debe estar disponible en Home, Soluciones, Detalle de solucion, Cotizador y Contacto.
- Debe abrir una conversacion con mensaje precargado segun contexto.
- Debe poder medirse como evento de conversion.
- El numero final de WhatsApp queda como variable de configuracion, no hardcodeado.

Ejemplos de mensajes:

```txt
Hola, quiero asesoria para una solucion de redes/WiFi.
Hola, quiero cotizar una solucion de videovigilancia.
Hola, necesito ayuda para elegir una solucion tecnologica.
```

## Chat futuro

Se contempla un chat dentro del sitio como fase posterior.

El chat puede evolucionar en tres niveles:

1. Chat manual con asesor.
2. Chat con respuestas rapidas y formularios guiados.
3. Chat asistido por IA conectado al catalogo, cotizador y estado de proyectos.

Condiciones antes de implementarlo:

- Definir proveedor o tecnologia.
- Definir horario de atencion.
- Definir traspaso a asesor humano.
- Definir que datos puede consultar el chat.
- Definir politicas de privacidad y consentimiento.

## Sugerencias adicionales

### Captura de leads

Todo contacto debe poder generar un lead minimo:

- Nombre.
- Telefono o WhatsApp.
- Correo opcional.
- Tipo de solucion buscada.
- Mensaje o necesidad.
- Origen: formulario, WhatsApp, cotizador o contacto.

### Analytics de conversion

Medir desde el inicio:

- Click en WhatsApp.
- Inicio de cotizacion.
- Cotizacion enviada.
- Formulario de contacto enviado.
- Solucion mas consultada.
- Producto o paquete mas consultado.

### Consentimiento

Agregar aceptacion de contacto y aviso de privacidad en formularios que capturen datos personales.

### SEO local

Preparar Home, Soluciones y Contacto con informacion local de servicios, cobertura y especialidades para mejorar descubrimiento organico.

