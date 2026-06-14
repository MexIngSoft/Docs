# REFAPART

## Estado

ACTIVE

## Nombre canonico

El nombre final del producto es:

```text
REFAPART
```

Variantes anteriores como `Refapart`, `RepuestosMax` o `Refakto` quedan como
referencias historicas o ideas previas. La marca visible nueva debe usar
`REFAPART`.

Nota tecnica: el repositorio y carpeta web usan `RefaPart` por convencion de
nombre de repositorio (`WEB.NJ.NEXT.RefaPart`), pero la marca visible en UI y
documentacion de negocio sigue siendo `REFAPART`.

## Rol

REFAPART es una plataforma comercial de localizacion y abastecimiento de
refacciones automotrices.

No inicia como refaccionaria con inventario propio. El MVP ayuda al cliente,
taller o flotilla a encontrar piezas dificiles mediante una red de proveedores
verificados y operacion interna controlada.

## Promesa de usuario

```text
Encuentra cualquier pieza.
```

La experiencia debe permitir buscar en menos de 10 segundos por pieza,
vehiculo, anio, categoria, ciudad o numero de parte.

## Modelo operativo

El cliente compra y conversa con REFAPART. Los proveedores quedan detras de la
operacion.

```text
Cliente -> REFAPART -> Proveedores -> REFAPART -> Cliente
```

REFAPART no debe exponer telefonos, costos internos, notas operativas ni lista
completa de proveedores al cliente.

## MVP

1. Buscador publico de refacciones.
2. Resultados mock de piezas para validar UX.
3. Detalle de pieza con acciones de disponibilidad y WhatsApp.
4. Publicacion de busqueda cuando no hay pieza visible.
5. Favoritos locales.
6. Cuenta cliente integrada con Auth central mediante Gateway propio.
7. Contrato documentado para API comercial futura.

## Documentos

- `architecture.md`
- `api-contracts.md`
- `database.md`
- `frontend.md`
- `visual-identity.md`
- `local-runbook.md`
- `repositories.md`

## Dependencias

| Capa | Decision |
|---|---|
| Web | `Docker.WEB.NJ/WEB.NJ.NEXT.RefaPart` |
| Gateway central | `API.PY.DJANGO.Gateway` |
| Gateway retirado | `API.PY.DJANGO.RefaPart.Gateway` (retirado 2026-06-14) |
| API futura | `API.PY.DJANGO.Refapart` |
| ERP/operacion | JobCron |
| Puerto web local | `3008` |
| Puerto Gateway central | `8025` |
| Puerto Gateway legacy | `8023` |
| Puerto API futuro | `8024` |

## Pendientes

- Crear API comercial propia cuando se cierre fase backend.
- Definir permisos REFAPART mas alla del rol base `CUSTOMER`.
- Definir pasarela de pago real.
- Definir politica de garantia, devoluciones y proveedores autorizados.
- Confirmar dominios finales.
