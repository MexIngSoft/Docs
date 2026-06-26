-- Nombre buscable: list-users-by-application.sql
-- Objetivo:
--   Saber de que web/API proviene cada usuario registrado en Auth.
-- Base:
--   auth
-- Schema:
--   "Auth"
-- Seguridad:
--   Script de solo lectura. No modifica datos.

SELECT
  u."Id" AS "UserId",
  u."Email",
  u."ApplicationId",
  a."Code" AS "ApplicationCode",
  a."Name" AS "ApplicationName"
FROM "Auth"."UserAccounts" u
LEFT JOIN "Auth"."Applications" a
  ON a."Id" = u."ApplicationId"
ORDER BY a."Code", u."Email";
