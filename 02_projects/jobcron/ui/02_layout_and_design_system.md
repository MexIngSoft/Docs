# Maquetacion y sistema visual JobCron

## Principio de interfaz

JobCron debe sentirse como una consola ERP/SaaS de trabajo diario: clara, compacta, confiable y preparada para alto volumen de datos.

No se plantea como landing page. La primera pantalla es el producto operativo.

## Layout base

| Zona | Funcion |
|---|---|
| Header superior | Marca, busqueda global, notificaciones, preferencias y ambiente. |
| Sidebar | Mapa completo por grupos funcionales. |
| Main content | Dashboard, tablas, metricas, formularios y placeholders dinamicos. |
| Paneles de datos | Tablas y bloques operativos conectables al Gateway General. |

## Dashboard

Componentes incluidos:

- Hero operativo con propuesta de consola ERP.
- Senales de salud: Gateway, Auth, Jobs y Facturacion.
- Metricas rapidas: empresas, jobs, modulos y eventos auditados.
- Tabla de procesos activos.
- Grid de modulos navegables.

## Plantilla de pantalla por modulo

Cada modulo de primer nivel usa la misma base:

| Seccion | Contenido |
|---|---|
| Encabezado | Eyebrow, titulo, descripcion e icono del modulo. |
| Toolbar | Nuevo registro, filtrar, exportar y configurar vista. |
| Metricas | Estado de modulo y fuente de datos. |
| Tabla | Datos placeholder con columnas de operacion. |

## Estilo visual

| Token | Uso |
|---|---|
| Fondo claro | Reduce fatiga y favorece lectura de tablas. |
| Sidebar oscuro | Da jerarquia al mapa de navegacion. |
| Verde institucional | Acciones primarias y estados operativos. |
| Naranja acento | Badges, avisos suaves y estados de revision. |
| Radio 8px | Bordes sobrios y consistentes. |
| Sombras suaves | Separacion visual sin efecto decorativo excesivo. |

## Reglas de componentes

- Los iconos deben venir de `lucide-react`.
- Los botones de accion deben ser compactos.
- Las tablas deben tener scroll horizontal en mobile.
- Los cards solo se usan para modulos, metricas y paneles de datos.
- No usar heroes decorativos ni composiciones de marketing.
- No introducir gradientes dominantes ni fondos ornamentales.

## Responsive

| Breakpoint | Comportamiento |
|---|---|
| Desktop | Header + sidebar fija + main amplio. |
| Tablet | Sidebar pasa arriba con scroll vertical limitado. |
| Mobile | Todo se apila, tablas conservan scroll horizontal. |

## Estado actual

El CSS principal esta en:

```text
Docker.WEB.NJ/WEB.NJ.NEXT.JobCron/app/globals.css
```

La navegacion y contenido mock estan centralizados en:

```text
Docker.WEB.NJ/WEB.NJ.NEXT.JobCron/lib/modules.ts
```
