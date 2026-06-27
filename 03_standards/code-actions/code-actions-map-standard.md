# Estandar de mapa de acciones de codigo

## Objetivo

Todo proyecto debe tener un mapa navegable de acciones reales para que una
persona o Codex pueda ubicar rapido donde vive cada accion del sistema.

Este estandar conecta documentacion, frontend, Gateway, APIs, permisos y base
de datos. Ninguna accion funcional importante debe quedar solo en codigo.

## Ubicacion obligatoria

Cada proyecto debe tener un indice principal:

```text
Docs/02_projects/<proyecto>/technical/code-actions-map.md
```

Si el proyecto tiene frontend o API propios, tambien puede dividir el detalle:

```text
Docs/02_projects/<proyecto>/frontend/code-actions-map.md
Docs/02_projects/<proyecto>/api/code-actions-map.md
```

El indice principal siempre debe existir y enlazar los mapas secundarios.

## Que se considera accion

Una accion es cualquier operacion que el usuario, sistema, API o tarea
automatica pueda ejecutar.

Incluye:

- pagina o ruta visual;
- formulario;
- boton;
- evento de UI;
- servicio frontend;
- hook;
- cliente Gateway;
- endpoint Gateway;
- endpoint API;
- serializer, view, permiso o modelo Django;
- migracion;
- job, cron o comando operativo;
- integracion externa;
- envio de correo;
- evento Auth;
- accion administrativa.

## Formato obligatorio

Cada accion debe registrar:

| Campo | Regla |
|---|---|
| Codigo de accion | `<PROJECT>.<MODULE>.<ACTION>` en mayusculas. |
| Nombre visible | Texto funcional o `PENDIENTE_DE_DEFINIR`. |
| Tipo | `page`, `form`, `button`, `service`, `endpoint`, `job`, `command`, `integration`, `auth-event`. |
| Proyecto | Proyecto dueno de la accion. |
| Modulo | Dominio funcional. |
| Frontend ruta | Ruta visual o `N/A`. |
| Frontend archivo | Archivo Next.js o `N/A`. |
| Servicio frontend | Archivo de servicio/hook o `N/A`. |
| Gateway route | Ruta Gateway usada por la web o `N/A`. |
| API destino | API final responsable. |
| Endpoint API | Endpoint real o conceptual. |
| Metodo HTTP | Metodo usado. |
| Permiso requerido | Permiso backend o `PENDIENTE_DE_DEFINIR`. |
| Modelos/tablas afectadas | Tablas reales o `PENDIENTE_DE_DEFINIR`. |
| Estados UI | `loading`, `empty`, `error`, `success`, otros si aplica. |
| Errores esperados | Codigos o mensajes esperados. |
| Validacion minima | Comando o validacion manual/documental. |
| Documento canonico relacionado | Ruta de documento vigente. |
| Estado | `vigente`, `pendiente`, `obsoleto`. |
| Ultima revision | Fecha `YYYY-MM-DD`. |

## Reglas

- No duplicar codigos de accion.
- Si falta informacion real, usar `PENDIENTE_DE_DEFINIR`.
- Si una accion se elimina del codigo, marcarla como `obsoleto` antes de
  retirarla del mapa.
- Si una accion nueva consume API desde frontend, debe documentar Gateway,
  API destino, permisos, errores y modelos/tablas.
- El frontend no debe consumir APIs internas fuera del Gateway General.
- No inventar APIs activas, bases de datos ni permisos.

## Frontend Next.js

Las acciones deben ser ubicables en:

```text
app/
features/<modulo>/
features/<modulo>/services/
features/<modulo>/components/
features/<modulo>/types/
lib/api/
```

Prohibido esconder acciones de negocio en componentes genericos sin
documentarlas.

## API Django

Las acciones deben ser ubicables en:

```text
apps/<modulo>/models.py
apps/<modulo>/serializers.py
apps/<modulo>/views.py
apps/<modulo>/urls.py
apps/<modulo>/permissions.py
apps/<modulo>/services.py
apps/<modulo>/tasks.py
apps/<modulo>/management/commands/
```

Si la API usa otra estructura, el mapa debe documentar la estructura real.

## Checklist de cierre

- [ ] La accion existe en `code-actions-map.md`.
- [ ] La ruta frontend esta documentada.
- [ ] El servicio frontend esta documentado.
- [ ] La ruta Gateway esta documentada.
- [ ] El endpoint API esta documentado.
- [ ] Los permisos estan documentados.
- [ ] Los modelos/tablas estan documentados.
- [ ] Los estados UI estan documentados.
- [ ] Los errores esperados estan documentados.
- [ ] La validacion fue ejecutada o justificada.
- [ ] No se duplico una accion existente.
