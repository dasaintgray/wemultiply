BEGIN;

--
-- ACTION ALTER TABLE
--
ALTER TABLE "reaper_commissions" DROP CONSTRAINT "reaper_commissions_fk_2";
ALTER TABLE "reaper_commissions" DROP CONSTRAINT "reaper_commissions_fk_1";
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
    "lastLoginAt" timestamp without time zone,
    "userInfoId" bigint NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "users_email_index" ON "users" USING btree ("userInfoId", "email");

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "reaper_commissions"
    ADD CONSTRAINT "reaper_commissions_fk_1"
    FOREIGN KEY("productId")
    REFERENCES "products"("id")
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
ALTER TABLE ONLY "users"
    ADD CONSTRAINT "users_fk_2"
    FOREIGN KEY("userInfoId")
    REFERENCES "serverpod_user_info"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;


--
-- MIGRATION VERSION FOR wm
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('wm', '20251030035206310', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20251030035206310', "timestamp" = now();

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
