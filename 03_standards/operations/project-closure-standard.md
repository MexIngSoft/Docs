# Estandar de cierre para proyectos Django API

> Estado: base vigente.
>
> Este documento define cuando un proyecto tipo API Django puede considerarse cerrado, entregable y listo para operar dentro del repositorio modular.

## Objetivo

Establecer una nomenclatura unica y un checklist minimo para cerrar proyectos Django API sin dejar dudas sobre estructura, contratos, migraciones, despliegue, operacion y mantenimiento.

## Nomenclatura

La nomenclatura oficial para proyectos Django API es:

```text
API.PY.DJANGO.NombreProyecto
```

Para gateways/BFF de proyecto, la nomenclatura oficial es:

```text
API.PY.DJANGO.NombreProyecto.Gateway
```

Las carpetas existentes con `API.PY.DJANGO` se consideran nomenclatura anterior. Para proyectos nuevos se debe usar `API.PY.DJANGO.NombreProyecto`.

Ejemplos de nomenclatura:

```text
API.PY.DJANGO.Auth
API.PY.DJANGO.Catalog
API.PY.DJANGO.Inventory
API.PY.DJANGO.Pricing
API.PY.DJANGO.Procurement
API.PY.DJANGO.Sales
API.PY.DJANGO.Supplier
API.PY.DJANGO.TecnoTelec
API.PY.DJANGO.TecnoTelec.Gateway
```

Reglas:

- El prefijo debe ser siempre `API.PY.DJANGO`.
- `NombreProyecto` debe escribirse en PascalCase.
- Para Gateway/BFF se debe agregar el sufijo `.Gateway`, separado por punto.
- El nombre debe representar el dominio principal, no una tecnologia, proveedor o tarea temporal.
- El paquete de configuracion debe llamarse `config`.
- `settings.py` debe vivir en `config/settings.py`.
- Los endpoints deben usar nombres de dominio en plural cuando representen colecciones.
- Los comandos de gestion deben separar procesos de descarga, publicacion, auditoria y mantenimiento.

Ejemplo recomendado:

```text
API.PY.DJANGO.Supplier/
  config/
    settings.py
    urls.py
    asgi.py
    wsgi.py
  supplier/
    management/
      commands/
        sync_syscom_all.py
        publish_supplier_catalog.py
```

## Criterios de cierre

Un proyecto Django API se considera cerrado cuando cumple estos puntos:

- La carpeta raiz respeta `API.PY.DJANGO.NombreProyecto`.
- Si es Gateway/BFF, la carpeta raiz respeta `API.PY.DJANGO.NombreProyecto.Gateway`.
- La carpeta raiz es un repositorio Git independiente.
- La carpeta tiene remoto `origin` configurado.
- Al crear un Gateway de proyecto, tambien debe evaluarse y crear la API de dominio `API.PY.DJANGO.NombreProyecto` cuando existan datos, formularios, configuraciones o reglas propias.
- Si la API de dominio no se crea, la decision debe documentarse con motivo y responsable.
- El repo Docker orquestador debe mantener `API.PY.DJANGO.*/` en `.gitignore` para que las APIs montadas no se versionen ahi.
- No existe otra copia viva de la misma API dentro del entorno Docker.
- El paquete de settings se llama `config`.
- El dominio y responsabilidades estan documentados.
- Los modelos finales tienen migraciones creadas y aplicadas.
- Los serializers, views, urls y permisos estan conectados.
- Los endpoints publicos tienen contrato documentado.
- Las variables de entorno requeridas estan documentadas.
- Los comandos operativos tienen nombre, parametros y comportamiento esperado.
- Los procesos destructivos requieren confirmacion explicita o estan limitados a ambientes seguros.
- Las pruebas relevantes pasan en local o en contenedor.
- El runbook indica como levantar, migrar, probar, operar y diagnosticar el proyecto.
- No quedan credenciales reales, dumps privados ni archivos temporales versionados.
- El README del proyecto explica proposito, dependencias y comandos basicos.

## Contrato minimo del README del proyecto

Cada proyecto debe incluir o documentar:

- Proposito del proyecto.
- Responsabilidad principal y limites.
- Apps Django incluidas.
- Variables de entorno.
- Comandos de instalacion local.
- Comandos de migracion.
- Comandos de prueba.
- Comandos de sincronizacion o procesos de fondo.
- Endpoints principales.
- Dependencias externas.
- Riesgos operativos conocidos.

## Estructura minima esperada

