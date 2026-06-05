Sí. Esta sería una maqueta base más ordenada para el **Workspace**, evitando que `topbar`, estado del documento, herramientas, zoom y configuración se encimen. Está pensada para reemplazar la estructura actual donde esos bloques se mezclan. 

```tsx
// WorkspaceMockup.tsx

import {
  Settings,
  Search,
  Scissors,
  Merge,
  Minimize2,
  FileText,
  Upload,
  Download,
  X,
  Pin,
  ZoomIn,
  ZoomOut,
} from "lucide-react";
import "./workspace.css";

export default function WorkspaceMockup() {
  return (
    <main className="app-main">
      <GlobalTopbar />

      <section className="workspace-root workspace-config-pinned">
        <WorkspaceStatusHeader />

        <section className="workspace-body">
          <ToolRail />

          <main className="workspace-document-area">
            <DocumentTabs />
            <PdfStage />
            <FloatingTabs />
          </main>

          <ConfigPanel />
        </section>
      </section>
    </main>
  );
}

function GlobalTopbar() {
  return (
    <header className="topbar">
      <div>
        <p>Workspace documental</p>
        <strong>Procesamiento seguro de archivos</strong>
      </div>

      <div className="topbar-actions">
        <button>Iniciar sesión</button>
        <button className="primary">Registrarme</button>
      </div>
    </header>
  );
}

function WorkspaceStatusHeader() {
  return (
    <header className="workspace-status-header">
      <div className="workspace-active-document">
        <span>Documento activo</span>
        <strong>SENTENCIA CONDENATORIA 332024.pdf</strong>
      </div>

      <div className="workspace-status-metrics">
        <span>28 páginas</span>
        <span>2 docs</span>
        <span className="saved">Guardado</span>
      </div>

      <button className="workspace-add-doc">
        <Upload size={15} />
        Agregar documento
      </button>
    </header>
  );
}

function ToolRail() {
  return (
    <aside className="workspace-tool-rail">
      <button className="active" title="Dividir PDF">
        <Scissors size={20} />
        <span>Dividir</span>
      </button>

      <button title="Unir PDF">
        <Merge size={20} />
        <span>Unir</span>
      </button>

      <button title="Comprimir PDF">
        <Minimize2 size={20} />
        <span>Comprimir</span>
      </button>

      <button title="PDF a Word">
        <FileText size={20} />
        <span>Word</span>
      </button>
    </aside>
  );
}

function DocumentTabs() {
  return (
    <nav className="workspace-document-tabs">
      <button className="active">
        <FileText size={15} />
        <span>SENTENCIA CONDENATORIA 332024.pdf</span>
      </button>

      <button>
        <FileText size={15} />
        <span>especificaciones cron.pdf</span>
      </button>
    </nav>
  );
}

function PdfStage() {
  return (
    <section className="pdf-stage">
      <div className="page-grid">
        <BlockSeparator />

        {Array.from({ length: 10 }).map((_, index) => (
          <PageThumb key={index} page={index + 1} />
        ))}
      </div>
    </section>
  );
}

function BlockSeparator() {
  return (
    <article className="document-block-separator">
      <span className="separator-band" />
      <div>
        <strong>Inicio de documento</strong>
        <small>Páginas 1-28</small>
      </div>

      <button className="separator-menu">⋯</button>
    </article>
  );
}

function PageThumb({ page }: { page: number }) {
  return (
    <article className="pdf-thumb">
      <button className="thumb-select">✓</button>

      <div className="paper-preview">
        <FileText size={46} />
      </div>

      <strong>Página {page}</strong>
      <small>Personalizado · Vertical</small>
    </article>
  );
}

function FloatingTabs() {
  return (
    <div className="workspace-floating-tabs">
      <button title="Configuración">
        <Settings size={18} />
      </button>

      <button title="Zoom">
        <Search size={18} />
      </button>

      <div className="workspace-zoom-popover">
        <button>
          <ZoomOut size={15} />
        </button>

        <input type="range" min="60" max="180" defaultValue="100" />

        <strong>100%</strong>

        <button>
          <ZoomIn size={15} />
        </button>
      </div>
    </div>
  );
}

function ConfigPanel() {
  return (
    <aside className="workspace-config-panel">
      <header>
        <div>
          <span>Herramienta</span>
          <strong>Dividir PDF</strong>
        </div>

        <div className="config-actions">
          <button title="Fijar panel">
            <Pin size={15} />
          </button>

          <button title="Cerrar panel">
            <X size={15} />
          </button>
        </div>
      </header>

      <section className="config-content">
        <p>Crea nuevos PDF a partir de páginas o rangos.</p>

        <label>
          <input type="radio" name="split" defaultChecked />
          Dividir por rango de páginas
        </label>

        <label>
          <input type="radio" name="split" />
          Extraer páginas seleccionadas
        </label>

        <label>
          <input type="radio" name="split" />
          Separar cada página en un PDF
        </label>

        <label>
          <input type="radio" name="split" />
          Dividir cada N páginas
        </label>

        <button className="primary full">
          <Scissors size={16} />
          Aplicar división
        </button>

        <button className="secondary full">Cancelar</button>
      </section>
    </aside>
  );
}
```

