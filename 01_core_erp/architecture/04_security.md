# Seguridad

## Objetivo

Definir reglas base de seguridad para APIs y frontend.

## Principios

- Auth API es duena de usuarios, roles y permisos.
- Gateway valida acceso para frontend.
- APIs internas no deben confiar ciegamente en datos del cliente.
- Secretos fuera de Git.
- Logs sin tokens ni passwords.

## Roles iniciales

- Admin.
- Vendedor.
- Tecnico.
- Cliente.

## Permisos iniciales

- Ver precios publicos.
- Ver costos reales.
- Crear cotizaciones.
- Autorizar descuentos.
- Convertir cotizacion a orden.
- Administrar reglas.
- Ejecutar sincronizaciones.

## Pendiente

Modelo final RBAC/ABAC: `PENDIENTE_DE_DEFINIR`.
