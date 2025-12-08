BEGIN;

--
-- ACTION DROP TABLE
--
DROP TABLE "cart_item" CASCADE;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "cart_items" (
    "id" bigserial PRIMARY KEY,
    "cartId" bigint NOT NULL,
    "productId" bigint NOT NULL,
    "quantity" bigint NOT NULL,
    "unitPrice" double precision NOT NULL,
    "totalPrice" double precision NOT NULL,
    "createdAt" timestamp without time zone NOT NULL,
    "updatedAt" timestamp without time zone NOT NULL,
    "_cartCartitemsCartId" bigint
);

-- Indexes
CREATE UNIQUE INDEX "cart_item_idx" ON "cart_items" USING btree ("cartId", "productId");

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "cart_items"
    ADD CONSTRAINT "cart_items_fk_0"
    FOREIGN KEY("cartId")
    REFERENCES "cart"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "cart_items"
    ADD CONSTRAINT "cart_items_fk_1"
    FOREIGN KEY("productId")
    REFERENCES "products"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "cart_items"
    ADD CONSTRAINT "cart_items_fk_2"
    FOREIGN KEY("_cartCartitemsCartId")
    REFERENCES "cart"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;


--
-- MIGRATION VERSION FOR wm
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('wm', '20251109102107248', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20251109102107248', "timestamp" = now();

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
