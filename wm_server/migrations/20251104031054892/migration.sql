BEGIN;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "uela" (
    "id" bigserial PRIMARY KEY,
    "documentType" text NOT NULL,
    "content" text NOT NULL,
    "version" text NOT NULL,
    "effectiveDate" timestamp without time zone NOT NULL,
    "isActive" boolean NOT NULL,
    "language" text NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "document_type_version_idx" ON "uela" USING btree ("documentType", "version", "language");


--
-- MIGRATION VERSION FOR wm
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('wm', '20251104031054892', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20251104031054892', "timestamp" = now();

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
