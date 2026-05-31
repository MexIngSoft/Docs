Esto ya no es un listado de páginas. Esto es la **arquitectura de navegación completa (UX Flow + Sitemap + User Journey)** de IMAGRAFITY.

La regla principal debe ser:

> Ninguna página debe quedar aislada.
>
> El usuario siempre debe saber:
>
> * Dónde está.
> * Cómo regresar.
> * Qué puede hacer después.
> * Cómo comprar.
> * Cómo personalizar.
> * Cómo contactar.
> * Cómo ver sus pedidos.

---

# NIVEL 1 (NAVEGACIÓN PRINCIPAL)

Navbar global presente en casi todo el sitio.

```text
IMAGRAFITY LOGO
│
├── Inicio
├── Productos
├── Personalizar
├── Inspiración
├── Empresas
├── Blog
├── Contacto
│
├── Buscar
├── Favoritos
├── Carrito
└── Mi Cuenta
```

---

# ÁRBOL GENERAL

```text
Inicio
│
├── Productos
│
├── Personalizar
│
├── Inspiración
│
├── Empresas
│
├── Blog
│
├── Contacto
│
├── Favoritos
│
├── Carrito
│
└── Mi Cuenta
```

---

# FLUJO DESDE INICIO

```text
Inicio
│
├── Ver Productos
├── Diseñar Ahora
├── Ver Inspiración
├── Ver Empresas
├── Ver Promociones
├── Login
└── Registro
```

---

# PRODUCTOS

```text
Productos
│
├── Ropa
├── Tazas
├── Llaveros
├── Decoración
├── Oficina
├── Tecnología
├── Premium
└── Ver Todo
```

---

# DENTRO DE UNA CATEGORÍA

```text
Categoría
│
├── Filtros
├── Ordenar
│
├── Producto A
├── Producto B
├── Producto C
│
└── Volver Productos
```

Breadcrumb:

```text
Inicio
>
Productos
>
Tazas
```

---

# DETALLE DEL PRODUCTO

```text
Producto
│
├── Personalizar
├── Agregar Carrito
├── Comprar Ahora
├── Favoritos
├── Compartir
│
├── Productos Relacionados
├── Opiniones
└── Regresar Categoría
```

Breadcrumb:

```text
Inicio
>
Productos
>
Tazas
>
Taza Mágica
```

---

# PERSONALIZADOR

Puede entrar desde:

```text
Inicio
Producto
Galería
Diseño Guardado
```

Flujo:

```text
Personalizador
│
├── Subir Imagen
├── Agregar Texto
├── IA Diseño
├── Plantillas
├── Efectos
│
├── Guardar Diseño
├── Vista 3D
├── Mockup
│
├── Agregar Carrito
└── Comprar
```

Botones inferiores:

```text
← Volver Producto

Guardar

Continuar →
```

---

# CARRITO

Acceso:

```text
Navbar
Detalle Producto
Personalizador
```

Flujo:

```text
Carrito
│
├── Editar Producto
├── Editar Diseño
├── Cambiar Cantidad
├── Eliminar
│
├── Seguir Comprando
└── Continuar Pago
```

---

# CHECKOUT

```text
Checkout
│
├── Datos Cliente
│
├── Dirección
│
├── Envío
│
├── Pago
│
└── Confirmar
```

Siempre:

```text
Atrás
Siguiente
```

---

# PERFIL

```text
Mi Cuenta
│
├── Dashboard
├── Pedidos
├── Diseños
├── Favoritos
├── Direcciones
├── Pagos
├── Facturas
├── Soporte
└── Configuración
```

---

# PEDIDOS

```text
Pedidos
│
├── Pedido 1001
├── Pedido 1002
├── Pedido 1003
│
└── Volver Dashboard
```

---

# DETALLE PEDIDO

```text
Pedido
│
├── Tracking
├── Factura
├── Reordenar
├── Descargar Diseño
│
└── Volver Pedidos
```

---

# DISEÑOS GUARDADOS

```text
Diseños
│
├── Editar
├── Duplicar
├── Comprar
├── Compartir
│
└── Eliminar
```

---

# FAVORITOS

```text
Favoritos
│
├── Producto
├── Diseño
├── Colección
│
└── Comprar
```

---

# INSPIRACIÓN

```text
Inspiración
│
├── Galería
├── Tendencias
├── Comunidad
├── Historias
│
└── Crear Diseño Similar
```

Este último es importante:

```text
Galería
↓
Diseño
↓
Me gusta
↓
Crear parecido
↓
Personalizador
```

---

# COMUNIDAD

```text
Comunidad
│
├── Testimonios
├── Embajadores
├── Concursos
├── Diseños
│
└── Publicar Diseño
```

---

# BLOG

```text
Blog
│
├── Artículos
├── Tutoriales
├── Materiales
├── Efectos
├── IA
│
└── Buscar
```

---

# EMPRESAS

```text
Empresas
│
├── Branding
├── Uniformes
├── Kits
├── Promocionales
│
├── Solicitar Cotización
│
└── Contactar Asesor
```

---

# CONTACTO

```text
Contacto
│
├── Formulario
├── WhatsApp
├── Correo
├── Facebook
├── Instagram
│
└── Mapa
```

---

# LOGIN

```text
Login
│
├── Correo
├── Google
├── Facebook
│
├── Crear Cuenta
└── Recuperar Contraseña
```

---

# REGISTRO

```text
Registro
│
├── Datos
├── Verificación
│
└── Dashboard
```

---

# BUSCADOR GLOBAL

Debe ser accesible desde toda la web.

Puede devolver:

```text
Producto
Categoría
Diseño
Artículo
Tutorial
Empresa
```

---

# NAVEGACIÓN REAL COMPLETA

```text
Inicio
│
├── Productos
│   ├── Categoría
│   │   ├── Producto
│   │   │   ├── Personalizar
│   │   │   ├── Carrito
│   │   │   └── Comprar
│
├── Personalizar
│   ├── Diseñar
│   ├── Guardar
│   ├── Carrito
│   └── Comprar
│
├── Inspiración
│   ├── Galería
│   ├── Comunidad
│   └── Crear Similar
│
├── Empresas
│   ├── Servicios
│   ├── Cotización
│   └── Asesor
│
├── Blog
│   ├── Tutoriales
│   ├── Guías
│   └── Artículos
│
├── Contacto
│
├── Favoritos
│
├── Carrito
│   └── Checkout
│
└── Mi Cuenta
    ├── Pedidos
    ├── Diseños
    ├── Pagos
    ├── Direcciones
    ├── Facturas
    └── Soporte
```

Si hablamos de una versión profesional lista para producción, después de estas 20 páginas todavía faltaría diseñar el **árbol del ERP administrativo**, que sería otro mapa completo separado para:

```text
Administración
│
├── Dashboard
├── Pedidos
├── Producción
├── Diseños
├── Productos
├── Inventario
├── Clientes
├── Empresas
├── Cotizaciones
├── Pagos
├── Facturación
├── Envíos
├── Blog
├── Comunidad
├── Cupones
├── Marketing
├── Soporte
├── Reportes
└── Configuración
```

Ese ERP realmente es el cerebro que conecta toda la navegación pública que acabamos de definir.
