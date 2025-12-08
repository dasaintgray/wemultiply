BEGIN;

--
-- ACTION ALTER TABLE
--
--
-- ACTION ALTER TABLE
--
--
-- ACTION DROP TABLE
--
DROP TABLE "distributors" CASCADE;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "distributors" (
    "id" bigserial PRIMARY KEY,
    "distributorName" text NOT NULL,
    "email" text NOT NULL,
    "userID" bigint NOT NULL,
    "joinDate" timestamp without time zone NOT NULL,
    "currentRankId" bigint NOT NULL,
    "isActive" boolean NOT NULL
);

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "cart"
    ADD CONSTRAINT "cart_fk_0"
    FOREIGN KEY("userID")
    REFERENCES "serverpod_user_info"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "cart_items"
    ADD CONSTRAINT "cart_items_fk_0"
    FOREIGN KEY("cartId")
    REFERENCES "cart"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "cart_items"
    ADD CONSTRAINT "cart_items_fk_1"
    FOREIGN KEY("productId")
    REFERENCES "products"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "distributors"
    ADD CONSTRAINT "distributors_fk_0"
    FOREIGN KEY("userID")
    REFERENCES "serverpod_user_info"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "distributors"
    ADD CONSTRAINT "distributors_fk_1"
    FOREIGN KEY("currentRankId")
    REFERENCES "ranks"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;


--
-- MIGRATION VERSION FOR wm
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('wm', '20251012233250574', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20251012233250574', "timestamp" = now();

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
