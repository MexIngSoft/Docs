# Checklist anti-vicios Codex

## Objetivo

Bloquear decisiones repetidas que rompen la arquitectura del ecosistema.

## Checklist obligatorio

Antes de implementar, confirmar:

- [ ] No se crea Gateway por proyecto.
- [ ] No se crea BFF por proyecto.
- [ ] No se crea Docker por proyecto.
- [ ] No se crea Auth por proyecto.
- [ ] No se usa SQLite.
- [ ] No se usa `crejo`.
- [ ] No se crea API duplicada.
- [ ] No se usa mock si existe API real disponible.
- [ ] No se consume integracion externa desde frontend.
- [ ] No se cambia arquitectura sin ADR o decision documentada.
- [ ] No se crea endpoint sin contrato.
- [ ] No se crea proyecto sin `api-dependencies.md` o sin registrar
  `PENDIENTE_DE_DEFINIR`.

## Resultado

Si un punto falla, detener esa parte, documentar contradiccion y aplicar el
estandar canonico vigente.
