# Seguridad DocuCore

## Controles MVP

- Validacion de extension.
- Bloqueo de extensiones peligrosas.
- Limite de tamano por `DOCUMENT_MAX_UPLOAD_MB`.
- Hash SHA256.
- Storage privado por zonas.
- Borrado logico.
- Gateway como unica entrada frontend.

## Controles pendientes para produccion

- MIME real con `python-magic/libmagic`.
- Antivirus o sandbox.
- Deteccion de ZIP bombs por ratio y profundidad.
- Downloads firmados y temporales.
- Rate limiting por IP/usuario.
- Autenticacion y permisos por herramienta.
- Limpieza periodica de temporales.
- Cifrado en reposo para storage sensible.
