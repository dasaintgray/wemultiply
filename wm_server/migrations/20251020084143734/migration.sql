BEGIN;

--
-- ACTION DROP TABLE
--
DROP TABLE "commissions" CASCADE;

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
CREATE TABLE "crown_packages" (
    "id" bigserial PRIMARY KEY,
    "packageId" bigint NOT NULL,
    "cashBack" double precision NOT NULL,
    "netProfit" double precision NOT NULL,
    "profitToWeMultiply" double precision NOT NULL,
    "profitToCEO" double precision NOT NULL,
    "profitToFounders" double precision NOT NULL,
    "profitToMembers" double precision NOT NULL,
    "profitToTithes" double precision NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "idx_crown_packages_packageid" ON "crown_packages" USING btree ("packageId");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "golden_seat_commissions" (
    "id" bigserial PRIMARY KEY,
    "seatType" text NOT NULL,
    "packageId" bigint NOT NULL,
    "productId" bigint NOT NULL,
    "netPerMember" double precision NOT NULL,
    "netPerBottle" double precision NOT NULL,
    "commissionAmount" double precision NOT NULL,
    "createdAt" timestamp without time zone NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "idx_golden_seat_commissions_seattype_package_product" ON "golden_seat_commissions" USING btree ("seatType", "packageId", "productId");

--
-- ACTION DROP TABLE
--
DROP TABLE "golden_seats" CASCADE;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "golden_seats" (
    "id" bigserial PRIMARY KEY,
    "seatType" text NOT NULL,
    "territory" text NOT NULL,
    "ownerId" bigint NOT NULL,
    "price" double precision NOT NULL,
    "startDate" timestamp without time zone NOT NULL,
    "endDate" timestamp without time zone NOT NULL,
    "isActive" boolean NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "seat_type_idx" ON "golden_seats" USING btree ("seatType", "territory");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "membership_packages" (
    "id" bigserial PRIMARY KEY,
    "name" text NOT NULL,
    "price" double precision NOT NULL,
    "bottlesIncluded" bigint NOT NULL,
    "cashback" double precision,
    "description" text
);

-- Indexes
CREATE UNIQUE INDEX "idx_membership_packages_name" ON "membership_packages" USING btree ("name");

--
-- ACTION DROP TABLE
--
DROP TABLE "menu" CASCADE;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "menu" (
    "id" bigserial PRIMARY KEY,
    "menuName" text NOT NULL,
    "menuImagePath" text NOT NULL,
    "menuItems" json NOT NULL
);

--
-- ACTION CREATE TABLE
--
CREATE TABLE "reaper_commissions" (
    "id" bigserial PRIMARY KEY,
    "packageId" bigint NOT NULL,
    "level" bigint NOT NULL,
    "productId" bigint NOT NULL,
    "commissionAmount" double precision NOT NULL,
    "createdAt" timestamp without time zone NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "idx_reaper_commissions_package_product_level" ON "reaper_commissions" USING btree ("packageId", "productId", "level");

--
-- ACTION DROP TABLE
--
DROP TABLE "sales" CASCADE;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "sales" (
    "id" bigserial PRIMARY KEY,
    "buyerId" bigint NOT NULL,
    "packageId" bigint NOT NULL,
    "productId" bigint NOT NULL,
    "saleType" text NOT NULL,
    "amount" double precision NOT NULL,
    "saleDate" timestamp without time zone NOT NULL,
    "processedBy" bigint NOT NULL
);

--
-- ACTION CREATE TABLE
--
CREATE TABLE "users" (
    "id" bigserial PRIMARY KEY,
    "fullName" text NOT NULL,
    "email" text NOT NULL,
    "phone" text,
    "passwordHash" text NOT NULL,
    "role" text NOT NULL,
    "referrerId" bigint,
    "level" bigint NOT NULL,
    "joinDate" timestamp without time zone NOT NULL,
    "isActive" boolean NOT NULL,
    "membershipPackageId" bigint,
    "longtitude" double precision,
    "latitude" double precision,
    "isUpgraded" boolean NOT NULL,
    "upgradedAt" timestamp without time zone,
    "lastLoginAt" timestamp without time zone
);

-- Indexes
CREATE UNIQUE INDEX "users_email_index" ON "users" USING btree ("email");

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "commissions"
    ADD CONSTRAINT "commissions_fk_0"
    FOREIGN KEY("saleId")
    REFERENCES "sales"("id")
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
ALTER TABLE ONLY "crown_packages"
    ADD CONSTRAINT "crown_packages_fk_0"
    FOREIGN KEY("packageId")
    REFERENCES "membership_packages"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "golden_seat_commissions"
    ADD CONSTRAINT "golden_seat_commissions_fk_0"
    FOREIGN KEY("packageId")
    REFERENCES "membership_packages"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "golden_seat_commissions"
    ADD CONSTRAINT "golden_seat_commissions_fk_1"
    FOREIGN KEY("productId")
    REFERENCES "products"("id")
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
ALTER TABLE ONLY "reaper_commissions"
    ADD CONSTRAINT "reaper_commissions_fk_0"
    FOREIGN KEY("packageId")
    REFERENCES "membership_packages"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "reaper_commissions"
    ADD CONSTRAINT "reaper_commissions_fk_1"
    FOREIGN KEY("level")
    REFERENCES "ranks"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "reaper_commissions"
    ADD CONSTRAINT "reaper_commissions_fk_2"
    FOREIGN KEY("productId")
    REFERENCES "products"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "sales"
    ADD CONSTRAINT "sales_fk_0"
    FOREIGN KEY("buyerId")
    REFERENCES "users"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "sales"
    ADD CONSTRAINT "sales_fk_1"
    FOREIGN KEY("packageId")
    REFERENCES "membership_packages"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "sales"
    ADD CONSTRAINT "sales_fk_2"
    FOREIGN KEY("productId")
    REFERENCES "products"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "sales"
    ADD CONSTRAINT "sales_fk_3"
    FOREIGN KEY("processedBy")
    REFERENCES "users"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "users"
    ADD CONSTRAINT "users_fk_0"
    FOREIGN KEY("membershipPackageId")
    REFERENCES "membership_packages"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;


--
-- MIGRATION VERSION FOR wm
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('wm', '20251020084143734', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20251020084143734', "timestamp" = now();

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
