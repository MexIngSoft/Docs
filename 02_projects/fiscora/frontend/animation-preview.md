# Preview frontend Fiscora

## Ruta local

```text
Docker.WEB.NJ/WEB.NJ.NEXT.Fiscora
```

## Objetivo

Implementar un preview funcional de las animaciones principales:

- Hero CFDI.
- Flujo SAT -> XML -> PDF.
- Counters del dashboard.
- Progreso de descarga SAT.
- Explorador de facturas.
- Personalizador visual.

## Validacion esperada

```bash
npm run build
```

## Estado

MVP creado para validar direccion visual y estructura de animaciones. No consume backend real todavia.

El preview se exporta como sitio estatico para Docker local:

```text
next.config.ts -> output: "export"
Docker.WEB.NJ/start.sh -> servidor estatico en puerto 3005
```

Antes de reconstruir Docker, validar:

```bash
npm run build
```
