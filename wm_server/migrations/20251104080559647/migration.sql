BEGIN;

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
    "ronDescription" text,
    "isActive" boolean NOT NULL,
    "createdBy" text NOT NULL,
    "createdAt" timestamp without time zone NOT NULL,
    "updatedBy" text,
    "updatedAt" timestamp without time zone
);

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
    VALUES ('wm', '20251104080559647', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20251104080559647', "timestamp" = now();

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
