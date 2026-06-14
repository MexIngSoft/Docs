# Pendientes Fiscora

## Pendientes de producto

- Definir cliente prioritario del MVP: contador, PyME, persona fisica o empresa
  multiempresa.
- Confirmar limites del plan gratis: CFDI, empresas, descargas SAT, PDFs,
  reportes y almacenamiento.
- Definir precio/uso de creditos: descarga SAT, PDF visual, reportes, IA o
  almacenamiento.
- Definir si el primer uso requiere SAT real o puede iniciar con carga manual
  XML.

## Pendientes fiscales

- Elegir estrategia de conexion SAT y credenciales permitidas.
- Definir retencion de XML, PDF, auditoria y respaldos.
- Confirmar versiones CFDI soportadas en MVP y reglas de complementos.
- Definir catalogos SAT versionables y proceso de actualizacion.

## Pendientes tecnicos

- Validar `WEB.NJ.NEXT.Fiscora` contra `API.PY.DJANGO.Gateway`.
- Completar parser XML CFDI con validacion XSD/cadena original y
  normalizacion especializada de complementos.
- Implementar generacion real de PDF visual con `API.PY.DJANGO.Document`.
- Ejecutar migraciones reales en PostgreSQL local.
- Definir colas/reintentos para jobs SAT.

## Pendientes legales y seguridad

- Validar textos legales de uso de credenciales SAT.
- Definir aviso de privacidad y tratamiento de documentos fiscales.
- Definir consentimiento para conexion SAT.
- Definir politica de eliminacion de cuenta, credenciales, XML y PDFs.
- Incluir aviso de que Fiscora no sustituye asesoria contable.
