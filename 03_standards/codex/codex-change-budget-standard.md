# Codex Change Budget Standard

## Objetivo

Reducir el consumo de contexto y evitar cambios demasiado grandes o
repetitivos.

## Regla principal

Codex debe trabajar por presupuesto de cambio.

Antes de implementar debe declarar:

- Context Pack elegido;
- archivos que si leera;
- archivos que no leera;
- maximo de archivos a modificar;
- validaciones minimas;
- criterio de cierre.

## Presupuestos

### Cambio pequeno

Maximo:

- 3 archivos leidos;
- 2 archivos modificados;
- sin cambios de arquitectura;
- sin nuevas APIs;
- sin nuevos Docker;
- sin nuevos estandares.

### Cambio mediano

Maximo:

- 8 archivos leidos;
- 5 archivos modificados;
- sin crear infraestructura nueva;
- sin cambiar ADRs salvo que sea requerido;
- sin crear APIs nuevas salvo que exista API Decision Record.

### Cambio grande

Requiere:

- agent activo;
- reporte en `EXECUTION_REPORT.md`;
- lectura de Context Pack;
- validacion final;
- justificacion de archivos modificados.

## Bloqueo

Si la tarea requiere mas archivos de los previstos:

- detener;
- registrar motivo;
- ampliar presupuesto solo si el agent o la instruccion vigente lo permite;
- no modificar archivos no relacionados.

## Prohibido

- leer todo `Docs` por defecto;
- modificar documentos no relacionados;
- crear estandares duplicados;
- implementar sin contrato;
- cerrar sin validacion.
