# ADR 0003 - Estrategia Supplier y Catalog

## Estado

Aceptado

## Contexto

Los proveedores externos entregan productos, categorias, marcas, precios y stock con formatos propios.

## Decision

Supplier conserva datos externos y Catalog crea productos internos normalizados.

## Consecuencias

- Un producto interno puede mapearse a varios proveedores.
- RawData permite reprocesar.
- Sales no consume productos externos directamente.
