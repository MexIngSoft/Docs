import React, { useMemo, useState } from "react";
import { motion } from "framer-motion";
import {
  FileText,
  UploadCloud,
  Search,
  ShieldCheck,
  History,
  Sparkles,
  Scissors,
  Merge,
  Lock,
  RotateCw,
  Image,
  Table,
  FileArchive,
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
  User,
  Eye,
  Download,
  PlayCircle,
  Cpu,
  BookOpen,
  ScanText,
  Tags,
  MessageSquareText,
  FileSearch,
  X,
  Brain,
  Workflow,
  FolderKanban,
  Wand2,
  FileOutput,
  PanelRightOpen,
  Activity,
  Gauge,
  Archive,
  KeyRound,
  Cloud,
  Layers3,
  SplitSquareHorizontal,
  FileCheck2,
} from "lucide-react";

const uploadedFile = {
  name: "expediente_judicial_245_paginas.pdf",
  type: "PDF escaneado",
  pages: 245,
  size: "80.4 MB",
  status: "Analizado",
  confidence: "94%",
};

const recommendedTools = [
  {
    name: "OCR completo",
    reason: "El PDF parece escaneado y necesita texto seleccionable.",
    credits: 18,
    icon: ScanText,
    level: "Recomendado",
  },
  {
    name: "Separar expediente",
    reason: "Detecta oficios, acuerdos, anexos y sentencias dentro del archivo.",
    credits: 25,
    icon: SplitSquareHorizontal,
    level: "Clave",
  },
  {
    name: "Generar índice",
    reason: "Crea índice por páginas y documentos internos.",
    credits: 15,
    icon: BookOpen,
    level: "Avanzado",
  },
  {
    name: "Comprimir PDF",
    reason: "El archivo pesa 80.4 MB; conviene reducirlo antes de compartir.",
    credits: 3,
    icon: Zap,
    level: "Rápido",
  },
];

const allTools = [
  { name: "Unir PDF", cat: "PDF", icon: Merge, credits: 1 },
  { name: "Dividir PDF", cat: "PDF", icon: Scissors, credits: 1 },
  { name: "Rotar páginas", cat: "PDF", icon: RotateCw, credits: 1 },
  { name: "Proteger PDF", cat: "Seguridad", icon: Lock, credits: 2 },
  { name: "PDF a Word", cat: "Conversión", icon: FileOutput, credits: 2 },
  { name: "Imagen a PDF", cat: "Conversión", icon: Image, credits: 1 },
  { name: "Excel a CSV", cat: "Datos", icon: Table, credits: 1 },
  { name: "ZIP Extract", cat: "Archivos", icon: FileArchive, credits: 1 },
  { name: "Extraer datos", cat: "IA", icon: Database, credits: 12 },
  { name: "Resumir documento", cat: "IA", icon: MessageSquareText, credits: 10 },
  { name: "Clasificar", cat: "IA", icon: Tags, credits: 10 },
  { name: "Validar PDF/A", cat: "Archivo", icon: FileCheck2, credits: 4 },
];

const workflowSteps = [
  { title: "Subir", desc: "Archivo recibido", done: true },
  { title: "Detectar", desc: "Tipo y estructura", done: true },
  { title: "Recomendar", desc: "Herramientas útiles", done: true },
  { title: "Procesar", desc: "Pendiente", done: false },
  { title: "Exportar", desc: "PDF, ZIP, JSON", done: false },
];

