# Manejo de secretos

## Objetivo

Definir reglas para manejar tokens, credenciales, variables de entorno y secretos usados por proveedores externos, Django, base de datos y APIs internas.

## Principios

- Ningun secreto real debe versionarse.
- `.env.local` contiene valores reales locales y debe estar ignorado por Git.
- `.env.local.example` documenta nombres de variables sin valores sensibles.
- Los logs no deben imprimir secretos.
- Los errores no deben devolver tokens, passwords ni payloads sensibles.
- Las credenciales deben poder rotarse.

## Archivos de entorno

Cada API debe tener:

```text
.env.local
.env.local.example
```

Reglas:

- `.env.local` no se versiona.
- `.env.local.example` si se versiona.
- `.env.local.example` no debe contener credenciales reales.
- Los nombres deben ser consistentes entre APIs cuando representen lo mismo.

## Variables minimas

Django:

```text
DEVELOPMENT_MODE=
DJANGO_SECRET_KEY=
DJANGO_ALLOWED_HOSTS=
CORS_ALLOWED_ORIGINS=
PROJECT_NAME=
DB_SCHEMA=
```

Base de datos:

```text
DB_ENGINE=
POSTGRES_DB=
POSTGRES_USER=
POSTGRES_PASSWORD=
POSTGRES_HOST=
POSTGRES_PORT=
DATABASE_URL=
```

Auth interna:

```text
AUTH_API_VERIFY_URL=
```

Proveedor externo:

```text
<PROVIDER>_CLIENT_ID=
<PROVIDER>_CLIENT_SECRET=
<PROVIDER>_BASE_URL=
```

## Secretos por ambiente

Local:

- Usar `.env.local`.
- No subir capturas ni logs con valores reales.

Pruebas:

- Usar valores falsos.
- Simular proveedores externos.
- No depender de credenciales reales.

Produccion:

- Usar variables del entorno, Docker secrets, vault o proveedor de secretos.
- No construir imagenes con secretos embebidos.

CI/CD:

- Usar secret store del sistema de CI.
- Limitar permisos por repositorio.
- Rotar tokens si se exponen en logs.

## Tokens temporales

Reglas:

- Guardar expiracion.
- No imprimir token completo.
- Renovar antes de expirar cuando sea posible.
- Registrar fallas de autenticacion sin exponer credencial.

## Rotacion

Rotar secretos cuando:

- Se sospeche exposicion.
- Cambie una persona con acceso.
- Cambie proveedor o ambiente.
- Se migre infraestructura.

Pasos:

1. Crear nuevo secreto.
2. Actualizar ambiente.
3. Reiniciar servicio si aplica.
4. Validar conectividad.
5. Revocar secreto anterior.
6. Registrar la rotacion.

## Datos prohibidos en Git

- `.env.local`.
- Dumps de base de datos.
- Tokens.
- Passwords.
- API keys.
- Certificados privados.
- Payloads privados completos de clientes o proveedores.
- Logs con autorizaciones HTTP.

## Revision antes de commit

Ejecutar busquedas de seguridad:

```powershell
rg "SECRET|PASSWORD|TOKEN|CLIENT_SECRET|API_KEY|Authorization" .
```

Validar que los resultados sean nombres de variables o plantillas sin valor real.

## Criterio de cierre

Un proyecto cumple manejo de secretos cuando:

- `.env.local` esta ignorado.
- `.env.local.example` esta versionado.
- No hay secretos reales en Git.
- Los logs no imprimen secretos.
- Las credenciales externas son rotables.
- Produccion no depende de archivos locales versionados.
