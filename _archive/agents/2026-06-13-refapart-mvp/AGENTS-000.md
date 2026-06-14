



Sí. Te dejo una instrucción lista para pegar en **Codex**:

```text
Construye una web moderna tipo marketplace de refacciones automotrices llamada “RepuestosMax” o “RefaPart Refacciones”.

Objetivo:
Crear una página web responsive muy parecida en estructura a la imagen de referencia, pero optimizada para búsqueda rápida de autopartes nuevas/usadas, refaccionarias, deshuesaderos y talleres proveedores.

Stack:
- Next.js 15
- React
- TypeScript
- Tailwind CSS
- App Router
- Componentes reutilizables
- Diseño responsive desktop/mobile
- Sin backend real por ahora, usar datos mock en JSON/TS

Páginas necesarias:
1. Home / buscador principal
2. Resultados de búsqueda
3. Detalle de pieza
4. Publicar búsqueda
5. Favoritos
6. Cuenta / proveedor
7. Panel básico proveedor

Diseño general:
- Estilo moderno, limpio, automotriz premium.
- Colores principales:
  - Rojo: #E32626
  - Negro: #111827
  - Gris fondo: #F5F6F8
  - Blanco: #FFFFFF
  - Verde disponible: #16A34A
- Bordes redondeados grandes.
- Sombras suaves.
- Mucho espacio en blanco.
- Íconos lineales modernos.
- No copiar exactamente la imagen, solo usarla como inspiración visual.

Layout desktop:
- Header superior fijo o sticky.
- Logo a la izquierda.
- Barra de búsqueda central grande:
  “Busca por pieza, marca, modelo o número de parte”
- Accesos rápidos:
  WhatsApp
  Favoritos
  Mi cuenta
- Sidebar izquierda con categorías:
  Todas las categorías
  Motor
  Transmisión
  Suspensión
  Frenos
  Eléctrico
  Carrocería
  Enfriamiento
  Interior
  Iluminación
  Más categorías
- Área principal con hero:
  Título: “Encuentra la pieza que necesitas”
  Subtítulo: “Compara precios, disponibilidad y elige la mejor opción entre proveedores verificados.”
  Imagen o placeholder de motor/autopartes.
- Buscador por tabs:
  Tab 1: Buscar por vehículo
  Tab 2: Buscar por número de parte
- Campos:
  Marca
  Modelo
  Año
  Categoría
  Código postal / ciudad
- Botón principal rojo:
  “Buscar piezas”

Layout mobile:
- Header compacto con menú hamburguesa, logo y carrito/favoritos.
- Buscador en tarjeta.
- Categorías como scroll horizontal.
- Resultados en tarjetas verticales.
- Bottom navigation:
  Inicio
  Buscar
  Favoritos
  Mensajes
  Cuenta

Componentes:
- Header
- SidebarCategories
- HeroSearch
- SearchTabs
- PopularSearches
- FeaturedCategories
- ProductCard
- ProviderTrustBadge
- PublishRequestCard
- BenefitsSection
- Footer
- MobileBottomNav

Tarjetas de producto:
Cada producto debe mostrar:
- Imagen
- Categoría
- Condición: Nueva / Usada / Reconstruida
- Nombre de pieza
- Compatibilidad
- Precio
- Estado: Disponible / Por confirmar
- Ubicación
- Envío disponible
- Proveedor verificado
- Botón “Ver detalles”
- Botón favorito

Datos mock:
Crear al menos 12 productos:
- Transmisión automática Honda Civic 2018
- Computadora de motor Ford F-150 2016
- Faro derecho LED BMW X5 2017
- Motor 2.0L Jetta 2015
- Alternador Nissan Versa 2020
- Caja de dirección Chevrolet Aveo
- Defensa delantera Toyota Corolla
- Radiador Mazda 3
- Marcha Volkswagen Gol
- Bomba de gasolina Sentra
- Módulo ABS Audi A4
- Turbo Ford Ranger

Crear proveedores mock:
- Refaccionaria
- Deshuesadero
- Taller especialista
- Distribuidor nuevo
Con campos:
id, nombre, ciudad, estado, verificado, rating, tiempoRespuesta, aceptaEnvio, aceptaPagoContraEntrega.

Funcionalidad frontend:
- Filtro por categoría.
- Filtro por marca.
- Filtro por condición.
- Ordenar por:
  precio menor
  precio mayor
  más cercano
  proveedor mejor calificado
- Buscador global funcional sobre los datos mock.
- Al dar clic en “Buscar piezas”, mandar a resultados con parámetros.
- Favoritos usando localStorage.
- Vista de detalle con botón:
  “Consultar por WhatsApp”
  “Solicitar disponibilidad”
  “Agregar a favoritos”

Optimización de negocio:
Agregar una sección especial:
“¿No encuentras la pieza?”
Con texto:
“Publica tu búsqueda y nosotros la enviamos a proveedores compatibles.”
Botón:
“Publicar búsqueda”

Formulario publicar búsqueda:
Campos:
- Pieza requerida
- Marca
- Modelo
- Año
- Versión
- Número de parte opcional
- Ciudad
- Urgencia
- Descripción
- Subir imagen opcional, solo UI por ahora
- Botón “Enviar búsqueda”

Importante:
La web no debe parecer una tienda genérica. Debe sentirse como una plataforma que ayuda al cliente a encontrar refacciones difíciles entre muchas refaccionarias, deshuesaderos y proveedores.

UX importante:
- El usuario debe poder buscar en menos de 10 segundos.
- El botón principal siempre debe ser visible.
- En mobile debe sentirse como app.
- La información de precio, disponibilidad y ubicación debe destacar.
- Usar badges claros:
  “Proveedor verificado”
  “Disponible”
  “Pago contra entrega”
  “Envío a todo México”

Estructura sugerida:
src/
  app/
    page.tsx
    resultados/page.tsx
    pieza/[id]/page.tsx
    publicar-busqueda/page.tsx
    favoritos/page.tsx
    cuenta/page.tsx
    proveedor/page.tsx
  components/
    layout/
    search/
    products/
    providers/
    ui/
  data/
    products.ts
    categories.ts
    providers.ts
  types/
    index.ts
  lib/
    filters.ts
    favorites.ts

Entrega:
- Crear todo el código funcional.
- Usar imágenes placeholder elegantes si no hay imágenes reales.
- Dejar la web lista para correr con:
  npm install
  npm run dev
- Cuidar responsive, diseño y consistencia visual.
```

