BEGIN;

--
-- Class Addresses as table addresses
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
    "latitude" double precision,
    "longitude" double precision,
    "isPrimary" boolean NOT NULL,
    "createdAt" timestamp without time zone NOT NULL,
    "updatedAt" timestamp without time zone NOT NULL
);

--
-- Class Cart as table cart
--
CREATE TABLE "cart" (
    "id" bigserial PRIMARY KEY,
    "userID" bigint NOT NULL,
    "status" text NOT NULL,
    "currency" text NOT NULL,
    "totalItems" double precision NOT NULL,
    "subtotal" double precision NOT NULL,
    "discountTotal" double precision NOT NULL,
    "taxTotal" double precision NOT NULL,
    "shippingTotal" double precision NOT NULL,
    "grandTotal" double precision NOT NULL,
    "couponCode" text NOT NULL,
    "createdAt" timestamp without time zone NOT NULL,
    "updatedAt" timestamp without time zone NOT NULL,
    "expiresAt" timestamp without time zone NOT NULL,
    "notes" text NOT NULL,
    "isActive" boolean NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "cart_user_idx" ON "cart" USING btree ("userID");

--
-- Class CartItem as table cart_items
--
CREATE TABLE "cart_items" (
    "id" bigserial PRIMARY KEY,
    "cartId" bigint NOT NULL,
    "productId" bigint NOT NULL,
    "quantity" bigint NOT NULL,
    "unitPrice" double precision NOT NULL,
    "totalPrice" double precision NOT NULL,
    "createdAt" timestamp without time zone NOT NULL,
    "updatedAt" timestamp without time zone NOT NULL,
    "_cartCartitemsCartId" bigint
);

-- Indexes
CREATE UNIQUE INDEX "cart_item_idx" ON "cart_items" USING btree ("cartId", "productId");

--
-- Class Cdnconfig as table cdnconfig
--
CREATE TABLE "cdnconfig" (
    "id" bigserial PRIMARY KEY,
    "type" text NOT NULL,
    "domain" text NOT NULL,
    "urlpath" text NOT NULL
);

--
-- Class CommissionRule as table commission_rules
--
CREATE TABLE "commission_rules" (
    "id" bigserial PRIMARY KEY,
    "rankId" bigint NOT NULL,
    "level" bigint NOT NULL,
    "commissionRate" double precision NOT NULL,
    "commissionType" text NOT NULL
);

--
-- Class Commissions as table commissions
--
CREATE TABLE "commissions" (
    "id" bigserial PRIMARY KEY,
    "saleId" bigint NOT NULL,
    "recipientId" bigint NOT NULL,
    "sourceLevel" bigint NOT NULL,
    "commissionType" text NOT NULL,
    "commissionAmount" double precision NOT NULL,
    "isPaid" boolean NOT NULL,
    "paidAt" timestamp without time zone,
    "createdAt" timestamp without time zone NOT NULL
);

--
-- Class CrownPackage as table crown_packages
--
CREATE TABLE "crown_packages" (
    "id" bigserial PRIMARY KEY,
    "packageId" bigint NOT NULL,
    "cashBack" double precision NOT NULL,
    "netProfit" double precision NOT NULL,
    "profitToWeMultiply" double precision NOT NULL,
    "profitToCEO" double precision NOT NULL,
    "profitToFounders" double precision NOT NULL,
    "profitToMembers" double precision NOT NULL,
    "profitToTithes" double precision NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "idx_crown_packages_packageid" ON "crown_packages" USING btree ("packageId");

--
-- Class Distributors as table distributors
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
-- Class Eula as table eula
--
CREATE TABLE "eula" (
    "id" bigserial PRIMARY KEY,
    "menuId" bigint NOT NULL,
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
-- Class GoldenSeatCommission as table golden_seat_commissions
--
CREATE TABLE "golden_seat_commissions" (
    "id" bigserial PRIMARY KEY,
    "seatType" text NOT NULL,
    "packageId" bigint NOT NULL,
    "productId" bigint NOT NULL,
    "netPerMember" double precision NOT NULL,
    "netPerBottle" double precision NOT NULL,
    "commissionAmount" double precision NOT NULL,
    "createdAt" timestamp without time zone NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "idx_golden_seat_commissions_seattype_package_product" ON "golden_seat_commissions" USING btree ("seatType", "packageId", "productId");

--
-- Class GoldenSeats as table golden_seats
--
CREATE TABLE "golden_seats" (
    "id" bigserial PRIMARY KEY,
    "seatType" text NOT NULL,
    "territory" text NOT NULL,
    "ownerId" bigint NOT NULL,
    "price" double precision NOT NULL,
    "startDate" timestamp without time zone NOT NULL,
    "endDate" timestamp without time zone NOT NULL,
    "isActive" boolean NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "seat_type_idx" ON "golden_seats" USING btree ("seatType", "territory");

--
-- Class Level as table levels
--
CREATE TABLE "levels" (
    "id" bigserial PRIMARY KEY,
    "levelName" text NOT NULL,
    "description" text,
    "isActive" boolean NOT NULL,
    "createdAt" timestamp without time zone NOT NULL
);

--
-- Class MembershipPackage as table membership_packages
--
CREATE TABLE "membership_packages" (
    "id" bigserial PRIMARY KEY,
    "name" text NOT NULL,
    "price" double precision NOT NULL,
    "bottlesIncluded" bigint NOT NULL,
    "cashback" double precision,
    "description" text
);

-- Indexes
CREATE UNIQUE INDEX "idx_membership_packages_name" ON "membership_packages" USING btree ("name");

--
-- Class Menu as table menu
--
CREATE TABLE "menu" (
    "id" bigserial PRIMARY KEY,
    "menuName" text NOT NULL,
    "menuImagePath" text NOT NULL,
    "createdAt" timestamp without time zone NOT NULL,
    "isActive" boolean NOT NULL
);

--
-- Class MenuItems as table menu_items
--
CREATE TABLE "menu_items" (
    "id" bigserial PRIMARY KEY,
    "menuId" bigint NOT NULL,
    "menuItemDesc" text NOT NULL,
    "menuItemImage" text NOT NULL,
    "isActive" boolean NOT NULL,
    "createdAt" timestamp without time zone NOT NULL,
    "productID" bigint NOT NULL,
    "productDesc" text NOT NULL,
    "price" double precision NOT NULL,
    "_menuMenuitemsMenuId" bigint
);

--
-- Class OrderItem as table order_items
--
CREATE TABLE "order_items" (
    "id" bigserial PRIMARY KEY,
    "orderId" bigint NOT NULL,
    "productId" bigint NOT NULL,
    "quantity" bigint NOT NULL,
    "unitPrice" double precision NOT NULL,
    "totalPrice" double precision NOT NULL,
    "createdAt" timestamp without time zone NOT NULL,
    "updatedAt" timestamp without time zone NOT NULL,
    "_ordersOrderitemsOrdersId" bigint
);

-- Indexes
CREATE UNIQUE INDEX "order_item_idx" ON "order_items" USING btree ("orderId", "productId");

--
-- Class Order as table orders
--
CREATE TABLE "orders" (
    "id" bigserial PRIMARY KEY,
    "userID" bigint NOT NULL,
    "cartId" bigint NOT NULL,
    "status" text NOT NULL,
    "currency" text NOT NULL,
    "subtotal" double precision NOT NULL,
    "taxTotal" double precision NOT NULL,
    "shippingTotal" double precision NOT NULL,
    "discountTotal" double precision NOT NULL,
    "grandTotal" double precision NOT NULL,
    "paymentMethod" text NOT NULL,
    "createdAt" timestamp without time zone NOT NULL,
    "updatedAt" timestamp without time zone NOT NULL
);

-- Indexes
CREATE INDEX "order_user_idx" ON "orders" USING btree ("userID");

--
-- Class Package as table packages
--
CREATE TABLE "packages" (
    "id" bigserial PRIMARY KEY,
    "packageName" text NOT NULL,
    "packageDescription" text NOT NULL,
    "membershipFee" double precision NOT NULL,
    "productId" bigint NOT NULL,
    "createdAt" timestamp without time zone,
    "createdBy" text,
    "updatedAt" timestamp without time zone,
    "updatedBy" text,
    "isActive" boolean NOT NULL
);

--
-- Class PaymentEvent as table payment_events
--
CREATE TABLE "payment_events" (
    "id" bigserial PRIMARY KEY,
    "paymentId" bigint NOT NULL,
    "eventType" text NOT NULL,
    "payload" text NOT NULL,
    "createdAt" timestamp without time zone NOT NULL
);

--
-- Class Payment as table payments
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
-- Class PioneerAccounts as table pioneer_accounts
--
CREATE TABLE "pioneer_accounts" (
    "id" bigserial PRIMARY KEY,
    "gsID" bigint NOT NULL,
    "userId" bigint NOT NULL,
    "pioneerCode" text NOT NULL,
    "createdAt" timestamp without time zone NOT NULL,
    "isRedeemed" boolean NOT NULL,
    "redeemedAt" timestamp without time zone
);

--
-- Class Product as table products
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
    "createdAt" timestamp without time zone NOT NULL,
    "createdBy" text NOT NULL,
    "updatedat" timestamp without time zone NOT NULL,
    "updatedBy" text NOT NULL
);

-- Indexes
CREATE INDEX "product_name_idx" ON "products" USING btree ("productName");

--
-- Class ProfitSharing as table profit_sharing
--
CREATE TABLE "profit_sharing" (
    "id" bigserial PRIMARY KEY,
    "profitType" text NOT NULL,
    "percentage" double precision NOT NULL,
    "effectiveDate" timestamp without time zone NOT NULL,
    "createdAt" timestamp without time zone NOT NULL,
    "isActive" boolean NOT NULL
);

--
-- Class RankCategory as table rank_category
--
CREATE TABLE "rank_category" (
    "id" bigserial PRIMARY KEY,
    "rankName" text NOT NULL,
    "description" text NOT NULL,
    "createdAt" timestamp without time zone NOT NULL,
    "updatedAt" timestamp without time zone NOT NULL
);

--
-- Class Ranks as table ranks
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
-- Class ReaperCommission as table reaper_commissions
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
    "updatedAt" timestamp without time zone,
    "_packagesPackageidPackagesId" bigint
);

--
-- Class Sale as table sale
--
CREATE TABLE "sale" (
    "id" bigserial PRIMARY KEY,
    "saleNumber" text NOT NULL,
    "saleDate" timestamp without time zone NOT NULL,
    "buyerId" bigint NOT NULL,
    "packageId" bigint NOT NULL,
    "saleType" text NOT NULL,
    "amount" double precision NOT NULL,
    "status" text NOT NULL
);

--
-- Class SaleItem as table sale_items
--
CREATE TABLE "sale_items" (
    "id" bigserial PRIMARY KEY,
    "saleId" bigint NOT NULL,
    "productId" bigint NOT NULL,
    "productName" text NOT NULL,
    "quantity" bigint NOT NULL,
    "price" double precision NOT NULL,
    "lineTotal" double precision NOT NULL,
    "_saleSalesitemsSaleId" bigint
);

--
-- Class User as table users
--
CREATE TABLE "users" (
    "id" bigserial PRIMARY KEY,
    "firstName" text NOT NULL,
    "middleName" text NOT NULL,
    "lastName" text NOT NULL,
    "email" text NOT NULL,
    "phone" text,
    "passwordHash" text NOT NULL,
    "role" text NOT NULL,
    "referrerId" bigint,
    "level" bigint NOT NULL,
    "addressId" bigint,
    "joinDate" timestamp without time zone NOT NULL,
    "isActive" boolean NOT NULL,
    "isPioneer" boolean NOT NULL,
    "membershipPackageId" bigint,
    "longtitude" double precision,
    "latitude" double precision,
    "isUpgraded" boolean NOT NULL,
    "upgradedAt" timestamp without time zone,
    "lastLoginAt" timestamp without time zone,
    "userInfoId" bigint NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "users_email_index" ON "users" USING btree ("userInfoId", "email");

--
-- Class CloudStorageEntry as table serverpod_cloud_storage
--
CREATE TABLE "serverpod_cloud_storage" (
    "id" bigserial PRIMARY KEY,
    "storageId" text NOT NULL,
    "path" text NOT NULL,
    "addedTime" timestamp without time zone NOT NULL,
    "expiration" timestamp without time zone,
    "byteData" bytea NOT NULL,
    "verified" boolean NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "serverpod_cloud_storage_path_idx" ON "serverpod_cloud_storage" USING btree ("storageId", "path");
CREATE INDEX "serverpod_cloud_storage_expiration" ON "serverpod_cloud_storage" USING btree ("expiration");

--
-- Class CloudStorageDirectUploadEntry as table serverpod_cloud_storage_direct_upload
--
CREATE TABLE "serverpod_cloud_storage_direct_upload" (
    "id" bigserial PRIMARY KEY,
    "storageId" text NOT NULL,
    "path" text NOT NULL,
    "expiration" timestamp without time zone NOT NULL,
    "authKey" text NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "serverpod_cloud_storage_direct_upload_storage_path" ON "serverpod_cloud_storage_direct_upload" USING btree ("storageId", "path");

--
-- Class FutureCallEntry as table serverpod_future_call
--
CREATE TABLE "serverpod_future_call" (
    "id" bigserial PRIMARY KEY,
    "name" text NOT NULL,
    "time" timestamp without time zone NOT NULL,
    "serializedObject" text,
    "serverId" text NOT NULL,
    "identifier" text
);

-- Indexes
CREATE INDEX "serverpod_future_call_time_idx" ON "serverpod_future_call" USING btree ("time");
CREATE INDEX "serverpod_future_call_serverId_idx" ON "serverpod_future_call" USING btree ("serverId");
CREATE INDEX "serverpod_future_call_identifier_idx" ON "serverpod_future_call" USING btree ("identifier");

--
-- Class ServerHealthConnectionInfo as table serverpod_health_connection_info
--
CREATE TABLE "serverpod_health_connection_info" (
    "id" bigserial PRIMARY KEY,
    "serverId" text NOT NULL,
    "timestamp" timestamp without time zone NOT NULL,
    "active" bigint NOT NULL,
    "closing" bigint NOT NULL,
    "idle" bigint NOT NULL,
    "granularity" bigint NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "serverpod_health_connection_info_timestamp_idx" ON "serverpod_health_connection_info" USING btree ("timestamp", "serverId", "granularity");

--
-- Class ServerHealthMetric as table serverpod_health_metric
--
CREATE TABLE "serverpod_health_metric" (
    "id" bigserial PRIMARY KEY,
    "name" text NOT NULL,
    "serverId" text NOT NULL,
    "timestamp" timestamp without time zone NOT NULL,
    "isHealthy" boolean NOT NULL,
    "value" double precision NOT NULL,
    "granularity" bigint NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "serverpod_health_metric_timestamp_idx" ON "serverpod_health_metric" USING btree ("timestamp", "serverId", "name", "granularity");

--
-- Class LogEntry as table serverpod_log
--
CREATE TABLE "serverpod_log" (
    "id" bigserial PRIMARY KEY,
    "sessionLogId" bigint NOT NULL,
    "messageId" bigint,
    "reference" text,
    "serverId" text NOT NULL,
    "time" timestamp without time zone NOT NULL,
    "logLevel" bigint NOT NULL,
    "message" text NOT NULL,
    "error" text,
    "stackTrace" text,
    "order" bigint NOT NULL
);

-- Indexes
CREATE INDEX "serverpod_log_sessionLogId_idx" ON "serverpod_log" USING btree ("sessionLogId");

--
-- Class MessageLogEntry as table serverpod_message_log
--
CREATE TABLE "serverpod_message_log" (
    "id" bigserial PRIMARY KEY,
    "sessionLogId" bigint NOT NULL,
    "serverId" text NOT NULL,
    "messageId" bigint NOT NULL,
    "endpoint" text NOT NULL,
    "messageName" text NOT NULL,
    "duration" double precision NOT NULL,
    "error" text,
    "stackTrace" text,
    "slow" boolean NOT NULL,
    "order" bigint NOT NULL
);

--
-- Class MethodInfo as table serverpod_method
--
CREATE TABLE "serverpod_method" (
    "id" bigserial PRIMARY KEY,
    "endpoint" text NOT NULL,
    "method" text NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "serverpod_method_endpoint_method_idx" ON "serverpod_method" USING btree ("endpoint", "method");

--
-- Class DatabaseMigrationVersion as table serverpod_migrations
--
CREATE TABLE "serverpod_migrations" (
    "id" bigserial PRIMARY KEY,
    "module" text NOT NULL,
    "version" text NOT NULL,
    "timestamp" timestamp without time zone
);

-- Indexes
CREATE UNIQUE INDEX "serverpod_migrations_ids" ON "serverpod_migrations" USING btree ("module");

--
-- Class QueryLogEntry as table serverpod_query_log
--
CREATE TABLE "serverpod_query_log" (
    "id" bigserial PRIMARY KEY,
    "serverId" text NOT NULL,
    "sessionLogId" bigint NOT NULL,
    "messageId" bigint,
    "query" text NOT NULL,
    "duration" double precision NOT NULL,
    "numRows" bigint,
    "error" text,
    "stackTrace" text,
    "slow" boolean NOT NULL,
    "order" bigint NOT NULL
);

-- Indexes
CREATE INDEX "serverpod_query_log_sessionLogId_idx" ON "serverpod_query_log" USING btree ("sessionLogId");

--
-- Class ReadWriteTestEntry as table serverpod_readwrite_test
--
CREATE TABLE "serverpod_readwrite_test" (
    "id" bigserial PRIMARY KEY,
    "number" bigint NOT NULL
);

--
-- Class RuntimeSettings as table serverpod_runtime_settings
--
CREATE TABLE "serverpod_runtime_settings" (
    "id" bigserial PRIMARY KEY,
    "logSettings" json NOT NULL,
    "logSettingsOverrides" json NOT NULL,
    "logServiceCalls" boolean NOT NULL,
    "logMalformedCalls" boolean NOT NULL
);

--
-- Class SessionLogEntry as table serverpod_session_log
--
CREATE TABLE "serverpod_session_log" (
    "id" bigserial PRIMARY KEY,
    "serverId" text NOT NULL,
    "time" timestamp without time zone NOT NULL,
    "module" text,
    "endpoint" text,
    "method" text,
    "duration" double precision,
    "numQueries" bigint,
    "slow" boolean,
    "error" text,
    "stackTrace" text,
    "authenticatedUserId" bigint,
    "isOpen" boolean,
    "touched" timestamp without time zone NOT NULL
);

-- Indexes
CREATE INDEX "serverpod_session_log_serverid_idx" ON "serverpod_session_log" USING btree ("serverId");
CREATE INDEX "serverpod_session_log_touched_idx" ON "serverpod_session_log" USING btree ("touched");
CREATE INDEX "serverpod_session_log_isopen_idx" ON "serverpod_session_log" USING btree ("isOpen");

--
-- Class AuthKey as table serverpod_auth_key
--
CREATE TABLE "serverpod_auth_key" (
    "id" bigserial PRIMARY KEY,
    "userId" bigint NOT NULL,
    "hash" text NOT NULL,
    "scopeNames" json NOT NULL,
    "method" text NOT NULL
);

-- Indexes
CREATE INDEX "serverpod_auth_key_userId_idx" ON "serverpod_auth_key" USING btree ("userId");

--
-- Class EmailAuth as table serverpod_email_auth
--
CREATE TABLE "serverpod_email_auth" (
    "id" bigserial PRIMARY KEY,
    "userId" bigint NOT NULL,
    "email" text NOT NULL,
    "hash" text NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "serverpod_email_auth_email" ON "serverpod_email_auth" USING btree ("email");

--
-- Class EmailCreateAccountRequest as table serverpod_email_create_request
--
CREATE TABLE "serverpod_email_create_request" (
    "id" bigserial PRIMARY KEY,
    "userName" text NOT NULL,
    "email" text NOT NULL,
    "hash" text NOT NULL,
    "verificationCode" text NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "serverpod_email_auth_create_account_request_idx" ON "serverpod_email_create_request" USING btree ("email");

--
-- Class EmailFailedSignIn as table serverpod_email_failed_sign_in
--
CREATE TABLE "serverpod_email_failed_sign_in" (
    "id" bigserial PRIMARY KEY,
    "email" text NOT NULL,
    "time" timestamp without time zone NOT NULL,
    "ipAddress" text NOT NULL
);

-- Indexes
CREATE INDEX "serverpod_email_failed_sign_in_email_idx" ON "serverpod_email_failed_sign_in" USING btree ("email");
CREATE INDEX "serverpod_email_failed_sign_in_time_idx" ON "serverpod_email_failed_sign_in" USING btree ("time");

--
-- Class EmailReset as table serverpod_email_reset
--
CREATE TABLE "serverpod_email_reset" (
    "id" bigserial PRIMARY KEY,
    "userId" bigint NOT NULL,
    "verificationCode" text NOT NULL,
    "expiration" timestamp without time zone NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "serverpod_email_reset_verification_idx" ON "serverpod_email_reset" USING btree ("verificationCode");

--
-- Class GoogleRefreshToken as table serverpod_google_refresh_token
--
CREATE TABLE "serverpod_google_refresh_token" (
    "id" bigserial PRIMARY KEY,
    "userId" bigint NOT NULL,
    "refreshToken" text NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "serverpod_google_refresh_token_userId_idx" ON "serverpod_google_refresh_token" USING btree ("userId");

--
-- Class UserImage as table serverpod_user_image
--
CREATE TABLE "serverpod_user_image" (
    "id" bigserial PRIMARY KEY,
    "userId" bigint NOT NULL,
    "version" bigint NOT NULL,
    "url" text NOT NULL
);

-- Indexes
CREATE INDEX "serverpod_user_image_user_id" ON "serverpod_user_image" USING btree ("userId", "version");

--
-- Class UserInfo as table serverpod_user_info
--
CREATE TABLE "serverpod_user_info" (
    "id" bigserial PRIMARY KEY,
    "userIdentifier" text NOT NULL,
    "userName" text,
    "fullName" text,
    "email" text,
    "created" timestamp without time zone NOT NULL,
    "imageUrl" text,
    "scopeNames" json NOT NULL,
    "blocked" boolean NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "serverpod_user_info_user_identifier" ON "serverpod_user_info" USING btree ("userIdentifier");
CREATE INDEX "serverpod_user_info_email" ON "serverpod_user_info" USING btree ("email");

--
-- Foreign relations for "addresses" table
--
ALTER TABLE ONLY "addresses"
    ADD CONSTRAINT "addresses_fk_0"
    FOREIGN KEY("userId")
    REFERENCES "users"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- Foreign relations for "cart" table
--
ALTER TABLE ONLY "cart"
    ADD CONSTRAINT "cart_fk_0"
    FOREIGN KEY("userID")
    REFERENCES "serverpod_user_info"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- Foreign relations for "cart_items" table
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
ALTER TABLE ONLY "cart_items"
    ADD CONSTRAINT "cart_items_fk_2"
    FOREIGN KEY("_cartCartitemsCartId")
    REFERENCES "cart"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- Foreign relations for "commission_rules" table
--
ALTER TABLE ONLY "commission_rules"
    ADD CONSTRAINT "commission_rules_fk_0"
    FOREIGN KEY("rankId")
    REFERENCES "ranks"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- Foreign relations for "commissions" table
--
ALTER TABLE ONLY "commissions"
    ADD CONSTRAINT "commissions_fk_0"
    FOREIGN KEY("saleId")
    REFERENCES "sale"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "commissions"
    ADD CONSTRAINT "commissions_fk_1"
    FOREIGN KEY("recipientId")
    REFERENCES "users"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- Foreign relations for "crown_packages" table
--
ALTER TABLE ONLY "crown_packages"
    ADD CONSTRAINT "crown_packages_fk_0"
    FOREIGN KEY("packageId")
    REFERENCES "membership_packages"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- Foreign relations for "distributors" table
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
-- Foreign relations for "eula" table
--
ALTER TABLE ONLY "eula"
    ADD CONSTRAINT "eula_fk_0"
    FOREIGN KEY("_menuEulaitemsMenuId")
    REFERENCES "menu"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- Foreign relations for "golden_seat_commissions" table
--
ALTER TABLE ONLY "golden_seat_commissions"
    ADD CONSTRAINT "golden_seat_commissions_fk_0"
    FOREIGN KEY("packageId")
    REFERENCES "membership_packages"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "golden_seat_commissions"
    ADD CONSTRAINT "golden_seat_commissions_fk_1"
    FOREIGN KEY("productId")
    REFERENCES "products"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- Foreign relations for "golden_seats" table
--
ALTER TABLE ONLY "golden_seats"
    ADD CONSTRAINT "golden_seats_fk_0"
    FOREIGN KEY("ownerId")
    REFERENCES "users"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- Foreign relations for "menu_items" table
--
ALTER TABLE ONLY "menu_items"
    ADD CONSTRAINT "menu_items_fk_0"
    FOREIGN KEY("menuId")
    REFERENCES "menu"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "menu_items"
    ADD CONSTRAINT "menu_items_fk_1"
    FOREIGN KEY("_menuMenuitemsMenuId")
    REFERENCES "menu"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- Foreign relations for "order_items" table
--
ALTER TABLE ONLY "order_items"
    ADD CONSTRAINT "order_items_fk_0"
    FOREIGN KEY("orderId")
    REFERENCES "orders"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "order_items"
    ADD CONSTRAINT "order_items_fk_1"
    FOREIGN KEY("productId")
    REFERENCES "products"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "order_items"
    ADD CONSTRAINT "order_items_fk_2"
    FOREIGN KEY("_ordersOrderitemsOrdersId")
    REFERENCES "orders"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- Foreign relations for "orders" table
--
ALTER TABLE ONLY "orders"
    ADD CONSTRAINT "orders_fk_0"
    FOREIGN KEY("userID")
    REFERENCES "serverpod_user_info"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "orders"
    ADD CONSTRAINT "orders_fk_1"
    FOREIGN KEY("cartId")
    REFERENCES "cart"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- Foreign relations for "packages" table
--
ALTER TABLE ONLY "packages"
    ADD CONSTRAINT "packages_fk_0"
    FOREIGN KEY("productId")
    REFERENCES "products"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- Foreign relations for "pioneer_accounts" table
--
ALTER TABLE ONLY "pioneer_accounts"
    ADD CONSTRAINT "pioneer_accounts_fk_0"
    FOREIGN KEY("gsID")
    REFERENCES "golden_seats"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "pioneer_accounts"
    ADD CONSTRAINT "pioneer_accounts_fk_1"
    FOREIGN KEY("userId")
    REFERENCES "users"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- Foreign relations for "reaper_commissions" table
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
ALTER TABLE ONLY "reaper_commissions"
    ADD CONSTRAINT "reaper_commissions_fk_3"
    FOREIGN KEY("_packagesPackageidPackagesId")
    REFERENCES "packages"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- Foreign relations for "sale" table
--
ALTER TABLE ONLY "sale"
    ADD CONSTRAINT "sale_fk_0"
    FOREIGN KEY("buyerId")
    REFERENCES "users"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "sale"
    ADD CONSTRAINT "sale_fk_1"
    FOREIGN KEY("packageId")
    REFERENCES "membership_packages"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- Foreign relations for "sale_items" table
--
ALTER TABLE ONLY "sale_items"
    ADD CONSTRAINT "sale_items_fk_0"
    FOREIGN KEY("saleId")
    REFERENCES "sale"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "sale_items"
    ADD CONSTRAINT "sale_items_fk_1"
    FOREIGN KEY("productId")
    REFERENCES "products"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "sale_items"
    ADD CONSTRAINT "sale_items_fk_2"
    FOREIGN KEY("_saleSalesitemsSaleId")
    REFERENCES "sale"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- Foreign relations for "users" table
--
ALTER TABLE ONLY "users"
    ADD CONSTRAINT "users_fk_0"
    FOREIGN KEY("addressId")
    REFERENCES "addresses"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "users"
    ADD CONSTRAINT "users_fk_1"
    FOREIGN KEY("membershipPackageId")
    REFERENCES "membership_packages"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "users"
    ADD CONSTRAINT "users_fk_2"
    FOREIGN KEY("userInfoId")
    REFERENCES "serverpod_user_info"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- Foreign relations for "serverpod_log" table
--
ALTER TABLE ONLY "serverpod_log"
    ADD CONSTRAINT "serverpod_log_fk_0"
    FOREIGN KEY("sessionLogId")
    REFERENCES "serverpod_session_log"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;

--
-- Foreign relations for "serverpod_message_log" table
--
ALTER TABLE ONLY "serverpod_message_log"
    ADD CONSTRAINT "serverpod_message_log_fk_0"
    FOREIGN KEY("sessionLogId")
    REFERENCES "serverpod_session_log"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;

--
-- Foreign relations for "serverpod_query_log" table
--
ALTER TABLE ONLY "serverpod_query_log"
    ADD CONSTRAINT "serverpod_query_log_fk_0"
    FOREIGN KEY("sessionLogId")
    REFERENCES "serverpod_session_log"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;


--
-- MIGRATION VERSION FOR wm
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('wm', '20260117025845261', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20260117025845261', "timestamp" = now();

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
