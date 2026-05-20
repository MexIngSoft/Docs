# LexNova Case Participants and Access

## Estado

ACTIVE

## Objetivo

Definir el contrato inicial para que un expediente no pertenezca a un solo
usuario, sino a una red de personas, usuarios y participantes con permisos
distintos.

## Regla central

LexNova separa tres conceptos:

- `User`: cuenta autenticada en Auth.
- `Person`: persona real relacionada juridicamente con el expediente.
- `CaseParticipant`: relacion entre caso, persona, usuario opcional, rol,
  autorizacion y permisos.

No todos los participantes tienen cuenta. No todos los usuarios representan a
la misma persona en todos los casos.

## Modelo implementado

Implementado en:

```text
Docker.API.PY/API.PY.DJANGO.LexNova/apps/legal_workspace
```

Tablas agregadas:

| Schema | Tabla | Uso |
|---|---|---|
| `Cases` | `CaseParticipants` | Participantes del expediente, con `PersonId` opcional y `UserId` logico hacia Auth. |
| `Cases` | `CaseParticipantAuthorizations` | Autorizaciones explicitas entre participantes. |
| `Documents` | `CaseDocumentAccessPolicies` | Privacidad y visibilidad por documento dentro del caso. |
| `Cases` | `CaseAccessAuditEvents` | Historial de acceso, consulta, descarga o modificacion. |

Endpoint MVP expuesto por Gateway:

```text
GET /api/lexnova/participants/
GET /api/lexnova/participants/?case_id={id}
```

## Categorias de participantes

```text
LEGAL
FAMILY_AUTHORIZED
PROCEDURAL
INTERNAL
OTHER
```

Ejemplos:

- Abogado defensor.
- Asesor juridico.
- Analista juridico.
- Ministerio Publico.
- Perito.
- Victima.
- Imputado.
- Quejoso.
- Tercero interesado.
- Madre, padre, hermano, tutor o familiar autorizado.

## Estados de vinculacion

```text
PENDING
INVITED
ACTIVE
SUSPENDED
REVOKED
```

## Alcances de autorizacion

```text
TRACKING
DOCUMENT_UPLOAD
DOCUMENT_VIEW
LEGAL_REVIEW
REPRESENTATION
SIGNATURE
ADMINISTRATION
```

Una victima o titular procesal puede autorizar a familiares, representantes o
abogados para ver seguimiento, subir documentos, revisar documentos o actuar en
representacion, segun corresponda.

## Privacidad documental

Visibilidades iniciales:

```text
PUBLIC_TO_CASE
PARTICIPANTS_ONLY
LEGAL_TEAM_ONLY
VICTIM_ONLY
CUSTOM
```

Regla:

- Un documento interno puede quedar solo para abogados y analistas.
- Un documento psicologico puede quedar visible solo para victima y abogado.
- Un familiar autorizado no debe heredar acceso total por defecto.
- Cada excepcion debe dejar razon, usuario creador y auditoria.

## Auditoria

Cada acceso sensible debe poder registrarse con:

- caso,
- participante,
- usuario Auth,
- documento,
- tipo de evento,
- fecha,
- IP,
- dispositivo o user agent,
- metadata.

Esto es obligatorio por el tipo de informacion manejada: carpetas de
investigacion, violencia familiar, menores, domicilios, telefonos, medidas de
proteccion y datos sensibles.

## Informacion faltante

Antes de produccion falta definir:

| Tema | Falta definir |
|---|---|
| Identidad legal | Documento o flujo para validar que quien autoriza es titular, victima, representante o persona legitimada. |
| Invitaciones | Caducidad, reenvio, revocacion y vinculacion automatica con Auth. |
| Consentimiento | Formato juridico de autorizacion y evidencia documental que lo respalda. |
| Acceso temporal | Duracion, renovacion y reglas para vinculos compartidos. |
| Perfiles por vista | Matriz final de campos visibles para cliente, familiar, abogado, analista, administrador y perfiles futuros. |
| Auditoria productiva | Politica de retencion, exportacion y alertas por acceso anomalo. |
| Privacidad fina | Catalogo final de documentos sensibles por materia y rol procesal. |

## Criterio de evolucion

Este MVP prepara la estructura sin cerrar todavia los flujos productivos de
invitacion, consentimiento, firma o portal colaborativo. Esos flujos deben
implementarse sobre estas tablas o sobre una evolucion compatible del mismo
contrato.
