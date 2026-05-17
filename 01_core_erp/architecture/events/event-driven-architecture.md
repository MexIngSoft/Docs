# Arquitectura de eventos

## Estado actual

El ecosistema usa principalmente comunicacion HTTP sincronica y jobs programados.

## Evolucion recomendada

- Mantener HTTP para consultas directas.
- Usar jobs/colas para procesos pesados.
- Publicar eventos de dominio cuando una API cambie estado relevante.
- Agregar dead letter queue cuando existan colas reales.

## Regla

Cada evento debe tener nombre, emisor, consumidor, version y payload minimo.
