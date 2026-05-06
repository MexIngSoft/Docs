# Servicios

## Servicios principales

- Redes empresariales.
- WiFi empresarial.
- Videovigilancia.
- Energia solar.
- Control de acceso.
- Telecomunicaciones.
- Respaldo electrico.
- Cableado estructurado.
- Equipamiento tecnologico.

## Servicios operativos asociados

- Diagnostico.
- Diseno de solucion.
- Instalacion.
- Configuracion.
- Puesta en marcha.
- Soporte.
- Mantenimiento.

## Relacion con productos

Un servicio puede requerir productos, materiales, mano de obra, logistica y reglas de margen.

Ejemplo:

```text
Servicio de videovigilancia
  -> camaras
  -> grabador
  -> disco
  -> cableado
  -> conectores
  -> instalacion
  -> envio
```

## Regla de surtido

Tecno Telec debe publicar productos como parte de soluciones tecnologicas, no como tienda generica.

Ejemplo:

```text
Telefono celular generico
  -> No se publica como producto suelto.

Telefono con configuracion empresarial, seguridad, MDM o cifrado
  -> Puede publicarse como componente o solucion cotizable.
```

Productos como cables, accesorios o telefonos deben marcarse como:

```text
COMPONENT_ONLY
QUOTE_ONLY
BLOCKED
```

segun su uso dentro de una solucion.
