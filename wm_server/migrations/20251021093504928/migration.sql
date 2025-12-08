BEGIN;

--
-- ACTION ALTER TABLE
--
ALTER TABLE "menu_items" DROP CONSTRAINT "menu_items_fk_1";
ALTER TABLE "menu_items" DROP CONSTRAINT "menu_items_fk_2";
ALTER TABLE "menu_items" DROP COLUMN "createdBy";
ALTER TABLE "menu_items" DROP COLUMN "updatedAt";
ALTER TABLE "menu_items" DROP COLUMN "updatedBy";

--
-- MIGRATION VERSION FOR wm
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('wm', '20251021093504928', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20251021093504928', "timestamp" = now();

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
