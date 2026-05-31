# Flujo documentation-first

## Objetivo

Definir como trabajar cuando una tarea requiere leer documentacion antes de
implementar, sin necesidad de usar agents.

## Lectura obligatoria

Antes de implementar:

```text
Docs/README.md
Docs/_meta/master-index.md
Docs/_meta/master-index.yaml
Docs/_meta/navigation-map.md
Docs/_meta/active-work-index.md
```

Despues leer solo los documentos canonicos relacionados con la tarea.

## Regla de busqueda

No buscar en todo `Docs` salvo que:

- el indice no cubra el tema;
- la documentacion canonica este incompleta;
- exista contradiccion;
- la tarea toque arquitectura, seguridad, facturacion o datos sensibles.

## Cierre obligatorio

Al finalizar, reportar:

- documentos revisados;
- documentos fuera de alcance;
- informacion faltante;
- decisiones tomadas con base en documentacion;
- validaciones ejecutadas;
- comandos no disponibles, si aplica.

## Si no hay documentacion canonica

Registrar:

```text
No encontrado en la documentacion actual.
```

Despues:

1. Revisar patrones existentes en el codigo.
2. Aplicar estandares globales.
3. Mantener alcance minimo.
4. Documentar la decision.
5. Proponer documento canonico futuro si la tarea lo amerita.
