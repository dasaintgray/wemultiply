BEGIN;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "levels" (
    "id" bigserial PRIMARY KEY,
    "levelName" text NOT NULL,
    "description" text,
    "isActive" boolean NOT NULL,
    "createdAt" timestamp without time zone NOT NULL
);

--
-- ACTION DROP TABLE
--
DROP TABLE "packages" CASCADE;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "packages" (
    "id" bigserial PRIMARY KEY,
    "packageName" text NOT NULL,
    "packageDescription" text NOT NULL,
    "membershipFee" double precision NOT NULL,
    "productId" bigint NOT NULL,
    "createdAt" timestamp without time zone NOT NULL,
    "createdBy" text NOT NULL,
    "updatedAt" timestamp without time zone NOT NULL,
    "updatedBy" text NOT NULL,
    "isActive" boolean NOT NULL
);

--
-- ACTION ALTER TABLE
--
ALTER TABLE "products" DROP COLUMN "categoryId";
--
-- ACTION DROP TABLE
--
DROP TABLE "reaper_commissions" CASCADE;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "reaper_commissions" (
    "id" bigserial PRIMARY KEY,
    "packageId" bigint NOT NULL,
    "level" bigint NOT NULL,
    "productId" bigint NOT NULL,
    "netPerMember" double precision NOT NULL,
    "repeatOrderNet" double precision NOT NULL,
    "createdAt" timestamp without time zone NOT NULL,
    "createdBy" text NOT NULL,
    "updatedAt" timestamp without time zone NOT NULL,
    "updatedBy" text NOT NULL
);

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "packages"
    ADD CONSTRAINT "packages_fk_0"
    FOREIGN KEY("productId")
    REFERENCES "products"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "reaper_commissions"
    ADD CONSTRAINT "reaper_commissions_fk_0"
    FOREIGN KEY("packageId")
    REFERENCES "packages"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "reaper_commissions"
    ADD CONSTRAINT "reaper_commissions_fk_1"
    FOREIGN KEY("level")
    REFERENCES "levels"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "reaper_commissions"
    ADD CONSTRAINT "reaper_commissions_fk_2"
    FOREIGN KEY("productId")
    REFERENCES "products"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;


--
-- MIGRATION VERSION FOR wm
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('wm', '20251104071723813', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20251104071723813', "timestamp" = now();

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
