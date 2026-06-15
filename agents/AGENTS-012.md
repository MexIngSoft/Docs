Sí. La forma correcta sería:

**LeadHunter deja de ser producto separado** y se convierte en un módulo interno del ERP llamado:

**Prospecting / Clientes Potenciales**

Objetivo: usar los **$5 USD mensuales de Apify** con máximo cuidado. Apify confirma que el plan Free incluye **$5 para gastar en Apify Store o Actors propios**. ([Apify][1])

## Estructura recomendada

```text
ERP / JobCron
├── Prospecting
│   ├── Búsquedas Apify
│   ├── Negocios encontrados
│   ├── Deduplicación
│   ├── Scoring
│   ├── Cola de contacto
│   └── Seguimiento comercial
│
├── RefApart
│   └── Proveedores / refaccionarias / talleres / deshuesaderos
│
└── CRM
    └── Clientes para páginas web y ERP
```

## Regla principal

No gastar Apify buscando todo México de golpe.

Se debe trabajar por **lotes pequeños**:

```text
Ciudad + zona rica + giro + límite de resultados
```

Ejemplo:

```text
San Pedro Garza García
taller mecánico
50 resultados
```

Después:

```text
Monterrey
refaccionaria
50 resultados
```

## Filtros principales

Cada negocio debe guardarse una sola vez usando:

```text
google_place_id
nombre_normalizado
teléfono
sitio_web
dirección
latitud/longitud
```

Si ya existe, no se vuelve a insertar.

## Tabla principal

```sql
prospecting_business
- id
- source
- source_place_id
- name
- normalized_name
- category
- city
- state
- address
- phone
- whatsapp
- website
- rating
- reviews_count
- latitude
- longitude
- has_phone
- has_website
- has_whatsapp
- is_refapart_candidate
- is_web_candidate
- score
- status
- created_at
- updated_at
```

## Clasificación automática

```text
Si tiene giro de refacciones, taller, deshuesadero, autopartes:
→ aparece en RefApart

Si no tiene página web:
→ candidato para vender página web

Si tiene buena calificación y muchas reseñas:
→ prioridad alta

Si tiene WhatsApp:
→ contacto rápido

Si tiene web pero mala web:
→ candidato para mejora web / ERP
```

## Score recomendado

```text
+30 si rating >= 4.7
+25 si reseñas >= 100
+20 si tiene WhatsApp
+15 si no tiene página web
+15 si pertenece a giro RefApart
+10 si está en zona premium
-30 si rating < 4.0
-20 si ya fue contactado
```

## Interfaz del ERP

Pantalla: **Prospectos**

Filtros:

```text
Ciudad
Estado
Giro
Tiene web / No tiene web
Tiene teléfono / No tiene teléfono
Tiene WhatsApp
Rating mínimo
Reseñas mínimas
Candidato RefApart
Candidato página web
No contactado
```

Botones:

```text
Buscar con Apify
Importar resultados
Eliminar duplicados
Enviar a RefApart
Crear tarea de contacto
Marcar como contactado
Abrir WhatsApp
```

## Flujo barato con $5 USD

1. Ejecutar máximo **1 a 3 búsquedas pequeñas al día**.
2. Limitar a **50 o 100 resultados** por búsqueda.
3. Buscar primero zonas ricas.
4. No enriquecer emails al inicio.
5. No repetir ciudad + giro si ya fue consultado.
6. Guardar todo en ERP.
7. Filtrar localmente sin volver a gastar Apify.

Hay actores de Google Maps en Apify con precios desde rangos bajos por 1,000 resultados, pero varían según actor; por eso el ERP debe guardar el costo estimado por búsqueda y bloquear ejecuciones si se alcanza el presupuesto mensual. ([Apify][2])

## Instrucción para Codex

```text
Implementar módulo interno ERP Prospecting.

El módulo debe consumir Apify solo bajo demanda manual al inicio, con control estricto de presupuesto mensual de 5 USD.

Debe permitir buscar negocios por:
- estado
- ciudad
- zona
- giro
- límite de resultados
- rating mínimo
- reseñas mínimas

Cada resultado debe guardarse en prospecting_business, evitando duplicados por source_place_id, teléfono, website y nombre normalizado + ciudad.

El sistema debe clasificar automáticamente:
1. Prospecto RefApart
2. Prospecto página web
3. Prospecto ERP
4. Prospecto descartado

Los negocios relacionados con refacciones, autopartes, talleres, transmisiones, deshuesaderos, grúas y logística deben enviarse también como candidatos visibles en RefApart.

La interfaz del ERP debe mostrar:
- ranking por score
- filtros comerciales
- estado de contacto
- botón WhatsApp
- botón enviar a RefApart
- historial de búsqueda
- presupuesto usado del mes
- resultados nuevos
- duplicados evitados

No se debe volver a consultar Apify para datos ya existentes.
Todo filtrado posterior debe hacerse desde la base local.
```

