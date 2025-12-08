BEGIN;

--
-- ACTION DROP TABLE
--
DROP TABLE "addresses" CASCADE;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "addresses" (
    "id" bigserial PRIMARY KEY,
    "userId" bigint NOT NULL,
    "label" text NOT NULL,
    "contactName" text NOT NULL,
    "contactPhone" text NOT NULL,
    "street" text NOT NULL,
    "brgy" text NOT NULL,
    "city" text NOT NULL,
    "province" text NOT NULL,
    "postalCode" text NOT NULL,
    "country" text NOT NULL,
    "isPrimary" boolean NOT NULL,
    "createdAt" timestamp without time zone NOT NULL,
    "updatedAt" timestamp without time zone NOT NULL
);

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
-- MIGRATION VERSION FOR wm
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('wm', '20251130043507847', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20251130043507847', "timestamp" = now();

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
