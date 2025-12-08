BEGIN;

--
-- ACTION ALTER TABLE
--
ALTER TABLE "cart_items" DROP CONSTRAINT "cart_items_fk_2";
ALTER TABLE "cart_items" DROP COLUMN "_cartCartidCartId";
ALTER TABLE "cart_items" ADD COLUMN "_cartCartitemsCartId" bigint;
--
-- ACTION CREATE TABLE
--
CREATE TABLE "order_items" (
    "id" bigserial PRIMARY KEY,
    "orderId" bigint NOT NULL,
    "productId" bigint NOT NULL,
    "quantity" bigint NOT NULL,
    "unitPrice" double precision NOT NULL,
    "totalPrice" double precision NOT NULL,
    "createdAt" timestamp without time zone NOT NULL,
    "updatedAt" timestamp without time zone NOT NULL,
    "_ordersOrderitemsOrdersId" bigint
);

-- Indexes
CREATE UNIQUE INDEX "order_item_idx" ON "order_items" USING btree ("orderId", "productId");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "orders" (
    "id" bigserial PRIMARY KEY,
    "userID" bigint NOT NULL,
    "cartId" bigint NOT NULL,
    "status" text NOT NULL,
    "currency" text NOT NULL,
    "subtotal" double precision NOT NULL,
    "taxTotal" double precision NOT NULL,
    "shippingTotal" double precision NOT NULL,
    "discountTotal" double precision NOT NULL,
    "grandTotal" double precision NOT NULL,
    "paymentMethod" text NOT NULL,
    "createdAt" timestamp without time zone NOT NULL,
    "updatedAt" timestamp without time zone NOT NULL
);

-- Indexes
CREATE INDEX "order_user_idx" ON "orders" USING btree ("userID");

--
-- ACTION ALTER TABLE
--
ALTER TABLE "uela" ADD COLUMN "_menuEulaitemsMenuId" bigint;
--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "cart_items"
    ADD CONSTRAINT "cart_items_fk_2"
    FOREIGN KEY("_cartCartitemsCartId")
    REFERENCES "cart"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "order_items"
    ADD CONSTRAINT "order_items_fk_0"
    FOREIGN KEY("orderId")
    REFERENCES "orders"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "order_items"
    ADD CONSTRAINT "order_items_fk_1"
    FOREIGN KEY("productId")
    REFERENCES "products"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "order_items"
    ADD CONSTRAINT "order_items_fk_2"
    FOREIGN KEY("_ordersOrderitemsOrdersId")
    REFERENCES "orders"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "orders"
    ADD CONSTRAINT "orders_fk_0"
    FOREIGN KEY("userID")
    REFERENCES "serverpod_user_info"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "orders"
    ADD CONSTRAINT "orders_fk_1"
    FOREIGN KEY("cartId")
    REFERENCES "cart"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "uela"
    ADD CONSTRAINT "uela_fk_0"
    FOREIGN KEY("_menuEulaitemsMenuId")
    REFERENCES "menu"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- MIGRATION VERSION FOR wm
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('wm', '20251111074605155', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20251111074605155', "timestamp" = now();

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