function RecommendedCard({ tool, onOpen }) {
  const Icon = tool.icon;
  return (
    <motion.button
      whileHover={{ y: -3 }}
      onClick={() => onOpen(tool)}
      className="group rounded-3xl border border-slate-200 bg-white p-5 text-left shadow-sm transition hover:border-blue-200 hover:shadow-xl"
    >
      <div className="flex items-start justify-between gap-3">
        <div className="flex h-12 w-12 items-center justify-center rounded-2xl bg-blue-600 text-white shadow-lg shadow-blue-100">
          <Icon className="h-6 w-6" />
        </div>
        <span className="rounded-full bg-blue-50 px-3 py-1 text-xs font-black text-blue-700">{tool.level}</span>
      </div>
      <h3 className="mt-5 text-lg font-black text-slate-950">{tool.name}</h3>
      <p className="mt-2 min-h-[48px] text-sm leading-6 text-slate-500">{tool.reason}</p>
      <div className="mt-5 flex items-center justify-between border-t border-slate-100 pt-4">
        <span className="flex items-center gap-1 text-sm font-black text-slate-700"><CreditCard className="h-4 w-4" /> {tool.credits} créditos</span>
        <span className="flex items-center gap-1 text-sm font-black text-blue-700">Ejecutar <ChevronRight className="h-4 w-4" /></span>
      </div>
    </motion.button>
  );
}

function ToolMini({ tool, onOpen }) {
  const Icon = tool.icon;
  return (
    <button onClick={() => onOpen(tool)} className="flex items-center justify-between gap-3 rounded-2xl border border-slate-200 bg-white p-4 text-left shadow-sm transition hover:border-blue-200 hover:bg-blue-50/30">
      <div className="flex items-center gap-3">
        <div className="flex h-10 w-10 items-center justify-center rounded-xl bg-slate-100 text-slate-700">
          <Icon className="h-5 w-5" />
        </div>
        <div>
          <div className="text-sm font-black text-slate-900">{tool.name}</div>
          <div className="text-xs font-semibold text-slate-500">{tool.cat} · {tool.credits} créditos</div>
        </div>
      </div>
      <ChevronRight className="h-4 w-4 text-slate-400" />
    </button>
  );
}

