# Instrucciones generales de analisis, arquitectura y planeacion del ecosistema

## Objetivo

Analizar y mantener la documentacion del repositorio `Docs` para que el ecosistema quede organizado, auditable y listo para desarrollo.

## Instruccion 1: Auditoria completa de documentacion, APIs y proyectos

Realiza un analisis completo de toda la documentacion existente dentro del repositorio `Docs`.

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

## Instruccion 2: Separacion futura de APIs y bases de datos

Las APIs deben estar preparadas para trabajar por separado.

Si una API debe separarse por carga, seguridad o crecimiento, debe poder moverse a:

- Proyecto/repositorio propio.
- Base de datos propia.
- Contratos de comunicacion explicitos.
- Integracion con otras APIs sin depender de tablas internas ajenas.

Tambien debe evaluarse el uso de tablas referenciadas entre bases de datos PostgreSQL, por ejemplo con `postgres_fdw`, cuando sea util para lectura controlada de datos maestros.

Documento canonico:

```txt
01_core_erp/architecture/08_data_isolation_and_reference_tables.md
```

## Instruccion 3: Plan detallado Tecno Telec

Con base en toda la documentacion existente, definir los pasos para desarrollar Tecno Telec, indicando:

- Procesos ya realizados.
- Puntos pendientes.
- Orden recomendado de desarrollo.
- APIs requeridas.
- Tablas requeridas.
- Frontend requerido.
- Decisiones ya tomadas.

Documento canonico:

```txt
02_projects/tecnotelec/AGENTE.md
```

## Reglas importantes

- No inventar informacion.
- Si algo no existe en la documentacion, marcarlo como:

```txt
No encontrado en la documentacion actual.
```

- Si una regla sirve para varios proyectos, pertenece al nucleo ERP.
- Si una regla solo aplica a una empresa, marca, canal o vertical, pertenece al proyecto correspondiente.
- Si una integracion depende de un proveedor externo, pertenece a `04_integrations`.
