# Animaciones web Fiscora

## Objetivo

Las animaciones deben explicar procesos, reducir sensacion de espera, mostrar actividad del sistema y mejorar la percepcion premium sin saturar al usuario.

## Regla principal

```text
Home = animaciones llamativas
Dashboard = animaciones sutiles
Procesos SAT = animaciones informativas
Factura = animaciones elegantes
Reportes = animaciones minimas
Pagos = animaciones discretas
```

## Librerias

Para Next.js:

```bash
npm install framer-motion lucide-react
```

## Componentes propuestos

- `HeroCfdiAnimation`
- `SatToFiscoraFlow`
- `DashboardCounters`
- `SatDownloadProgress`
- `InvoiceExplorerAnimation`
- `InvoicePreviewAnimation`
- `InvoiceCustomizerAnimation`
- `ReportChartAnimation`
- `CreditRewardAnimation`
- `EmptyStateAnimation`

## Eventos globales

```ts
type AnimationEvent =
  | "onPageLoad"
  | "onSectionVisible"
  | "onDataLoading"
  | "onDataLoaded"
  | "onDataError"
  | "onJobCreated"
  | "onJobUpdated"
  | "onJobCompleted"
  | "onJobFailed"
  | "onInvoiceOpened"
  | "onInvoiceClosed"
  | "onTemplateChanged"
  | "onCreditsUpdated"
  | "onAdCompleted";
```

## Estados

```ts
type AnimationState =
  | "idle"
  | "loading"
  | "active"
  | "success"
  | "error"
  | "paused"
  | "completed";
```

## Accesibilidad

Debe respetarse `prefers-reduced-motion`.

```css
@media (prefers-reduced-motion: reduce) {
  * {
    animation: none !important;
    transition: none !important;
  }
}
```

## Limites

- No animar listas completas grandes.
- No animar tablas con miles de registros.
- No usar loops infinitos dentro del dashboard.
- No usar progreso falso en produccion.
- No animar el XML tecnico completo.
- La factura impresa y el PDF final deben ser estaticos.

