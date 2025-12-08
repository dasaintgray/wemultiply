BEGIN;

--
-- ACTION DROP TABLE
--
DROP TABLE "sales_items" CASCADE;

--
-- ACTION DROP TABLE
--
DROP TABLE "commissions" CASCADE;

--
-- ACTION DROP TABLE
--
DROP TABLE "sales" CASCADE;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "commissions" (
    "id" bigserial PRIMARY KEY,
    "saleId" bigint NOT NULL,
    "recipientId" bigint NOT NULL,
    "sourceLevel" bigint NOT NULL,
    "commissionType" text NOT NULL,
    "commissionAmount" double precision NOT NULL,
    "isPaid" boolean NOT NULL,
    "paidAt" timestamp without time zone,
    "createdAt" timestamp without time zone NOT NULL
);

--
-- ACTION CREATE TABLE
--
CREATE TABLE "sale" (
    "id" bigserial PRIMARY KEY,
    "saleNumber" text NOT NULL,
    "saleDate" timestamp without time zone NOT NULL,
    "buyerId" bigint NOT NULL,
    "packageId" bigint NOT NULL,
    "saleType" text NOT NULL,
    "amount" double precision NOT NULL,
    "status" text NOT NULL
);

--
-- ACTION CREATE TABLE
--
CREATE TABLE "sale_items" (
    "id" bigserial PRIMARY KEY,
    "saleId" bigint NOT NULL,
    "productId" bigint NOT NULL,
    "productName" text NOT NULL,
    "quantity" bigint NOT NULL,
    "price" double precision NOT NULL,
    "lineTotal" double precision NOT NULL,
    "_saleSalesitemsSaleId" bigint
);

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "commissions"
    ADD CONSTRAINT "commissions_fk_0"
    FOREIGN KEY("saleId")
    REFERENCES "sale"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "commissions"
    ADD CONSTRAINT "commissions_fk_1"
    FOREIGN KEY("recipientId")
    REFERENCES "users"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "sale"
    ADD CONSTRAINT "sale_fk_0"
    FOREIGN KEY("buyerId")
    REFERENCES "users"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "sale"
    ADD CONSTRAINT "sale_fk_1"
    FOREIGN KEY("packageId")
    REFERENCES "membership_packages"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "sale_items"
    ADD CONSTRAINT "sale_items_fk_0"
    FOREIGN KEY("saleId")
    REFERENCES "sale"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "sale_items"
    ADD CONSTRAINT "sale_items_fk_1"
    FOREIGN KEY("productId")
    REFERENCES "products"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "sale_items"
    ADD CONSTRAINT "sale_items_fk_2"
    FOREIGN KEY("_saleSalesitemsSaleId")
    REFERENCES "sale"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;


--
-- MIGRATION VERSION FOR wm
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('wm', '20251031071659587', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20251031071659587', "timestamp" = now();

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
