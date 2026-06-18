Sí. La regla global debe ser:

**Toda web y toda API nueva deben nacer con estándares obligatorios, no como desarrollos aislados.**
La documentación ya define que `03_standards` guarda operación, frontend, database, seguridad, testing y Docker, y que si un documento dice cómo trabajar, validar u operar, debe vivir ahí. ([GitHub][1])

También ya existe el patrón correcto:

```txt
Web / Mobile / Admin
→ Project Gateway / BFF
→ Project Domain API
→ Core ERP APIs
```

El frontend no debe consumir APIs core directamente.  

Te dejo la instrucción completa para Codex:

Analiza toda la documentación del repositorio `MexIngSoft/Docs` y crea una estructura global de estándares para todas las webs y APIs del ecosistema.

Objetivo:
Estandarizar todos los proyectos web, APIs, gateways, integraciones, logs, errores, permisos, Docker, estructura visual, documentación, pruebas, seguridad y operación.

Regla principal:
Ninguna web o API debe desarrollarse de forma aislada. Todo proyecto debe cumplir los estándares globales documentados en `03_standards`.

Estructura documental obligatoria:

```txt
03_standards/
├── frontend/
│   ├── nextjs-project-standard.md
│   ├── ui-global-standard.md
│   ├── web-layout-standard.md
│   ├── forms-standard.md
│   ├── empty-states-standard.md
│   ├── error-ui-standard.md
│   ├── catalog-visibility-rules.md
│   └── pre-development-checklist.md
│
├── backend/
│   ├── django-api-project-standard.md
│   ├── gateway-bff-standard.md
│   ├── api-response-standard.md
│   ├── api-error-standard.md
│   ├── api-logging-standard.md
│   ├── api-healthcheck-standard.md
│   ├── api-permissions-standard.md
│   └── api-versioning-standard.md
│
├── operations/
│   ├── observability-standard.md
│   ├── logs-standard.md
│   ├── runbook.md
│   ├── deployment-checklist.md
│   ├── failure-recovery-standard.md
│   └── git-repository-map.md
│
├── docker/
│   ├── docker-project-standard.md
│   ├── docker-network-standard.md
│   ├── docker-compose-project-standard.md
│   └── docker-env-standard.md
│
├── security/
│   ├── secrets-standard.md
│   ├── auth-standard.md
│   ├── roles-permissions-standard.md
│   └── frontend-security-standard.md
│
├── testing/
│   ├── testing-strategy.md
│   ├── api-testing-standard.md
│   ├── frontend-testing-standard.md
│   └── regression-checklist.md
│
└── database/
    ├── sql-server-publication-standard.md
    ├── naming-standard.md
    ├── migrations-standard.md
    └── audit-fields-standard.md
```

Procesos obligatorios por cada web:

1. Identidad del proyecto:

* Nombre comercial.
* Nombre técnico.
* Dominio.
* Tipo de negocio.
* Proyecto ERP relacionado.
* Gateway requerido.
* API propia requerida o justificación si no aplica.

2. Estructura Next.js:
   Cada web debe cumplir:

```txt
WEB.NJ.NEXT.NombreProyecto/
├── app/
├── components/
├── features/
├── hooks/
├── lib/
├── public/
├── styles/
├── types/
├── .env.local.example
├── package.json
└── README.md
```

3. Rutas obligatorias:

```txt
app/
├── (public)/
├── (auth)/
├── (client)/
├── (admin)/
└── api/
```

4. Comunicación:
   Ninguna web puede consumir directamente:

* Core ERP API.
* Supplier API.
* Pricing API.
* Inventory API.
* Base de datos.

Toda web debe consumir:

```txt
Frontend → Project Gateway/BFF → Project Domain API → Core ERP APIs
```

5. Interfaz:
   Toda web debe tener:

* Header consistente.
* Footer.
* Estados de carga.
* Estados vacíos.
* Estados de error.
* Formularios con validación.
* Mensajes claros.
* Diseño responsive.
* Accesibilidad básica.
* SEO básico.
* Favicon.
* Metadata.
* Títulos de pestaña correctos.
* Open Graph si aplica.
* Sistema visual documentado.

6. Logs frontend:
   Cada web debe registrar:

* Error de formulario.
* Error de API.
* Conversión importante.
* Click crítico.
* Login/logout.
* Compra/cotización enviada.
* Error inesperado.
* Tiempo de carga si aplica.

Nunca mostrar trazas internas al usuario.

Procesos obligatorios por cada API:

1. Estructura Django:
   Cada API debe cumplir el patrón:

```txt
API.PY.DJANGO.NombreApi/
├── apps/
├── config/
├── core/
├── tests/
├── scripts/
├── logs/
├── .env.example
├── requirements.txt
├── manage.py
└── README.md
```

2. Tipos de API:

* Core ERP API.
* Project Gateway/BFF.
* Project Domain API.
* Integration API.
* Worker/ETL API.

3. Respuestas estándar:
   Toda API debe responder con formato uniforme:

```json
{
  "success": true,
  "data": {},
  "message": "Operación realizada correctamente",
  "errors": [],
  "meta": {
    "request_id": "",
    "timestamp": "",
    "service": "",
    "version": ""
  }
}
```

4. Errores estándar:
   Toda API debe devolver errores normalizados:

