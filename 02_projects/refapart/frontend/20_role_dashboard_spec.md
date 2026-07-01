# REFAPART - Especificacion de dashboards por rol

## Objetivo

Definir que pantalla debe ver cada perfil REFAPART despues de autenticarse por
Gateway General y Auth.

## Cliente / buscador

Ruta principal:

```text
/dashboard
```

Alias de compatibilidad:

```text
/cuenta -> /dashboard
```

Contenido obligatorio:

- busqueda rapida de pieza;
- solicitudes recientes;
- cotizaciones;
- pedidos;
- favoritos;
- direcciones;
- seguimiento de la ultima solicitud;
- acciones secundarias: editar perfil, configuracion, direcciones, buscar otra
  pieza y crear solicitud cuando no encontro la pieza.

Estado actual:

```text
IMPLEMENTADO_CON_MOCK_TEMPORAL
```

Motivo:

```text
El dashboard renderiza la experiencia final y conserva sesion/returnTo, pero el
endpoint GET /api/v1/projects/REFAPART/customer/dashboard aun debe cerrarse en
REFAPART API para reemplazar los datos demo.
```

## Cotizador / gestor de busqueda

Ruta final:

```text
PENDIENTE_DE_DEFINIR
```

Debe usar Auth y permisos REFAPART. No debe consumir proveedor directo ni
exponer datos internos de supplier.

## Proveedor

Ruta final:

```text
PENDIENTE_DE_DEFINIR
```

Debe operar sobre solicitudes asignadas y respuestas de disponibilidad/precio
mediante Gateway General.

## Administrador REFAPART

Ruta final:

```text
/admin
```

Permisos finales:

```text
PENDIENTE_DE_DEFINIR
```

Debe usar la matriz de permisos REFAPART antes de declararse productivo.

## Administrador global

El administrador global pertenece a JobCron/Core, no a la web REFAPART.
REFAPART solo debe enlazar o consumir datos autorizados por Gateway General.

## Regla para nuevas webs

Cada web comercial debe declarar su dashboard principal de usuario antes de
copiar pantallas Auth. Si conserva `/cuenta`, esa ruta debe redirigir o renderizar
el dashboard util; nunca debe mostrar selector intermedio.
