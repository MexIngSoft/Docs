Listo, te maqueté una página completa en React para visualizar DocuCore como **panel de herramientas**, con:

* Herramientas por categorías.
* Créditos visibles.
* Login en modal sin cambiar de pantalla.
* Panel lateral.
* Procesos sugeridos.
* Modal de ejecución de herramienta.
* Barra inferior móvil.
* Estilo más profesional y más completo que las referencias.
import React, { useMemo, useState } from "react";
import { motion } from "framer-motion";
import {
  FileText,
  Wand2,
  Layers3,
  Brain,
  FolderKanban,
  Workflow,
  UploadCloud,
  Search,
  ShieldCheck,
  History,
  Sparkles,
  FileInput,
  FileOutput,
  Scissors,
  Merge,
  Lock,
  RotateCw,
  Image,
  Table,
  FileArchive,
  KeyRound,
  User,
  CreditCard,
  ChevronRight,
  CheckCircle2,
  Clock3,
  Zap,
  Database,
  Settings,
  Bell,
  Home,
  Grid3X3,
  FolderOpen,
  BadgeCheck,
  Eye,
  Download,
  PlayCircle,
  Cpu,
  BookOpen,
  ScanText,
  Tags,
  MessageSquareText,
  FileSearch,
  Plus,
  X,
} from "lucide-react";

const categories = [
  { id: "all", label: "Todo", icon: Grid3X3 },
  { id: "pdf", label: "PDF", icon: FileText },
  { id: "ocr", label: "OCR", icon: ScanText },
  { id: "convert", label: "Conversión", icon: FileOutput },
  { id: "ai", label: "IA Documental", icon: Brain },
  { id: "expedientes", label: "Expedientes", icon: FolderKanban },
  { id: "workflow", label: "Procesos", icon: Workflow },
];

const tools = [
  { name: "Unir PDF", desc: "Combina varios archivos en un solo documento.", cat: "pdf", credits: 1, icon: Merge, tag: "Básico" },
  { name: "Dividir PDF", desc: "Separa páginas, rangos o documentos completos.", cat: "pdf", credits: 1, icon: Scissors, tag: "Básico" },
  { name: "Comprimir PDF", desc: "Reduce tamaño sin perder legibilidad.", cat: "pdf", credits: 2, icon: Zap, tag: "Popular" },
  { name: "Ordenar páginas", desc: "Reordena, rota y elimina páginas visualmente.", cat: "pdf", credits: 1, icon: Layers3, tag: "Rápido" },
  { name: "Proteger PDF", desc: "Agrega contraseña y reglas de acceso.", cat: "pdf", credits: 2, icon: Lock, tag: "Seguro" },
  { name: "Rotar PDF", desc: "Corrige orientación de páginas individuales o por lote.", cat: "pdf", credits: 1, icon: RotateCw, tag: "Básico" },
  { name: "PDF a Word", desc: "Convierte PDF a DOCX editable.", cat: "convert", credits: 1, icon: FileOutput, tag: "Popular" },
  { name: "Word a PDF", desc: "Crea PDF desde DOC o DOCX.", cat: "convert", credits: 1, icon: FileInput, tag: "Básico" },
  { name: "Excel a CSV", desc: "Extrae hojas y convierte datos tabulares.", cat: "convert", credits: 1, icon: Table, tag: "Datos" },
  { name: "Imagen a PDF", desc: "Convierte JPG, PNG, TIFF o WEBP a PDF.", cat: "convert", credits: 1, icon: Image, tag: "Básico" },
  { name: "ZIP Extract", desc: "Descomprime, revisa contenido y genera paquete limpio.", cat: "convert", credits: 1, icon: FileArchive, tag: "Archivo" },
  { name: "OCR de PDF", desc: "Convierte escaneos en texto seleccionable.", cat: "ocr", credits: 3, icon: ScanText, tag: "IA" },
  { name: "OCR por lotes", desc: "Procesa decenas de archivos al mismo tiempo.", cat: "ocr", credits: 5, icon: Cpu, tag: "Premium" },
  { name: "Extraer texto", desc: "Obtén TXT, JSON o DOCX desde imágenes y PDF.", cat: "ocr", credits: 2, icon: FileSearch, tag: "Rápido" },
  { name: "Clasificar documento", desc: "Detecta si es oficio, sentencia, acuerdo o anexo.", cat: "ai", credits: 10, icon: Tags, tag: "DocuCore" },
  { name: "Generar índice", desc: "Crea índice por páginas, documentos y secciones.", cat: "ai", credits: 15, icon: BookOpen, tag: "Avanzado" },
  { name: "Resumir documento", desc: "Resume contenido extenso con estructura clara.", cat: "ai", credits: 10, icon: MessageSquareText, tag: "IA" },
  { name: "Extraer datos", desc: "Nombres, fechas, autoridades, importes y folios.", cat: "ai", credits: 12, icon: Database, tag: "Datos" },
  { name: "Separar expediente", desc: "Detecta inicio y final de cada documento interno.", cat: "expedientes", credits: 20, icon: FolderKanban, tag: "Clave" },
  { name: "Detectar anexos", desc: "Reconoce anexos, pruebas, acuses y constancias.", cat: "expedientes", credits: 12, icon: FileSearch, tag: "Legal" },
  { name: "OCR + Índice", desc: "Flujo completo para expedientes escaneados.", cat: "workflow", credits: 18, icon: Workflow, tag: "Flujo" },
  { name: "Convertir + Comprimir", desc: "Convierte, optimiza y entrega un ZIP final.", cat: "workflow", credits: 4, icon: Wand2, tag: "Automático" },
  { name: "OCR + Extraer datos", desc: "Lee documentos y genera salida JSON estructurada.", cat: "workflow", credits: 18, icon: Sparkles, tag: "API Ready" },
];

