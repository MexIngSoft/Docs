# Runbook local MexIngSof

## Proyecto actual

```powershell
cd Docs\agents\mexingsof-page\mexingsof-page
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
http://localhost:3000
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

## Pendientes

- PENDIENTE_DE_DEFINIR: URL y base PostgreSQL local/oficial.
- PENDIENTE_DE_DEFINIR: puerto canonico si se promueve a `Docker.WEB.NJ`.
- PENDIENTE_DE_DEFINIR: Auth para admin.
