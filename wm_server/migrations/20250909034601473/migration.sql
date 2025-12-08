BEGIN;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "cdnconfig" (
    "id" bigserial PRIMARY KEY,
    "type" text NOT NULL,
    "domain" text NOT NULL,
    "urlpath" text NOT NULL
);

--
-- ACTION CREATE TABLE
--
CREATE TABLE "commission_rules" (
    "id" bigserial PRIMARY KEY,
    "rankId" bigint NOT NULL,
    "level" bigint NOT NULL,
    "commissionRate" double precision NOT NULL,
    "commissionType" text NOT NULL
);

--
-- ACTION CREATE TABLE
--
CREATE TABLE "commissions" (
    "id" bigserial PRIMARY KEY,
    "distributorId" bigint NOT NULL,
    "commissionAmount" double precision NOT NULL,
    "payoutDate" timestamp without time zone NOT NULL
);

--
-- ACTION CREATE TABLE
--
CREATE TABLE "distributors" (
    "id" bigserial PRIMARY KEY,
    "distributorName" text NOT NULL,
    "email" text NOT NULL,
    "uplineId" bigint NOT NULL,
    "joinDate" timestamp without time zone NOT NULL,
    "currentRankId" bigint NOT NULL,
    "isActive" boolean NOT NULL
);

--
-- ACTION CREATE TABLE
--
CREATE TABLE "ranks" (
    "id" bigserial PRIMARY KEY,
    "rankName" text NOT NULL,
    "rankCategory" text NOT NULL,
    "minPersonalSalesTarget" bigint NOT NULL,
    "minGroupSalesTarget" bigint NOT NULL,
    "minDirectRecruits" bigint NOT NULL
);

--
-- ACTION CREATE TABLE
--
CREATE TABLE "sales" (
    "id" bigserial PRIMARY KEY,
    "productId" bigint NOT NULL,
    "distributorId" bigint NOT NULL,
    "saleDate" timestamp without time zone NOT NULL,
    "quantity" bigint NOT NULL,
    "totalAmount" double precision NOT NULL
);

--
-- ACTION CREATE TABLE
--
CREATE TABLE "sales_items" (
    "id" bigserial PRIMARY KEY,
    "saleId" bigint NOT NULL,
    "productId" bigint NOT NULL,
    "itemQuantity" bigint NOT NULL,
    "itemPrice" double precision NOT NULL,
    "itemTotal" double precision NOT NULL
);

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
ALTER TABLE ONLY "commissions"
    ADD CONSTRAINT "commissions_fk_0"
    FOREIGN KEY("distributorId")
    REFERENCES "distributors"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "distributors"
    ADD CONSTRAINT "distributors_fk_0"
    FOREIGN KEY("currentRankId")
    REFERENCES "ranks"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "sales"
    ADD CONSTRAINT "sales_fk_0"
    FOREIGN KEY("productId")
    REFERENCES "products"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "sales"
    ADD CONSTRAINT "sales_fk_1"
    FOREIGN KEY("distributorId")
    REFERENCES "distributors"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "sales_items"
    ADD CONSTRAINT "sales_items_fk_0"
    FOREIGN KEY("saleId")
    REFERENCES "sales"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "sales_items"
    ADD CONSTRAINT "sales_items_fk_1"
    FOREIGN KEY("productId")
    REFERENCES "products"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;


--
-- MIGRATION VERSION FOR wm
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('wm', '20250909034601473', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20250909034601473', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20240516151843329', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240516151843329', "timestamp" = now();


COMMIT;
