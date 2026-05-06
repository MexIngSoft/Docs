# Security

> Ruta actual: `/docs/03_standards/operations/security.md`

## 1. Credenciales

Las credenciales SYSCOM deben vivir en variables de entorno:

```env
SYSCOM_CLIENT_ID=...
SYSCOM_CLIENT_SECRET=...
```

No deben guardarse en Git ni mostrarse al frontend.

## 2. Token

El token se guarda en base de datos para uso backend.

No debe:

- Mandarse al navegador.
- Aparecer completo en logs.
- Exponerse por API pública.

## 3. Datos sensibles del proveedor

No mostrar al frontend:

- Costo proveedor.
- Link privado.
- RawData completo.
- Token.
- Credenciales.

## 4. APIs internas

Solo usuarios autorizados deben poder:

- Ver costos.
- Ejecutar sincronizaciones.
- Ver logs.
- Modificar márgenes.
- Cambiar reglas de precio.

## 5. Auditoría

Registrar:

- Quién ejecutó sync manual.
- Quién cambió margen.
- Quién cambió precio final.
- Quién ocultó/activó producto.
