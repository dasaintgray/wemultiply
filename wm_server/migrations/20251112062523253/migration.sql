BEGIN;

--
-- ACTION DROP TABLE
--
DROP TABLE "uela" CASCADE;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "eula" (
    "id" bigserial PRIMARY KEY,
    "documentType" text NOT NULL,
    "content" text NOT NULL,
    "version" text NOT NULL,
    "effectiveDate" timestamp without time zone NOT NULL,
    "isActive" boolean NOT NULL,
    "language" text NOT NULL,
    "_menuEulaitemsMenuId" bigint
);

-- Indexes
CREATE UNIQUE INDEX "document_type_version_idx" ON "eula" USING btree ("documentType", "version", "language");

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "eula"
    ADD CONSTRAINT "eula_fk_0"
    FOREIGN KEY("_menuEulaitemsMenuId")
    REFERENCES "menu"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;


--
-- MIGRATION VERSION FOR wm
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('wm', '20251112062523253', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20251112062523253', "timestamp" = now();

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
