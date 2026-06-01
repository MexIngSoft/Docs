Listo, te dejé el código en el canvas.

Incluye:
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>DocuCore Workspace Preview</title>
  <style>
    * {
      box-sizing: border-box;
    }

    html,
    body {
      margin: 0;
      min-height: 100%;
      overflow-x: hidden;
      font-family: Inter, system-ui, -apple-system, BlinkMacSystemFont, "Segoe UI", sans-serif;
      background: #f8fafc;
      color: #0f172a;
    }

    body {
      overflow-y: auto;
    }

    .workspace-shell {
      width: 100%;
      min-height: 100dvh;
      position: relative;
      background:
        radial-gradient(circle at top left, rgba(37, 99, 235, 0.08), transparent 32%),
        #f8fafc;
    }

    /* TOPBAR */
    .topbar {
      position: fixed;
      top: 10px;
      left: 50%;
      transform: translateX(-50%);
      width: min(920px, calc(100vw - 24px));
      height: 48px;
      padding: 6px 10px 6px 16px;
      display: flex;
      align-items: center;
      justify-content: space-between;
      gap: 14px;
      border-radius: 999px;
      background: rgba(255, 255, 255, 0.58);
      backdrop-filter: blur(16px);
      border: 1px solid rgba(226, 232, 240, 0.72);
      box-shadow: 0 10px 30px rgba(15, 23, 42, 0.06);
      z-index: 1000;
      transition: background 160ms ease, box-shadow 160ms ease;
    }

    .topbar:hover,
    .topbar:focus-within {
      background: rgba(255, 255, 255, 0.96);
      box-shadow: 0 16px 42px rgba(15, 23, 42, 0.16);
    }

    .topbar-title {
      min-width: 0;
    }

    .topbar-title p {
      margin: 0;
      font-size: 11px;
      color: #64748b;
    }

    .topbar-title strong {
      display: block;
      font-size: 13px;
      white-space: nowrap;
      overflow: hidden;
      text-overflow: ellipsis;
    }

    .topbar-actions {
      display: flex;
      align-items: center;
      gap: 8px;
      flex: 0 0 auto;
    }

    .topbar-actions button {
      height: 34px;
      border: 0;
      border-radius: 999px;
      padding: 0 14px;
      cursor: pointer;
      font-weight: 700;
    }

    .topbar-link {
      background: transparent;
      color: #1e293b;
    }

    .topbar-primary {
      background: #2563eb;
      color: white;
      box-shadow: 0 10px 24px rgba(37, 99, 235, 0.28);
    }

    /* SIDEBAR */
    .sidebar-tab {
      position: fixed;
      left: 0;
      top: 50%;
      transform: translateY(-50%);
      width: 34px;
      height: 78px;
      border: 0;
      border-radius: 0 18px 18px 0;
      background: rgba(15, 23, 42, 0.62);
      color: white;
      backdrop-filter: blur(12px);
      z-index: 950;
      cursor: pointer;
    }

    .sidebar {
      position: fixed;
      left: 12px;
      top: 72px;
      bottom: 96px;
      width: 58px;
      padding: 8px;
      border-radius: 22px;
      background: rgba(15, 23, 42, 0.78);
      backdrop-filter: blur(16px);
      z-index: 960;
      overflow: hidden;
      transform: translateX(calc(-100% - 20px));
      opacity: 0;
      pointer-events: none;
      transition: width 180ms ease, transform 180ms ease, opacity 180ms ease;
    }

    .sidebar.is-open {
      transform: translateX(0);
      opacity: 1;
      pointer-events: auto;
    }

    .sidebar:hover,
    .sidebar.is-expanded {
      width: 250px;
    }

    .sidebar a,
    .sidebar button {
      width: 100%;
      min-height: 42px;
      display: flex;
      align-items: center;
      gap: 10px;
      border: 0;
      border-radius: 14px;
      padding: 0 12px;
      color: white;
      background: transparent;
      text-decoration: none;
      cursor: pointer;
    }

    .sidebar span {
      opacity: 0;
      white-space: nowrap;
      transition: opacity 160ms ease;
    }

    .sidebar:hover span,
    .sidebar.is-expanded span {
      opacity: 1;
    }

    /* MAIN DOCUMENT AREA */
    .canvas-workspace {
      width: 100%;
      min-height: 100dvh;
      margin: 0;
      padding: 0;
      border: 0;
      border-radius: 0;
      background: transparent;
      overflow: visible;
      position: relative;
    }

    .canvas-main {
      width: 100%;
      min-height: 100dvh;
      padding: 78px 16px 120px;
      overflow: visible;
    }

    .pdf-stage {
      width: 100%;
      max-width: none;
      margin: 0;
      padding: 0;
      background: transparent;
      border: 0;
      box-shadow: none;
      overflow: visible;
    }

    .page-grid {
      width: min(100%, 1280px);
      margin: 0 auto;
      padding: 12px 0 140px;
      display: grid;
      grid-template-columns: repeat(auto-fill, minmax(150px, 1fr));
      gap: 18px;
      align-items: start;
      justify-items: center;
      overflow: visible;
    }

    .pdf-thumb {
      width: 150px;
      position: relative;
      border: 1px solid rgba(148, 163, 184, 0.45);
      border-top: 4px solid var(--section-color, #2563eb);
      border-radius: 18px;
      padding: 8px;
      background: rgba(255, 255, 255, 0.92);
      box-shadow: 0 12px 30px rgba(15, 23, 42, 0.08);
    }

    .thumb-select {
      width: 100%;
      display: flex;
      flex-direction: column;
      align-items: center;
      gap: 7px;
      border: 0;
      background: transparent;
      cursor: pointer;
      padding: 0;
      text-align: center;
    }

    .paper-mini {
      width: 100%;
      aspect-ratio: var(--preview-aspect, 612 / 792);
      display: flex;
      align-items: center;
      justify-content: center;
      overflow: hidden;
      border-radius: 12px;
      background: #ffffff;
      border: 1px solid #e2e8f0;
    }

    .paper-mini img,
    .paper-mini canvas {
      width: 100%;
      height: 100%;
      object-fit: contain;
      display: block;
      transform: rotate(var(--preview-rotation, 0deg));
    }

    .pdf-thumb strong,
    .pdf-thumb small {
      max-width: 100%;
      white-space: nowrap;
      overflow: hidden;
      text-overflow: ellipsis;
    }

    .pdf-thumb strong {
      font-size: 13px;
    }

    .pdf-thumb small {
      font-size: 11px;
      color: #64748b;
    }

    .page-quick-actions {
      position: absolute;
      top: 10px;
      left: 10px;
      right: 10px;
      display: flex;
      justify-content: center;
      gap: 5px;
      opacity: 0;
      pointer-events: none;
      transition: opacity 140ms ease;
    }

    .pdf-thumb:hover .page-quick-actions,
    .pdf-thumb:focus-within .page-quick-actions,
    .pdf-thumb.selected .page-quick-actions {
      opacity: 1;
      pointer-events: auto;
    }

    .page-action {
      width: 28px;
      height: 28px;
      border: 1px solid #e2e8f0;
      border-radius: 999px;
      background: rgba(255, 255, 255, 0.94);
      cursor: pointer;
    }

    .section-split-zone {
      width: 140px;
      min-height: 34px;
      display: inline-flex;
      align-items: center;
      justify-content: center;
      gap: 6px;
      border: 1px dashed rgba(37, 99, 235, 0.46);
      border-radius: 999px;
      background: rgba(239, 246, 255, 0.72);
      color: #1d4ed8;
      font-size: 12px;
      font-weight: 700;
      cursor: pointer;
    }

    /* FLOATING TOOLBAR */
    .floating-toolbar {
      position: fixed;
      left: 50%;
      bottom: 18px;
      transform: translateX(-50%);
      max-width: calc(100vw - 24px);
      display: flex;
      align-items: center;
      justify-content: center;
      gap: 8px;
      padding: 8px;
      border-radius: 999px;
      background: rgba(15, 23, 42, 0.82);
      backdrop-filter: blur(16px);
      box-shadow: 0 18px 46px rgba(15, 23, 42, 0.28);
      overflow: visible;
      z-index: 1200;
    }

    .floating-toolbar button {
      position: relative;
      width: 42px;
      height: 42px;
      min-width: 42px;
      flex: 0 0 auto;
      display: inline-flex;
      align-items: center;
      justify-content: center;
      border: 0;
      border-radius: 999px;
      background: rgba(255, 255, 255, 0.1);
      color: white;
      cursor: pointer;
      transition: background 140ms ease, transform 140ms ease;
    }

    .floating-toolbar button:hover,
    .floating-toolbar button:focus-visible {
      background: rgba(255, 255, 255, 0.22);
      transform: translateY(-2px);
    }

    .floating-toolbar .apply-button {
      background: #2563eb;
      box-shadow: 0 10px 24px rgba(37, 99, 235, 0.34);
    }

    .floating-toolbar button span {
      display: none;
    }

    .floating-toolbar button::after {
      content: attr(data-label);
      position: absolute;
      bottom: calc(100% + 9px);
      left: 50%;
      transform: translate(-50%, 4px);
      padding: 6px 10px;
      border-radius: 999px;
      background: #020617;
      color: white;
      font-size: 12px;
      font-weight: 700;
      white-space: nowrap;
      opacity: 0;
      pointer-events: none;
      transition: opacity 140ms ease, transform 140ms ease;
    }

    .floating-toolbar button:hover::after,
    .floating-toolbar button:focus-visible::after {
      opacity: 1;
      transform: translate(-50%, 0);
    }

    .popover {
      position: fixed;
      left: 50%;
      bottom: 82px;
      transform: translateX(-50%);
      width: min(360px, calc(100vw - 24px));
      padding: 14px;
      border-radius: 22px;
      background: rgba(255, 255, 255, 0.98);
      border: 1px solid #e2e8f0;
      box-shadow: 0 22px 60px rgba(15, 23, 42, 0.2);
      z-index: 1190;
      display: none;
    }

    .popover.is-open {
      display: block;
    }

    .popover h3 {
      margin: 0 0 8px;
      font-size: 15px;
    }

    .popover p {
      margin: 5px 0;
      font-size: 13px;
      color: #475569;
    }

    .popover-list {
      display: grid;
      gap: 8px;
      margin-top: 10px;
    }

    .popover-list button {
      min-height: 38px;
      border: 1px solid #e2e8f0;
      border-radius: 12px;
      background: #f8fafc;
      cursor: pointer;
      font-weight: 700;
    }

    @media (max-width: 640px) {
      .topbar {
        width: calc(100vw - 16px);
      }

      .topbar-title p {
        display: none;
      }

      .topbar-actions button:not(.topbar-primary) {
        display: none;
      }

      .canvas-main {
        padding-inline: 10px;
      }

      .page-grid {
        grid-template-columns: repeat(auto-fill, minmax(126px, 1fr));
        gap: 14px;
      }

      .pdf-thumb {
        width: 126px;
      }

      .floating-toolbar {
        gap: 5px;
        padding: 7px;
      }

      .floating-toolbar button {
        width: 38px;
        height: 38px;
        min-width: 38px;
      }
    }
  </style>
</head>
<body>
  <div class="workspace-shell">
    <header class="topbar">
      <div class="topbar-title">
        <p>Workspace documental</p>
        <strong>Procesamiento seguro de archivos</strong>
      </div>
      <div class="topbar-actions">
        <button class="topbar-link" type="button">Iniciar sesión</button>
        <button class="topbar-primary" type="button">Registrarme</button>
      </div>
    </header>

    <button class="sidebar-tab" type="button" aria-label="Abrir navegación" onclick="toggleSidebar()">☰</button>

    <aside class="sidebar" id="sidebar">
      <a href="#"><strong>◈</strong><span>DocuCore</span></a>
      <a href="#"><strong>⌂</strong><span>Inicio</span></a>
      <a href="#"><strong>⇧</strong><span>Subir archivo</span></a>
      <a href="#"><strong>▣</strong><span>Workspace</span></a>
      <a href="#"><strong>◷</strong><span>Historial</span></a>
      <a href="#"><strong>⚙</strong><span>Administración</span></a>
    </aside>

    <section class="canvas-workspace">
      <main class="canvas-main">
        <section class="pdf-stage" aria-label="Vista previa principal del PDF">
          <div class="page-grid">
            <article class="pdf-thumb selected" style="--section-color:#2563eb;">
              <button class="thumb-select" type="button" aria-label="Seleccionar página 1">
                <span class="paper-mini" style="--preview-aspect: 612 / 792;"></span>
                <strong>Página 1</strong>
                <small>Carta · V</small>
              </button>
              <div class="page-quick-actions">
                <button class="page-action" title="Girar izquierda">↶</button>
                <button class="page-action" title="Girar derecha">↷</button>
                <button class="page-action" title="Más opciones">⋯</button>
              </div>
            </article>

            <button class="section-split-zone" type="button">✂ Dividir aquí</button>

            <article class="pdf-thumb selected" style="--section-color:#2563eb;">
              <button class="thumb-select" type="button" aria-label="Seleccionar página 2">
                <span class="paper-mini" style="--preview-aspect: 612 / 792;"></span>
                <strong>Página 2</strong>
                <small>Carta · V</small>
              </button>
              <div class="page-quick-actions">
                <button class="page-action" title="Girar izquierda">↶</button>
                <button class="page-action" title="Girar derecha">↷</button>
                <button class="page-action" title="Más opciones">⋯</button>
              </div>
            </article>

            <button class="section-split-zone" type="button">✂ Dividir aquí</button>

            <article class="pdf-thumb" style="--section-color:#16a34a;">
              <button class="thumb-select" type="button" aria-label="Seleccionar página 3">
                <span class="paper-mini" style="--preview-aspect: 612 / 792;"></span>
                <strong>Página 3</strong>
                <small>Carta · V</small>
              </button>
              <div class="page-quick-actions">
                <button class="page-action" title="Girar izquierda">↶</button>
                <button class="page-action" title="Girar derecha">↷</button>
                <button class="page-action" title="Más opciones">⋯</button>
              </div>
            </article>

            <button class="section-split-zone" type="button">✂ Dividir aquí</button>

            <article class="pdf-thumb" style="--section-color:#16a34a;">
              <button class="thumb-select" type="button" aria-label="Seleccionar página 4">
                <span class="paper-mini" style="--preview-aspect: 612 / 792;"></span>
                <strong>Página 4</strong>
                <small>Carta · V</small>
              </button>
              <div class="page-quick-actions">
                <button class="page-action" title="Girar izquierda">↶</button>
                <button class="page-action" title="Girar derecha">↷</button>
                <button class="page-action" title="Más opciones">⋯</button>
              </div>
            </article>
          </div>
        </section>
      </main>
    </section>

    <div class="popover" id="popover">
      <h3 id="popover-title">Documento</h3>
      <div id="popover-content"></div>
    </div>

    <nav class="floating-toolbar" aria-label="Accesos rápidos de workspace">
      <button type="button" data-label="Herramientas" onclick="openPopover('Herramientas', '<div class=&quot;popover-list&quot;><button>Dividir PDF</button><button>Unir PDF</button><button>OCR</button><button>PDF a Word</button></div>')">✂<span>Herramientas</span></button>
      <button type="button" data-label="Documento" onclick="openPopover('Documento actual', '<p>Archivo: sentencia.pdf</p><p>Peso: 26.1 MB</p><p>Páginas: 123</p><p>Seleccionadas: 8</p>')">📄<span>Documento</span></button>
      <button type="button" data-label="Estado" onclick="openPopover('Estado del preview', '<p>123/123 miniaturas listas</p><p>0 cargando</p><p>0 incidencias</p>')">●<span>Estado</span></button>
      <button type="button" data-label="Secciones" onclick="openPopover('Secciones', '<p>🔵 Documento principal · 80 páginas</p><p>🟢 Anexos · 43 páginas</p>')">▦<span>Secciones</span></button>
      <button type="button" data-label="Selección" onclick="openPopover('Selección', '<div class=&quot;popover-list&quot;><button>Todas</button><button>Impares</button><button>Pares</button><button>Limpiar selección</button></div>')">☑<span>Selección</span></button>
      <button type="button" data-label="Configuración" onclick="openPopover('Configuración', '<p>Calidad de preview</p><p>Mostrar páginas descartadas</p><p>Modo compacto</p>')">⚙<span>Configuración</span></button>
      <button type="button" data-label="Subir más">＋<span>Subir más</span></button>
      <button type="button" data-label="Resultado">⇩<span>Resultado</span></button>
      <button class="apply-button" type="button" data-label="Aplicar cambios">✓<span>Aplicar</span></button>
    </nav>
  </div>

  <script>
    const sidebar = document.getElementById('sidebar');
    const popover = document.getElementById('popover');
    const popoverTitle = document.getElementById('popover-title');
    const popoverContent = document.getElementById('popover-content');

    function toggleSidebar() {
      sidebar.classList.toggle('is-open');
    }

    function openPopover(title, html) {
      popoverTitle.textContent = title;
      popoverContent.innerHTML = html;
      popover.classList.add('is-open');
    }

    document.addEventListener('keydown', (event) => {
      if (event.key === 'Escape') {
        popover.classList.remove('is-open');
        sidebar.classList.remove('is-open');
      }
    });

    document.addEventListener('click', (event) => {
      const clickedToolbar = event.target.closest('.floating-toolbar');
      const clickedPopover = event.target.closest('.popover');
      const clickedSidebar = event.target.closest('.sidebar, .sidebar-tab');

      if (!clickedToolbar && !clickedPopover) {
        popover.classList.remove('is-open');
      }

      if (!clickedSidebar) {
        sidebar.classList.remove('is-open');
      }
    });
  </script>
</body>
</html>

* preview a pantalla completa
* sin `pdf-toolbar`
* sin `canvas-header` estorbando
* barra inferior flotante
* popovers para documento, estado, selección y secciones
* sidebar oculta con pestaña lateral
* un solo scroll del navegador
