# Runbook local MexIngSof

## Proyecto canonico

```powershell
cd Docker.WEB.NJ\WEB.NJ.NEXT.MexIngSof
```

## Instalacion

```powershell
npm install
npm run prisma:generate
```

## Base de datos

Crear `.env` desde `.env.example`:

```powershell
Copy-Item .env.example .env
```

Configurar:

```text
DATABASE_URL="postgresql://user:password@localhost:5432/mexingsof"
```

Migrar y sembrar:

```powershell
npx prisma migrate dev --name init
npm run seed
```

## Desarrollo

```powershell
npm run dev
```

Abrir:

```text
http://localhost:3009
```

## Validacion

```powershell
npm run lint
npm run build
```

## Resultado validado 2026-06-18

| Comando | Resultado |
|---|---|
| `npm install` | OK; 2 vulnerabilidades moderadas reportadas por npm audit. |
| `npm run prisma:generate` | OK; Prisma Client v6.19.3 generado. |
| `npm run lint` | OK; TypeScript sin errores. |
| `npm run build` | OK; Next.js compila landing, admin y APIs. |

## Validaciones no ejecutadas

| Comando | Causa |
|---|---|
| `npx prisma migrate dev` | Falta PostgreSQL local configurado para `mexingsof`. |
| `npm run seed` | Depende de migracion/base PostgreSQL disponible. |

## Docker

El proyecto se ejecuta en el Docker web compartido:

```powershell
docker compose -p comercial_platform -f Docker.WEB.NJ\docker-compose.mexingsof.web.yml config --quiet
docker compose -p comercial_platform -f Docker.WEB.NJ\docker-compose.mexingsof.web.yml up -d --build
```

No se debe crear un Docker aislado para MexIngSof. Si al validar este proyecto
se detecta un problema del patron compartido, la correccion debe evaluarse para
los demas proyectos web que usan `Docker.WEB.NJ`.

## Pendientes

- PENDIENTE_DE_DEFINIR: URL y base PostgreSQL local/oficial.
- PENDIENTE_DE_DEFINIR: acceso o creacion del remoto
  `MexIngSoft/WEB.NJ.NEXT.MexIngSof`.
- PENDIENTE_DE_DEFINIR: Auth para admin.
