Listo. Te dejé en código las pantallas faltantes con selector:
import React, { useState } from "react";
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
  Building2,
  Scale,
  Landmark,
  GraduationCap,
  Code2,
  Copy,
  BarChart3,
  ReceiptText,
  FileJson,
  FileArchiveIcon,
  Plus,
  ArrowRight,
  LayoutDashboard,
} from "lucide-react";

const screens = [
  { id: "home", label: "Home" },
  { id: "seo", label: "Landing SEO" },
  { id: "workspace", label: "Workspace vacío" },
  { id: "uploaded", label: "Documento subido" },
  { id: "result", label: "Resultado" },
  { id: "casefile", label: "Expediente" },
  { id: "api", label: "API" },
];

const uploadedFile = {
  name: "expediente_judicial_245_paginas.pdf",
  type: "PDF escaneado",
  pages: 245,
  size: "80.4 MB",
  status: "Analizado",
  confidence: "94%",
};

const recommendedTools = [
  { name: "OCR completo", reason: "Convierte el escaneo en texto seleccionable.", credits: 18, icon: ScanText, level: "Recomendado" },
  { name: "Separar expediente", reason: "Detecta oficios, acuerdos, anexos y sentencias.", credits: 25, icon: SplitSquareHorizontal, level: "Clave" },
  { name: "Generar índice", reason: "Crea índice por páginas y documentos internos.", credits: 15, icon: BookOpen, level: "Avanzado" },
  { name: "Comprimir PDF", reason: "Reduce el peso antes de compartir.", credits: 3, icon: Zap, level: "Rápido" },
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

const caseDocs = [
  { title: "Oficio de remisión", type: "Oficio", pages: "1-12", confidence: "96%" },
  { title: "Acuerdo inicial", type: "Acuerdo", pages: "13-20", confidence: "93%" },
  { title: "Notificación", type: "Notificación", pages: "21-28", confidence: "91%" },
  { title: "Sentencia", type: "Sentencia", pages: "29-74", confidence: "97%" },
  { title: "Anexo fotográfico", type: "Anexo", pages: "75-118", confidence: "89%" },
  { title: "Dictamen pericial", type: "Peritaje", pages: "119-168", confidence: "92%" },
];

function Shell({ activeScreen, setActiveScreen, children }) {
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

          <nav className="hidden items-center gap-1 rounded-full bg-slate-100 p-1 xl:flex">
            {screens.map((screen) => (
              <button
                key={screen.id}
                onClick={() => setActiveScreen(screen.id)}
                className={`rounded-full px-4 py-2 text-sm font-black transition ${activeScreen === screen.id ? "bg-white text-blue-700 shadow-sm" : "text-slate-600 hover:text-slate-950"}`}
              >
                {screen.label}
              </button>
            ))}
          </nav>

          <div className="flex items-center gap-2">
            <div className="hidden items-center gap-2 rounded-full border border-slate-200 bg-white px-4 py-2 shadow-sm md:flex">
              <CreditCard className="h-4 w-4 text-blue-700" />
              <span className="text-sm font-black">42 créditos</span>
            </div>
            <button className="rounded-full bg-slate-950 px-4 py-2 text-sm font-black text-white shadow-sm">Entrar</button>
          </div>
        </div>
        <div className="flex gap-2 overflow-x-auto border-t border-slate-100 px-4 py-2 xl:hidden">
          {screens.map((screen) => (
            <button
              key={screen.id}
              onClick={() => setActiveScreen(screen.id)}
              className={`shrink-0 rounded-full px-4 py-2 text-xs font-black ${activeScreen === screen.id ? "bg-blue-700 text-white" : "bg-slate-100 text-slate-600"}`}
            >
              {screen.label}
            </button>
          ))}
        </div>
      </header>
      {children}
    </div>
  );
}

