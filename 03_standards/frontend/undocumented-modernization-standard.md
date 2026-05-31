# Estandar para modernizacion visual no documentada

## Objetivo

Modernizar pantallas antiguas o secundarias cuando no exista documentacion
canonica especifica, manteniendo coherencia visual con el proyecto.

## Aplica a

- Login.
- Registro.
- Activacion de usuario.
- Recuperacion de contrasena.
- Links secundarios.
- Pantallas antiguas de LexNova, DocuCore, Fiscora, Imagrafity o Tecno Telec.
- Vistas con UI previa al sistema visual actual.

## Proceso

1. Revisar indices documentales.
2. Buscar documentacion canonica del proyecto.
3. Si no existe, declarar:

```text
No encontre documentacion especifica para esta pantalla.
```

4. Revisar patrones modernos ya implementados en el mismo proyecto.
5. Usar como referencia inicio, dashboard, layout, sidebar, topbar, cards,
   formularios, estados y componentes actuales.
6. Implementar cambios visuales sin alterar comportamiento funcional salvo que
   sea necesario para corregir errores evidentes.
7. Validar con build/lint/checks disponibles.
8. Documentar decisiones y faltantes.

## Reglas visuales

- Mantener identidad del proyecto.
- Mobile first.
- Formularios claros y accesibles.
- Estados de error, carga, exito y vacio.
- Espaciado y tipografia consistentes.
- No duplicar botones equivalentes.
- No introducir componentes aislados que no encajen con el sistema actual.
- No agregar marketing innecesario en pantallas operativas.

## Fuera de alcance

Sin instruccion explicita, no cambiar:

- contratos API;
- autenticacion real;
- permisos;
- modelos de datos;
- reglas de negocio;
- rutas publicas;
- copy legal sensible.

## Cierre esperado

El reporte debe indicar:

- documentacion encontrada o ausente;
- patrones usados como referencia;
- archivos modificados;
- validaciones;
- riesgos o pendientes.
