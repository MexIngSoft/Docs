# INSTRUCCIONES MAESTRAS — TECNO TELEC + JOBCRON

Objetivo:
Rehacer la documentación y lógica de procesos de Tecno Telec y JobCron bajo la nueva arquitectura:

Web Tecno Telec
→ TecnoTelec Gateway API
→ Core APIs necesarias
→ TecnoTelec API solo para configuración propia
→ JobCron como panel administrativo central.

Regla principal:
No descargar toda la lógica en TecnoTelec API.
No convertir Gateway en una API desordenada.
Gateway orquesta y prepara respuestas para Web.
Core APIs conservan la lógica del ERP.
TecnoTelec API guarda solo datos únicos de Tecno Telec.
JobCron administra, configura y supervisa todo.

La Web Tecno Telec NO debe consumir APIs internas directamente.
La Web solo consume TecnoTelec Gateway API.

TecnoTelec API NO debe ser la base maestra del catálogo.
La información base del catálogo debe venir de:

- Catalog API
- Pricing API
- Supplier API
- Inventory API
- Sales / Quote API si aplica

TecnoTelec API solo debe guardar información propia de Tecno Telec:

- banners
- textos comerciales
- secciones de Home
- soluciones
- productos destacados
- reglas de publicación por proyecto
- formularios propios
- configuración visual
- slugs comerciales
- agrupaciones propias
- orden visual
- landings