Y este sería el enfoque correcto para tu negocio: **no vender solo piezas**, sino vender “búsqueda rápida de piezas difíciles”. Ahí está el valor.


Toma este como base visual y divídelo en componentes reales.
Crea rutas para resultados, detalle de pieza, publicar búsqueda y favoritos.
Mantén el diseño responsive parecido a la referencia.
Usa datos mock por ahora.
No conectes backend todavía.


<!doctype html>
<html lang="es">
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>Maqueta RepuestosMax</title>
  <style>
    *{box-sizing:border-box} body{margin:0;font-family:Inter,Arial,sans-serif;background:#f5f6f8;color:#111827}
    .header{height:74px;background:#fff;border-bottom:1px solid #eee;position:sticky;top:0;z-index:5}
    .wrap{max-width:1180px;margin:auto;padding:0 20px}
    .header .wrap{height:100%;display:flex;align-items:center;gap:24px}
    .logo{font-weight:900;font-size:22px}.logo span{color:#e32626}.tag{font-size:11px;color:#777;font-weight:500}
    .search{display:flex;flex:1;max-width:650px}.search input{flex:1;border:1px solid #ddd;border-right:0;border-radius:14px 0 0 14px;padding:14px}.search button{border:0;background:#e32626;color:white;padding:0 22px;border-radius:0 14px 14px 0;font-weight:800}
    .toplinks{display:flex;gap:20px;font-size:13px;color:#222}
    .layout{max-width:1180px;margin:auto;display:grid;grid-template-columns:240px 1fr;gap:24px;padding:26px 20px}
    .card{background:#fff;border-radius:24px;box-shadow:0 10px 30px rgba(0,0,0,.05)}
    .side{padding:18px}.side h4,.section-title{font-size:12px;text-transform:uppercase;letter-spacing:.05em;color:#444}
    .cat{display:block;width:100%;border:0;background:white;text-align:left;padding:13px;border-radius:14px;margin:4px 0}.cat.active{background:#fff0f0;color:#e32626;font-weight:800}
    .publish{margin-top:26px;background:#fff1f1;border-radius:20px;padding:18px}.publish button,.primary{background:#e32626;color:white;border:0;border-radius:14px;padding:14px 18px;font-weight:900}
    .hero{overflow:hidden}.hero-top{display:grid;grid-template-columns:1.15fr .85fr;gap:18px;padding:42px}
    h1{font-size:48px;line-height:1.02;margin:0;font-weight:950} h1 span{color:#e32626} p{color:#5f6673}
    .part-img{height:230px;border-radius:28px;background:radial-gradient(circle at 65% 40%,#d7d7d7,transparent 35%),linear-gradient(135deg,#f0f1f3,#c9cbd1);position:relative;overflow:hidden}
    .part-img:after{content:"";position:absolute;right:35px;top:42px;width:170px;height:120px;border-radius:24px;background:#151922;box-shadow:-50px 55px 0 #2b3038,-105px 70px 0 #b8bcc4}
    .searchbox{margin:0 42px 34px;border:1px solid #eee;border-radius:22px;padding:18px}.tabs{display:flex;border-bottom:1px solid #eee;margin-bottom:18px}.tab{padding:13px 24px;font-weight:900}.tab.active{color:#e32626;border-bottom:3px solid #e32626}
    .fields{display:grid;grid-template-columns:repeat(4,1fr);gap:14px}.field label{display:block;font-size:13px;color:#555;margin-bottom:8px}.field div{border:1px solid #ddd;border-radius:14px;padding:14px;color:#888;background:#fff}
    .chips{display:flex;gap:10px;flex-wrap:wrap;margin:14px 0 30px}.chip{background:white;border-radius:999px;padding:10px 15px;font-size:13px;box-shadow:0 8px 18px rgba(0,0,0,.04)}
    .cats{display:grid;grid-template-columns:repeat(6,1fr);gap:12px;margin-bottom:30px}.catcard{padding:16px;text-align:center}.icon{height:58px;width:58px;background:#f0f1f3;border-radius:18px;margin:0 auto 10px}
    .product{display:grid;grid-template-columns:175px 1fr 170px;gap:18px;padding:14px;margin-bottom:14px}.photo{height:145px;border-radius:18px;background:linear-gradient(135deg,#30343b,#c7c9ce)}
    .badge{display:inline-block;background:#fff0f0;color:#e32626;border-radius:999px;padding:6px 10px;font-size:12px;font-weight:800;margin-right:6px}.badge.gray{background:#f0f1f3;color:#555}
    .product h3{margin:12px 0 8px;font-size:18px}.price{font-size:20px;font-weight:950;color:#e32626}.ok{color:#16a34a;font-weight:800;font-size:13px}
    .benefits{max-width:1180px;margin:10px auto 0;padding:0 20px 30px}.benefitgrid{display:grid;grid-template-columns:repeat(4,1fr);gap:12px;padding:24px;text-align:center}
    .footer{background:#111827;color:white;padding:32px 20px}.footer .wrap{color:white}
    .mobile{display:none}
    @media(max-width:850px){
      .header .search,.toplinks,.side,.footer{display:none}.header{height:68px}.layout{display:block;padding:14px}.hero-top{display:block;padding:24px;background:#111827;color:white}.hero-top p{color:#e5e7eb}h1{font-size:30px}.part-img{height:120px;margin-top:18px}.searchbox{margin:0;padding:16px;border-radius:0 0 24px 24px}.fields{grid-template-columns:1fr}.cats{grid-template-columns:repeat(3,1fr)}.product{grid-template-columns:120px 1fr;padding:12px}.product .actions{grid-column:2}.photo{height:120px}.benefitgrid{grid-template-columns:1fr}.mobile{position:fixed;bottom:0;left:0;right:0;background:white;border-top:1px solid #eee;display:grid;grid-template-columns:repeat(5,1fr);padding:8px 0;text-align:center;font-size:12px}.layout{padding-bottom:80px}
    }
  </style>
</head>
<body>
  <header class="header"><div class="wrap">
    <div class="logo"><span>Repuestos</span>Max<div class="tag">Encuentra. Compara. Ahorra.</div></div>
    <div class="search"><input placeholder="Busca por pieza, marca, modelo o número de parte"/><button>🔎</button></div>
    <div class="toplinks"><span>WhatsApp</span><span>Favoritos</span><span>Mi cuenta</span></div>
  </div></header>

  <main class="layout">
    <aside class="side card">
      <h4>Categorías</h4>
      <button class="cat active">Todas las categorías</button><button class="cat">Motor</button><button class="cat">Transmisión</button><button class="cat">Suspensión</button><button class="cat">Frenos</button><button class="cat">Eléctrico</button><button class="cat">Carrocería</button><button class="cat">Enfriamiento</button><button class="cat">Iluminación</button>
      <div class="publish"><b>¿No encuentras la pieza?</b><p>Publica tu búsqueda y los proveedores te responderán.</p><button>Publicar búsqueda</button></div>
    </aside>

    <section>
      <section class="hero card">
        <div class="hero-top">
          <div><h1>Encuentra la pieza que <span>necesitas</span></h1><p>Compara precios, disponibilidad y elige la mejor opción entre refaccionarias, deshuesaderos y proveedores verificados.</p></div>
          <div class="part-img"></div>
        </div>
        <div class="searchbox">
          <div class="tabs"><div class="tab active">Buscar por vehículo</div><div class="tab">N° de parte</div></div>
          <div class="fields">
            <div class="field"><label>Marca</label><div>Selecciona marca</div></div>
            <div class="field"><label>Modelo</label><div>Selecciona modelo</div></div>
            <div class="field"><label>Año</label><div>Selecciona año</div></div>
            <div class="field"><label>Categoría</label><div>Selecciona categoría</div></div>
          </div>
          <button class="primary" style="width:100%;margin-top:18px">Buscar piezas</button>
        </div>
      </section>

      <h4 class="section-title">Búsquedas populares</h4>
      <div class="chips"><span class="chip">Transmisión Honda Civic 2018</span><span class="chip">Computadora Ford F-150</span><span class="chip">Faro BMW X5</span><span class="chip">Motor Jetta 2015</span></div>

      <h4 class="section-title">Categorías destacadas</h4>
      <div class="cats">
        <div class="catcard card"><div class="icon"></div>Motor</div><div class="catcard card"><div class="icon"></div>Transmisión</div><div class="catcard card"><div class="icon"></div>Suspensión</div><div class="catcard card"><div class="icon"></div>Frenos</div><div class="catcard card"><div class="icon"></div>Eléctrico</div><div class="catcard card"><div class="icon"></div>Más</div>
      </div>

      <h4 class="section-title">Resultados destacados</h4>
      <article class="product card"><div class="photo"></div><div><span class="badge">Transmisión</span><span class="badge gray">Usada</span><h3>Transmisión automática Honda Civic 2018</h3><p>📍 Guadalajara, Jalisco</p><div class="ok">● Proveedor verificado</div></div><div class="actions"><div class="price">$18,500 MXN</div><div class="ok">Disponible</div><p>Envío a todo México</p><button class="primary">Ver detalles</button></div></article>
      <article class="product card"><div class="photo"></div><div><span class="badge">Eléctrico</span><span class="badge gray">Usada</span><h3>Computadora de motor Ford F-150 2016</h3><p>📍 Monterrey, Nuevo León</p><div class="ok">● Proveedor verificado</div></div><div class="actions"><div class="price">$7,800 MXN</div><div class="ok">Disponible</div><p>Envío a todo México</p><button class="primary">Ver detalles</button></div></article>
      <article class="product card"><div class="photo"></div><div><span class="badge">Iluminación</span><span class="badge gray">Usada</span><h3>Faro derecho LED BMW X5 2017</h3><p>📍 Tijuana, B.C.</p><div class="ok">● Proveedor verificado</div></div><div class="actions"><div class="price">$6,200 MXN</div><div class="ok">Disponible</div><p>Envío a todo México</p><button class="primary">Ver detalles</button></div></article>
    </section>
  </main>

  <section class="benefits"><div class="benefitgrid card"><div><b>Miles de piezas</b><p>Opciones disponibles</p></div><div><b>Compara precios</b><p>Elige mejor opción</p></div><div><b>Proveedores verificados</b><p>Negocios confiables</p></div><div><b>Envíos a México</b><p>Recibe en tu ciudad</p></div></div></section>
  <footer class="footer"><div class="wrap"><b>RepuestosMax</b><p>Encuentra. Compara. Ahorra.</p></div></footer>
  <nav class="mobile"><div>Inicio</div><div>Buscar</div><div>Favoritos</div><div>Mensajes</div><div>Cuenta</div></nav>
</body>
</html>