const quickWorkflows = [
  { title: "Expediente judicial", steps: ["Subir PDF", "OCR", "Separar documentos", "Generar índice"], credits: 35 },
  { title: "Conversión limpia", steps: ["Subir archivo", "Convertir", "Comprimir", "Descargar ZIP"], credits: 4 },
  { title: "Extracción de datos", steps: ["OCR", "Clasificar", "Extraer campos", "Exportar JSON"], credits: 30 },
];

function ToolCard({ tool, onOpen }) {
  const Icon = tool.icon;
  return (
    <motion.button
      layout
      onClick={() => onOpen(tool)}
      whileHover={{ y: -4 }}
      className="group text-left rounded-3xl border border-slate-200 bg-white p-5 shadow-sm transition hover:border-red-200 hover:shadow-xl"
    >
      <div className="flex items-start justify-between gap-3">
        <div className="flex h-12 w-12 items-center justify-center rounded-2xl bg-gradient-to-br from-red-500 to-rose-600 text-white shadow-md shadow-red-100">
          <Icon className="h-6 w-6" />
        </div>
        <span className="rounded-full bg-slate-100 px-3 py-1 text-xs font-semibold text-slate-600">{tool.tag}</span>
      </div>
      <h3 className="mt-5 text-lg font-bold text-slate-900">{tool.name}</h3>
      <p className="mt-2 min-h-[44px] text-sm leading-6 text-slate-500">{tool.desc}</p>
      <div className="mt-5 flex items-center justify-between border-t border-slate-100 pt-4">
        <span className="flex items-center gap-1 text-sm font-semibold text-slate-700"><CreditCard className="h-4 w-4" /> {tool.credits} créditos</span>
        <span className="flex items-center gap-1 text-sm font-bold text-red-600">Usar <ChevronRight className="h-4 w-4" /></span>
      </div>
    </motion.button>
  );
}

