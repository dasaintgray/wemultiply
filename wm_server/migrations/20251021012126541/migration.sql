BEGIN;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "addresses" (
    "id" bigserial PRIMARY KEY,
    "userId" bigint NOT NULL,
    "street" text NOT NULL,
    "brgy" text NOT NULL,
    "city" text NOT NULL,
    "province" text NOT NULL,
    "postalCode" text NOT NULL,
    "country" text NOT NULL,
    "isPrimary" boolean NOT NULL
);

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
    "createdAt" timestamp without time zone NOT NULL,
    "isActive" boolean NOT NULL
);

--
-- ACTION CREATE TABLE
--
CREATE TABLE "pioneer_accounts" (
    "id" bigserial PRIMARY KEY,
    "gsID" bigint NOT NULL,
    "userId" bigint NOT NULL,
    "pioneerCode" text NOT NULL,
    "createdAt" timestamp without time zone NOT NULL,
    "isRedeemed" boolean NOT NULL,
    "redeemedAt" timestamp without time zone
);

--
-- ACTION CREATE TABLE
--
CREATE TABLE "profit_sharing" (
    "id" bigserial PRIMARY KEY,
    "profitType" text NOT NULL,
    "percentage" double precision NOT NULL,
    "effectiveDate" timestamp without time zone NOT NULL,
    "createdAt" timestamp without time zone NOT NULL,
    "isActive" boolean NOT NULL
);

--
-- ACTION DROP TABLE
--
DROP TABLE "users" CASCADE;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "users" (
    "id" bigserial PRIMARY KEY,
    "firstName" text NOT NULL,
    "middleName" text NOT NULL,
    "lastName" text NOT NULL,
    "email" text NOT NULL,
    "phone" text,
    "passwordHash" text NOT NULL,
    "role" text NOT NULL,
    "referrerId" bigint,
    "level" bigint NOT NULL,
    "addressId" bigint,
    "joinDate" timestamp without time zone NOT NULL,
    "isActive" boolean NOT NULL,
    "isPioneer" boolean NOT NULL,
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
ALTER TABLE ONLY "addresses"
    ADD CONSTRAINT "addresses_fk_0"
    FOREIGN KEY("userId")
    REFERENCES "users"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "pioneer_accounts"
    ADD CONSTRAINT "pioneer_accounts_fk_0"
    FOREIGN KEY("gsID")
    REFERENCES "golden_seats"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "pioneer_accounts"
    ADD CONSTRAINT "pioneer_accounts_fk_1"
    FOREIGN KEY("userId")
    REFERENCES "users"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "users"
    ADD CONSTRAINT "users_fk_0"
    FOREIGN KEY("addressId")
    REFERENCES "addresses"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "users"
    ADD CONSTRAINT "users_fk_1"
    FOREIGN KEY("membershipPackageId")
    REFERENCES "membership_packages"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;


--
-- MIGRATION VERSION FOR wm
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('wm', '20251021012126541', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20251021012126541', "timestamp" = now();

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
