Correcto. La documentación ya separa APIs por dominio, schema y responsabilidad clara; ese mismo principio debe aplicarse también a todas las webs. 

Estándar obligatorio para crear Webs y APIs

1. Regla general

Cada web y cada API debe nacer con una estructura mínima obligatoria.

No se debe crear una web solo con páginas, ni una API solo con endpoints.
Todo proyecto debe incluir identidad visual, metadata, configuración, documentación, healthcheck, variables de entorno y estructura preparada para Docker.

---

2. Estándar obligatorio para toda Web

Toda web debe incluir:

Identidad visual

favicon.ico
icon.png
apple-icon.png
logo principal
logo horizontal
logo reducido
imagen Open Graph
imagen Twitter/X card

Metadata obligatoria

Cada web debe definir:

APP_NAME
COMPANY_NAME
APP_SHORT_NAME
APP_DESCRIPTION
APP_DOMAIN
APP_URL
APP_AUTHOR
APP_KEYWORDS
APP_LOCALE
APP_THEME_COLOR
APP_DEFAULT_TITLE
APP_TITLE_TEMPLATE

Ejemplo:

APP_NAME=TecnoTelec
COMPANY_NAME=TecnoTelec
APP_DEFAULT_TITLE=TecnoTelec | Energía, seguridad y tecnología
APP_TITLE_TEMPLATE=%s | TecnoTelec
APP_DESCRIPTION=Soluciones en energía, seguridad, redes y automatización.
APP_THEME_COLOR=#0f172a

---

3. Elementos visibles en navegador

Toda web debe mostrar correctamente:

Icono de pestaña
Título de pestaña
Descripción para buscadores
Color de tema móvil
Imagen al compartir enlace
Nombre de empresa
Nombre corto de app

Si el favicon o título no aparecen, la web se considera incompleta.

---

4. Estructura mínima de proyecto web

Toda web debe tener una estructura similar a:

WEB.NJ.NEXT.<Proyecto>/
├── app/
├── components/
├── config/
│   ├── app.config.ts
│   ├── seo.config.ts
│   ├── theme.config.ts
│   └── routes.config.ts
├── public/
│   ├── favicon.ico
│   ├── icon.png
│   ├── apple-icon.png
│   ├── og-image.png
│   └── logos/
├── services/
├── store/
├── types/
├── middleware.ts
├── next.config.ts
├── package.json
├── .env.example
├── .env.local.example
└── README.md

---

5. Archivo de configuración web

Cada web debe tener un archivo central:

config/app.config.ts

Debe contener:

nombre del proyecto
nombre comercial
descripción
dominio
rutas principales
logo
favicon
tema
idioma
moneda si aplica
país si aplica
gateway base URL

La web no debe tener estos datos regados en componentes.

---

6. Estándar para APIs

Toda API debe incluir:

nombre de API
descripción
versión
dominio funcional
schema/base asignada
healthcheck
documentación OpenAPI/Swagger
variables .env.example
migraciones
logs
permisos
CORS controlado
README técnico
Dockerfile
docker-compose individual

---

7. Metadata obligatoria de API

Cada API debe tener variables como:

API_NAME
API_VERSION
API_DESCRIPTION
API_DOMAIN
API_PORT
API_BASE_PATH
API_HEALTH_PATH
API_DOCS_PATH
API_SCHEMA_NAME
API_DATABASE_NAME

Ejemplo:

API_NAME=Catalog API
API_VERSION=1.0.0
API_DOMAIN=comercial
API_SCHEMA_NAME=catalog
API_DATABASE_NAME=comercial
API_HEALTH_PATH=/api/health/
API_DOCS_PATH=/api/docs/

---

8. Estructura mínima de API Django

API.PY.DJANGO.<Api>/
├── apps/
├── config/
│   ├── settings/
│   ├── urls.py
│   └── wsgi.py
├── docs/
├── scripts/
├── tests/
├── manage.py
├── Dockerfile
├── docker-compose.<api>.yml
├── .env.example
├── .env.local.example
└── README.md

---

9. Regla de documentación

Cada web debe documentar:

qué representa
qué gateway consume
qué APIs necesita
qué variables usa
qué favicon/logos usa
cómo correrla sola
cómo correrla con Docker
cómo correrla dentro del ecosistema completo

Cada API debe documentar:

qué dominio resuelve
qué tablas o schema usa
qué endpoints expone
qué permisos requiere
qué APIs consume
cómo correrla sola
cómo correrla con Docker
cómo integrarla al compose general

---

10. Regla para nuevas webs

Antes de considerar terminada una web, debe validarse:

favicon visible
title correcto
metadata completa
logo correcto
Open Graph correcto
variables completas
gateway configurado
Docker individual funcional
Docker master compatible
README actualizado

---

11. Regla para nuevas APIs

Antes de considerar terminada una API, debe validarse:

healthcheck funcionando
Swagger/OpenAPI disponible
variables completas
migraciones funcionando
logs funcionando
Docker individual funcional
Docker master compatible
README actualizado

---

12. Regla final

Toda web y toda API deben ser creadas como proyectos completos, no como archivos sueltos.

Una web sin favicon, metadata, título, configuración central y documentación no está terminada.

Una API sin healthcheck, documentación, variables, logs, migraciones y Docker propio no está terminada.