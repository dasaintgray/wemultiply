BEGIN;

--
-- ACTION ALTER TABLE
--
ALTER TABLE "cart" DROP COLUMN "sessionID";

--
-- MIGRATION VERSION FOR wm
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('wm', '20251109232844934', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20251109232844934', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20240516151843329', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240516151843329', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod_auth
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod_auth', '20240520102713718', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240520102713718', "timestamp" = now();


COMMIT;
