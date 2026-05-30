Te dejo la instrucción ya mejorada y ordenada para pasarla al sistema/desarrollador:

# Correcciones de contenido visible, flujo de carga documental y vistas de LexNova

## 1. Ocultar información técnica al usuario

En `http://localhost:3002/servicios` no debe mostrarse:

```text
Gateway único para identidad y permisos
```

Ese texto es técnico y no aporta valor al usuario final. Debe cambiarse por contenido comercial y entendible, por ejemplo:

```text
Gestiona tus documentos legales en un solo lugar.
Consulta tus casos, revisa avances y da seguimiento a tus expedientes de forma clara y segura.
```

---

## 2. Login sin términos técnicos

En `http://localhost:3002/auth/login` no debe aparecer:

```text
Gateway/BFF
Sesión verificada por LexNova Gateway
```

Debe reemplazarse por mensajes simples:

```text
Accede a tu cuenta LexNova.
Consulta tus casos, documentos y avances de forma segura.
```

---

## 3. Logo con mejor contraste

El logo:

```text
/images/lexnova-logo.svg
```

no contrasta correctamente en la vista anterior.

Se debe:

* cambiar por una versión con mejor contraste,
* usar versión blanca si el fondo es oscuro,
* usar versión azul/dorada si el fondo es claro,
* o retirarlo temporalmente si afecta la lectura visual.

---

## 4. Datos de contacto con hipervínculos

Los datos deben quedar así:

```text
Correo: contacto@lexnova.mx
WhatsApp: +52 1 322 013 1473
Horario: Analizador documental disponible 24/7
Ubicación: No mostrar
```

Implementación:

```html
<a href="mailto:contacto@lexnova.mx">contacto@lexnova.mx</a>

<a href="https://wa.me/5213220131473" target="_blank">
  +52 1 322 013 1473
</a>
```

La ubicación no debe mostrarse porque LexNova opera como empresa en línea.

---

## 5. Ocultar estados técnicos en carga documental

En:

```text
http://localhost:3002/dashboard/modules/cases/upload
```

no deben mostrarse códigos como:

```text
PENDING_CLASSIFICATION
TEXT_EXTRACTION
SEGMENTATION
INDEX_GENERATED
SECTION_INSERT
READY_FOR_REVIEW
```

Deben mostrarse estados entendibles:

```text
Documento recibido
Extrayendo texto
Detectando secciones
Generando índice
Pendiente de revisión
Listo para revisar
```

Los códigos técnicos deben quedar solo para backend, logs o panel técnico.

---

## 6. Marcar contenido de maqueta

Todo dato que no venga de base de datos o API debe marcarse como contenido de prueba.

Ejemplo:

```text
Cliente Demo
Expediente Demo
Documento Demo
```

Debe mostrarse con un distintivo visual:

```text
[Dato de prueba]
```

o un color diferente, por ejemplo amarillo suave, para indicar que debe sustituirse por contenido dinámico.

---

## 7. Flujo correcto después de subir documento

Después de cargar un documento, debe abrirse una interfaz de índice documental, no solo un mensaje de revisión.

La pantalla debe mostrar:

```text
Documento cargado correctamente.

Índice detectado:
1. Registro de carpeta de investigación — páginas 1 a 4
2. Informe policial homologado — páginas 5 a 12
3. Entrevista — páginas 13 a 18

Hojas sin clasificar:
Página 19, página 20
```

---

## 8. Editor de índice documental

La interfaz debe permitir:

* agregar nuevo índice,
* editar título,
* seleccionar tipo de documento,
* definir página inicial,
* definir página final,
* unir secciones,
* separar secciones,
* marcar hojas como anexo,
* marcar hojas como no relacionadas,
* dejar hojas pendientes,
* aprobar índice.

Regla automática:

```text
Si una sección inicia en la página 1 y la siguiente inicia en la página 5,
la primera sección termina automáticamente en la página 4.
```

El usuario solo modifica manualmente si necesita ajustar el rango.

---

## 9. Hojas sin índice

Si hay páginas que no pertenecen a ningún índice, el sistema debe avisar:

```text
Hay hojas sin clasificar.
Estas páginas todavía no pertenecen a ningún documento detectado.
```

Opciones:

```text
Agregar a sección existente
Crear nuevo documento
Marcar como anexo
Marcar como no relacionado
Dejar pendiente
```

---

## 10. Documentos recién cargados en casos y dashboard

Cuando se sube un documento, debe aparecer inmediatamente en:

## Listado de casos

Con estado:

```text
Pendiente de revisión
```

## Dashboard

En una sección prioritaria:

```text
Documentos pendientes por revisar
```

Ejemplo:

```text
Nuevo documento cargado
Expediente: LEX-2026-000001
Estado: Pendiente de revisión
Acción: Revisar índice
```

---

## 11. Dashboard con prioridades

El dashboard debe priorizar:

1. Documentos recién subidos.
2. Documentos pendientes de revisión.
3. Expedientes con actividad reciente.
4. Casos con plazos próximos.
5. Resultados pendientes.
6. Solicitudes del cliente.

---

## 12. Búsqueda y filtros en casos

En el módulo de casos debe existir una barra de búsqueda.

Debe buscar por:

```text
Número interno LexNova
NUC
Causa penal
Amparo
Apelación
Toca
Nombre del cliente
Víctima
Imputado
Autoridad
Tipo de documento
Palabra clave
```

También debe existir un filtro por relaciones:

```text
Mostrar relacionados:
☑ Directos
☑ Indirectos
☑ Probatorios
☑ Contextuales
☑ Procedimientos derivados
```

---

## 13. Paginación en listados

Los listados deben tener:

```text
Anterior
Siguiente
Primera página
Última página
```

Si no hay suficientes elementos:

* ocultar botones,
* o mostrarlos deshabilitados en gris.

También debe existir selector:

```text
Mostrar 10
Mostrar 25
Mostrar 50
Mostrar 100
```

---

## 14. Perfil sin códigos técnicos

No debe aparecer:

```text
CLIENT_RESTRICTED - Cliente Restricted
Tipo de perfil: CLIENT_RESTRICTED
```

Debe mostrarse:

```text
Cliente
```

Si tiene más permisos:

```text
Cliente (+)
```

Si tiene permisos reducidos:

```text
Cliente (-)
```

Ejemplos:

```text
Cliente
Cliente (+)
Cliente (-)
Analista jurídico
Analista jurídico (+)
Administrador
```

---

## 15. Perfil de usuario

El perfil debe mostrar solo datos simples:

```text
Nombre
Apellidos
Correo
Tipo de perfil
Fecha de registro
Último acceso
Cambiar contraseña
Cerrar sesión
```

Si el usuario tiene varios perfiles:

```text
Cambiar perfil activo
```

---

## 16. Cambiar contraseña

Debe agregarse una opción visible:

```text
Perfil > Seguridad > Cambiar contraseña
```

Campos:

```text
Contraseña actual
Nueva contraseña
Confirmar nueva contraseña
Guardar cambios
```

Mensajes:

```text
Contraseña actualizada correctamente.
La contraseña actual no coincide.
Las contraseñas no coinciden.
```

---

# Regla final

El usuario final no debe ver la arquitectura técnica de LexNova.

Debe ver únicamente:

```text
Qué puede hacer.
Qué documento subió.
Qué falta revisar.
Qué avance tiene su caso.
Qué documentos están pendientes.
Qué sigue dentro de su proceso.
```

Toda información técnica debe quedar para:

```text
Backend
Logs
Panel administrativo
Documentación técnica
Herramientas internas
```
