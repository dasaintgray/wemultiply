BEGIN;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "rank_category" (
    "id" bigserial PRIMARY KEY,
    "rankName" text NOT NULL,
    "description" text NOT NULL,
    "createdAt" timestamp without time zone NOT NULL,
    "updatedAt" timestamp without time zone NOT NULL
);

--
-- ACTION DROP TABLE
--
DROP TABLE "ranks" CASCADE;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "ranks" (
    "id" bigserial PRIMARY KEY,
    "rankName" text NOT NULL,
    "rankCategoryID" bigint NOT NULL,
    "minPersonalSalesTarget" bigint NOT NULL,
    "minGroupSalesTarget" bigint NOT NULL,
    "minDirectRecruits" bigint NOT NULL
);


--
-- MIGRATION VERSION FOR wm
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('wm', '20251012230528302', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20251012230528302', "timestamp" = now();

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
