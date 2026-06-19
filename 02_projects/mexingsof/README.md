# Mexingsof

## Rol

Desarrollo de software del ecosistema.

## Dominios

- mexingsof.com
- mexingsof.mx

## Que hace

Construye y mantiene ERP, APIs, apps, frontends, integraciones y automatizaciones.

## Necesidades JobCron

- Gestion de proyectos.
- CRM de clientes.
- Cotizaciones de desarrollo.
- Tickets y soporte.
- Facturacion/pagos.
- Repositorios y despliegues documentados.

## MVP sugerido

1. CRM basico.
2. Proyectos.
3. Cotizaciones.
4. Tareas.
5. Soporte.

## Web corporativa

La web corporativa oficial debe vivir como proyecto Next.js independiente:

```text
Docker.WEB.NJ/WEB.NJ.NEXT.MexIngSof
```

Repositorio esperado:

```text
https://github.com/MexIngSoft/WEB.NJ.NEXT.MexIngSof.git
```

Estado:

```text
MVP_FUNCIONAL_EN_REPOSITORIO_WEB_DEV
```

La pagina incluye productos desde Prisma, formulario de contacto, rutas Next.js
y panel admin basico para productos/leads. El runtime local canonico es
`Docker.WEB.NJ` dentro del compose `comercial_platform`, red `jobcron_network`
y puerto web `3009`.

El remoto GitHub `MexIngSoft/WEB.NJ.NEXT.MexIngSof` existe y tiene publicado
`dev`. Por instruccion vigente no se publicaron `pro` ni `main`.

## Documentos

- `frontend.md`
- `api-contracts.md`
- `productive-launch.md`
- `local-runbook.md`
- `tasks/00_mvp_gap_report.md`

## Pendientes

- Definir servicios y paquetes comerciales.
- PENDIENTE_DE_DEFINIR: dominio final de despliegue inicial.
- PENDIENTE_DE_DEFINIR: Auth para panel admin.