```text
API.PY.DJANGO.NombreProyecto/
  venv/
  .env.local.example
  manage.py
  requirements.txt
  README.md
  config/
    settings.py
    urls.py
    wsgi.py
    asgi.py
  app_principal/
    models.py
    serializers.py
    views.py
    urls.py
    admin.py
    tests.py o tests/
    management/
      commands/
```

La estructura puede variar si el proyecto ya tiene una convencion propia, pero debe quedar documentada. Para proyectos nuevos, el paquete de configuracion debe llamarse `config`.

## Relacion con el estandar de creacion

El cierre debe validarse contra este mismo estandar vigente y contra la documentacion operacional activa en `docs/03_standards/operations`.

En especial deben revisarse:

- Nombre externo `API.PY.DJANGO.NombreProyecto` o `API.PY.DJANGO.NombreProyecto.Gateway`.
- Repositorio Git propio por API.
- Remoto `origin` configurado.
- Sin carpetas duplicadas de la misma API.
- Nombre simple interno de la app de dominio.
- Paquete de settings `config`.
- Entorno virtual propio.
- `requirements.txt` completo.
- `.env.local.example` sin secretos.
- `.env.local` ignorado por Git.
- `.gitignore` con bloque minimo del estandar.
- `settings.py` leyendo variables de entorno.
- `PROJECT_NAME` definido.
- `DB_SCHEMA` definido cuando el proyecto usa schemas de PostgreSQL.
- Base de datos configurada por variables.

## Cierre por capas

### 1. Dominio

- Nombre del dominio validado.
- Responsabilidades y limites claros.
- Dependencias con otros proyectos documentadas.

### 2. Base de datos

- Modelos revisados.
- Migraciones creadas.
- Migraciones aplicadas.
- Campos auditables definidos cuando aplique.
- Indices y restricciones necesarias agregadas.

### 3. API

- URLs registradas.
- Serializers completos.
- Validaciones de entrada definidas.
- Permisos y autenticacion conectados.
- Respuestas de error consistentes.

### 4. Operacion

- Comandos `manage.py` documentados.
- Procesos `sync_*`, `publish_*`, `rebuild_*` o `cleanup_*` separados por responsabilidad.
- Logs suficientes para diagnosticar fallas.
- Reintentos seguros definidos cuando aplique.

### 5. Calidad

- Pruebas unitarias o de integracion segun riesgo.
- Validacion manual documentada si no existe automatizacion completa.
- Sin warnings criticos conocidos.
- Sin deuda bloqueante para produccion.

### 6. Seguridad

- Secretos fuera del repositorio.
- Variables sensibles documentadas con nombres, no valores reales.
- Permisos revisados.
- Endpoints internos protegidos.

## Estados permitidos

Todo proyecto debe poder clasificarse en uno de estos estados:

```text
draft
in_progress
ready_for_review
closed
deprecated
```

Definicion:

- `draft`: existe la idea o estructura inicial, pero no es operable.
- `in_progress`: hay desarrollo activo.
- `ready_for_review`: el proyecto cumple el checklist tecnico y espera validacion.
- `closed`: el proyecto esta entregado, documentado y operable.
- `deprecated`: el proyecto ya no debe usarse para nuevo desarrollo.

## Checklist final

Antes de marcar un proyecto como `closed`, validar:

- [ ] Nombre raiz: `API.PY.DJANGO.NombreProyecto` o `API.PY.DJANGO.NombreProyecto.Gateway`.
- [ ] Repositorio Git propio.
- [ ] Remoto `origin` configurado.
- [ ] Sin carpeta duplicada de la misma API.
- [ ] README actualizado.
- [ ] Documentacion de dominio actualizada.
- [ ] Migraciones listas.
- [ ] Endpoints conectados.
- [ ] Permisos revisados.
- [ ] Variables de entorno documentadas.
- [ ] Schema de base de datos documentado con `DB_SCHEMA` si aplica.
- [ ] `.env.local.example` versionado.
- [ ] `.env.local` fuera de Git.
- [ ] `.gitignore` revisado contra el bloque minimo del estandar.
- [ ] Comandos operativos documentados.
- [ ] Tests o validacion manual registrados.
- [ ] Runbook actualizado.
- [ ] Sin secretos ni temporales versionados.
- [ ] Riesgos conocidos anotados.

## Regla de cierre

Un proyecto no debe cerrarse solo porque el codigo compila. Debe cerrarse cuando otra persona pueda levantarlo, migrarlo, probarlo, operarlo y diagnosticarlo usando la documentacion del repositorio.
