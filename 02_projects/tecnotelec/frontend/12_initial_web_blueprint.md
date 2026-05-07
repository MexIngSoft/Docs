# Blueprint inicial web Tecno Telec

## Objetivo

Convertir la propuesta visual en una guia implementable sin iniciar programacion todavia.

## Direccion

Tecno Telec debe sentirse como plataforma consultiva de soluciones tecnologicas integradas, no como tienda generica.

## Layout publico

```text
Topbar contacto rapido
Header principal
Hero de solucion tecnologica
Soluciones destacadas
Diagnostico guiado
Proyectos tipo
Beneficios / confianza
Contacto
Footer
```

## Header

Elementos:

- Logo.
- Soluciones.
- Proyectos.
- Diagnostico.
- Asesoria.
- Cuenta.
- CTA principal: `Comienza tu diagnostico`.

## Home

Objetivo:

Presentar a Tecno Telec como integrador de energia, conectividad, seguridad, automatizacion e infraestructura.

Acciones principales:

- Explorar soluciones.
- Comenzar diagnostico.
- Hablar por WhatsApp.

## Dashboard cliente

```text
Resumen
Cotizaciones
Proyectos
Soporte
Documentos
Perfil
```

Debe priorizar estado y seguimiento, no administracion interna.

## Dashboard administrativo

```text
Resumen comercial
Leads
Cotizaciones
Proyectos
Catalogo visible
Reglas
Soporte
Licitaciones
Configuracion
```

Debe estar protegido por rol.

## Componentes base

| Componente | Uso |
|---|---|
| `SolutionCard` | Mostrar solucion comercial. |
| `ProjectTypeCard` | Mostrar caso tipo. |
| `QuoteStepper` | Diagnostico guiado. |
| `LeadForm` | Captura comercial. |
| `ContactPanel` | WhatsApp, correo, telefono y ubicacion. |
| `StatusBadge` | Estados de cotizacion/proyecto/soporte. |
| `DashboardShell` | Layout privado. |
| `AdminSidebar` | Navegacion interna. |

## Documento visual detallado

La maqueta inicial completa, incluyendo catalogo, producto, marcas, precios, imagenes, carrusel, formularios, banners y estados, queda documentada en `13_visual_mockup_spec.md`.

## Estados visuales

Todo flujo debe contemplar:

- Cargando.
- Vacio.
- Error recuperable.
- Error de permisos.
- Exito.
- Pendiente de asesor.
- Requiere informacion adicional.

## Responsive

- Mobile: navegacion compacta, CTA visible y diagnostico por pasos.
- Tablet: cards en dos columnas y resumen plegable.
- Desktop: hero amplio, grids densos y dashboard con sidebar.

## Criterio visual

- Paleta azul/blanco/gris con acento amarillo moderado.
- Fotografia o imagen realista relacionada con soluciones tecnologicas.
- Cards sobrias, bordes moderados y jerarquia clara.
- Texto profesional, sin errores del boceto fuente.
- CTAs orientados a diagnostico, asesoria y cotizacion.