```json
{
  "success": false,
  "data": null,
  "message": "No fue posible completar la operación",
  "errors": [
    {
      "code": "VALIDATION_ERROR",
      "field": "email",
      "detail": "El correo es obligatorio"
    }
  ],
  "meta": {
    "request_id": "",
    "timestamp": "",
    "service": "",
    "version": ""
  }
}
```

5. Logs obligatorios:
   Toda API debe registrar:

* request_id.
* usuario si existe.
* método HTTP.
* endpoint.
* status_code.
* duración.
* IP o canal.
* servicio origen.
* servicio destino.
* error_code.
* traceback solo en logs internos.
* payload sensible enmascarado.
* fecha/hora.
* ambiente.

6. Niveles de logs:

```txt
DEBUG: solo desarrollo.
INFO: operación normal.
WARNING: evento inesperado recuperable.
ERROR: fallo funcional.
CRITICAL: caída, corrupción o riesgo operativo.
```

7. Healthcheck obligatorio:
   Toda API debe exponer:

```txt
GET /health/
GET /health/db/
GET /health/dependencies/
GET /version/
```

8. Seguridad:
   Toda API debe:

* Usar `.env.example`.
* No subir secretos.
* Validar JWT.
* Validar permisos en backend.
* Registrar acciones sensibles.
* Enmascarar tokens, passwords, llaves y datos privados.
* Bloquear acceso directo no autorizado.

9. Testing:
   Cada API debe tener pruebas mínimas:

* healthcheck.
* autenticación.
* permisos.
* CRUD crítico.
* errores esperados.
* integración con gateway si aplica.

Procesos obligatorios para gateways:

Todo gateway debe:

* Ser punto único de entrada para la web.
* Validar autenticación.
* Validar permisos.
* Adaptar datos para pantallas.
* Centralizar errores.
* Ocultar contratos internos del ERP.
* Orquestar APIs core y API propia del proyecto.
* No contener reglas permanentes de negocio.
* No crear tablas de dominio.
* No reemplazar APIs core.

Procesos obligatorios para proyectos:

Cada proyecto en `02_projects/<proyecto>` debe documentar:

```txt
business/
frontend/
backend/
gateway/
database/
integrations/
tasks/
decisions/
roadmap/
```

Debe incluir:

* Identidad.
* Objetivo comercial.
* Usuarios.
* Módulos.
* Rutas web.
* Procesos del negocio.
* APIs requeridas.
* Gateway requerido.
* Reglas visuales.
* Estados.
* Flujos.
* Roadmap.
* Pendientes.

Procesos obligatorios para integraciones:

Toda integración debe documentarse en `04_integrations/<proveedor>` e incluir:

* Autenticación.
* Tokens.
* Endpoints.
* Parámetros.
* Respuestas.
* Mappers.
* ETL.
* Frecuencia.
* Logs.
* Errores.
* Reintentos.
* Límites.
* Costos si aplica.
* Campos internos afectados.

Proceso de estandarización global:

1. Leer `README.md`.
2. Leer `00_audit`.
3. Leer `01_core_erp`.
4. Leer `02_projects`.
5. Leer `03_standards`.
6. Leer `04_integrations`.
7. Detectar reglas repetidas.
8. Mover reglas reutilizables a `03_standards`.
9. Dejar reglas específicas en cada proyecto.
10. Crear documentos faltantes.
11. Actualizar referencias cruzadas.
12. Crear checklist global de cumplimiento.
13. Validar cada web contra el estándar.
14. Validar cada API contra el estándar.
15. Registrar pendientes como `PENDIENTE_DE_DEFINIR`.

Webs a validar:

* JobCron.
* TecnoTelec.
* LexNova.
* DocuCore.
* Fiscora.
* Refapart si ya existe o cuando se cree.
* Cualquier web futura.

APIs a validar:

* Auth.
* Catalog.
* Inventory.
* Pricing.
* Procurement.
* Sales.
* Supplier.
* Document.
* DocuCore.
* DocuCore Gateway.
* Fiscal.
* Fiscora.
* Fiscora Gateway.
* TecnoTelec.
* TecnoTelec Gateway.
* Refapart.
* Refapart Gateway.
* Cualquier API futura.

Criterio de cierre:
El trabajo solo se considera terminado cuando:

* Toda web tiene estructura estándar.
* Toda API tiene estructura estándar.
* Cada proyecto consume su gateway.
* Cada gateway orquesta correctamente.
* Los logs están normalizados.
* Los errores están normalizados.
* Las variables `.env.example` existen.
* Los README existen.
* Los permisos están documentados.
* Los healthchecks existen.
* Los procesos de negocio están documentados.
* Las excepciones están justificadas.
* No hay duplicación innecesaria entre core, proyecto, estándares e integraciones.

Punto importante: **no puedo confirmar haber leído absolutamente todos los archivos del repositorio**, pero sí confirmé la estructura principal, el estándar Next.js, el patrón Gateway/BFF y el mapa de repositorios. La documentación indica que `03_standards/frontend` ya contiene estándar Next.js, arquitectura Docker frontend, checklist previo, reglas de visibilidad y placeholders. ([GitHub][2])

[1]: https://github.com/MexIngSoft/Docs/tree/main/03_standards "Docs/03_standards at main · MexIngSoft/Docs · GitHub"
[2]: https://github.com/MexIngSoft/Docs/tree/main/03_standards/frontend "Docs/03_standards/frontend at main · MexIngSoft/Docs · GitHub"
