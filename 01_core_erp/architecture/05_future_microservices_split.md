# Separacion futura de microservicios

## Objetivo

Preparar el ERP para separar APIs sin redisenar dominios.

## Estrategia

1. Mantener carpetas y repos por API.
2. Mantener `config/` por proyecto Django.
3. Documentar contratos.
4. Evitar dependencias directas innecesarias.
5. Usar schemas por dominio.
6. Migrar llamadas internas a HTTP/eventos cuando se separen bases.

## Orden sugerido de separacion

1. Auth.
2. Supplier.
3. Catalog.
4. Pricing.
5. Inventory.
6. Sales/Quote.
7. Logistics.
8. Rules Engine.
9. Projects.
