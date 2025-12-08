BEGIN;

--
-- ACTION DROP TABLE
--
DROP TABLE "menu_items" CASCADE;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "menu_items" (
    "id" bigserial PRIMARY KEY,
    "menuItemDesc" text NOT NULL,
    "menuItemAction" text NOT NULL,
    "menuItemImagePath" text NOT NULL,
    "isActive" boolean NOT NULL,
    "createdAt" timestamp without time zone NOT NULL,
    "createdBy" bigint NOT NULL,
    "updatedAt" timestamp without time zone NOT NULL,
    "updatedBy" bigint NOT NULL
);

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "menu_items"
    ADD CONSTRAINT "menu_items_fk_0"
    FOREIGN KEY("createdBy")
    REFERENCES "users"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "menu_items"
    ADD CONSTRAINT "menu_items_fk_1"
    FOREIGN KEY("updatedBy")
    REFERENCES "users"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;


--
-- MIGRATION VERSION FOR wm
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('wm', '20251021012754799', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20251021012754799', "timestamp" = now();

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
