# Instrucciones generales de analisis, arquitectura y planeacion del ecosistema

## Instruccion 1: Auditoria completa de documentacion, APIs y proyectos

Realiza un analisis completo de toda la documentacion existente dentro del repositorio `Docs`.

El objetivo es identificar, organizar y documentar correctamente todo el ecosistema actual del proyecto.

Debes analizar:

- Arquitectura general.
- APIs existentes.
- Frontends existentes.
- Aplicaciones moviles existentes.
- Bases de datos existentes.
- Integraciones externas existentes.
- Reglas de negocio documentadas.
- Flujos documentados.
- Roadmaps o pendientes existentes.

## Objetivos principales

Debes determinar:

1. Que APIs ya existen.
2. Que APIs estan incompletas.
3. Que APIs faltan por crear.
4. Que proyectos frontend existen.
5. Que proyectos moviles existen.
6. Que proyectos faltan.
7. Que integraciones externas ya estan contempladas.
8. Que partes del sistema no tienen documentacion.
9. Que documentacion esta desactualizada.
10. Que documentacion se contradice.

## Para cada API encontrada documentar

- Nombre de la API.
- Nombre del repositorio.
- Dominio funcional.
- Objetivo.
- Base de datos relacionada.
- Schema relacionado.
- Modelos principales.
- Entidades principales.
- Endpoints existentes.
- Dependencias con otras APIs.
- Dependencias con frontends.
- Dependencias con integraciones externas.
- Estado actual:
  - Existente.
  - Incompleta.
  - Pendiente.
  - Propuesta.
  - Desactualizada.

## Para cada frontend encontrado documentar

- Nombre del proyecto.
- Objetivo.
- Framework utilizado.
- APIs que consume.
- Modulos existentes.
- Modulos faltantes.
- Estado actual.

## Para cada integracion encontrada documentar

- Nombre de la integracion.
- Tipo:
  - proveedor.
  - pagos.
  - logistica.
  - notificaciones.
  - autenticacion.
  - terceros.
- APIs relacionadas.
- Estado actual.
- Documentacion existente.
- Riesgos detectados.

## Reglas importantes

No inventar informacion.

Si algo no existe en la documentacion, marcarlo como:

```txt
No encontrado en la documentacion actual.
```
