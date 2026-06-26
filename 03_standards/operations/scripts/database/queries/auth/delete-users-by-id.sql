-- Nombre buscable: delete-users-by-id.sql
-- Objetivo:
--   Plantilla administrativa para eliminar usuarios Auth por Id.
-- Base:
--   auth
-- Schema:
--   "Auth"
-- Advertencia:
--   No ejecutar sin reemplazar los IDs placeholder y validar dependencias.
--   Para operacion normal, preferir el comando Django:
--   /usr/src/api/start.sh manage auth delete_auth_user --email <correo> --application-code <APP> --confirm
--   Documentacion:
--   Docs/01_core_erp/auth/user-application-traceability.md

BEGIN;

DO $$
DECLARE
    UserIdToDelete BIGINT;
    UserCount INTEGER;
BEGIN

    ----------------------------------------------------------------------
    -- Usuarios a eliminar
    ----------------------------------------------------------------------

    CREATE TEMP TABLE UsersToDelete
    (
        UserId BIGINT PRIMARY KEY
    ) ON COMMIT DROP;

    INSERT INTO UsersToDelete (UserId)
    VALUES
        (123),
        (456);
        -- Agregar mas IDs aqui

    ----------------------------------------------------------------------
    -- Validacion de seguridad
    ----------------------------------------------------------------------

    SELECT COUNT(*)
    INTO UserCount
    FROM UsersToDelete;

    IF UserCount = 0 THEN
        RAISE EXCEPTION 'No users were provided for deletion.';
    END IF;

    ----------------------------------------------------------------------
    -- Eliminacion usuario por usuario
    ----------------------------------------------------------------------

    FOR UserIdToDelete IN
        SELECT UserId
        FROM UsersToDelete
        ORDER BY UserId
    LOOP

        RAISE NOTICE 'Deleting UserId: %', UserIdToDelete;

        DELETE FROM "Auth"."PasswordHistory"
        WHERE "UserId" = UserIdToDelete;

        DELETE FROM "Auth"."UserRoles"
        WHERE "UserId" = UserIdToDelete;

        DELETE FROM "Auth"."EmailDeliveryLogs"
        WHERE "UserId" = UserIdToDelete;

        DELETE FROM "Auth"."UserAccounts"
        WHERE "Id" = UserIdToDelete;

        RAISE NOTICE 'UserId % deleted successfully.', UserIdToDelete;

    END LOOP;

END $$;

COMMIT;
