# Seguridad Fiscora

## Credenciales SAT

Las credenciales SAT nunca deben guardarse en texto plano.

Requisitos:

- Cifrado AES-256 o mecanismo equivalente validado.
- Separacion entre datos cifrados y llaves.
- Variables secretas fuera del repositorio.
- Auditoria de acceso.
- Eliminacion voluntaria de conexion SAT.

## Datos sensibles

No usar animaciones llamativas en:

- Captura de credenciales SAT.
- Pantallas de pago.
- Edicion de datos fiscales.
- Visualizacion XML completa.

## Frontend

- El frontend no debe hablar directo con APIs internas.
- Los permisos se validan en backend.
- El frontend solo refleja permisos para experiencia de usuario.

## Mensajes permitidos

```text
Tus accesos se usaran unicamente para consultar tus CFDI.
Tus datos se almacenan cifrados.
Puedes eliminar esta conexion cuando quieras.
```

