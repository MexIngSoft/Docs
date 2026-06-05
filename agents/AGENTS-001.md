Sí. Así se vería una versión **más limpia del Workspace en código**, separando:

```txt
Izquierda: herramientas
Centro: documento
Derecha: configuración
Arriba: estado del documento
```

Basado en tu estructura actual del Workspace. 

```tsx
// app/workspace/page.tsx

import {
  FileText,
  Scissors,
  RotateCw,
  Trash2,
  Download,
  Settings,
  PanelLeft,
  PanelRight,
  Eye,
  Layers,
} from "lucide-react";

export default function WorkspacePage() {
  return (
    <main className="workspace-shell">
      <WorkspaceHeader />

      <section className="workspace-layout">
        <ToolRail />
        <DocumentCanvas />
        <ToolSettingsPanel />
      </section>
    </main>
  );
}

function WorkspaceHeader() {
  return (
    <header className="workspace-header">
      <div>
        <strong>Contrato_Servicios_2024.pdf</strong>
        <span>123 páginas · 7 bloques · Guardado ✓</span>
      </div>

      <div className="workspace-header-actions">
        <button>
          <Eye size={16} />
          Vista previa
        </button>

        <button className="primary">
          <Download size={16} />
          Descargar
        </button>
      </div>
    </header>
  );
}

function ToolRail() {
  return (
    <aside className="tool-rail" aria-label="Herramientas del documento">
      <button className="tool-item active" title="Dividir PDF">
        <Scissors size={20} />
        <span>Dividir</span>
      </button>

      <button className="tool-item" title="Rotar páginas">
        <RotateCw size={20} />
        <span>Rotar</span>
      </button>

      <button className="tool-item" title="Eliminar páginas">
        <Trash2 size={20} />
        <span>Eliminar</span>
      </button>

      <button className="tool-item" title="Bloques">
        <Layers size={20} />
        <span>Bloques</span>
      </button>

      <button className="tool-item" title="Configuración">
        <Settings size={20} />
        <span>Ajustes</span>
      </button>
    </aside>
  );
}

function DocumentCanvas() {
  return (
    <section className="document-canvas">
      <BlockSeparator title="Bloque 1" pages="Páginas 1-20" />

      <div className="page-grid">
        {Array.from({ length: 12 }).map((_, index) => (
          <PageThumb key={index} page={index + 1} />
        ))}
      </div>
    </section>
  );
}

function PageThumb({ page }: { page: number }) {
  return (
    <article className="page-thumb">
      <button className="page-select">✓</button>

      <div className="paper-preview">
        <FileText size={42} />
      </div>

      <strong>Página {page}</strong>
      <small>Carta · Vertical</small>
    </article>
  );
}

function BlockSeparator({
  title,
  pages,
}: {
  title: string;
  pages: string;
}) {
  return (
    <div className="block-separator">
      <div>
        <strong>{title}</strong>
        <span>{pages}</span>
      </div>

      <div className="block-actions">
        <button>Renombrar</button>
        <button>Unificar</button>
        <button>Color</button>
      </div>
    </div>
  );
}

function ToolSettingsPanel() {
  return (
    <aside className="tool-settings-panel">
      <header>
        <PanelRight size={18} />
        <strong>Dividir PDF</strong>
      </header>

      <div className="setting-group">
        <label>
          <input type="radio" name="splitMode" defaultChecked />
          Dividir por bloques
        </label>

        <label>
          <input type="radio" name="splitMode" />
          Dividir por rangos
        </label>

        <label>
          <input type="radio" name="splitMode" />
          Extraer páginas seleccionadas
        </label>
      </div>

      <button className="primary full">Aplicar cambios</button>
    </aside>
  );
}
```

Y el CSS:

```css
.workspace-shell {
  height: 100vh;
  display: flex;
  flex-direction: column;
  background: #f6f8fb;
  color: #0f172a;
}

.workspace-header {
  height: 56px;
  padding: 0 18px;
  display: flex;
  align-items: center;
  justify-content: space-between;
  background: #ffffff;
  border-bottom: 1px solid #e5e7eb;
}

.workspace-header div:first-child {
  display: flex;
  flex-direction: column;
  gap: 2px;
}

.workspace-header span {
  font-size: 12px;
  color: #64748b;
}

.workspace-header-actions {
  display: flex;
  gap: 8px;
}

.workspace-header button,
.tool-settings-panel button,
.block-actions button {
  height: 34px;
  padding: 0 12px;
  border: 1px solid #dbe3ef;
  border-radius: 10px;
  background: #ffffff;
  display: inline-flex;
  align-items: center;
  gap: 6px;
  cursor: pointer;
}

.primary {
  background: #2563eb !important;
  color: white;
  border-color: #2563eb !important;
}

.workspace-layout {
  flex: 1;
  min-height: 0;
  display: grid;
  grid-template-columns: 68px minmax(0, 1fr) 320px;
}

.tool-rail {
  background: #071426;
  border-right: 1px solid #0f2744;
  padding: 12px 8px;
  display: flex;
  flex-direction: column;
  gap: 8px;
}

.tool-item {
  height: 52px;
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

.tool-item span {
  font-size: 10px;
}

.tool-item:hover,
.tool-item.active {
  background: #12345c;
  color: #ffffff;
}

.document-canvas {
  overflow: auto;
  padding: 22px;
}

.page-grid {
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(150px, 1fr));
  gap: 22px;
  align-items: start;
}

.page-thumb {
  position: relative;
  background: #ffffff;
  border: 1px solid #dbe3ef;
  border-radius: 16px;
  padding: 12px;
  box-shadow: 0 8px 20px rgba(15, 23, 42, 0.05);
}

.page-select {
  position: absolute;
  top: 8px;
  left: 8px;
  width: 24px;
  height: 24px;
  border-radius: 999px;
  border: 1px solid #2563eb;
  background: #2563eb;
  color: white;
}

.paper-preview {
  height: 200px;
  border-radius: 10px;
  background: #f8fafc;
  border: 1px solid #e2e8f0;
  display: flex;
  align-items: center;
  justify-content: center;
  color: #94a3b8;
  margin-bottom: 10px;
}

.page-thumb strong {
  display: block;
  font-size: 14px;
}

.page-thumb small {
  font-size: 12px;
  color: #64748b;
}

.block-separator {
  margin-bottom: 18px;
  padding: 10px 14px;
  border-radius: 12px;
  background: #eff6ff;
  border: 1px solid #bfdbfe;
  display: flex;
  align-items: center;
  justify-content: space-between;
}

.block-separator span {
  display: block;
  font-size: 12px;
  color: #475569;
}

.block-actions {
  display: flex;
  gap: 6px;
}

.tool-settings-panel {
  background: #ffffff;
  border-left: 1px solid #e5e7eb;
  padding: 16px;
  overflow: auto;
}

.tool-settings-panel header {
  display: flex;
  align-items: center;
  gap: 8px;
  margin-bottom: 18px;
}

.setting-group {
  display: flex;
  flex-direction: column;
  gap: 12px;
  margin-bottom: 20px;
}

.setting-group label {
  padding: 12px;
  border: 1px solid #dbe3ef;
  border-radius: 12px;
  display: flex;
  gap: 8px;
}

.full {
  width: 100%;
  justify-content: center;
}
```

La idea importante: **ya no repites herramientas en cada página**. La página solo muestra preview; las acciones viven en el panel izquierdo y la configuración en el derecho.