function UploadBox({ title = "Sube tu documento", subtitle = "PDF, DOCX, XLSX, XML, ZIP, JPG, PNG, TIFF o WEBP" }) {
  return (
    <div className="rounded-[2rem] border-2 border-dashed border-slate-200 bg-white p-10 text-center shadow-sm">
      <UploadCloud className="mx-auto h-16 w-16 text-blue-700" />
      <h2 className="mt-5 text-2xl font-black">{title}</h2>
      <p className="mt-2 text-slate-500">{subtitle}</p>
      <button className="mt-6 rounded-2xl bg-blue-700 px-6 py-4 font-black text-white shadow-lg shadow-blue-100">Seleccionar archivo</button>
    </div>
  );
}

function ToolCard({ tool }) {
  const Icon = tool.icon;
  return (
    <motion.button whileHover={{ y: -3 }} className="rounded-3xl border border-slate-200 bg-white p-5 text-left shadow-sm transition hover:border-blue-200 hover:shadow-xl">
      <div className="flex items-start justify-between gap-3">
        <div className="flex h-12 w-12 items-center justify-center rounded-2xl bg-blue-600 text-white shadow-lg shadow-blue-100">
          <Icon className="h-6 w-6" />
        </div>
        <span className="rounded-full bg-blue-50 px-3 py-1 text-xs font-black text-blue-700">{tool.level || tool.cat}</span>
      </div>
      <h3 className="mt-5 text-lg font-black text-slate-950">{tool.name}</h3>
      <p className="mt-2 min-h-[48px] text-sm leading-6 text-slate-500">{tool.reason || "Herramienta disponible para el documento activo."}</p>
      <div className="mt-5 flex items-center justify-between border-t border-slate-100 pt-4">
        <span className="flex items-center gap-1 text-sm font-black text-slate-700"><CreditCard className="h-4 w-4" /> {tool.credits} créditos</span>
        <span className="flex items-center gap-1 text-sm font-black text-blue-700">Usar <ChevronRight className="h-4 w-4" /></span>
      </div>
    </motion.button>
  );
}

function HomeScreen() {
  return (
    <main>
      <section className="bg-white">
        <div className="mx-auto grid max-w-[1500px] gap-10 px-4 py-14 lg:grid-cols-[1.1fr_.9fr] lg:px-6 lg:py-20">
          <div>
            <div className="mb-5 flex w-fit items-center gap-2 rounded-full border border-blue-100 bg-blue-50 px-4 py-2 text-sm font-black text-blue-700">
              <Sparkles className="h-4 w-4" /> OCR, conversión, IA, expedientes y API
            </div>
            <h1 className="max-w-4xl text-4xl font-black leading-tight tracking-tight md:text-6xl">Procesa documentos de forma inteligente, sin convertir tu flujo en un desorden.</h1>
            <p className="mt-6 max-w-2xl text-lg leading-8 text-slate-600">DocuCore no solo muestra herramientas: detecta tu documento, recomienda procesos y mantiene todo en un mismo centro de trabajo.</p>
            <div className="mt-8 flex flex-col gap-3 sm:flex-row">
              <button className="flex items-center justify-center gap-2 rounded-2xl bg-blue-700 px-6 py-4 text-base font-black text-white shadow-xl shadow-blue-100"><UploadCloud className="h-5 w-5" /> Subir documento</button>
              <button className="flex items-center justify-center gap-2 rounded-2xl border border-slate-200 bg-white px-6 py-4 text-base font-black shadow-sm"><Grid3X3 className="h-5 w-5" /> Ver herramientas</button>
            </div>
          </div>
          <div className="rounded-[2rem] border border-slate-200 bg-slate-50 p-4 shadow-2xl shadow-slate-200">
            <div className="rounded-[1.5rem] bg-white p-4 shadow-sm">
              <UploadBox title="Arrastra tus archivos aquí" subtitle="El sistema detectará automáticamente qué puedes hacer con ellos." />
              <div className="mt-4 grid gap-3 md:grid-cols-2">
                <div className="rounded-3xl border border-slate-200 p-4"><ShieldCheck className="h-6 w-6 text-emerald-600" /><div className="mt-2 font-black">Seguro</div><p className="text-sm text-slate-500">Auditoría, hash y control de acceso.</p></div>
                <div className="rounded-3xl border border-slate-200 p-4"><History className="h-6 w-6 text-blue-600" /><div className="mt-2 font-black">Historial</div><p className="text-sm text-slate-500">Todos los procesos en un solo lugar.</p></div>
              </div>
            </div>
          </div>
        </div>
      </section>

      <section className="mx-auto max-w-[1500px] px-4 py-12 lg:px-6">
        <div className="grid gap-5 md:grid-cols-4">
          {[
            [Scale, "Jurídico", "Expedientes, OCR, índices y anexos."],
            [Building2, "Empresarial", "Contratos, facturas y archivos internos."],
            [Landmark, "Gobierno", "Oficios, archivos administrativos y reportes."],
            [GraduationCap, "Académico", "Lectura, resumen y conversión de documentos."],
          ].map(([Icon, title, text]) => (
            <div key={title} className="rounded-[2rem] border border-slate-200 bg-white p-6 shadow-sm">
              <Icon className="h-8 w-8 text-blue-700" />
              <h3 className="mt-5 text-xl font-black">{title}</h3>
              <p className="mt-3 leading-7 text-slate-600">{text}</p>
            </div>
          ))}
        </div>
      </section>
    </main>
  );
}

