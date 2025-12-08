BEGIN;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "golden_seats" (
    "id" bigserial PRIMARY KEY,
    "gsName" text NOT NULL,
    "gsDescription" text NOT NULL,
    "gsImageUrl" text NOT NULL
);

--
-- ACTION CREATE TABLE
--
CREATE TABLE "packages" (
    "id" bigserial PRIMARY KEY,
    "gsID" bigint NOT NULL,
    "packageName" text NOT NULL,
    "packageDescription" text NOT NULL,
    "packagePrice" double precision NOT NULL,
    "packageImageUrl" text NOT NULL
);

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "packages"
    ADD CONSTRAINT "packages_fk_0"
    FOREIGN KEY("gsID")
    REFERENCES "golden_seats"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;


--
-- MIGRATION VERSION FOR wm
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('wm', '20251013124638656', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20251013124638656', "timestamp" = now();

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
