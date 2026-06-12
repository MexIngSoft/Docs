# Arquitectura Docker frontend compartida

## Objetivo

Permitir que varios proyectos Next.js convivan inicialmente dentro de `Docker.WEB.NJ`, manteniendo aislamiento suficiente para separarlos despues.

## Decision base

La estrategia recomendada es hibrida:

- `Docker.WEB.NJ` funciona como orquestador local.
- Cada frontend vive en su propia carpeta y repositorio.
- No se crea un monorepo obligatorio todavia.
- Si en el futuro hay componentes compartidos maduros, se pueden mover a un paquete o workspace comun.

## Estructura

```text
Docker.WEB.NJ/
  docker-compose.yml
  Dockerfile
  WEB.NJ.NEXT.JobCron/
  WEB.NJ.NEXT.TecnoTelec/
  WEB.NJ.NEXT.LexNova/
  WEB.NJ.NEXT.PhoneShop/
```

Regla:

`Docker.WEB.NJ` no debe guardar logica de negocio de los frontends. Solo contiene Docker, red, proxy local y documentacion operativa.

## Puertos locales

| Proyecto | Puerto sugerido | Contenedor sugerido |
|---|---:|---|
| `WEB.NJ.NEXT.JobCron` | `3000` | `web-frontend-node` |
| `WEB.NJ.NEXT.TecnoTelec` | `3001` | `web-frontend-node` |
| `WEB.NJ.NEXT.LexNova` | `3002` | `web-frontend-node` |
| `WEB.NJ.NEXT.PhoneShop` | `3003` | `web-frontend-node` |

El puerto se asigna por proyecto y no debe cambiar sin documentarlo en `Docker.WEB.NJ/README.md` y Nginx.

Por costo inicial, varios frontends pueden correr como procesos separados dentro de un solo contenedor `web-frontend-node`. La separacion por contenedor se reserva para cuando un proyecto crezca en consumo, ciclo de despliegue o criticidad.

## Red

Todos los proyectos web deben usar la red Docker compartida del ecosistema. El
nombre objetivo para nuevos compose y refactors es:

```yaml
networks:
  jobcron_network:
    external: true
```

Esto permite que Nginx, Gateways y APIs compartidas resuelvan contenedores por
nombre de servicio.

Compatibilidad: los compose actuales pueden seguir usando la red heredada
`crejo` hasta ejecutar la migracion coordinada a `jobcron_network`. No se deben
crear redes aisladas por frontend como regla general.

## Proxy reverso

Nginx debe ser la entrada recomendada para navegador.

Estrategias validas:

| Estrategia | Uso |
|---|---|
| Hostname local | `tecnotelec.localhost`, `jobcron.localhost`. |
| Path | `/tecnotelec`, `/jobcron`. |
| Puerto directo | Diagnostico local, no flujo principal. |

Para proyectos comerciales se prefiere hostname local porque evita mezclar rutas internas de Next.js.

En el entorno actual:

| Host | Proyecto |
|---|---|
| `http://localhost` | `WEB.NJ.NEXT.JobCron` |
| `http://tecnotelec.localhost` | `WEB.NJ.NEXT.TecnoTelec` |
| `http://lexnova.localhost` | `WEB.NJ.NEXT.LexNova` |

Si el sistema operativo no resuelve subdominios `.localhost`, el puerto directo del proyecto sigue siendo valido para desarrollo local.

## Variables de entorno

Cada proyecto debe tener su propio `.env.local` y `.env.local.example`.

No se deben compartir variables por accidente entre proyectos. Si una variable es comun, debe documentarse y repetirse explicitamente en cada ejemplo.

## Dependencias

Regla inicial:

- Cada proyecto instala sus dependencias en su propio `node_modules`.
- No compartir `node_modules` entre proyectos.
- No crear libreria compartida hasta que existan al menos dos proyectos usando el mismo componente con el mismo contrato.

Cuando exista reutilizacion real:

```text
Docker.WEB.NJ/
  packages/
    ui/
    api-client/
```

La carpeta `packages` solo debe agregarse si se adopta workspace o paquete compartido con versionamiento claro.

## Builds

- Cada proyecto debe poder ejecutar `npm run build` de forma independiente.
- Un build roto en un proyecto no debe bloquear el desarrollo local de otro.
- El Dockerfile puede ser unico al inicio, pero debe permitir elegir proyecto por servicio cuando haya mas de un frontend.

## Riesgos

| Riesgo | Control |
|---|---|
| Acoplamiento entre proyectos | Repositorios y `.env` separados. |
| Consumo alto de memoria | Levantar solo servicios necesarios. |
| Puertos duplicados | Tabla de puertos documentada. |
| Componentes copiados sin control | Crear paquete compartido solo cuando haya contrato estable. |
| Frontend llamando APIs core | Forzar `NEXT_PUBLIC_GATEWAY_BASE_URL`. |
| HTML sin estilos | Validar y reparar CSS con `Docs/03_standards/operations/scripts/Repair-NextCss.ps1`. |

## Separacion futura

Un frontend puede salir de `Docker.WEB.NJ` cuando:

- Tiene dominio propio.
- Tiene pipeline propio.
- Tiene equipo o roadmap independiente.
- Sus dependencias ya no coinciden con los otros proyectos.
- Requiere despliegue separado.

La separacion no debe cambiar contratos con APIs: debe seguir consumiendo su gateway/BFF.
