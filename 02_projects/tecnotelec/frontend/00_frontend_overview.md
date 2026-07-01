# Frontend overview

## Objetivo

Crear una web Next.js para Tecno Telec enfocada en soluciones tecnologicas, cotizacion en linea, compra y seguimiento de proyectos.

## Tipo de web

No es marketplace generico. Es sitio comercial + cotizador + portal de cliente.

## Direccion visual

La propuesta oficial queda documentada en `09_interface_proposal.md` y toma como referencia el PDF archivado de interfaz web.

## Publico objetivo

- Empresas.
- Negocios.
- Oficinas.
- Escuelas.
- Clientes que necesitan soluciones tecnologicas completas.

## Consume

El frontend debe consumir solo `API.PY.DJANGO.Gateway`.

`API.PY.DJANGO.Gateway` puede consumir `tecnotelec-api` y las APIs core del ERP.

## Proyecto recomendado

El proyecto web debe crearse como:

```text
WEB.NJ.NEXT.TecnoTelec
```

Puede vivir inicialmente dentro de `Docker.WEB.NJ`, pero debe poder separarse como repositorio independiente.

## Documentos de preparacion

- `10_pre_development_analysis.md`
- `11_web_platform_structure.md`
- `12_initial_web_blueprint.md`

Estandares generales:

- `../../../03_standards/frontend/nextjs-project-standard.md`
- `../../../03_standards/frontend/shared-docker-frontend-architecture.md`
- `../../../03_standards/frontend/pre-development-checklist.md`
- `../../../03_standards/frontend/account-continuity-standard.md`

## Continuidad Auth y frontend local

Impacto vigente:

- `WEB.NJ.NEXT.TecnoTelec/next.config.ts` declara `allowedDevOrigins` para
  `tecnotelec.localhost`, `localhost:3001` y `127.0.0.1:3001`.
- `NEXT_PUBLIC_APPLICATION_CODE=TECNOTELEC` identifica la web ante
  Gateway/Auth cuando se active el portal.

Pendientes reales:

- Confirmar si el MVP usa portal/login ahora o queda para fase posterior.
- Confirmar si cotizaciones van por Sales API o TecnoTelec API antes de copiar
  el flujo completo de cuenta y continuidad.
