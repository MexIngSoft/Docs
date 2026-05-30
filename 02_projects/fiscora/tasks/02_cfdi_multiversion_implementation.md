# Implementacion CFDI multiversion

## Estado

ACTIVE

## Objetivo

Ordenar el desarrollo para guardar CFDI 2.0, 3.3 y 4.0 completos en
`API.PY.DJANGO.Fiscal` y exponerlos a Fiscora por Gateway.

## Fuentes revisadas

- `Docs/agents/AGENTS-000.md`: dump SQL historico CFDI/SAT usado como inventario
  de catalogos y entidades.
- `Docs/agents/Anexo_20_Guia_de_llenado_CFDI.pdf`: guia oficial de llenado
  CFDI 4.0 y retenciones.
- `Docs/agents/CFDI-4-0-MAYO-2022.pdf`: material de cambios operativos CFDI
  4.0.

## Decision tecnica

No se crean modelos separados por version. Se usa:

- cabecera normalizada;
- partes emisor/receptor;
- conceptos;
- impuestos;
- relaciones;
- complementos como payload estructurado;
- atributos variables por version;
- XML original y arbol completo en JSON.

## Fase implementada

1. Extender `CfdiDocument` con version, serie, folio, datos fiscales 4.0,
   `XmlSha256`, `RawTree`, descuento y tipo de cambio.
2. Crear tablas hijas para partes, conceptos, impuestos, relaciones,
   complementos y atributos variables.
3. Implementar parser XML MVP en `POST /api/fiscal/xml/upload/`.
4. Hacer que el detalle de CFDI devuelva estructura completa para Fiscora.

## Fase pendiente

1. Importar catalogos SAT versionables desde fuentes oficiales.
2. Validar XML contra XSD y reglas SAT por version.
3. Normalizar complementos prioritarios:
   - Pagos;
   - Nomina;
   - Carta Porte;
   - Comercio Exterior.
4. Conectar Fiscora Web con Gateway para carga real.
5. Generar PDF visual por Document API.
6. Agregar jobs para carga masiva y descarga SAT real.

## Regla para frontend

Fiscora Web no debe leer XML crudo. Debe mostrar resumen, filtros, conceptos,
impuestos y complementos ya normalizados por Gateway.
