BEGIN;

--
-- ACTION ALTER TABLE
--
ALTER TABLE "packages" ALTER COLUMN "createdAt" DROP NOT NULL;
ALTER TABLE "packages" ALTER COLUMN "createdBy" DROP NOT NULL;
ALTER TABLE "packages" ALTER COLUMN "updatedAt" DROP NOT NULL;
ALTER TABLE "packages" ALTER COLUMN "updatedBy" DROP NOT NULL;

--
-- MIGRATION VERSION FOR wm
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('wm', '20251104075153651', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20251104075153651', "timestamp" = now();

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
