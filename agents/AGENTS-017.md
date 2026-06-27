Confirmo lectura del repositorio `Docs` en rama `general`: estructura, reglas de agents, índice activo, estándares Auth y UI/UX. La documentación ya marca que Auth web debe revisarse desde `03_standards/auth/*`, respetando Gateway General, identidad visual por proyecto y estados de carga/error/éxito. ([GitHub][1]) ([GitHub][2])

Páginas Auth que no deben faltar:

```txt
app/auth/facebook/page.tsx
app/auth/forgot-password/page.tsx
app/auth/google/page.tsx
app/auth/login/page.tsx
app/auth/register/page.tsx
app/auth/register/RegisterPageClient.tsx
app/auth/resend/page.tsx
app/auth/reset/[uid]/[token]/page.tsx
app/activation/page.tsx
```

Agente propuesto para `Docs/agents/AGENTS-XXX.md`:

````md
# AGENT — Propagación estándar de páginas Auth Djoser en webs Next.js

## Objetivo
Estandarizar e implementar en todos los proyectos web existentes y futuros las páginas necesarias para completar los flujos Auth/Djoser, evitando fallos como el de Refapart, donde la activación de cuenta no funcionó porque no existía la ruta web correspondiente.

## Rama obligatoria
Trabajar únicamente en rama `general`, que extiende de `dev`.

## Lectura obligatoria antes de modificar
1. `Docs/README.md`
2. `Docs/_meta/master-index.md`, si existe y tiene contenido útil.
3. `Docs/_meta/active-work-index.md`
4. `Docs/agents/RUN_AGENTS_INSTRUCTIONS.md`
5. `Docs/agents/AGENT_GLOBAL_RULES.md`
6. `Docs/03_standards/auth/web-auth-login-standard.md`
7. `Docs/03_standards/auth/web-auth-route-scope-standard.md`
8. `Docs/03_standards/auth/auth-email-delivery-diagnostics-standard.md`
9. `Docs/03_standards/auth/auth-email-template-standard.md`
10. `Docs/03_standards/auth/auth-email-template-source-standard.md`
11. `Docs/03_standards/frontend/ui-ux-standard.md`
12. Documentación específica de cada proyecto web afectado en `Docs/02_projects/*`.

## Proyecto fuente de referencia
Usar como referencia funcional las páginas existentes en:

`C:\Users\cash1\source\repos\Workspace.Comercial\Docker.WEB.NJ\WEB.NJ.NEXT.LexNova\app\auth`

También revisar:

`WEB.NJ.NEXT.LexNova\app\activation`

## Páginas obligatorias a propagar cuando un proyecto requiera Auth
Cada web con autenticación debe tener, como mínimo:

