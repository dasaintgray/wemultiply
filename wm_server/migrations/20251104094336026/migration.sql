BEGIN;

--
-- ACTION ALTER TABLE
--
ALTER TABLE "reaper_commissions" ADD COLUMN "_packagesPackageidPackagesId" bigint;
--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "reaper_commissions"
    ADD CONSTRAINT "reaper_commissions_fk_3"
    FOREIGN KEY("_packagesPackageidPackagesId")
    REFERENCES "packages"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- MIGRATION VERSION FOR wm
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('wm', '20251104094336026', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20251104094336026', "timestamp" = now();

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
