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
    "menuId" bigint NOT NULL,
    "menuItemDesc" text NOT NULL,
    "menuItemImage" text NOT NULL,
    "isActive" boolean NOT NULL,
    "createdAt" timestamp without time zone NOT NULL,
    "productID" bigint NOT NULL,
    "productDesc" text NOT NULL,
    "price" double precision NOT NULL,
    "_menuMenuitemsMenuId" bigint
);

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "menu_items"
    ADD CONSTRAINT "menu_items_fk_0"
    FOREIGN KEY("menuId")
    REFERENCES "menu"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "menu_items"
    ADD CONSTRAINT "menu_items_fk_1"
    FOREIGN KEY("productID")
    REFERENCES "products"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "menu_items"
    ADD CONSTRAINT "menu_items_fk_2"
    FOREIGN KEY("_menuMenuitemsMenuId")
    REFERENCES "menu"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;


--
-- MIGRATION VERSION FOR wm
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('wm', '20251102084012557', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20251102084012557', "timestamp" = now();

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
