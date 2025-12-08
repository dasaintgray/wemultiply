BEGIN;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "payment_events" (
    "id" bigserial PRIMARY KEY,
    "paymentId" bigint NOT NULL,
    "eventType" text NOT NULL,
    "payload" text NOT NULL,
    "createdAt" timestamp without time zone NOT NULL
);

--
-- ACTION CREATE TABLE
--
CREATE TABLE "payments" (
    "id" bigserial PRIMARY KEY,
    "orderId" text NOT NULL,
    "externalId" text NOT NULL,
    "channel" text NOT NULL,
    "amount" double precision NOT NULL,
    "currency" text NOT NULL,
    "status" text NOT NULL,
    "metadata" text NOT NULL,
    "createdAt" timestamp without time zone NOT NULL,
    "updatedAt" timestamp without time zone NOT NULL
);


--
-- MIGRATION VERSION FOR wm
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('wm', '20251127114236790', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20251127114236790', "timestamp" = now();

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
