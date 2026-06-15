Sí. Conviene corregirlo ahora antes de que la documentación siga creciendo y se generen inconsistencias.

Como la documentación actual de MexIngSoft menciona **Refakto**, y tú has definido que el proyecto correcto es **RefaPart**, debes crear una tarea de migración documental completa.

Puedes darle esta instrucción a Codex:

# Migración Oficial de Nombre de Proyecto: Refakto → RefaPart

## Objetivo

Estandarizar el nombre oficial del marketplace de refacciones como:

RefaPart

A partir de este cambio, Refakto deja de ser el nombre oficial del proyecto y pasa a considerarse un nombre obsoleto utilizado únicamente para compatibilidad histórica.

---

## Regla General

Todo documento, API, módulo, carpeta, variable, endpoint, texto visible al usuario y referencia interna deberá utilizar:

RefaPart

No deberán generarse nuevos documentos ni componentes utilizando el nombre Refakto.

---

## Cambios de Documentación

Buscar y reemplazar:

Refakto
→
RefaPart

Incluyendo:

* títulos
* encabezados
* diagramas
* ejemplos
* flujos
* descripciones
* tablas
* referencias cruzadas

---

## Cambios de Carpetas

Renombrar:

02_projects/refakto

a

02_projects/refapart

Actualizar todos los enlaces internos que apunten a:

02_projects/refakto

para que apunten a:

02_projects/refapart

---

## Cambios de ProjectCode

Cambiar:

ProjectCode = REFAKTO

por:

ProjectCode = REFAPART

---

## Cambios de APIs

Renombrar rutas documentales:

/api/refakto/*

por

/api/refapart/*

Ejemplos:

/api/refakto/search
→
/api/refapart/search

/api/refakto/admin/part-requests
→
/api/refapart/admin/part-requests

/api/refakto/admin/quotes
→
/api/refapart/admin/quotes

---

## Cambios Frontend

Renombrar:

features/refakto

a

features/refapart

Actualizar:

* imports
* rutas
* aliases
* componentes
* layouts
* documentación

---

## Cambios Backend

Renombrar:

RefaktoApi

a

RefaPartApi

RefaktoGatewayApi

a

RefaPartGatewayApi

RefaktoSearchService

a

RefaPartSearchService

RefaktoQuoteService

a

RefaPartQuoteService

---

## Cambios de Base de Datos

No renombrar tablas históricas automáticamente si ya existen datos productivos.

Crear compatibilidad mediante:

ProjectCode = REFAPART

y migraciones controladas.

Evitar cambios destructivos.

---

## Compatibilidad Histórica

Mantener durante transición:

REFAPART
REFAPART_API
REFAPART_GATEWAY

Opcionalmente aceptar:

REFAKTO

solo como alias temporal para migración.

---

## Nombre Oficial

Nombre comercial:

RefaPart

Descripción oficial:

Marketplace inteligente de refacciones automotrices con búsqueda avanzada, cotización con proveedores, logística y venta de piezas nuevas y usadas.

---

## Prohibición

A partir de esta migración ningún documento nuevo podrá utilizar:

Refakto

Todo nuevo desarrollo deberá utilizar exclusivamente:

RefaPart

Adicionalmente te recomiendo crear una regla general dentro de `03_standards/project-naming-standard.md`:

```txt
Una vez que un proyecto tenga nombre oficial aprobado,
ningún documento, API, carpeta o módulo podrá utilizar
variantes del nombre.

Nombre oficial:
RefaPart

Variantes prohibidas:
Refakto
Refa Parts
Refa-Part
RefaParts
```

Eso evitará que en unos meses termines con carpetas llamadas `refakto`, APIs `refapart` y documentación mezclada, que es un problema muy común cuando los proyectos crecen.
