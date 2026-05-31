Implementar en DocuCore un marco de trabajo para edición de PDF con estilo tipo Canvas.

Objetivo:
La vista previa del documento debe ser el centro de la experiencia. Las herramientas, configuración, archivos e información no deben ocupar espacio fijo ni interrumpir la visualización. Todo debe abrirse solo cuando el usuario lo solicite.

Reglas de interfaz:

1. La pantalla principal del workspace debe mostrar principalmente la previsualización del PDF.
2. Las páginas del PDF deben verse como miniaturas reales o renderizadas.
3. El usuario debe poder seleccionar páginas desde la vista previa.
4. Las herramientas no deben estar siempre visibles como panel lateral fijo.
5. Las herramientas deben abrirse mediante botón o drawer lateral.
6. La configuración de cada herramienta debe abrirse en drawer derecho.
7. Los archivos cargados deben abrirse en drawer izquierdo o modal lateral.
8. La información del documento debe abrirse solo bajo solicitud.
9. La barra inferior flotante debe contener accesos rápidos:

   * Herramientas
   * Configurar
   * Subir más
   * Resultado
10. El botón principal debe ser “Aplicar cambios”.
11. Después de aplicar cambios, el usuario debe poder continuar usando otra herramienta sin salir del workspace.
12. En móvil, todo debe funcionar por botones/drawers, no por columnas fijas.
13. El workspace no debe parecer formulario; debe parecer área de edición documental.
14. La vista previa nunca debe quedar tapada permanentemente por herramientas.
15. El diseño debe seguir el patrón:

* Header compacto
* Área central amplia de vista previa
* Barra inferior flotante
* Drawers contextuales
* Herramientas bajo demanda

Estructura visual esperada:

Header:

* Nombre del workspace
* Herramienta activa
* Resumen pequeño del documento
* Botón “Aplicar cambios”

Centro:

* Vista previa principal del PDF
* Miniaturas seleccionables
* Controles rápidos: Todas, Impares, Pares, Limpiar selección
* Modo activo visible

Barra flotante inferior:

* Herramientas
* Configurar
* Subir más
* Resultado

Drawer de herramientas:

* Buscar herramienta
* Dividir PDF
* Unir PDF
* Comprimir PDF
* PDF a Word
* OCR
* Extraer imágenes
* Firmar PDF
* Generar índice

Drawer de configuración:
Para Dividir PDF debe incluir:

* Por rango
* Páginas seleccionadas
* Cada X páginas
* Por tamaño
* Por marcadores
* Una página por archivo
* Detectar separadores
* Botón Aplicar cambios
* Botón Usar otra herramienta

Drawer de archivos:

* Lista de archivos cargados
* Eliminar archivo
* Reordenar archivo
* Agregar más archivos

Drawer de información:

* Número de archivos
* Tipo
* Peso
* Páginas
* Acciones compatibles
* Validación de compatibilidad

Resultado esperado:
Un workspace limpio, moderno y profesional, donde el usuario trabaja principalmente viendo el documento, y las herramientas aparecen solo cuando las necesita.


ejemplo a mejorar según la instrucciónes anteriores 
import React, { useMemo, useState } from "react";
import { motion, AnimatePresence } from "framer-motion";
import {
  FileText,
  Scissors,
  Merge,
  Minimize2,
  FileType,
  ScanText,
  Image,
  Signature,
  ListTree,
  Download,
  Plus,
  X,
  GripVertical,
  Search,
  Settings2,
  Eye,
  Layers3,
  CheckCircle2,
  AlertCircle,
  ArrowRight,
  Info,
  FolderPlus,
  Wand2,
  PanelRightOpen,
  PanelLeftOpen,
} from "lucide-react";

const files = [
  { id: 1, name: "SENTENCIA CONDENATORIA 332024.pdf", type: "PDF", size: "26.1 MB", pages: 40 },
  { id: 2, name: "12-2020-05085 Victima Jose Luis Martinez Rivera.pdf", type: "PDF", size: "89.3 MB", pages: 75 },
];

const tools = [
  { id: "split", label: "Dividir PDF", icon: Scissors, active: true },
  { id: "merge", label: "Unir PDF", icon: Merge },
  { id: "compress", label: "Comprimir", icon: Minimize2 },
  { id: "word", label: "PDF a Word", icon: FileType },
  { id: "ocr", label: "OCR básico", icon: ScanText },
  { id: "images", label: "Extraer imágenes", icon: Image },
  { id: "sign", label: "Firmar PDF", icon: Signature },
  { id: "index", label: "Generar índice", icon: ListTree },
];