function SeoLandingScreen() {
  return (
    <main className="mx-auto max-w-[1200px] px-4 py-10 lg:px-6">
      <section className="grid gap-8 lg:grid-cols-[1fr_420px]">
        <div className="rounded-[2rem] bg-gradient-to-br from-slate-950 to-blue-800 p-8 text-white shadow-2xl shadow-blue-100">
          <div className="mb-5 flex w-fit items-center gap-2 rounded-full bg-white/10 px-4 py-2 text-sm font-black backdrop-blur"><FileOutput className="h-4 w-4" /> Herramienta directa</div>
          <h1 className="text-4xl font-black leading-tight md:text-6xl">Convertir PDF a Word</h1>
          <p className="mt-5 max-w-2xl text-lg leading-8 text-blue-50">Convierte tu PDF en un documento DOCX editable. Si el PDF está escaneado, DocuCore puede sugerir OCR antes de convertir.</p>
          <div className="mt-8"><UploadBox title="Sube tu PDF" subtitle="Después podrás convertirlo sin salir de esta página." /></div>
        </div>
        <aside className="space-y-5">
          <div className="rounded-[2rem] border border-slate-200 bg-white p-6 shadow-sm">
            <h2 className="text-xl font-black">Incluye</h2>
            <div className="mt-4 space-y-3">
              {["Conserva formato", "OCR opcional", "Descarga inmediata", "Créditos visibles", "Sin cambiar de pantalla"].map((item) => (
                <div key={item} className="flex items-center gap-3"><CheckCircle2 className="h-5 w-5 text-emerald-600" /><span className="font-bold text-slate-700">{item}</span></div>
              ))}
            </div>
          </div>
          <div className="rounded-[2rem] border border-slate-200 bg-white p-6 shadow-sm">
            <h2 className="text-xl font-black">Costo estimado</h2>
            <div className="mt-3 text-4xl font-black text-blue-700">2 créditos</div>
            <p className="mt-2 text-sm text-slate-500">Puede cambiar si el archivo requiere OCR.</p>
          </div>
        </aside>
      </section>

      <section className="mt-10 grid gap-5 md:grid-cols-3">
        {[
          [ScanText, "OCR si hace falta", "Si el PDF no tiene texto, primero se puede leer con OCR."],
          [ShieldCheck, "Privacidad", "Archivo temporal y protegido durante el procesamiento."],
          [Download, "Descarga final", "Obtén DOCX o guarda el resultado en tu workspace."],
        ].map(([Icon, title, text]) => (
          <div key={title} className="rounded-[2rem] border border-slate-200 bg-white p-6 shadow-sm"><Icon className="h-8 w-8 text-blue-700" /><h3 className="mt-5 text-xl font-black">{title}</h3><p className="mt-3 text-slate-600">{text}</p></div>
        ))}
      </section>
    </main>
  );
}