```css
/* workspace.css */

:root {
  --topbar-height: 56px;
  --workspace-status-height: 54px;
  --tool-rail-width: 68px;
  --config-panel-width: 340px;
  --workspace-border: #e5e7eb;
  --workspace-bg: #f6f8fb;
  --workspace-blue: #2563eb;
}

/* Global */
.app-main {
  height: 100vh;
  display: flex;
  flex-direction: column;
  overflow: hidden;
}

.topbar {
  height: var(--topbar-height);
  flex-shrink: 0;
  z-index: 30;
  background: #ffffff;
  border-bottom: 1px solid var(--workspace-border);
  display: flex;
  align-items: center;
  justify-content: space-between;
  padding: 0 18px;
}

.topbar p {
  margin: 0;
  font-size: 12px;
  color: #64748b;
}

.topbar strong {
  font-size: 14px;
}

.topbar-actions {
  display: flex;
  gap: 8px;
}

/* Workspace isolated */
.workspace-root {
  height: calc(100vh - var(--topbar-height));
  min-height: 0;
  display: flex;
  flex-direction: column;
  background: var(--workspace-bg);
  overflow: hidden;
}

.workspace-status-header {
  height: var(--workspace-status-height);
  flex-shrink: 0;
  z-index: 20;
  background: #ffffff;
  border-bottom: 1px solid var(--workspace-border);
  display: flex;
  align-items: center;
  justify-content: space-between;
  gap: 16px;
  padding: 0 16px;
}

.workspace-active-document {
  min-width: 0;
  display: flex;
  flex-direction: column;
}

.workspace-active-document span {
  font-size: 11px;
  color: #64748b;
}

.workspace-active-document strong {
  max-width: 420px;
  overflow: hidden;
  white-space: nowrap;
  text-overflow: ellipsis;
}

.workspace-status-metrics {
  display: flex;
  gap: 10px;
  font-size: 12px;
  color: #475569;
}

.workspace-status-metrics span {
  padding: 5px 9px;
  border-radius: 999px;
  background: #f1f5f9;
}

.workspace-status-metrics .saved {
  color: #047857;
  background: #ecfdf5;
}

.workspace-body {
  height: calc(100vh - var(--topbar-height) - var(--workspace-status-height));
  min-height: 0;
  display: grid;
  grid-template-columns: var(--tool-rail-width) minmax(0, 1fr) var(--config-panel-width);
  overflow: hidden;
}

.workspace-root.workspace-config-hidden .workspace-body {
  grid-template-columns: var(--tool-rail-width) minmax(0, 1fr);
}

/* Tool rail */
.workspace-tool-rail {
  min-width: 0;
  background: #071426;
  border-right: 1px solid #0f2744;
  padding: 10px 7px;
  display: flex;
  flex-direction: column;
  gap: 8px;
}

.workspace-tool-rail button {
  height: 54px;
  border: 0;
  border-radius: 14px;
  background: transparent;
  color: #cbd5e1;
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  gap: 3px;
  cursor: pointer;
}

.workspace-tool-rail button span {
  font-size: 10px;
}

.workspace-tool-rail button:hover,
.workspace-tool-rail button.active {
  background: #12345c;
  color: #ffffff;
}

/* Document area */
.workspace-document-area {
  position: relative;
  min-width: 0;
  min-height: 0;
  overflow: hidden;
  display: flex;
  flex-direction: column;
}

.workspace-document-tabs {
  height: 44px;
  flex-shrink: 0;
  background: #ffffff;
  border-bottom: 1px solid var(--workspace-border);
  display: flex;
  align-items: center;
  gap: 8px;
  padding: 0 12px;
  overflow-x: auto;
}

.workspace-document-tabs button {
  height: 30px;
  max-width: 260px;
  padding: 0 10px;
  border-radius: 999px;
  border: 1px solid #dbe3ef;
  background: #ffffff;
  display: flex;
  align-items: center;
  gap: 6px;
}

.workspace-document-tabs button span {
  overflow: hidden;
  white-space: nowrap;
  text-overflow: ellipsis;
}

.workspace-document-tabs button.active {
  background: #eff6ff;
  border-color: #bfdbfe;
  color: var(--workspace-blue);
}

.pdf-stage {
  flex: 1;
  min-height: 0;
  overflow: auto;
  padding: 22px 56px 22px 22px;
}

.page-grid {
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(145px, 1fr));
  gap: 22px;
  align-items: start;
}

/* Compact separator */
.document-block-separator {
  width: calc(170px * 0.75);
  min-height: calc(220px * 0.2);
  max-height: 72px;
  justify-self: center;
  align-self: center;
  background: #eff6ff;
  border: 1px solid #bfdbfe;
  border-radius: 14px;
  padding: 8px 10px;
  display: flex;
  align-items: center;
  gap: 8px;
  overflow: hidden;
}

.separator-band {
  width: 5px;
  height: 34px;
  border-radius: 999px;
  background: var(--workspace-blue);
  flex-shrink: 0;
}

.document-block-separator strong {
  display: block;
  font-size: 12px;
}

.document-block-separator small {
  display: block;
  font-size: 10px;
  color: #64748b;
}

.separator-menu {
  margin-left: auto;
  opacity: 0;
}

.document-block-separator:hover .separator-menu {
  opacity: 1;
}

/* Page thumb */
.pdf-thumb {
  position: relative;
  background: #ffffff;
  border: 1px solid #dbe3ef;
  border-radius: 16px;
  padding: 10px;
  box-shadow: 0 8px 18px rgba(15, 23, 42, 0.05);
}

.thumb-select {
  position: absolute;
  top: 8px;
  left: 8px;
  width: 24px;
  height: 24px;
  border-radius: 999px;
  border: 1px solid var(--workspace-blue);
  background: var(--workspace-blue);
  color: #ffffff;
}

.paper-preview {
  height: 210px;
  border-radius: 10px;
  border: 1px solid #e2e8f0;
  background: #f8fafc;
  display: flex;
  align-items: center;
  justify-content: center;
  color: #94a3b8;
  margin-bottom: 10px;
}

.pdf-thumb strong {
  display: block;
  font-size: 13px;
}

.pdf-thumb small {
  font-size: 11px;
  color: #64748b;
}

/* Right floating tabs */
.workspace-floating-tabs {
  position: absolute;
  right: 10px;
  top: 58px;
  z-index: 25;
  display: flex;
  flex-direction: column;
  gap: 6px;
}

.workspace-floating-tabs > button {
  width: 38px;
  height: 38px;
  border-radius: 12px;
  border: 1px solid #dbe3ef;
  background: #ffffff;
  box-shadow: 0 8px 22px rgba(15, 23, 42, 0.12);
}

.workspace-zoom-popover {
  position: absolute;
  right: 46px;
  top: 44px;
  width: 220px;
  padding: 10px;
  border-radius: 14px;
  background: #ffffff;
  border: 1px solid #dbe3ef;
  box-shadow: 0 14px 34px rgba(15, 23, 42, 0.16);
  display: flex;
  align-items: center;
  gap: 8px;
}

.workspace-zoom-popover input {
  min-width: 0;
  flex: 1;
}

/* Config panel */
.workspace-config-panel {
  min-width: 0;
  min-height: 0;
  background: #ffffff;
  border-left: 1px solid var(--workspace-border);
  overflow-y: auto;
  overflow-x: hidden;
}

.workspace-config-panel header {
  height: 58px;
  border-bottom: 1px solid var(--workspace-border);
  padding: 0 14px;
  display: flex;
  align-items: center;
  justify-content: space-between;
}

.workspace-config-panel header span {
  display: block;
  font-size: 11px;
  color: #64748b;
}

.config-actions {
  display: flex;
  gap: 6px;
}

.config-content {
  padding: 16px;
}

.config-content p {
  font-size: 13px;
  color: #64748b;
  margin-top: 0;
}

.config-content label {
  width: 100%;
  box-sizing: border-box;
  padding: 12px;
  border: 1px solid #dbe3ef;
  border-radius: 12px;
  display: flex;
  gap: 8px;
  margin-bottom: 10px;
}

button {
  cursor: pointer;
}

button.primary,
.primary {
  background: var(--workspace-blue);
  color: #ffffff;
  border-color: var(--workspace-blue);
}

button.secondary {
  background: #ffffff;
  color: #334155;
  border: 1px solid #dbe3ef;
}

.full {
  width: 100%;
  height: 38px;
  border-radius: 12px;
  border: 1px solid transparent;
  margin-top: 10px;
  display: flex;
  align-items: center;
  justify-content: center;
  gap: 6px;
}

/* Safety */
.workspace-root *,
.workspace-root *::before,
.workspace-root *::after {
  box-sizing: border-box;
}

.workspace-config-panel * {
  max-width: 100%;
}
```

La clave es esta estructura:

```txt
Topbar global
└── Workspace
    ├── Header del documento
    └── Body
        ├── Herramientas
        ├── Documento
        └── Configuración
```

Así ya no se enciman los elementos.