export default function DocuCoreHomepageMockup() {
  const [active, setActive] = useState("all");
  const [selectedTool, setSelectedTool] = useState(null);
  const [showLogin, setShowLogin] = useState(false);
  const [credits, setCredits] = useState(20);

  const filteredTools = useMemo(() => {
    if (active === "all") return tools;
    return tools.filter((tool) => tool.cat === active);
  }, [active]);

  const consumeCredits = () => {
    if (!selectedTool) return;
    setCredits((prev) => Math.max(0, prev - selectedTool.credits));
    setSelectedTool(null);
  };

  return (
    <div className="min-h-screen bg-slate-50 text-slate-900">
      <header className="sticky top-0 z-40 border-b border-slate-200 bg-white/90 backdrop-blur-xl">
        <div className="mx-auto flex max-w-7xl items-center justify-between px-4 py-3 lg:px-6">
          <div className="flex items-center gap-3">
            <div className="flex h-11 w-11 items-center justify-center rounded-2xl bg-slate-950 text-white shadow-lg">
              <FileText className="h-6 w-6" />
            </div>
            <div>
              <div className="text-xl font-black tracking-tight">DocuCore</div>
              <div className="text-xs font-medium text-slate-500">Document Intelligence Platform</div>
            </div>
          </div>

          <nav className="hidden items-center gap-1 rounded-full bg-slate-100 p-1 lg:flex">
            {categories.slice(1).map((cat) => (
              <button key={cat.id} onClick={() => setActive(cat.id)} className={`rounded-full px-4 py-2 text-sm font-semibold transition ${active === cat.id ? "bg-white text-red-600 shadow-sm" : "text-slate-600 hover:text-slate-950"}`}>
                {cat.label}
              </button>
            ))}
          </nav>

          <div className="flex items-center gap-2">
            <div className="hidden items-center gap-2 rounded-full border border-slate-200 bg-white px-4 py-2 shadow-sm md:flex">
              <CreditCard className="h-4 w-4 text-red-600" />
              <span className="text-sm font-bold">{credits} créditos</span>
            </div>
            <button onClick={() => setShowLogin(true)} className="rounded-full border border-slate-200 bg-white px-4 py-2 text-sm font-bold shadow-sm hover:bg-slate-50">Iniciar sesión</button>
            <button className="hidden rounded-full bg-red-600 px-5 py-2 text-sm font-bold text-white shadow-lg shadow-red-100 hover:bg-red-700 md:block">Registrarse</button>
          </div>
        </div>
      </header>

      <main>
        <section className="relative overflow-hidden border-b border-slate-200 bg-white">
          <div className="absolute inset-0 bg-[radial-gradient(circle_at_top_left,rgba(239,68,68,.12),transparent_35%),radial-gradient(circle_at_bottom_right,rgba(15,23,42,.08),transparent_35%)]" />
          <div className="relative mx-auto grid max-w-7xl gap-10 px-4 py-12 lg:grid-cols-[1.05fr_.95fr] lg:px-6 lg:py-16">
            <div className="flex flex-col justify-center">
              <div className="mb-5 flex w-fit items-center gap-2 rounded-full border border-red-100 bg-red-50 px-4 py-2 text-sm font-bold text-red-700">
                <Sparkles className="h-4 w-4" /> Plataforma modular para documentos, OCR, IA y expedientes
              </div>
              <h1 className="max-w-3xl text-4xl font-black leading-tight tracking-tight md:text-6xl">
                Procesa, convierte, clasifica e indexa documentos sin salir de la misma pantalla.
              </h1>
              <p className="mt-6 max-w-2xl text-lg leading-8 text-slate-600">
                DocuCore concentra herramientas PDF, OCR, conversión, IA documental y flujos para expedientes en un solo panel. El usuario inicia sesión en modal, conserva su trabajo y solo se actualizan sus créditos.
              </p>
              <div className="mt-8 flex flex-col gap-3 sm:flex-row">
                <button className="flex items-center justify-center gap-2 rounded-2xl bg-red-600 px-6 py-4 text-base font-black text-white shadow-xl shadow-red-100 hover:bg-red-700">
                  <UploadCloud className="h-5 w-5" /> Subir archivo
                </button>
                <button onClick={() => setActive("all")} className="flex items-center justify-center gap-2 rounded-2xl border border-slate-200 bg-white px-6 py-4 text-base font-black shadow-sm hover:bg-slate-50">
                  <Grid3X3 className="h-5 w-5" /> Explorar panel
                </button>
              </div>

              <div className="mt-10 grid grid-cols-2 gap-3 md:grid-cols-4">
                {[
                  ["20", "créditos gratis"],
                  ["30+", "herramientas"],
                  ["API", "lista para integrar"],
                  ["OCR", "por página o lote"],
                ].map(([a, b]) => (
                  <div key={a} className="rounded-3xl border border-slate-200 bg-white p-4 shadow-sm">
                    <div className="text-2xl font-black text-slate-950">{a}</div>
                    <div className="text-sm font-medium text-slate-500">{b}</div>
                  </div>
                ))}
              </div>
            </div>

            <div className="rounded-[2rem] border border-slate-200 bg-slate-50 p-4 shadow-2xl shadow-slate-200">
              <div className="rounded-[1.5rem] bg-white p-4 shadow-sm">
                <div className="flex items-center justify-between border-b border-slate-100 pb-4">
                  <div>
                    <div className="text-sm font-bold text-slate-500">Panel activo</div>
                    <div className="text-xl font-black">Nuevo procesamiento</div>
                  </div>
                  <div className="rounded-full bg-emerald-50 px-3 py-1 text-xs font-black text-emerald-700">Sesión conservada</div>
                </div>
                <div className="mt-4 rounded-3xl border-2 border-dashed border-slate-200 bg-slate-50 p-8 text-center">
                  <UploadCloud className="mx-auto h-12 w-12 text-red-500" />
                  <h3 className="mt-4 text-lg font-black">Arrastra tus archivos aquí</h3>
                  <p className="mt-2 text-sm text-slate-500">PDF, DOCX, XLSX, XML, ZIP, JPG, PNG, TIFF</p>
                  <button className="mt-5 rounded-2xl bg-slate-950 px-5 py-3 text-sm font-bold text-white">Seleccionar archivos</button>
                </div>
                <div className="mt-4 grid gap-3 md:grid-cols-2">
                  <div className="rounded-3xl border border-slate-200 p-4">
                    <div className="flex items-center gap-2 font-black"><ShieldCheck className="h-5 w-5 text-emerald-600" /> Seguro</div>
                    <p className="mt-2 text-sm text-slate-500">Hash, auditoría y eliminación programada.</p>
                  </div>
                  <div className="rounded-3xl border border-slate-200 p-4">
                    <div className="flex items-center gap-2 font-black"><History className="h-5 w-5 text-blue-600" /> Historial</div>
                    <p className="mt-2 text-sm text-slate-500">Regresa al último flujo sin perder archivos.</p>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </section>

        <section className="mx-auto max-w-7xl px-4 py-10 lg:px-6">
          <div className="grid gap-6 lg:grid-cols-[290px_1fr_320px]">
            <aside className="hidden lg:block">
              <div className="sticky top-24 rounded-[2rem] border border-slate-200 bg-white p-4 shadow-sm">
                <h2 className="px-2 text-lg font-black">Panel de herramientas</h2>
                <p className="px-2 pt-1 text-sm text-slate-500">El usuario cambia de herramienta sin cambiar de pantalla.</p>
                <div className="mt-5 space-y-2">
                  {categories.map((cat) => {
                    const Icon = cat.icon;
                    return (
                      <button key={cat.id} onClick={() => setActive(cat.id)} className={`flex w-full items-center gap-3 rounded-2xl px-4 py-3 text-left text-sm font-bold transition ${active === cat.id ? "bg-red-600 text-white shadow-lg shadow-red-100" : "text-slate-600 hover:bg-slate-100 hover:text-slate-950"}`}>
                        <Icon className="h-5 w-5" /> {cat.label}
                      </button>
                    );
                  })}
                </div>
                <div className="mt-6 rounded-3xl bg-slate-950 p-5 text-white">
                  <div className="flex items-center gap-2 text-sm font-bold text-slate-300"><BadgeCheck className="h-4 w-4" /> Plan actual</div>
                  <div className="mt-2 text-3xl font-black">Gratis</div>
                  <div className="mt-1 text-sm text-slate-300">{credits} créditos disponibles</div>
                  <button className="mt-4 w-full rounded-2xl bg-white px-4 py-3 text-sm font-black text-slate-950">Mejorar plan</button>
                </div>
              </div>
            </aside>

            <section>
              <div className="mb-6 flex flex-col gap-4 md:flex-row md:items-center md:justify-between">
                <div>
                  <h2 className="text-3xl font-black">Herramientas disponibles</h2>
                  <p className="mt-1 text-slate-500">PDF, OCR, conversión, IA, expedientes y procesos automáticos.</p>
                </div>
                <div className="flex items-center gap-2 rounded-2xl border border-slate-200 bg-white px-4 py-3 shadow-sm">
                  <Search className="h-5 w-5 text-slate-400" />
                  <input className="w-full bg-transparent text-sm outline-none" placeholder="Buscar herramienta..." />
                </div>
              </div>

              <div className="mb-6 flex gap-2 overflow-x-auto pb-2 lg:hidden">
                {categories.map((cat) => {
                  const Icon = cat.icon;
                  return <button key={cat.id} onClick={() => setActive(cat.id)} className={`flex shrink-0 items-center gap-2 rounded-full px-4 py-2 text-sm font-bold ${active === cat.id ? "bg-red-600 text-white" : "bg-white text-slate-600"}`}><Icon className="h-4 w-4" /> {cat.label}</button>;
                })}
              </div>

              <motion.div layout className="grid gap-4 md:grid-cols-2 xl:grid-cols-3">
                {filteredTools.map((tool) => <ToolCard key={tool.name} tool={tool} onOpen={setSelectedTool} />)}
              </motion.div>
            </section>

            <aside className="space-y-6">
              <div className="rounded-[2rem] border border-slate-200 bg-white p-5 shadow-sm">
                <div className="flex items-center justify-between">
                  <h3 className="text-lg font-black">Procesos sugeridos</h3>
                  <Plus className="h-5 w-5 text-red-600" />
                </div>
                <div className="mt-4 space-y-3">
                  {quickWorkflows.map((flow) => (
                    <button key={flow.title} className="w-full rounded-3xl border border-slate-200 p-4 text-left transition hover:border-red-200 hover:bg-red-50/30">
                      <div className="flex items-center justify-between gap-2">
                        <div className="font-black">{flow.title}</div>
                        <span className="rounded-full bg-slate-100 px-2 py-1 text-xs font-bold">{flow.credits} cr.</span>
                      </div>
                      <div className="mt-3 flex flex-wrap gap-2">
                        {flow.steps.map((step) => <span key={step} className="rounded-full bg-slate-100 px-2 py-1 text-xs font-semibold text-slate-600">{step}</span>)}
                      </div>
                    </button>
                  ))}
                </div>
              </div>

              <div className="rounded-[2rem] border border-slate-200 bg-white p-5 shadow-sm">
                <h3 className="text-lg font-black">Actividad reciente</h3>
                <div className="mt-4 space-y-4">
                  {[
                    ["Sentencia_ocr.pdf", "OCR completado", "Hace 2 min"],
                    ["Expediente.zip", "Índice generado", "Hace 18 min"],
                    ["Oficio.docx", "Convertido a PDF", "Ayer"],
                  ].map(([file, action, time]) => (
                    <div key={file} className="flex gap-3">
                      <div className="mt-1 flex h-9 w-9 shrink-0 items-center justify-center rounded-2xl bg-slate-100"><FileText className="h-4 w-4" /></div>
                      <div className="min-w-0">
                        <div className="truncate text-sm font-black">{file}</div>
                        <div className="text-xs text-slate-500">{action} · {time}</div>
                      </div>
                    </div>
                  ))}
                </div>
              </div>
            </aside>
          </div>
        </section>

        <section className="border-y border-slate-200 bg-white">
          <div className="mx-auto max-w-7xl px-4 py-14 lg:px-6">
            <div className="mx-auto max-w-3xl text-center">
              <h2 className="text-3xl font-black md:text-4xl">Una plataforma, dos formas de trabajo</h2>
              <p className="mt-4 text-lg text-slate-600">Herramientas rápidas para usuarios comunes y procesos avanzados para empresas, expedientes y APIs.</p>
            </div>
            <div className="mt-10 grid gap-5 md:grid-cols-3">
              {[
                { icon: Eye, title: "Sin cambiar de pantalla", text: "Las herramientas se abren en paneles y modales. La sesión no rompe el flujo del usuario." },
                { icon: CreditCard, title: "Créditos visibles", text: "Cada operación muestra costo antes de ejecutarse y actualiza el saldo al finalizar." },
                { icon: KeyRound, title: "Preparado para API", text: "Los mismos procesos pueden ejecutarse desde interfaz web, API o integraciones externas." },
              ].map((item) => {
                const Icon = item.icon;
                return (
                  <div key={item.title} className="rounded-[2rem] border border-slate-200 bg-slate-50 p-6">
                    <div className="flex h-12 w-12 items-center justify-center rounded-2xl bg-slate-950 text-white"><Icon className="h-6 w-6" /></div>
                    <h3 className="mt-5 text-xl font-black">{item.title}</h3>
                    <p className="mt-3 leading-7 text-slate-600">{item.text}</p>
                  </div>
                );
              })}
            </div>
          </div>
        </section>
      </main>

      <nav className="fixed bottom-0 left-0 right-0 z-50 border-t border-slate-200 bg-white/95 px-3 py-2 backdrop-blur-xl lg:hidden">
        <div className="grid grid-cols-5 gap-1 text-xs font-bold text-slate-500">
          {[
            [Home, "Inicio"],
            [Grid3X3, "Tools"],
            [UploadCloud, "Subir"],
            [FolderOpen, "Archivos"],
            [User, "Cuenta"],
          ].map(([Icon, label]) => (
            <button key={label} className="flex flex-col items-center gap-1 rounded-2xl px-2 py-2 hover:bg-slate-100">
              <Icon className="h-5 w-5" /> {label}
            </button>
          ))}
        </div>
      </nav>

      {selectedTool && (
        <div className="fixed inset-0 z-[60] flex items-end justify-center bg-slate-950/40 p-4 backdrop-blur-sm md:items-center">
          <motion.div initial={{ y: 40, opacity: 0 }} animate={{ y: 0, opacity: 1 }} className="w-full max-w-2xl rounded-[2rem] bg-white p-6 shadow-2xl">
            <div className="flex items-start justify-between gap-4">
              <div>
                <div className="text-sm font-bold text-red-600">Herramienta seleccionada</div>
                <h2 className="mt-1 text-3xl font-black">{selectedTool.name}</h2>
                <p className="mt-2 text-slate-600">{selectedTool.desc}</p>
              </div>
              <button onClick={() => setSelectedTool(null)} className="rounded-full bg-slate-100 p-2 hover:bg-slate-200"><X className="h-5 w-5" /></button>
            </div>
            <div className="mt-6 rounded-3xl border-2 border-dashed border-slate-200 bg-slate-50 p-8 text-center">
              <UploadCloud className="mx-auto h-10 w-10 text-red-500" />
              <div className="mt-3 font-black">Sube el archivo para continuar</div>
              <div className="mt-1 text-sm text-slate-500">Costo estimado: {selectedTool.credits} créditos</div>
            </div>
            <div className="mt-6 flex flex-col gap-3 sm:flex-row sm:justify-between">
              <button onClick={() => setShowLogin(true)} className="rounded-2xl border border-slate-200 px-5 py-3 font-black hover:bg-slate-50">Iniciar sesión sin salir</button>
              <button onClick={consumeCredits} className="flex items-center justify-center gap-2 rounded-2xl bg-red-600 px-5 py-3 font-black text-white hover:bg-red-700"><PlayCircle className="h-5 w-5" /> Ejecutar y descontar créditos</button>
            </div>
          </motion.div>
        </div>
      )}

      {showLogin && (
        <div className="fixed inset-0 z-[70] flex items-center justify-center bg-slate-950/40 p-4 backdrop-blur-sm">
          <motion.div initial={{ scale: .96, opacity: 0 }} animate={{ scale: 1, opacity: 1 }} className="w-full max-w-md rounded-[2rem] bg-white p-6 shadow-2xl">
            <div className="flex items-center justify-between">
              <h2 className="text-2xl font-black">Iniciar sesión</h2>
              <button onClick={() => setShowLogin(false)} className="rounded-full bg-slate-100 p-2 hover:bg-slate-200"><X className="h-5 w-5" /></button>
            </div>
            <p className="mt-2 text-sm text-slate-500">El usuario permanece en la misma herramienta y conserva sus archivos.</p>
            <div className="mt-6 space-y-3">
              <input className="w-full rounded-2xl border border-slate-200 px-4 py-3 outline-none focus:border-red-300" placeholder="Correo electrónico" />
              <input className="w-full rounded-2xl border border-slate-200 px-4 py-3 outline-none focus:border-red-300" placeholder="Contraseña" type="password" />
              <button onClick={() => setShowLogin(false)} className="w-full rounded-2xl bg-slate-950 px-4 py-3 font-black text-white">Entrar y regresar al panel</button>
            </div>
          </motion.div>
        </div>
      )}
    </div>
  );
}
