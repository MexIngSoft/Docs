
# 01_zip_inventory_agent.md

## Propósito

Crear el inventario completo de documentos.

Este agent sirve para que Codex no tenga que revisar manualmente todo el proyecto cada vez.

## Responsabilidad

* Descomprimir el ZIP si aplica.
* Listar todos los archivos.
* Detectar documentos Markdown, DOCX, PDF, imágenes, diagramas y archivos técnicos.
* Registrar ruta, nombre, extensión, tamaño, propósito aparente y carpeta.
* Crear un inventario inicial.

## Entrada

* `docs.zip` o carpeta `/docs`.

## Salida esperada

```text
/docs/_meta/document_inventory.md
/docs/_meta/document_inventory.csv
/docs/_meta/document_inventory.json
```

## Campos mínimos

```yaml
path:
file_name:
extension:
folder:
apparent_domain:
apparent_type:
size:
status:
needs_review:
notes:
```

## Reglas

* No eliminar archivos.
* No fusionar archivos.
* No mover archivos.
* Solo inventariar.
* Si un documento parece duplicado, marcarlo como `possible_duplicate`, no eliminarlo.

## Prompt para Codex

```text
Actúa como inventariador documental.

Analiza toda la carpeta /docs o el ZIP descomprimido.

Crea un inventario completo con:
- ruta
- nombre
- extensión
- carpeta padre
- dominio aparente
- tipo aparente de documento
- si parece vigente, repetitivo, futuro o archivo histórico
- si requiere revisión humana

No modifiques documentos.
No elimines documentos.
No muevas documentos.

Genera:
/docs/_meta/document_inventory.md
/docs/_meta/document_inventory.json
/docs/_meta/document_inventory.csv
```

---