function WorkspaceEmptyScreen() {
  return (
    <main className="mx-auto grid max-w-[1500px] gap-5 px-4 py-5 lg:grid-cols-[280px_1fr_340px] lg:px-6">
      <aside className="hidden rounded-[2rem] border border-slate-200 bg-white p-5 shadow-sm lg:block">
        <h2 className="text-lg font-black">Mis archivos</h2>
        <p className="mt-2 text-sm text-slate-500">Aquí aparecerán los documentos cargados.</p>
        <button className="mt-5 flex w-full items-center justify-center gap-2 rounded-2xl bg-blue-700 px-4 py-3 font-black text-white"><Plus className="h-5 w-5" /> Nuevo archivo</button>
      </aside>
      <section>
        <div className="rounded-[2rem] border border-slate-200 bg-white p-6 shadow-sm">
          <div className="mb-6"><h1 className="text-3xl font-black">Workspace documental</h1><p className="mt-2 text-slate-500">Sube un archivo para que DocuCore active las herramientas correctas.</p></div>
          <UploadBox />
        </div>
      </section>
      <aside className="rounded-[2rem] border border-slate-200 bg-white p-5 shadow-sm">
        <h2 className="text-lg font-black">Panel listo</h2>
        <div className="mt-4 space-y-3">
          {["Detectar tipo de archivo", "Recomendar herramientas", "Calcular créditos", "Crear flujo de trabajo"].map((item) => (
            <div key={item} className="flex items-center gap-3 rounded-2xl bg-slate-50 p-3"><Clock3 className="h-5 w-5 text-slate-400" /><span className="text-sm font-bold text-slate-600">{item}</span></div>
          ))}
        </div>
      </aside>
    </main>
  );
}