```txt
app/auth/facebook/page.tsx
app/auth/forgot-password/page.tsx
app/auth/google/page.tsx
app/auth/login/page.tsx
app/auth/register/page.tsx
app/auth/register/RegisterPageClient.tsx
app/auth/resend/page.tsx
app/auth/reset/[uid]/[token]/page.tsx
app/activation/page.tsx
````

## Regla principal

No copiar la identidad visual de LexNova de forma literal.

La lógica funcional de Auth puede reutilizarse como base, pero cada proyecto debe adaptar:

* colores;
* logo;
* textos;
* layout;
* mensajes;
* botones;
* fondo;
* tono comercial;
* estados visuales;
* navegación secundaria;
* experiencia mobile first.

Cada implementación debe respetar la identidad documentada del proyecto correspondiente.

## Proyectos existentes a revisar

Identificar todos los repositorios `WEB.NJ.NEXT.*` existentes y verificar cuáles requieren autenticación.

Como mínimo revisar:

* LexNova;
* Refapart;
* JobCron;
* DocuCore;
* Tecno Telec;
* Imagrafity;
* Fiscora;
* cualquier otro proyecto web registrado en `Docs/02_projects` o inventario operativo.

## Criterio de implementación

Para cada proyecto web:

1. Revisar si realmente requiere Auth.
2. Si no requiere Auth, documentar “No aplica” y no crear rutas innecesarias.
3. Si requiere Auth, validar que existan todas las rutas obligatorias.
4. Si faltan rutas, implementarlas.
5. Si existen pero no funcionan con Djoser/Auth API, corregirlas.
6. Si existen pero no respetan identidad visual del proyecto, adaptarlas.
7. Validar que los enlaces generados por correo apunten a rutas reales del frontend.
8. Validar que activación, login, registro, recuperación, reset y reenvío funcionen desde Gateway/Auth.
9. No consumir Auth API directo desde frontend si el estándar exige Gateway General.
10. No crear Auth por proyecto.

## Flujos mínimos que deben quedar cubiertos

* Registro de usuario.
* Confirmación visual de registro exitoso.
* Activación de cuenta desde email.
* Reenvío de activación.
* Login.
* Recuperación de contraseña.
* Reset de contraseña con `uid` y `token`.
* Login social Google, si está habilitado.
* Login social Facebook, si está habilitado.
* Estados de error cuando el proveedor social no esté configurado.
* Estados de carga.
* Estados de éxito.
* Estados de token inválido, expirado o ya utilizado.
* Redirección segura posterior al éxito.

## Caso Refapart obligatorio

Corregir específicamente Refapart para que la activación de cuenta no falle por ruta inexistente.

Validar que el correo de activación apunte a una URL real del frontend Refapart y que esa URL resuelva correctamente:

`/activation`
o la ruta documentada oficialmente para activación.

Si la plantilla/backend genera otra ruta, corregir documentación o frontend para que coincidan.

## Documentación que debe actualizarse

Actualizar o crear, según corresponda:

1. `Docs/03_standards/auth/web-auth-login-standard.md`
2. `Docs/03_standards/auth/web-auth-route-scope-standard.md`
3. `Docs/03_standards/auth/auth-email-template-standard.md`
4. `Docs/03_standards/auth/auth-email-template-source-standard.md`
5. `Docs/03_standards/frontend/ui-ux-standard.md`, solo si hace falta aclarar el estándar visual.
6. `Docs/02_projects/refapart/frontend.md`
7. `Docs/02_projects/refapart/tasks/*`, si existe checklist de pendientes.
8. Documentación frontend de cada proyecto afectado.
9. `Docs/_meta/active-work-index.md`, solo si falta enlazar este flujo como ruta rápida.
10. `Docs/agents/EXECUTION_REPORT.md`.

## Estándar documental nuevo

Agregar una regla clara:

“Todo proyecto web que solicite autenticación debe implementar desde el inicio el paquete completo de páginas Auth/Djoser. No se permite implementar solo login o registro si los correos de Auth requieren activación, reenvío o reset de contraseña. Las rutas frontend deben existir antes de probar plantillas de correo en Auth.”

## Validaciones obligatorias

Por cada web modificada ejecutar, si existe:

```bash
npm run lint
npm run build
```

Validar manualmente o por prueba funcional:

* `/auth/login`
* `/auth/register`
* `/auth/forgot-password`
* `/auth/resend`
* `/auth/reset/testuid/testtoken`
* `/activation`
* `/auth/google`
* `/auth/facebook`

Las rutas sociales pueden mostrar estado “no configurado” si el proveedor no aplica, pero no deben romper build ni mostrar página vacía.

## Restricciones

* No inventar rutas distintas sin documentarlas.
* No eliminar páginas Auth existentes sin reemplazo funcional.
* No crear Gateway por proyecto.
* No crear Auth API por proyecto.
* No duplicar lógica sensible si ya existe cliente Auth/Gateway compartido.
* No dejar páginas sin diseño del proyecto.
* No dejar mensajes genéricos técnicos visibles al usuario final.
* No exponer nombres internos como Djoser al cliente final.
* No romper LexNova al usarlo como referencia.

## Resultado esperado

Al finalizar reportar:

```txt
Proyectos revisados:
Proyectos con Auth requerido:
Proyectos sin Auth requerido:
Rutas Auth implementadas:
Rutas Auth corregidas:
Rutas Auth no aplicables:
Archivos modificados:
Documentación actualizada:
Validaciones ejecutadas:
Errores encontrados:
Pendientes:
```

## Cierre del agent

Actualizar `Docs/agents/EXECUTION_REPORT.md`.

Si el agent queda completado:

* vaciar el archivo `AGENTS-XXX.md`;
* no eliminarlo;
* no moverlo;
* dejar constancia en el reporte.

```

Este agente queda alineado con las reglas del repositorio: leer documentación mínima, tocar solo el dominio afectado, respetar identidad visual por proyecto y validar con build/lint cuando exista.
```

[1]: https://github.com/MexIngSoft/Docs/tree/general "GitHub - MexIngSoft/Docs at general · GitHub"
[2]: https://raw.githubusercontent.com/MexIngSoft/Docs/general/_meta/active-work-index.md "raw.githubusercontent.com"
