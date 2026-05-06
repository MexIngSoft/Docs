# Roadmap del proyecto

## Objetivo

Ordenar el trabajo del ERP modular por fases, diferenciando lo indispensable para operar de lo que puede esperar hasta que el sistema crezca.

## Principios

- Primero estabilidad y contratos, despues automatizacion avanzada.
- Cada API debe poder vivir como repositorio independiente.
- El ERP no debe quedar amarrado a SYSCOM ni a un solo giro.
- Las fases deben reducir riesgo tecnico y aumentar valor de negocio.

## Fase 0: Estandarizacion base

Estado: en progreso.

Objetivo: dejar estructura, documentacion y repositorios consistentes.

Incluye:

- Nomenclatura `API.PY.DJANGO.NombreProyecto`.
- Configuracion Django en `config/`.
- `.env.local` y `.env.local.example`.
- `.gitignore` estandar.
- Documentacion de cierre de proyecto.
- Separacion entre Docker orquestador y repos de APIs.

Criterio de salida:

- Todas las APIs cumplen el estandar.
- Docker levanta el entorno.
- Cada API tiene remoto Git definido.

## Fase 1: Supplier estable

Objetivo: estabilizar descarga y evidencia de proveedores.

Incluye:

- SYSCOM token.
- Sync de categorias.
- Sync de marcas.
- Sync de productos.
- Sync de stock y precios.
- Sync de accesorios relacionados.
- Logs de ejecucion.
- Reintentos seguros.

Criterio de salida:

- Los comandos `sync_*` pueden repetirse sin duplicar datos.
- Los errores parciales quedan registrados.
- Los datos externos pueden reprocesarse desde `RawData`.

## Fase 2: Publicacion a Catalog y Pricing

Objetivo: convertir datos externos en entidades internas vendibles y precios comerciales.

Incluye:

- `publish_*` hacia `Catalog`.
- `publish_*` hacia `Pricing`.
- Contratos `Supplier -> Catalog`.
- Contratos `Supplier -> Pricing`.
- Idempotencia por proveedor y `ExternalId`.

Criterio de salida:

- Un producto externo puede convertirse en producto interno.
- Pricing calcula precio final sin depender de reglas dentro de Supplier.
- Repetir publish no duplica entidades.

## Fase 3: Inventory propio

Objetivo: separar stock proveedor de stock propio.

Incluye:

- Almacenes.
- Inventario por almacen.
- Movimientos de stock.
- Reservas.
- Transito.
- Contratos `Inventory -> Sales/Projects`.

Criterio de salida:

- El sistema puede responder cuanto stock propio hay y donde esta.
- Ninguna venta modifica inventario sin movimiento auditable.
- Las reservas son idempotentes y liberables.

## Fase 4: Sales y cotizaciones

Objetivo: vender o cotizar usando catalogo, precio, inventario y logistica.

Incluye:

- Cotizaciones.
- Ordenes.
- Pagos o anticipos.
- Vigencia de precios.
- Estados comerciales.
- Integracion con Auth.

Criterio de salida:

- Una cotizacion puede congelar productos, precios e impuestos.
- Una venta puede reservar y liberar inventario.
- El flujo comercial no depende de datos crudos del proveedor.

## Fase 5: Logistics

Objetivo: calcular costos, tiempos, carriers y tracking.

Incluye:

- Shipping quotes.
- Carriers por adapter.
- Cache de cotizaciones.
- Tracking.
- Integracion con ventas y proyectos.

Criterio de salida:

- Logistics puede cotizar sin modificar inventario.
- Las cotizaciones tienen vigencia.
- Fallas de un carrier no bloquean todo el flujo.

## Fase 6: Projects API

Objetivo: soportar venta consultiva y proyectos por necesidad del cliente.

Incluye:

- Tipos de solucion configurables.
- Formularios dinamicos.
- Motor de recomendacion.
- Paquetes comerciales.
- Revision por asesor.
- Conversion a cotizacion en Sales.

Criterio de salida:

- Un cliente puede expresar una necesidad y recibir una propuesta preliminar.
- Projects no calcula precios finales ni confirma ventas por su cuenta.

## Fase 7: Multi-tenant y expansion

Objetivo: reutilizar el ERP para varios negocios, sucursales y giros.

Incluye:

- `TenantId`.
- `BusinessUnitId`.
- Reglas por tenant.
- Carriers por tenant.
- Listas de precio por tenant.
- Proveedores por tenant.

Criterio de salida:

- El mismo sistema puede operar mas de un negocio sin mezclar datos.

## Fase 8: Operacion avanzada

Objetivo: preparar el ERP para operacion continua.

Incluye:

- Observabilidad.
- Alertas.
- Pruebas automatizadas.
- CI/CD.
- Backups.
- Auditoria.
- Reportes.

Criterio de salida:

- El equipo puede detectar fallas, reprocesar datos y diagnosticar operaciones sin entrar al codigo.

## Priorizacion actual recomendada

1. Cerrar estandarizacion y commits por repo.
2. Estabilizar Supplier y sus comandos.
3. Formalizar contratos `Supplier -> Catalog/Pricing`.
4. Implementar Inventory propio.
5. Implementar Sales basico.
6. Agregar Logistics.
7. Crear Projects API.
8. Agregar multi-tenant formal.
