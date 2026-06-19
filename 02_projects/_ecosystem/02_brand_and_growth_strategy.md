# Estrategia de marcas, dominios e infraestructura evolutiva

## Objetivo

Documentar la estrategia oficial de crecimiento del ecosistema para evitar la
fragmentacion prematura de marcas, dominios, infraestructura y recursos.

## Principio oficial

Primero se construyen clientes.

Despues se construyen marcas independientes.

No se crean dominios, VPS, correos, certificados o separaciones innecesarias
antes de tener justificacion comercial, financiera, operativa o tecnica.

## Problema que evita

Separar cada producto desde el inicio aumenta:

- costo de dominios;
- costo de VPS;
- costo de correos;
- costo de certificados SSL;
- mantenimiento;
- complejidad operativa;
- carga administrativa.

Durante etapas tempranas esto reduce la inversion disponible para desarrollo,
ventas y adquisicion de clientes.

## Estructura actual

| Marca/proyecto | Rol |
|---|---|
| MexIngSof | Marca principal de software, APIs, apps, automatizacion, SaaS e integraciones. |
| JobCron | ERP central del ecosistema. |
| Universal POS | Punto de venta para comercios, restaurantes, promociones y lealtad. |
| REFAPART | Busqueda y comercializacion asistida de refacciones. |
| DocuCore | Plataforma documental. |
| Phone Shop | Canal comercial de telefonos, accesorios y servicios relacionados. |
| Tecno Telec | Redes, telecomunicaciones, ISP, CCTV, energia, soporte e integracion. |

## Estrategia de dominios

Mientras los recursos economicos sean limitados, los proyectos pueden operar
bajo el ecosistema principal:

```text
mexingsof.com
jobcron.mexingsof.com
universalpos.mexingsof.com
refapart.mexingsof.com
docucore.mexingsof.com
phoneshop.mexingsof.com
tecnotelec.mexingsof.com
satwi.mexingsof.com
```

Esta estructura es valida y oficial.

## Estrategia de infraestructura

Mientras un proyecto no genere ingresos suficientes, puede compartir:

- VPS;
- certificados;
- infraestructura;
- autenticacion;
- servicios comunes;
- observabilidad;
- despliegue base.

Siempre debe respetar las reglas tecnicas del ecosistema: Gateway General,
APIs reutilizables, aislamiento de datos cuando aplique y seguridad.

## Criterios para independizar un proyecto

Un proyecto puede migrar a dominio e infraestructura propia cuando cumpla uno o
mas de estos criterios:

- genera ingresos recurrentes;
- posee clientes propios;
- requiere posicionamiento de marca independiente;
- requiere infraestructura dedicada;
- requiere equipo operativo propio;
- requiere escalabilidad independiente;
- puede sostener sus costos operativos.

## Regla obligatoria

No crear dominios independientes solo por estetica.

No crear VPS independientes solo por organizacion.

Toda separacion debe justificarse con:

- analisis financiero;
- analisis operativo;
- analisis tecnico;
- analisis comercial.

## Responsabilidad de agents

Cuando un agent, desarrollador o IA proponga una nueva marca, proyecto o
plataforma, debe evaluar primero:

1. si puede vivir dentro de la infraestructura existente;
2. si puede reutilizar servicios existentes;
3. si requiere realmente dominio propio;
4. si requiere realmente infraestructura propia.

Si no hay justificacion, debe mantenerse integrado al ecosistema actual.