function UploadedDocumentScreen() {
  return (
    <main className="mx-auto grid max-w-[1500px] gap-5 px-4 py-5 pb-24 lg:grid-cols-[280px_1fr_360px] lg:px-6">
      <aside className="hidden lg:block">
        <div className="sticky top-24 space-y-5">
          <section className="rounded-[2rem] border border-slate-200 bg-white p-5 shadow-sm">
            <h2 className="text-lg font-black">Documentos</h2>
            <div className="mt-5 rounded-3xl border border-blue-200 bg-blue-50 p-4"><div className="flex gap-3"><div className="flex h-11 w-11 shrink-0 items-center justify-center rounded-2xl bg-blue-700 text-white"><FileText className="h-5 w-5" /></div><div className="min-w-0"><div className="truncate text-sm font-black">{uploadedFile.name}</div><div className="mt-1 text-xs font-semibold text-blue-700">Activo · {uploadedFile.pages} páginas</div></div></div></div>
          </section>
          <section className="rounded-[2rem] border border-slate-200 bg-white p-5 shadow-sm">
            <h2 className="text-lg font-black">Caja de herramientas</h2>
            <div className="mt-5 grid gap-2">
              {[ScanText, FileOutput, Brain, FolderKanban, ShieldCheck, Archive].map((Icon, i) => <button key={i} className="flex items-center gap-3 rounded-2xl px-4 py-3 text-sm font-black text-slate-600 hover:bg-slate-100"><Icon className="h-5 w-5" /> {['OCR','Convertir','IA','Expedientes','Seguridad','Archivos'][i]}</button>)}
            </div>
          </section>
        </div>
      </aside>

      <section className="space-y-5">
        <section className="rounded-[2rem] border border-slate-200 bg-white p-5 shadow-sm md:p-6">
          <div className="flex flex-col gap-5 md:flex-row md:items-center md:justify-between">
            <div className="flex gap-4">
              <div className="flex h-16 w-16 shrink-0 items-center justify-center rounded-3xl bg-blue-50 text-blue-700"><FileText className="h-8 w-8" /></div>
              <div className="min-w-0"><div className="flex flex-wrap items-center gap-2"><h1 className="truncate text-2xl font-black">{uploadedFile.name}</h1><span className="rounded-full bg-emerald-50 px-3 py-1 text-xs font-black text-emerald-700">{uploadedFile.status}</span></div><div className="mt-2 flex flex-wrap gap-2 text-sm font-semibold text-slate-500"><span>{uploadedFile.type}</span><span>·</span><span>{uploadedFile.pages} páginas</span><span>·</span><span>{uploadedFile.size}</span><span>·</span><span>Confianza {uploadedFile.confidence}</span></div></div>
            </div>
            <div className="flex gap-2"><button className="rounded-2xl border border-slate-200 bg-white px-4 py-3 text-sm font-black shadow-sm"><Eye className="inline h-4 w-4" /> Vista</button><button className="rounded-2xl border border-slate-200 bg-white px-4 py-3 text-sm font-black shadow-sm"><Download className="inline h-4 w-4" /> Descargar</button></div>
          </div>
          <div className="mt-6 grid gap-4 lg:grid-cols-[1fr_300px]">
            <div className="rounded-[1.5rem] border border-slate-200 bg-slate-100 p-4">
              <div className="mx-auto flex min-h-[520px] max-w-md items-center justify-center rounded-xl bg-white shadow-inner">
                <div className="w-72 rounded border border-slate-200 bg-white p-6 shadow-lg"><div className="h-5 w-40 rounded bg-slate-200" /><div className="mt-5 space-y-2">{Array.from({ length: 18 }).map((_, i) => <div key={i} className="h-2 rounded bg-slate-100" />)}</div><div className="mt-8 h-20 rounded bg-slate-100" /></div>
              </div>
            </div>
            <div className="rounded-[1.5rem] border border-slate-200 bg-white p-5">
              <h3 className="text-lg font-black">Diagnóstico</h3>
              <div className="mt-4 space-y-3">{[[Gauge,'Calidad','Media'],[Activity,'Texto','Bajo'],[Layers3,'Estructura','Múltiples documentos'],[Cloud,'Salida','PDF OCR + ZIP']].map(([Icon,label,value]) => <div key={label} className="flex items-center justify-between rounded-2xl bg-slate-50 p-3"><div className="flex items-center gap-3"><Icon className="h-5 w-5 text-blue-700" /><span className="text-sm font-bold text-slate-600">{label}</span></div><span className="text-sm font-black">{value}</span></div>)}</div>
            </div>
          </div>
        </section>
        <section className="rounded-[2rem] border border-slate-200 bg-white p-5 shadow-sm md:p-6"><h2 className="text-2xl font-black">Herramientas recomendadas para este documento</h2><p className="mt-1 text-slate-500">Se prioriza lo que realmente ayuda al archivo cargado.</p><div className="mt-5 grid gap-4 md:grid-cols-2 xl:grid-cols-4">{recommendedTools.map((tool) => <ToolCard key={tool.name} tool={tool} />)}</div></section>
      </section>

      <aside className="space-y-5">
        <section className="rounded-[2rem] border border-slate-200 bg-white p-5 shadow-sm"><h2 className="text-lg font-black">Resultado esperado</h2><div className="mt-4 space-y-3">{['PDF con OCR seleccionable','Índice por rangos','ZIP con documentos separados','JSON con metadatos'].map((item) => <div key={item} className="flex items-center gap-3 rounded-2xl bg-slate-50 p-3"><CheckCircle2 className="h-5 w-5 text-emerald-600" /><span className="text-sm font-bold text-slate-700">{item}</span></div>)}</div></section>
        <section className="rounded-[2rem] border border-slate-200 bg-white p-5 shadow-sm"><h2 className="text-lg font-black">Cola de procesos</h2><div className="mt-4 space-y-4">{[['OCR completo','18 cr.'],['Separar expediente','25 cr.'],['Generar índice','15 cr.']].map(([title,cost]) => <div key={title} className="rounded-3xl border border-slate-200 p-4"><div className="flex items-center justify-between"><div className="font-black">{title}</div><span className="rounded-full bg-slate-100 px-2 py-1 text-xs font-black">{cost}</span></div><div className="mt-2 text-sm font-semibold text-slate-500">Listo para iniciar</div></div>)}</div><button className="mt-5 flex w-full items-center justify-center gap-2 rounded-2xl bg-blue-700 px-4 py-3 font-black text-white shadow-lg shadow-blue-100"><PlayCircle className="h-5 w-5" /> Ejecutar flujo</button></section>
      </aside>
    </main>
  );
}