Mi recomendación clara: **primero construir el módulo manual**, luego automatizar. Con $5 USD, el valor está en guardar, deduplicar y filtrar bien, no en raspar mucho.

[1]: https://apify.com/pricing?utm_source=chatgpt.com "Apify pricing - plans for data collection at any scale"
[2]: https://apify.com/dev-sinior/google-maps-scraper-premium/api/javascript?utm_source=chatgpt.com "Google Maps Scraper 2026 API in JavaScript"


Sí. El módulo manual debe llamarse:

# Módulo ERP: Prospectos y Captación Manual

Su objetivo es que tú puedas trabajar **con poco dinero**, cargar negocios poco a poco, filtrarlos, priorizarlos y convertirlos en clientes para:

1. páginas web económicas,
2. ERP,
3. RefApart,
4. proveedores,
5. talleres,
6. refaccionarias,
7. deshuesaderos,
8. logística.

---

## 1. Idea central

Este módulo NO será solo una lista de negocios.

Será una herramienta para:

```text
Encontrar negocios → clasificarlos → priorizarlos → contactarlos → dar seguimiento → convertirlos en clientes
```

Debe funcionar aunque no haya Apify.

Primero debe permitir captura manual desde Google Maps, Facebook, WhatsApp, directorios, páginas web o búsquedas propias.

---

# 2. Nombre del módulo

```text
Prospecting
```

Nombre visible en ERP:

```text
Prospectos
```

Submódulos:

```text
Prospectos
Búsquedas manuales
Zonas comerciales
Giros comerciales
Contactos
Seguimientos
Oportunidades
Candidatos RefApart
Candidatos páginas web
Candidatos ERP
Historial de contacto
```

---

# 3. Pantalla principal

## Vista: Prospectos

Columnas:

```text
Score
Nombre del negocio
Giro
Ciudad
Estado
Rating
Reseñas
Tiene teléfono
Tiene WhatsApp
Tiene página web
Candidato para
Estado
Último contacto
Próxima acción
```

Estados:

```text
Nuevo
Pendiente de revisar
Aprobado
Contactar
Contactado
Interesado
No interesado
Cliente potencial
Cliente ganado
Descartado
Duplicado
```

---

# 4. Captura manual rápida

Debe existir un botón:

```text
Agregar prospecto
```

Campos mínimos:

```text
Nombre del negocio
Giro
Ciudad
Estado
Teléfono
WhatsApp
Página web
Facebook
Google Maps URL
Rating
Número de reseñas
Dirección
Notas
```

Campos opcionales:

```text
Nombre del encargado
Correo
Horario
Zona económica
Fuente
Servicios que ofrece
Problema detectado
Qué se le puede vender
```

---

# 5. Captura manual por lote

Debe permitir pegar muchos negocios en texto o CSV.

Ejemplo:

```text
Taller El Rápido | Pachuca | 4.8 | 120 reseñas | 7710000000 | sin web
Refaccionaria López | Tulancingo | 4.6 | 80 reseñas | 7750000000 | tiene web
```

El ERP debe intentar separar datos y pedir revisión antes de guardar.

---

# 6. Clasificación automática

Cuando se guarda un prospecto, el sistema debe marcarlo automáticamente.

## Candidato página web

Si:

```text
No tiene página web
Tiene teléfono o WhatsApp
Rating >= 4.3
Reseñas >= 20
```

Entonces:

```text
is_web_candidate = true
```

## Candidato ERP

Si:

```text
Tiene página web
Tiene buen movimiento comercial
Tiene muchas reseñas
Tiene varios servicios
Pertenece a giro con inventario, ventas o logística
```

Entonces:

```text
is_erp_candidate = true
```

## Candidato RefApart

Si el giro contiene:

```text
refaccionaria
autopartes
taller mecánico
transmisiones
deshuesadero
grúa
llantas
hojalatería
mecánica
motores
suspensión
dirección hidráulica
```

Entonces:

```text
is_refapart_candidate = true
```

---

# 7. Score comercial

Cada prospecto debe tener un puntaje.

```text
+30 si rating >= 4.7
+20 si rating entre 4.4 y 4.6
+25 si reseñas >= 100
+15 si reseñas entre 30 y 99
+25 si tiene WhatsApp
+15 si tiene teléfono
+20 si no tiene página web
+15 si tiene página web mala
+20 si pertenece a giro RefApart
+15 si está en zona premium
-30 si rating < 4.0
-20 si no tiene teléfono ni WhatsApp
-20 si ya fue contactado y no respondió
-50 si fue descartado
```

Prioridad:

```text
80 a 100 = prioridad alta
50 a 79 = prioridad media
20 a 49 = revisar
0 a 19 = baja prioridad
```

---

# 8. Zonas comerciales

Crear tabla de zonas:

```text
San Pedro Garza García
Monterrey
Zapopan
Guadalajara
Querétaro
CDMX
Mérida
Puebla
León
Morelia
Pachuca
Tulancingo
Tizayuca
Actopan
```

