# ADR 0001 - Limites entre Fiscora, Fiscal, Gateway y Document

## Estado

Aceptado.

## Contexto

Fiscora necesita mezclar experiencia SaaS, CFDI, conexion SAT, documentos,
creditos, planes y visualizacion moderna. Si toda la logica vive en una sola
API, el producto queda dificil de reutilizar por otros proyectos y aumenta el
riesgo de mezclar datos fiscales con reglas comerciales.

## Decision

Separar responsabilidades:

- `API.PY.DJANGO.Fiscora.Gateway` es el unico contrato consumido por el
  frontend.
- `API.PY.DJANGO.Fiscora` administra producto comercial, planes, creditos,
  preferencias y reglas de uso.
- `API.PY.DJANGO.Fiscal` administra CFDI, SAT, XML, jobs, paquetes, reportes y
  auditoria fiscal.
- `API.PY.DJANGO.Document` administra transformacion documental, render visual,
  PDF y plantillas.
- `WEB.NJ.NEXT.Fiscora` no consume APIs internas ni guarda secretos.

## Consecuencias

- Fiscal puede reutilizarse por otros proyectos ERP.
- Fiscora puede evolucionar como SaaS sin duplicar el nucleo CFDI/SAT.
- El gateway puede proteger contratos, sesiones, permisos y rate limiting.
- El XML original queda protegido y separado de la capa visual.

## Pendientes

- Definir contrato final de permisos por tenant.
- Definir si JobCron administrara clientes, jobs y auditoria de Fiscora a
  futuro.
- Definir integracion final con Auth y Billing cuando se cierre monetizacion.
