BEGIN;

--
-- ACTION ALTER TABLE
--
ALTER TABLE "cart_items" DROP CONSTRAINT "cart_items_fk_2";
ALTER TABLE "cart_items" DROP COLUMN "_cartCartitemsCartId";
ALTER TABLE "cart_items" ADD COLUMN "_cartCartidCartId" bigint;
--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "cart_items"
    ADD CONSTRAINT "cart_items_fk_2"
    FOREIGN KEY("_cartCartidCartId")
    REFERENCES "cart"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- MIGRATION VERSION FOR wm
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('wm', '20251109103243898', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20251109103243898', "timestamp" = now();

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