Cada zona debe tener:

```text
Estado
Municipio
Nivel económico
Prioridad
Última búsqueda
Total prospectos
Prospectos contactados
Clientes ganados
```

Niveles:

```text
Premium
Alta
Media
Popular
Baja
```

---

# 9. Giros comerciales

Crear catálogo de giros:

```text
Taller mecánico
Refaccionaria
Deshuesadero
Transmisiones automáticas
Direcciones hidráulicas
Llantera
Hojalatería y pintura
Grúas
Autopartes
Ferretería
Restaurante
Clínica
Estética
Inmobiliaria
Escuela
Dentista
Abogado
Contador
Veterinaria
Gimnasio
```

Cada giro debe tener:

```text
Potencial página web
Potencial ERP
Potencial RefApart
Ticket estimado
Prioridad
```

---

# 10. Cola diaria de trabajo

El ERP debe generar una pantalla:

```text
Prospectos para contactar hoy
```

Debe mostrar máximo:

```text
10 a 30 negocios al día
```

Ordenados por:

```text
Score más alto
No contactados
Con WhatsApp
Sin página web
Mejor rating
Más reseñas
```

---

# 11. Botón de WhatsApp

Cada prospecto con teléfono debe tener botón:

```text
Contactar por WhatsApp
```

Mensaje automático para página web:

```text
Hola, buen día. Vi su negocio en Google y noté que tienen muy buenas reseñas. Estoy ayudando a negocios locales a tener una página web sencilla y económica para que más clientes los encuentren. ¿Le puedo mandar una propuesta rápida?
```

Mensaje para ERP:

```text
Hola, buen día. Vi que su negocio tiene buen movimiento y buenas reseñas. Estoy desarrollando herramientas para ayudar a negocios a controlar clientes, ventas, pedidos e inventario. ¿Le puedo mostrar una propuesta sencilla?
```

Mensaje para RefApart:

```text
Hola, buen día. Lo contacto de RefApart. Estamos creando una red de proveedores de refacciones para conectar clientes con piezas disponibles. ¿Manejan refacciones o autopartes?
```

---

# 12. Seguimiento

Cada contacto debe guardar:

```text
Fecha
Canal
Mensaje usado
Respuesta
Interés
Próxima acción
Usuario responsable
Notas
```

Tipos de seguimiento:

```text
Primer mensaje
Segundo mensaje
Llamada
Cotización enviada
Recordatorio
Cierre
No respondió
No interesado
Cliente ganado
```

---

# 13. Base de datos recomendada

```sql
prospecting_business
prospecting_contact
prospecting_followup
prospecting_zone
prospecting_category
prospecting_search_batch
prospecting_score_history
prospecting_opportunity
```

---

# 14. Relación con RefApart

Cuando un prospecto sea candidato RefApart, debe aparecer en:

```text
RefApart > Proveedores potenciales
```

Con estado:

```text
Pendiente de contactar
Contactado
Acepta participar
No acepta
Proveedor activo
```

---

# 15. Relación con ventas web

Cuando un prospecto no tenga página web, debe aparecer en:

```text
ERP > Ventas > Páginas web económicas
```

Con producto sugerido:

```text
Landing básica
Página informativa
Catálogo simple
WhatsApp integrado
Google Maps integrado
```

---

# 16. Regla de ahorro

La regla principal:

```text
Primero capturar, guardar y filtrar manualmente.
Después usar Apify solo para llenar huecos.
Nunca consultar dos veces el mismo giro en la misma ciudad sin revisar resultados anteriores.
```

---

# 17. Instrucción para Codex

```text
Crear módulo ERP llamado Prospecting.

Debe funcionar primero de forma manual, sin depender de Apify.

Implementar:
1. CRUD de prospectos.
2. Captura individual.
3. Captura por lote.
4. Catálogo de zonas.
5. Catálogo de giros.
6. Score automático.
7. Detección de duplicados.
8. Clasificación automática para:
   - candidato página web
   - candidato ERP
   - candidato RefApart
9. Cola diaria de contacto.
10. Historial de seguimiento.
11. Botones de WhatsApp con mensajes predefinidos.
12. Vista especial de candidatos RefApart.
13. Vista especial de candidatos para páginas web.
14. Vista de oportunidades comerciales.
15. Dashboard con:
   - prospectos nuevos
   - prospectos contactados
   - interesados
   - clientes ganados
   - zonas trabajadas
   - giros más rentables

El módulo debe guardar todos los prospectos localmente y evitar duplicados por:
- teléfono
- WhatsApp
- website
- google_maps_url
- nombre normalizado + ciudad + estado

Debe estar preparado para que en una segunda fase Apify pueda insertar resultados en la misma tabla prospecting_business sin cambiar la estructura.
```

La clave: **este módulo manual ya te permite vender desde el día uno**, aunque Apify esté limitado o no tenga saldo.
