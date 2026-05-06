# POS API

## Objetivo

Administrar punto de venta fisico, caja, tickets y cortes.

## Responsabilidades

- Abrir y cerrar sesiones de caja.
- Crear tickets de venta rapida.
- Registrar pagos de mostrador.
- Solicitar precio a `Pricing`.
- Descontar stock local mediante `Inventory`.
- Registrar venta formal en `Sales`.
- Manejar devoluciones de mostrador.

## Endpoints base

```http
POST /api/pos/sessions/open
POST /api/pos/sessions/{session_id}/close
POST /api/pos/tickets
POST /api/pos/tickets/{ticket_id}/items
POST /api/pos/tickets/{ticket_id}/pay
POST /api/pos/tickets/{ticket_id}/refund
GET /api/pos/sessions/{session_id}/cut
```

## Regla

El POS es una interfaz operativa; `Sales` conserva la verdad comercial.

