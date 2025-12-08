BEGIN;

--
-- ACTION ALTER TABLE
--
ALTER TABLE "menu_items" ADD COLUMN "_menuMenuitemsMenuId" bigint;
--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "menu_items"
    ADD CONSTRAINT "menu_items_fk_1"
    FOREIGN KEY("_menuMenuitemsMenuId")
    REFERENCES "menu"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- MIGRATION VERSION FOR wm
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('wm', '20251030100834120', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20251030100834120', "timestamp" = now();

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
