# LexNova Process Tracking

## Decision

The client experience must be centered on cases, not on a separate results
module. A user opens a case and sees the operational detail, evidence status,
process timeline, pending actions and final result in the same case detail view.

The current frontend keeps technical routes for compatibility, but navigation
must expose Cases as the main entry point. Results are treated as the case
detail outcome.

## Case Sections

Cases must support multiple legal sections inside one workspace:

- Carpeta de investigacion.
- Causa penal.
- Juicio oral.
- Incidencias.
- Amparo.
- Derechos humanos.
- Civil, familiar, mercantil, administrativo and other future matters.

The section is metadata for classification, filtering and process tracking. It
must not force users to choose technical database concepts.

## Evidence Upload Experience

The upload screen must ask only:

- Evidence type.
- Evidence source.
- File or external provider.

Supported source families:

- Local device.
- Google Drive.
- Dropbox.
- Mega.
- OneDrive.
- External link.

Technical choices such as OCR, transcription, storage, hashing, custody,
section insertion and classification queue belong to operational profiles.

## Post Upload Queue

After upload, every file enters an operational queue:

1. `PENDING_CLASSIFICATION`: assigned profile classifies the file.
2. `TEXT_EXTRACTION`: unreadable text is sent to Document API for OCR or text
   extraction.
3. `SECTION_INSERT`: extracted content is inserted into case sections when the
   file structure allows it.
4. `READY_FOR_REVIEW`: the evidence is ready for legal reading and case result.

## User Process Tracking

The user must always see what is happening in the procedure:

- What was uploaded.
- What is being classified.
- What is waiting for human review.
- What text extraction or OCR is pending.
- What evidence is already part of the case.
- What action is expected from the user, operator or legal profile.
- What result is available and what still needs validation.

This area is intentionally documented as a product requirement first. The final
data model can be connected to `TimelineEvents`, `DigitalAssets`,
classification history and review records as the backend matures.

## Profile Scope

The profile view remains intentionally small:

- Current profile type.
- User first name and last name.
- Password change action.
- Registration date when Auth exposes it.

If a user has multiple profiles, the dashboard must show the active profile and
allow switching from the profile label without leaving the dashboard.