function ResultScreen() {
  return (
    <main className="mx-auto max-w-[1300px] px-4 py-8 lg:px-6">
      <section className="rounded-[2rem] border border-slate-200 bg-white p-6 shadow-sm md:p-8">
        <div className="flex flex-col gap-6 md:flex-row md:items-center md:justify-between">
          <div><div className="flex w-fit items-center gap-2 rounded-full bg-emerald-50 px-4 py-2 text-sm font-black text-emerald-700"><CheckCircle2 className="h-4 w-4" /> Proceso completado</div><h1 className="mt-5 text-4xl font-black">OCR + índice generado</h1><p className="mt-3 text-slate-600">Tu expediente fue procesado correctamente. Puedes descargar resultados o abrirlos en el workspace.</p></div>
          <div className="rounded-3xl bg-blue-50 p-5 text-center"><div className="text-sm font-black text-blue-700">Créditos usados</div><div className="mt-1 text-4xl font-black text-blue-900">58</div></div>
        </div>
        <div className="mt-8 grid gap-4 md:grid-cols-4">{[['245','páginas leídas'],['37','documentos detectados'],['12','anexos posibles'],['94%','confianza global']].map(([a,b]) => <div key={b} className="rounded-3xl border border-slate-200 bg-slate-50 p-5"><div className="text-3xl font-black">{a}</div><div className="text-sm font-semibold text-slate-500">{b}</div></div>)}</div>
      </section>
      <section className="mt-6 grid gap-5 md:grid-cols-2 xl:grid-cols-4">
        {[[FileText,'Descargar PDF OCR','Documento con texto seleccionable'],[BookOpen,'Descargar índice','Índice en PDF o DOCX'],[FileArchiveIcon,'Descargar ZIP','Documentos separados'],[FileJson,'Descargar JSON','Datos estructurados']].map(([Icon,title,text]) => <button key={title} className="rounded-[2rem] border border-slate-200 bg-white p-6 text-left shadow-sm transition hover:border-blue-200 hover:shadow-xl"><Icon className="h-10 w-10 text-blue-700" /><h3 className="mt-5 text-xl font-black">{title}</h3><p className="mt-2 text-sm leading-6 text-slate-500">{text}</p><div className="mt-5 flex items-center gap-2 font-black text-blue-700"><Download className="h-4 w-4" /> Descargar</div></button>)}
      </section>
    </main>
  );
}

function CaseFileScreen() {
  return (
    <main className="mx-auto grid max-w-[1500px] gap-5 px-4 py-5 lg:grid-cols-[1fr_380px] lg:px-6">
      <section className="rounded-[2rem] border border-slate-200 bg-white p-6 shadow-sm">
        <div className="flex flex-col gap-4 md:flex-row md:items-center md:justify-between"><div><div className="flex w-fit items-center gap-2 rounded-full bg-blue-50 px-4 py-2 text-sm font-black text-blue-700"><FolderKanban className="h-4 w-4" /> Vista especial DocuCore</div><h1 className="mt-4 text-3xl font-black">Expediente judicial separado</h1><p className="mt-2 text-slate-500">Documentos internos detectados con rango de páginas y confianza.</p></div><button className="rounded-2xl bg-blue-700 px-5 py-3 font-black text-white"><Download className="inline h-4 w-4" /> Descargar índice</button></div>
        <div className="mt-8 overflow-hidden rounded-[1.5rem] border border-slate-200">
          <table className="w-full text-left text-sm"><thead className="bg-slate-50 text-xs uppercase text-slate-500"><tr><th className="px-5 py-4">Documento</th><th className="px-5 py-4">Tipo</th><th className="px-5 py-4">Páginas</th><th className="px-5 py-4">Confianza</th><th className="px-5 py-4">Acción</th></tr></thead><tbody className="divide-y divide-slate-100">{caseDocs.map((doc) => <tr key={doc.title} className="hover:bg-blue-50/30"><td className="px-5 py-4 font-black">{doc.title}</td><td className="px-5 py-4 text-slate-600">{doc.type}</td><td className="px-5 py-4 text-slate-600">{doc.pages}</td><td className="px-5 py-4"><span className="rounded-full bg-emerald-50 px-3 py-1 text-xs font-black text-emerald-700">{doc.confidence}</span></td><td className="px-5 py-4"><button className="font-black text-blue-700">Abrir</button></td></tr>)}</tbody></table>
        </div>
      </section>
      <aside className="space-y-5"><section className="rounded-[2rem] border border-slate-200 bg-white p-5 shadow-sm"><h2 className="text-lg font-black">Documento seleccionado</h2><div className="mt-4 rounded-3xl bg-slate-100 p-5"><div className="mx-auto h-72 w-48 rounded bg-white shadow-inner" /></div><div className="mt-4 grid gap-2">{['Ver OCR','Descargar documento','Editar clasificación','Enviar a LexNova'].map((item) => <button key={item} className="rounded-2xl border border-slate-200 px-4 py-3 text-left text-sm font-black hover:bg-slate-50">{item}</button>)}</div></section></aside>
    </main>
  );
}