const splitModes = [
  "Por rango",
  "Páginas seleccionadas",
  "Cada X páginas",
  "Por tamaño",
  "Por marcadores",
  "Una página por archivo",
  "Detectar separadores",
];

function Pill({ children, active = false }) {
  return <span className={`rounded-full px-3 py-1 text-xs font-black ${active ? "bg-red-600 text-white" : "bg-slate-100 text-slate-600"}`}>{children}</span>;
}

function FileRow({ file, index }) {
  return (
    <motion.div layout className="group flex items-center gap-3 rounded-2xl border border-slate-200 bg-white p-3 shadow-sm">
      <input type="checkbox" defaultChecked className="h-4 w-4 accent-red-600" />
      <div className="flex h-8 w-8 items-center justify-center rounded-full bg-slate-100 text-sm font-black text-slate-700">{index + 1}</div>
      <GripVertical className="hidden h-5 w-5 text-slate-300 md:block" />
      <FileText className="h-6 w-6 shrink-0 text-red-600" />
      <div className="min-w-0 flex-1">
        <p className="truncate text-sm font-black text-slate-900">{file.name}</p>
        <p className="text-xs text-slate-500">{file.type} · {file.size} · {file.pages} páginas</p>
      </div>
      <button className="rounded-xl border border-slate-200 bg-white p-2 text-slate-500 hover:text-red-600"><X className="h-4 w-4" /></button>
    </motion.div>
  );
}

function PageThumb({ page, selected }) {
  return (
    <button className={`relative rounded-2xl border bg-white p-2 shadow-sm transition hover:-translate-y-1 hover:shadow-md ${selected ? "border-red-500 ring-2 ring-red-100" : "border-slate-200"}`}>
      {selected && <span className="absolute -left-2 -top-2 flex h-7 w-7 items-center justify-center rounded-full bg-emerald-500 text-white shadow"><CheckCircle2 className="h-4 w-4" /></span>}
      <div className="flex aspect-[3/4] w-full items-center justify-center rounded-xl bg-slate-100">
        <div className="h-[78%] w-[68%] rounded bg-white p-2 shadow-inner">
          <div className="mb-2 h-2 w-10 rounded bg-slate-300" />
          <div className="space-y-1">{Array.from({ length: 9 }).map((_, i) => <div key={i} className="h-1 rounded bg-slate-200" />)}</div>
          <div className="mx-auto mt-4 h-10 w-10 rounded-full border border-blue-200" />
        </div>
      </div>
      <p className="mt-2 text-center text-xs font-semibold text-slate-500">Página {page}</p>
    </button>
  );
}

function Drawer({ title, open, onClose, children, side = "right" }) {
  return (
    <AnimatePresence>
      {open && (
        <>
          <motion.div className="fixed inset-0 z-50 bg-slate-950/25 backdrop-blur-sm" initial={{ opacity: 0 }} animate={{ opacity: 1 }} exit={{ opacity: 0 }} onClick={onClose} />
          <motion.aside
            initial={{ x: side === "right" ? 420 : -420 }}
            animate={{ x: 0 }}
            exit={{ x: side === "right" ? 420 : -420 }}
            transition={{ type: "spring", damping: 28, stiffness: 260 }}
            className={`fixed top-0 z-50 h-full w-[92vw] max-w-[420px] overflow-auto bg-white p-5 shadow-2xl ${side === "right" ? "right-0" : "left-0"}`}
          >
            <div className="mb-5 flex items-center justify-between">
              <h2 className="text-xl font-black">{title}</h2>
              <button onClick={onClose} className="rounded-2xl border border-slate-200 p-2 text-slate-500 hover:text-red-600"><X className="h-5 w-5" /></button>
            </div>
            {children}
          </motion.aside>
        </>
      )}
    </AnimatePresence>
  );
}

