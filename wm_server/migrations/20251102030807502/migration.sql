BEGIN;

--
-- ACTION DROP TABLE
--
DROP TABLE "cart_items" CASCADE;

--
-- ACTION DROP TABLE
--
DROP TABLE "cart" CASCADE;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "cart" (
    "id" bigserial PRIMARY KEY,
    "userID" bigint NOT NULL,
    "sessionID" text NOT NULL,
    "status" text NOT NULL,
    "currency" text NOT NULL,
    "totalItems" double precision NOT NULL,
    "subtotal" double precision NOT NULL,
    "discountTotal" double precision NOT NULL,
    "taxTotal" double precision NOT NULL,
    "shippingTotal" double precision NOT NULL,
    "grandTotal" double precision NOT NULL,
    "couponCode" text NOT NULL,
    "createdAt" timestamp without time zone NOT NULL,
    "updatedAt" timestamp without time zone NOT NULL,
    "expiresAt" timestamp without time zone NOT NULL,
    "notes" text NOT NULL,
    "isActive" boolean NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "cart_user_idx" ON "cart" USING btree ("userID");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "cart_item" (
    "id" bigserial PRIMARY KEY,
    "cartId" bigint NOT NULL,
    "productId" bigint NOT NULL,
    "variantId" bigint NOT NULL,
    "productName" text NOT NULL,
    "productImage" text NOT NULL,
    "quantity" bigint NOT NULL,
    "price" double precision NOT NULL,
    "discount" double precision NOT NULL,
    "tax" double precision NOT NULL,
    "subtotal" double precision NOT NULL,
    "metadata" text NOT NULL,
    "addedAt" timestamp without time zone NOT NULL,
    "updatedAt" timestamp without time zone NOT NULL,
    "notes" text NOT NULL,
    "isGift" boolean NOT NULL,
    "shippingAddressID" bigint NOT NULL,
    "paymentMethod" text NOT NULL,
    "cartSource" text NOT NULL,
    "idempotencyKey" text NOT NULL,
    "_cartCartitemsCartId" bigint
);

-- Indexes
CREATE INDEX "cart_item_cart_idx" ON "cart_item" USING btree ("cartId");

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "cart"
    ADD CONSTRAINT "cart_fk_0"
    FOREIGN KEY("userID")
    REFERENCES "serverpod_user_info"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "cart_item"
    ADD CONSTRAINT "cart_item_fk_0"
    FOREIGN KEY("cartId")
    REFERENCES "cart"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "cart_item"
    ADD CONSTRAINT "cart_item_fk_1"
    FOREIGN KEY("productId")
    REFERENCES "products"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "cart_item"
    ADD CONSTRAINT "cart_item_fk_2"
    FOREIGN KEY("_cartCartitemsCartId")
    REFERENCES "cart"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;


--
-- MIGRATION VERSION FOR wm
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('wm', '20251102030807502', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20251102030807502', "timestamp" = now();

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
