
# 10_frontend_documentation_agent.md

## Propósito

Reducir repetición en la documentación frontend.

## Problema detectado

Frontend suele quedar muy fragmentado:

* navbar,
* rutas,
* layouts,
* UX,
* componentes,
* formularios,
* vistas,
* responsive,
* estilos.

## Responsabilidad

* Fusionar documentos repetitivos.
* Crear Design System.
* Documentar rutas por empresa.
* Separar frontend Core/Shared de frontend Business.

## Estructura recomendada

```text
/docs/frontend
  /design-system
  /components
  /layouts
  /navigation
  /patterns
  /business-frontends
```

## Prompt para Codex

```text
Actúa como auditor frontend documental.

Revisa todos los documentos relacionados con frontend, UI, UX, navbar, layout, rutas, componentes y diseño.

Objetivo:
- reducir repetición
- crear una estructura clara
- separar componentes compartidos de pantallas específicas por empresa

Entrega:
1. Documentos repetidos.
2. Documento canónico sugerido.
3. Componentes compartidos.
4. Pantallas específicas por empresa.
5. Rutas frontend por proyecto.
6. Reglas de diseño.
7. Archivos que deben fusionarse.
8. Archivos que deben archivarse.

Crea si falta:
/docs/frontend/design-system/README.md
/docs/frontend/navigation/routing-map.md
/docs/frontend/components/component-catalog.md
/docs/frontend/business-frontends/README.md
```

---