function ApiScreen() {
  return (
    <main className="mx-auto max-w-[1400px] px-4 py-8 lg:px-6">
      <section className="grid gap-6 lg:grid-cols-[.95fr_1.05fr]">
        <div className="rounded-[2rem] bg-slate-950 p-8 text-white shadow-2xl shadow-slate-200"><div className="flex w-fit items-center gap-2 rounded-full bg-white/10 px-4 py-2 text-sm font-black"><Code2 className="h-4 w-4" /> API DocuCore</div><h1 className="mt-5 text-4xl font-black">Integra OCR, conversión e IA documental en tus sistemas.</h1><p className="mt-4 leading-8 text-slate-300">Crea API keys, revisa consumo, consulta logs y conecta DocuCore con LexNova, ERPs, CRMs o sistemas propios.</p><button className="mt-8 rounded-2xl bg-white px-6 py-4 font-black text-slate-950">Crear API Key</button></div>
        <div className="rounded-[2rem] border border-slate-200 bg-white p-6 shadow-sm"><h2 className="text-xl font-black">Panel de consumo</h2><div className="mt-5 grid gap-4 md:grid-cols-3">{[['4,522','requests hoy'],['10,000','créditos'],['99.9%','uptime']].map(([a,b]) => <div key={b} className="rounded-3xl bg-slate-50 p-5"><div className="text-3xl font-black">{a}</div><div className="text-sm font-semibold text-slate-500">{b}</div></div>)}</div><div className="mt-6 rounded-3xl bg-slate-950 p-5 font-mono text-sm text-slate-100"><div className="text-slate-400">POST /v1/ocr</div><div className="mt-2">POST /v1/convert</div><div>POST /v1/classify</div><div>POST /v1/index</div><div>POST /v1/workflows/expediente</div></div></div>
      </section>
      <section className="mt-6 grid gap-5 md:grid-cols-3">{[[KeyRound,'API Keys','Crea llaves por proyecto y controla permisos.'],[BarChart3,'Consumo','Mide créditos, requests y costos por cliente.'],[Activity,'Logs','Audita cada archivo, endpoint y resultado.']].map(([Icon,title,text]) => <div key={title} className="rounded-[2rem] border border-slate-200 bg-white p-6 shadow-sm"><Icon className="h-8 w-8 text-blue-700" /><h3 className="mt-5 text-xl font-black">{title}</h3><p className="mt-3 text-slate-600">{text}</p></div>)}</section>
    </main>
  );
}

export default function DocuCoreMultiScreenMockup() {
  const [activeScreen, setActiveScreen] = useState("home");

  return (
    <Shell activeScreen={activeScreen} setActiveScreen={setActiveScreen}>
      {activeScreen === "home" && <HomeScreen />}
      {activeScreen === "seo" && <SeoLandingScreen />}
      {activeScreen === "workspace" && <WorkspaceEmptyScreen />}
      {activeScreen === "uploaded" && <UploadedDocumentScreen />}
      {activeScreen === "result" && <ResultScreen />}
      {activeScreen === "casefile" && <CaseFileScreen />}
      {activeScreen === "api" && <ApiScreen />}
    </Shell>
  );
}

**Home, Landing SEO, Workspace vacío, Documento subido, Resultado, Expediente y API.**
