BEGIN;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "products" (
    "id" bigserial PRIMARY KEY,
    "productName" text NOT NULL,
    "description" text NOT NULL,
    "price" double precision NOT NULL,
    "stock" bigint NOT NULL,
    "imageName" text NOT NULL,
    "imageURL" text NOT NULL,
    "isActive" boolean NOT NULL,
    "categoryId" bigint NOT NULL,
    "createdAt" timestamp without time zone NOT NULL,
    "createdBy" text NOT NULL,
    "updatedat" timestamp without time zone NOT NULL,
    "updatedBy" text NOT NULL
);

-- Indexes
CREATE INDEX "product_name_idx" ON "products" USING btree ("productName");


--
-- MIGRATION VERSION FOR wm
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('wm', '20250909033716362', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20250909033716362', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20240516151843329', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240516151843329', "timestamp" = now();


COMMIT;