export default function DocuCoreWorkspace() {
  const [selectedTool, setSelectedTool] = useState(null);
  const [showLogin, setShowLogin] = useState(false);
  const [credits, setCredits] = useState(42);
  const [fileLoaded, setFileLoaded] = useState(true);

  const consumeCredits = () => {
    if (!selectedTool) return;
    setCredits((prev) => Math.max(0, prev - selectedTool.credits));
    setSelectedTool(null);
  };

  return (
    <div className="min-h-screen bg-[#f5f7fb] text-slate-900">
      <header className="sticky top-0 z-40 border-b border-slate-200 bg-white/90 backdrop-blur-xl">
        <div className="mx-auto flex max-w-[1500px] items-center justify-between px-4 py-3 lg:px-6">
          <div className="flex items-center gap-3">
            <div className="flex h-11 w-11 items-center justify-center rounded-2xl bg-blue-700 text-white shadow-lg shadow-blue-100">
              <FileText className="h-6 w-6" />
            </div>
            <div>
              <div className="text-xl font-black tracking-tight">DocuCore</div>
              <div className="text-xs font-semibold text-slate-500">Centro de trabajo documental</div>
            </div>
          </div>

          <nav className="hidden items-center gap-2 rounded-full bg-slate-100 p-1 lg:flex">
            {[
              [Home, "Inicio"],
              [PanelRightOpen, "Workspace"],
              [Workflow, "Procesos"],
              [KeyRound, "API"],
              [Settings, "Admin"],
            ].map(([Icon, label]) => (
              <button key={label} className={`flex items-center gap-2 rounded-full px-4 py-2 text-sm font-black ${label === "Workspace" ? "bg-white text-blue-700 shadow-sm" : "text-slate-600 hover:text-slate-950"}`}>
                <Icon className="h-4 w-4" /> {label}
              </button>
            ))}
          </nav>

          <div className="flex items-center gap-2">
            <button className="hidden rounded-full border border-slate-200 bg-white p-2 shadow-sm md:block"><Bell className="h-5 w-5 text-slate-600" /></button>
            <div className="flex items-center gap-2 rounded-full border border-slate-200 bg-white px-4 py-2 shadow-sm">
              <CreditCard className="h-4 w-4 text-blue-700" />
              <span className="text-sm font-black">{credits} créditos</span>
            </div>
            <button onClick={() => setShowLogin(true)} className="rounded-full bg-slate-950 px-4 py-2 text-sm font-black text-white shadow-sm">Entrar</button>
          </div>
        </div>
      </header>

      <main className="mx-auto grid max-w-[1500px] gap-5 px-4 py-5 pb-24 lg:grid-cols-[280px_1fr_360px] lg:px-6">
        <aside className="hidden lg:block">
          <div className="sticky top-24 space-y-5">
            <section className="rounded-[2rem] border border-slate-200 bg-white p-5 shadow-sm">
              <div className="flex items-center justify-between">
                <h2 className="text-lg font-black">Documentos</h2>
                <button className="rounded-xl bg-blue-50 p-2 text-blue-700"><UploadCloud className="h-5 w-5" /></button>
              </div>
              <button onClick={() => setFileLoaded(true)} className="mt-5 w-full rounded-3xl border border-blue-200 bg-blue-50 p-4 text-left">
                <div className="flex gap-3">
                  <div className="flex h-11 w-11 shrink-0 items-center justify-center rounded-2xl bg-blue-700 text-white"><FileText className="h-5 w-5" /></div>
                  <div className="min-w-0">
                    <div className="truncate text-sm font-black text-slate-950">{uploadedFile.name}</div>
                    <div className="mt-1 text-xs font-semibold text-blue-700">Activo · {uploadedFile.pages} páginas</div>
                  </div>
                </div>
              </button>
              <div className="mt-4 space-y-2">
                {["contrato_servicios.docx", "facturas_mayo.zip", "tabla_datos.xlsx"].map((name) => (
                  <button key={name} className="flex w-full items-center gap-3 rounded-2xl px-3 py-2 text-left hover:bg-slate-50">
                    <FileText className="h-4 w-4 text-slate-400" />
                    <span className="truncate text-sm font-semibold text-slate-600">{name}</span>
                  </button>
                ))}
              </div>
            </section>

            <section className="rounded-[2rem] border border-slate-200 bg-white p-5 shadow-sm">
              <h2 className="text-lg font-black">Caja de herramientas</h2>
              <p className="mt-1 text-sm leading-6 text-slate-500">No es catálogo suelto: cambia según el documento activo.</p>
              <div className="mt-5 grid gap-2">
                {[
                  [ScanText, "OCR"],
                  [FileOutput, "Convertir"],
                  [Brain, "IA"],
                  [FolderKanban, "Expedientes"],
                  [ShieldCheck, "Seguridad"],
                  [Archive, "Archivos"],
                ].map(([Icon, label]) => (
                  <button key={label} className="flex items-center gap-3 rounded-2xl px-4 py-3 text-sm font-black text-slate-600 hover:bg-slate-100 hover:text-slate-950">
                    <Icon className="h-5 w-5" /> {label}
                  </button>
                ))}
              </div>
            </section>
          </div>
        </aside>

        <section className="space-y-5">
          <section className="overflow-hidden rounded-[2rem] border border-slate-200 bg-white shadow-sm">
            <div className="border-b border-slate-100 bg-gradient-to-r from-slate-950 via-blue-950 to-blue-700 p-6 text-white md:p-8">
              <div className="flex flex-col gap-6 md:flex-row md:items-center md:justify-between">
                <div>
                  <div className="flex w-fit items-center gap-2 rounded-full bg-white/10 px-4 py-2 text-sm font-black backdrop-blur">
                    <Sparkles className="h-4 w-4" /> Workspace inteligente
                  </div>
                  <h1 className="mt-5 max-w-3xl text-3xl font-black leading-tight md:text-5xl">
                    Sube un documento y DocuCore te muestra exactamente qué herramientas te sirven.
                  </h1>
                  <p className="mt-4 max-w-2xl text-base leading-7 text-blue-50">
                    La página no cambia de pantalla: el archivo, las recomendaciones, los créditos, el historial y los resultados permanecen en el mismo centro de trabajo.
                  </p>
                </div>
                <div className="rounded-3xl bg-white/10 p-4 backdrop-blur md:w-72">
                  <div className="text-sm font-bold text-blue-100">Saldo disponible</div>
                  <div className="mt-1 text-4xl font-black">{credits}</div>
                  <div className="mt-1 text-sm text-blue-100">créditos para procesar</div>
                  <button className="mt-4 w-full rounded-2xl bg-white px-4 py-3 text-sm font-black text-blue-800">Comprar créditos</button>
                </div>
              </div>
            </div>

            {!fileLoaded ? (
              <div className="p-6 md:p-8">
                <div className="rounded-[2rem] border-2 border-dashed border-slate-200 bg-slate-50 p-12 text-center">
                  <UploadCloud className="mx-auto h-14 w-14 text-blue-700" />
                  <h2 className="mt-5 text-2xl font-black">Sube el primer documento</h2>
                  <p className="mt-2 text-slate-500">PDF, DOCX, XLSX, XML, ZIP, JPG, PNG, TIFF o WEBP.</p>
                  <button onClick={() => setFileLoaded(true)} className="mt-6 rounded-2xl bg-blue-700 px-6 py-4 font-black text-white shadow-lg shadow-blue-100">Simular carga de documento</button>
                </div>
              </div>
            ) : (
              <div className="grid gap-5 p-5 md:p-6 xl:grid-cols-[1fr_320px]">
                <div className="rounded-[1.75rem] border border-slate-200 bg-slate-50 p-5">
                  <div className="flex flex-col gap-5 md:flex-row md:items-center md:justify-between">
                    <div className="flex gap-4">
                      <div className="flex h-16 w-16 shrink-0 items-center justify-center rounded-3xl bg-white text-blue-700 shadow-sm"><FileText className="h-8 w-8" /></div>
                      <div className="min-w-0">
                        <div className="flex flex-wrap items-center gap-2">
                          <h2 className="truncate text-2xl font-black">{uploadedFile.name}</h2>
                          <span className="rounded-full bg-emerald-50 px-3 py-1 text-xs font-black text-emerald-700">{uploadedFile.status}</span>
                        </div>
                        <div className="mt-2 flex flex-wrap gap-2 text-sm font-semibold text-slate-500">
                          <span>{uploadedFile.type}</span>
                          <span>·</span>
                          <span>{uploadedFile.pages} páginas</span>
                          <span>·</span>
                          <span>{uploadedFile.size}</span>
                          <span>·</span>
                          <span>Confianza {uploadedFile.confidence}</span>
                        </div>
                      </div>
                    </div>
                    <div className="flex gap-2">
                      <button className="rounded-2xl border border-slate-200 bg-white px-4 py-3 text-sm font-black shadow-sm"><Eye className="inline h-4 w-4" /> Vista</button>
                      <button className="rounded-2xl border border-slate-200 bg-white px-4 py-3 text-sm font-black shadow-sm"><Download className="inline h-4 w-4" /> Descargar</button>
                    </div>
                  </div>

                  <div className="mt-6 grid gap-3 md:grid-cols-5">
                    {workflowSteps.map((step, index) => (
                      <div key={step.title} className={`rounded-3xl border p-4 ${step.done ? "border-emerald-100 bg-white" : "border-slate-200 bg-white/70"}`}>
                        <div className="flex items-center justify-between">
                          <span className="text-xs font-black text-slate-400">0{index + 1}</span>
                          {step.done ? <CheckCircle2 className="h-5 w-5 text-emerald-600" /> : <Clock3 className="h-5 w-5 text-slate-300" />}
                        </div>
                        <div className="mt-3 font-black">{step.title}</div>
                        <div className="mt-1 text-xs font-semibold text-slate-500">{step.desc}</div>
                      </div>
                    ))}
                  </div>
                </div>

                <div className="rounded-[1.75rem] border border-slate-200 bg-white p-5 shadow-sm">
                  <h3 className="text-lg font-black">Diagnóstico</h3>
                  <div className="mt-4 space-y-4">
                    {[
                      [Gauge, "Calidad de escaneo", "Media"],
                      [Activity, "Texto detectado", "Bajo"],
                      [Layers3, "Estructura", "Múltiples documentos"],
                      [Cloud, "Salida recomendada", "PDF OCR + ZIP"],
                    ].map(([Icon, label, value]) => (
                      <div key={label} className="flex items-center justify-between gap-3 rounded-2xl bg-slate-50 p-3">
                        <div className="flex items-center gap-3">
                          <Icon className="h-5 w-5 text-blue-700" />
                          <span className="text-sm font-bold text-slate-600">{label}</span>
                        </div>
                        <span className="text-sm font-black">{value}</span>
                      </div>
                    ))}
                  </div>
                </div>
              </div>
            )}
          </section>

          {fileLoaded && (
            <section className="rounded-[2rem] border border-slate-200 bg-white p-5 shadow-sm md:p-6">
              <div className="mb-5 flex flex-col gap-4 md:flex-row md:items-center md:justify-between">
                <div>
                  <h2 className="text-2xl font-black">Herramientas recomendadas para este documento</h2>
                  <p className="mt-1 text-slate-500">DocuCore no muestra todo primero; prioriza lo que realmente ayuda al archivo subido.</p>
                </div>
                <button className="rounded-2xl border border-slate-200 bg-white px-4 py-3 text-sm font-black shadow-sm"><Wand2 className="inline h-4 w-4" /> Crear flujo automático</button>
              </div>
              <div className="grid gap-4 md:grid-cols-2 xl:grid-cols-4">
                {recommendedTools.map((tool) => <RecommendedCard key={tool.name} tool={tool} onOpen={setSelectedTool} />)}
              </div>
            </section>
          )}

          <section className="rounded-[2rem] border border-slate-200 bg-white p-5 shadow-sm md:p-6">
            <div className="mb-5 flex flex-col gap-4 md:flex-row md:items-center md:justify-between">
              <div>
                <h2 className="text-2xl font-black">Todas las herramientas</h2>
                <p className="mt-1 text-slate-500">Disponibles sin cambiar de pantalla.</p>
              </div>
              <div className="flex items-center gap-2 rounded-2xl border border-slate-200 bg-white px-4 py-3 shadow-sm">
                <Search className="h-5 w-5 text-slate-400" />
                <input className="w-full bg-transparent text-sm outline-none" placeholder="Buscar herramienta..." />
              </div>
            </div>
            <div className="grid gap-3 md:grid-cols-2 xl:grid-cols-3">
              {allTools.map((tool) => <ToolMini key={tool.name} tool={tool} onOpen={setSelectedTool} />)}
            </div>
          </section>
        </section>

        <aside className="space-y-5">
          <section className="rounded-[2rem] border border-slate-200 bg-white p-5 shadow-sm">
            <h2 className="text-lg font-black">Resultado esperado</h2>
            <div className="mt-4 space-y-3">
              {[
                "PDF con OCR seleccionable",
                "Índice por rangos de páginas",
                "ZIP con documentos separados",
                "JSON con metadatos extraídos",
              ].map((item) => (
                <div key={item} className="flex items-center gap-3 rounded-2xl bg-slate-50 p-3">
                  <CheckCircle2 className="h-5 w-5 text-emerald-600" />
                  <span className="text-sm font-bold text-slate-700">{item}</span>
                </div>
              ))}
            </div>
          </section>

          <section className="rounded-[2rem] border border-slate-200 bg-white p-5 shadow-sm">
            <h2 className="text-lg font-black">Cola de procesos</h2>
            <div className="mt-4 space-y-4">
              {[
                ["OCR completo", "Listo para iniciar", "18 cr."],
                ["Separar expediente", "Sugerido", "25 cr."],
                ["Generar índice", "Opcional", "15 cr."],
              ].map(([title, status, cost]) => (
                <div key={title} className="rounded-3xl border border-slate-200 p-4">
                  <div className="flex items-center justify-between gap-3">
                    <div className="font-black">{title}</div>
                    <span className="rounded-full bg-slate-100 px-2 py-1 text-xs font-black">{cost}</span>
                  </div>
                  <div className="mt-2 text-sm font-semibold text-slate-500">{status}</div>
                </div>
              ))}
            </div>
            <button className="mt-5 flex w-full items-center justify-center gap-2 rounded-2xl bg-blue-700 px-4 py-3 font-black text-white shadow-lg shadow-blue-100"><PlayCircle className="h-5 w-5" /> Ejecutar flujo</button>
          </section>

          <section className="rounded-[2rem] border border-slate-200 bg-white p-5 shadow-sm">
            <h2 className="text-lg font-black">Actividad</h2>
            <div className="mt-4 space-y-4">
              {[
                ["Archivo analizado", "Hace 8 segundos"],
                ["Recomendaciones creadas", "Hace 6 segundos"],
                ["Créditos verificados", "Hace 4 segundos"],
              ].map(([event, time]) => (
                <div key={event} className="flex gap-3">
                  <div className="mt-1 h-2 w-2 rounded-full bg-blue-700" />
                  <div>
                    <div className="text-sm font-black">{event}</div>
                    <div className="text-xs font-semibold text-slate-500">{time}</div>
                  </div>
                </div>
              ))}
            </div>
          </section>
        </aside>
      </main>

      <nav className="fixed bottom-0 left-0 right-0 z-50 border-t border-slate-200 bg-white/95 px-3 py-2 backdrop-blur-xl lg:hidden">
        <div className="grid grid-cols-5 gap-1 text-xs font-bold text-slate-500">
          {[
            [Home, "Inicio"],
            [PanelRightOpen, "Panel"],
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
                <div className="text-sm font-black text-blue-700">Herramienta sobre documento activo</div>
                <h2 className="mt-1 text-3xl font-black">{selectedTool.name}</h2>
                <p className="mt-2 text-slate-600">Se ejecutará sobre: {uploadedFile.name}</p>
              </div>
              <button onClick={() => setSelectedTool(null)} className="rounded-full bg-slate-100 p-2 hover:bg-slate-200"><X className="h-5 w-5" /></button>
            </div>
            <div className="mt-6 rounded-3xl border border-slate-200 bg-slate-50 p-5">
              <div className="flex items-center justify-between gap-4">
                <div>
                  <div className="text-sm font-bold text-slate-500">Costo de ejecución</div>
                  <div className="mt-1 text-3xl font-black">{selectedTool.credits} créditos</div>
                </div>
                <div className="text-right">
                  <div className="text-sm font-bold text-slate-500">Saldo después</div>
                  <div className="mt-1 text-3xl font-black text-blue-700">{Math.max(0, credits - selectedTool.credits)}</div>
                </div>
              </div>
            </div>
            <div className="mt-6 flex flex-col gap-3 sm:flex-row sm:justify-between">
              <button onClick={() => setShowLogin(true)} className="rounded-2xl border border-slate-200 px-5 py-3 font-black hover:bg-slate-50">Iniciar sesión sin salir</button>
              <button onClick={consumeCredits} className="flex items-center justify-center gap-2 rounded-2xl bg-blue-700 px-5 py-3 font-black text-white hover:bg-blue-800"><PlayCircle className="h-5 w-5" /> Ejecutar proceso</button>
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
            <p className="mt-2 text-sm text-slate-500">El usuario no pierde el documento, la herramienta ni el flujo activo.</p>
            <div className="mt-6 space-y-3">
              <input className="w-full rounded-2xl border border-slate-200 px-4 py-3 outline-none focus:border-blue-300" placeholder="Correo electrónico" />
              <input className="w-full rounded-2xl border border-slate-200 px-4 py-3 outline-none focus:border-blue-300" placeholder="Contraseña" type="password" />
              <button onClick={() => setShowLogin(false)} className="w-full rounded-2xl bg-slate-950 px-4 py-3 font-black text-white">Entrar y volver al workspace</button>
            </div>
          </motion.div>
        </div>
      )}
    </div>
  );
}


Listo, ya te la maqueté como **workspace empresarial**, no como copia de PDF2Go/iLovePDF.

Ahora la idea visual es:

**Documento activo → diagnóstico → herramientas recomendadas → créditos → ejecución sin cambiar de pantalla.**