export default function DocuCoreWorkspaceMockup() {
  const [selectedMode, setSelectedMode] = useState("Por rango");
  const [drawer, setDrawer] = useState(null);
  const pages = useMemo(() => Array.from({ length: 36 }, (_, i) => i + 1), []);

  return (
    <div className="min-h-screen bg-slate-100 text-slate-900">
      <header className="sticky top-0 z-40 border-b border-slate-200 bg-white/95 backdrop-blur">
        <div className="mx-auto flex max-w-[1600px] items-center justify-between px-4 py-3 md:px-6">
          <div className="flex items-center gap-3">
            <div className="flex h-10 w-10 items-center justify-center rounded-2xl bg-red-600 text-white shadow-sm"><FileText className="h-5 w-5" /></div>
            <div>
              <p className="text-xs font-black uppercase tracking-wide text-red-600">DocuCore Workspace</p>
              <h1 className="text-lg font-black md:text-xl">Dividir PDF</h1>
            </div>
          </div>
          <div className="hidden items-center gap-2 lg:flex"><Pill active>2 archivos</Pill><Pill>115.4 MB</Pill><Pill>115 páginas</Pill></div>
          <button onClick={() => setDrawer("config")} className="rounded-2xl bg-red-600 px-4 py-2 text-sm font-black text-white shadow-lg shadow-red-200">Aplicar cambios</button>
        </div>
      </header>

      <main className="mx-auto max-w-[1600px] p-4">
        <section className="rounded-[2rem] border border-slate-200 bg-white shadow-sm">
          <div className="flex flex-col gap-3 border-b border-slate-200 p-4 lg:flex-row lg:items-center lg:justify-between">
            <div>
              <p className="text-xs font-black uppercase text-red-600">Vista principal</p>
              <h2 className="text-2xl font-black">Previsualiza y selecciona las páginas</h2>
            </div>
            <div className="flex flex-wrap gap-2">
              <button onClick={() => setDrawer("tools")} className="flex items-center gap-2 rounded-2xl border border-slate-200 bg-slate-50 px-4 py-3 text-sm font-black hover:bg-white"><PanelLeftOpen className="h-4 w-4 text-red-600" />Herramientas</button>
              <button onClick={() => setDrawer("config")} className="flex items-center gap-2 rounded-2xl border border-slate-200 bg-slate-50 px-4 py-3 text-sm font-black hover:bg-white"><Settings2 className="h-4 w-4 text-red-600" />Opciones de división</button>
              <button onClick={() => setDrawer("files")} className="flex items-center gap-2 rounded-2xl border border-slate-200 bg-slate-50 px-4 py-3 text-sm font-black hover:bg-white"><FolderPlus className="h-4 w-4 text-red-600" />Archivos</button>
              <button onClick={() => setDrawer("info")} className="flex items-center gap-2 rounded-2xl border border-slate-200 bg-slate-50 px-4 py-3 text-sm font-black hover:bg-white"><Info className="h-4 w-4 text-red-600" />Información</button>
            </div>
          </div>

          <div className="flex flex-col gap-3 border-b border-slate-200 bg-slate-50 px-4 py-3 xl:flex-row xl:items-center xl:justify-between">
            <div className="flex flex-wrap gap-2"><Pill active>Todas</Pill><Pill>Impares</Pill><Pill>Pares</Pill><Pill>Limpiar selección</Pill></div>
            <div className="rounded-2xl border border-blue-100 bg-blue-50 px-4 py-2 text-sm font-bold text-blue-950">Modo activo: {selectedMode}</div>
          </div>

          <div className="max-h-[calc(100vh-210px)] overflow-auto bg-slate-50 p-5">
            <div className="grid grid-cols-2 gap-4 sm:grid-cols-3 md:grid-cols-4 xl:grid-cols-6 2xl:grid-cols-8">
              {pages.map((page) => <PageThumb key={page} page={page} selected={page <= 18} />)}
            </div>
          </div>
        </section>
      </main>

      <div className="fixed bottom-5 left-1/2 z-40 flex -translate-x-1/2 items-center gap-2 rounded-[2rem] border border-slate-200 bg-white/95 p-2 shadow-2xl backdrop-blur">
        <button onClick={() => setDrawer("tools")} className="rounded-2xl px-3 py-2 text-xs font-black text-slate-700 hover:bg-slate-100"><Layers3 className="mx-auto mb-1 h-4 w-4" />Herramientas</button>
        <button onClick={() => setDrawer("config")} className="rounded-2xl bg-red-600 px-4 py-3 text-xs font-black text-white shadow-lg shadow-red-200"><Wand2 className="mx-auto mb-1 h-4 w-4" />Configurar</button>
        <button onClick={() => setDrawer("files")} className="rounded-2xl px-3 py-2 text-xs font-black text-slate-700 hover:bg-slate-100"><Plus className="mx-auto mb-1 h-4 w-4" />Subir más</button>
        <button className="rounded-2xl px-3 py-2 text-xs font-black text-slate-700 hover:bg-slate-100"><Download className="mx-auto mb-1 h-4 w-4" />Resultado</button>
      </div>

      <Drawer title="Herramientas disponibles" open={drawer === "tools"} onClose={() => setDrawer(null)} side="left">
        <div className="mb-4 rounded-2xl bg-slate-50 p-2"><div className="flex items-center gap-2 rounded-xl bg-white px-3 py-2 text-sm text-slate-400 shadow-sm"><Search className="h-4 w-4" />Buscar herramienta</div></div>
        <div className="grid gap-2">
          {tools.map((tool) => { const Icon = tool.icon; return (
            <button key={tool.id} className={`flex w-full items-center gap-3 rounded-2xl px-3 py-3 text-left text-sm font-black transition ${tool.active ? "bg-slate-950 text-white shadow-lg" : "border border-slate-200 bg-slate-50 text-slate-800 hover:bg-white"}`}>
              <Icon className={`h-4 w-4 ${tool.active ? "text-red-300" : "text-red-600"}`} /><span className="flex-1">{tool.label}</span>
            </button>
          ); })}
        </div>
      </Drawer>

      <Drawer title="Opciones de Dividir PDF" open={drawer === "config"} onClose={() => setDrawer(null)}>
        <p className="mb-4 text-sm text-slate-500">Estas opciones aparecen solo cuando el usuario las necesita. La vista previa queda como área principal.</p>
        <div className="rounded-2xl border border-slate-200 p-2">
          {splitModes.map((mode) => (
            <label key={mode} className={`mb-2 flex cursor-pointer items-center gap-3 rounded-xl px-3 py-3 text-sm font-semibold last:mb-0 ${selectedMode === mode ? "bg-red-50 text-red-700" : "bg-slate-50 text-slate-700 hover:bg-white"}`}>
              <input type="radio" name="mode" checked={selectedMode === mode} onChange={() => setSelectedMode(mode)} className="accent-red-600" />{mode}
            </label>
          ))}
        </div>
        <div className="mt-4 rounded-2xl bg-slate-50 p-3">
          <span className="text-xs font-black uppercase text-slate-500">Rangos</span>
          <input defaultValue="1-10, 11-20, 21-40" className="mt-2 w-full rounded-xl border border-slate-200 bg-white px-3 py-3 text-sm font-semibold outline-none focus:border-red-500" />
          <p className="mt-2 text-xs text-slate-500">Puedes usar rangos separados por coma.</p>
        </div>
        <button className="mt-4 flex w-full items-center justify-center gap-3 rounded-2xl bg-red-600 px-4 py-4 text-lg font-black text-white shadow-xl shadow-red-200 hover:bg-red-700">Aplicar cambios<ArrowRight className="h-5 w-5" /></button>
        <button onClick={() => setDrawer("tools")} className="mt-3 flex w-full items-center justify-center gap-2 rounded-2xl border border-slate-200 bg-white px-4 py-3 text-sm font-black text-slate-800 hover:bg-slate-50"><PanelRightOpen className="h-4 w-4" />Usar otra herramienta</button>
      </Drawer>

      <Drawer title="Archivos del workspace" open={drawer === "files"} onClose={() => setDrawer(null)} side="left">
        <div className="mb-3 grid gap-3">{files.map((file, index) => <FileRow key={file.id} file={file} index={index} />)}</div>
        <button className="flex w-full items-center justify-center gap-2 rounded-2xl border border-dashed border-slate-300 bg-slate-50 px-4 py-4 text-sm font-black text-slate-800 hover:bg-white"><Plus className="h-4 w-4" />Agregar más archivos</button>
      </Drawer>

      <Drawer title="Información del documento" open={drawer === "info"} onClose={() => setDrawer(null)}>
        <div className="space-y-2">
          {[["Archivos", "2"], ["Tipo", "PDF"], ["Peso", "115.4 MB"], ["Páginas", "115"], ["Acciones compatibles", "8"]].map(([label, value]) => (
            <div key={label} className="flex items-center justify-between rounded-2xl bg-slate-50 px-3 py-3"><span className="text-xs font-black uppercase text-slate-500">{label}</span><span className="font-black text-slate-900">{value}</span></div>
          ))}
        </div>
        <div className="mt-4 rounded-2xl border border-amber-100 bg-amber-50 p-4"><div className="mb-2 flex items-center gap-2"><AlertCircle className="h-5 w-5 text-amber-600" /><h3 className="font-black text-amber-950">Validación</h3></div><p className="text-sm font-semibold text-amber-900">Los documentos son compatibles. Puedes dividirlos juntos o trabajar solo con uno.</p></div>
      </Drawer>
    </div>
  );
}
