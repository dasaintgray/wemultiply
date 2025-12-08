BEGIN;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "menu" (
    "id" bigserial PRIMARY KEY,
    "menuName" text NOT NULL,
    "menuItems" json NOT NULL
);

--
-- ACTION CREATE TABLE
--
CREATE TABLE "menu_items" (
    "id" bigserial PRIMARY KEY,
    "menuItemDesc" text NOT NULL,
    "menuItemAction" text NOT NULL,
    "menuItemShortcut" text NOT NULL,
    "menuImagePath" text NOT NULL
);


--
-- MIGRATION VERSION FOR wm
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('wm', '20251020024650671', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20251020024650671', "timestamp" = now();

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
