BEGIN;

--
-- ACTION ALTER TABLE
--
--
-- ACTION ALTER TABLE
--
--
-- ACTION ALTER TABLE
--
--
-- ACTION CREATE TABLE
--
CREATE TABLE "menu_items" (
    "id" bigserial PRIMARY KEY,
    "menuId" bigint NOT NULL,
    "menuItemDesc" text NOT NULL,
    "menuItemAction" text NOT NULL,
    "menuItemImagePath" text NOT NULL,
    "isActive" boolean NOT NULL,
    "createdAt" timestamp without time zone NOT NULL,
    "_menuMenuitemsMenuId" bigint
);

--
-- ACTION ALTER TABLE
--
--
-- ACTION ALTER TABLE
--
--
-- ACTION ALTER TABLE
--
CREATE UNIQUE INDEX "product_idx" ON "products" USING btree ("id");
--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "addresses"
    ADD CONSTRAINT "addresses_fk_0"
    FOREIGN KEY("userId")
    REFERENCES "users"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "commission_rules"
    ADD CONSTRAINT "commission_rules_fk_0"
    FOREIGN KEY("rankId")
    REFERENCES "ranks"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "golden_seats"
    ADD CONSTRAINT "golden_seats_fk_0"
    FOREIGN KEY("ownerId")
    REFERENCES "users"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
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
    FOREIGN KEY("_menuMenuitemsMenuId")
    REFERENCES "menu"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "packages"
    ADD CONSTRAINT "packages_fk_0"
    FOREIGN KEY("gsID")
    REFERENCES "golden_seats"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "pioneer_accounts"
    ADD CONSTRAINT "pioneer_accounts_fk_1"
    FOREIGN KEY("userId")
    REFERENCES "users"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- MIGRATION VERSION FOR wm
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('wm', '20251102082221980', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20251102082221980', "timestamp" = now();

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

--
-- MIGRATION VERSION FOR _repair
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('_repair', '20251102082611382', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20251102082611382', "timestamp" = now();


COMMIT;
