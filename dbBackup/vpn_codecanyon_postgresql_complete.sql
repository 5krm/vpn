-- PostgreSQL SQL Dump
-- Converted from MySQL dump
-- Original: phpMyAdmin SQL Dump version 5.2.1
-- Host: 127.0.0.1
-- Generation Time: Dec 19, 2024 at 09:29 AM
-- Server version: 10.4.32-MariaDB converted to PostgreSQL
-- PHP Version: 8.2.12

-- PostgreSQL compatible version
BEGIN;

--
-- Database: vpn_codecanyon
--

-- Create ENUM types first
CREATE TYPE login_system_type_enum AS ENUM ('device_id_required', 'email_password_only');

-- --------------------------------------------------------

--
-- Table structure for table "admins"
--

CREATE TABLE "admins" (
  "id" BIGSERIAL PRIMARY KEY,
  "username" VARCHAR(50) NOT NULL,
  "name" VARCHAR(100) NOT NULL,
  "email" VARCHAR(100) NOT NULL,
  "email_verified_at" TIMESTAMP NULL DEFAULT NULL,
  "password" VARCHAR(255) NOT NULL,
  "status" SMALLINT DEFAULT 0, -- 0: active, 1: blocked
  "remember_token" VARCHAR(100) DEFAULT NULL,
  "created_at" TIMESTAMP NULL DEFAULT NULL,
  "updated_at" TIMESTAMP NULL DEFAULT NULL
);

INSERT INTO "admins" ("id", "username", "name", "email", "email_verified_at", "password", "status", "remember_token", "created_at", "updated_at") VALUES
(1, 'admin', 'Abu Motaleb', 'admin@gmail.com', NULL, '$2y$12$ryUdY7MTej2G7mnEWzitfOCx6FWdC9K7y/beISI.Vu9Oa/C2khHNe', 0, 'oKpRJMkpkAJcotDh7VVjRpEC4oXJ7LycHEDfhETytkhnlVoAxdFr50z2SsYU', '2024-12-19 06:24:59', '2024-12-19 06:24:59');

-- --------------------------------------------------------

--
-- Table structure for table "advertisements"
--

CREATE TABLE "advertisements" (
  "id" BIGSERIAL PRIMARY KEY,
  "admob_android_publisher_account_id" VARCHAR(255) DEFAULT NULL,
  "admob_android_banner_ad_unit_id" VARCHAR(255) DEFAULT NULL,
  "admob_android_interstitial_ad_unit_id" VARCHAR(255) DEFAULT NULL,
  "admob_android_native_ad_unit_id" VARCHAR(255) DEFAULT NULL,
  "admob_android_reward_ad_unit_id" VARCHAR(255) DEFAULT NULL,
  "admob_android_app_open_ad_unit_id" VARCHAR(255) DEFAULT NULL,
  "admob_ios_banner_ad_unit_id" VARCHAR(255) DEFAULT NULL,
  "admob_ios_interstitial_ad_unit_id" VARCHAR(255) DEFAULT NULL,
  "admob_ios_native_ad_unit_id" VARCHAR(255) DEFAULT NULL,
  "admob_ios_reward_ad_unit_id" VARCHAR(255) DEFAULT NULL,
  "admob_ios_app_open_ad_unit_id" VARCHAR(255) DEFAULT NULL,
  "facebook_android_banner_ad_unit_id" VARCHAR(255) DEFAULT NULL,
  "facebook_android_interstitial_ad_unit_id" VARCHAR(255) DEFAULT NULL,
  "facebook_android_native_ad_unit_id" VARCHAR(255) DEFAULT NULL,
  "facebook_android_reward_ad_unit_id" VARCHAR(255) DEFAULT NULL,
  "facebook_ios_banner_ad_unit_id" VARCHAR(255) DEFAULT NULL,
  "facebook_ios_interstitial_ad_unit_id" VARCHAR(255) DEFAULT NULL,
  "facebook_ios_native_ad_unit_id" VARCHAR(255) DEFAULT NULL,
  "facebook_ios_reward_ad_unit_id" VARCHAR(255) DEFAULT NULL,
  "unity_game_id" VARCHAR(255) DEFAULT NULL,
  "unity_banner_ad_placement_id" VARCHAR(255) DEFAULT NULL,
  "unity_interstitial_ad_placement_id" VARCHAR(255) DEFAULT NULL,
  "ironsource_app_key" VARCHAR(255) DEFAULT NULL,
  "interstitial_ad_interval" VARCHAR(255) DEFAULT NULL,
  "native_ad_index" VARCHAR(255) DEFAULT NULL,
  "ads_type" VARCHAR(255) NOT NULL,
  "created_at" TIMESTAMP NULL DEFAULT NULL,
  "updated_at" TIMESTAMP NULL DEFAULT NULL
);

-- --------------------------------------------------------

--
-- Table structure for table "app_settings"
--

CREATE TABLE "app_settings" (
  "id" BIGSERIAL PRIMARY KEY,
  "login_system_type" login_system_type_enum NOT NULL DEFAULT 'email_password_only',
  "faq_url" VARCHAR(255) DEFAULT NULL,
  "contact_us_url" VARCHAR(255) DEFAULT NULL,
  "privacy_policy_url" VARCHAR(255) DEFAULT NULL,
  "terms_and_conditions_url" VARCHAR(255) DEFAULT NULL,
  "created_at" TIMESTAMP NULL DEFAULT NULL,
  "updated_at" TIMESTAMP NULL DEFAULT NULL
);

-- --------------------------------------------------------

--
-- Table structure for table "cache"
--

CREATE TABLE "cache" (
  "key" VARCHAR(255) NOT NULL PRIMARY KEY,
  "value" TEXT NOT NULL,
  "expiration" INTEGER NOT NULL
);

INSERT INTO "cache" ("key", "value", "expiration") VALUES
('spatie.permission.cache', 'a:3:{s:5:"alias";a:5:{s:1:"a";s:2:"id";s:1:"b";s:4:"name";s:1:"c";s:10:"guard_name";s:1:"d";s:10:"group_name";s:1:"r";s:5:"roles";}s:11:"permissions";a:40:{i:0;a:5:{s:1:"a";i:1;s:1:"b";s:14:"dashboard.view";s:1:"c";s:5:"admin";s:1:"d";s:9:"dashboard";s:1:"r";a:1:{i:0;i:1;}}i:1;a:5:{s:1:"a";i:2;s:1:"b";s:9:"role.view";s:1:"c";s:5:"admin";s:1:"d";s:4:"role";s:1:"r";a:1:{i:0;i:1;}}i:2;a:5:{s:1:"a";i:3;s:1:"b";s:11:"role.create";s:1:"c";s:5:"admin";s:1:"d";s:4:"role";s:1:"r";a:1:{i:0;i:1;}}i:3;a:5:{s:1:"a";i:4;s:1:"b";s:9:"role.edit";s:1:"c";s:5:"admin";s:1:"d";s:4:"role";s:1:"r";a:1:{i:0;i:1;}}i:4;a:5:{s:1:"a";i:5;s:1:"b";s:11:"role.delete";s:1:"c";s:5:"admin";s:1:"d";s:4:"role";s:1:"r";a:1:{i:0;i:1;}}i:5;a:5:{s:1:"a";i:6;s:1:"b";s:10:"admin.view";s:1:"c";s:5:"admin";s:1:"d";s:5:"admin";s:1:"r";a:1:{i:0;i:1;}}i:6;a:5:{s:1:"a";i:7;s:1:"b";s:12:"admin.create";s:1:"c";s:5:"admin";s:1:"d";s:5:"admin";s:1:"r";a:1:{i:0;i:1;}}i:7;a:5:{s:1:"a";i:8;s:1:"b";s:10:"admin.edit";s:1:"c";s:5:"admin";s:1:"d";s:5:"admin";s:1:"r";a:1:{i:0;i:1;}}i:8;a:5:{s:1:"a";i:9;s:1:"b";s:12:"admin.delete";s:1:"c";s:5:"admin";s:1:"d";s:5:"admin";s:1:"r";a:1:{i:0;i:1;}}i:9;a:5:{s:1:"a";i:10;s:1:"b";s:9:"user.view";s:1:"c";s:5:"admin";s:1:"d";s:4:"user";s:1:"r";a:1:{i:0;i:1;}}i:10;a:5:{s:1:"a";i:11;s:1:"b";s:9:"user.edit";s:1:"c";s:5:"admin";s:1:"d";s:4:"user";s:1:"r";a:1:{i:0;i:1;}}i:11;a:5:{s:1:"a";i:12;s:1:"b";s:11:"user.delete";s:1:"c";s:5:"admin";s:1:"d";s:4:"user";s:1:"r";a:1:{i:0;i:1;}}i:12;a:5:{s:1:"a";i:13;s:1:"b";s:12:"country.view";s:1:"c";s:5:"admin";s:1:"d";s:7:"country";s:1:"r";a:1:{i:0;i:1;}}i:13;a:5:{s:1:"a";i:14;s:1:"b";s:14:"country.create";s:1:"c";s:5:"admin";s:1:"d";s:7:"country";s:1:"r";a:1:{i:0;i:1;}}i:14;a:5:{s:1:"a";i:15;s:1:"b";s:12:"country.edit";s:1:"c";s:5:"admin";s:1:"d";s:7:"country";s:1:"r";a:1:{i:0;i:1;}}i:15;a:5:{s:1:"a";i:16;s:1:"b";s:14:"country.delete";s:1:"c";s:5:"admin";s:1:"d";s:7:"country";s:1:"r";a:1:{i:0;i:1;}}i:16;a:5:{s:1:"a";i:17;s:1:"b";s:11:"server.view";s:1:"c";s:5:"admin";s:1:"d";s:6:"server";s:1:"r";a:1:{i:0;i:1;}}i:17;a:5:{s:1:"a";i:18;s:1:"b";s:13:"server.create";s:1:"c";s:5:"admin";s:1:"d";s:6:"server";s:1:"r";a:1:{i:0;i:1;}}i:18;a:5:{s:1:"a";i:19;s:1:"b";s:11:"server.edit";s:1:"c";s:5:"admin";s:1:"d";s:6:"server";s:1:"r";a:1:{i:0;i:1;}}i:19;a:5:{s:1:"a";i:20;s:1:"b";s:13:"server.delete";s:1:"c";s:5:"admin";s:1:"d";s:6:"server";s:1:"r";a:1:{i:0;i:1;}}i:20;a:5:{s:1:"a";i:21;s:1:"b";s:20:"package_pricing.view";s:1:"c";s:5:"admin";s:1:"d";s:15:"package_pricing";s:1:"r";a:1:{i:0;i:1;}}i:21;a:5:{s:1:"a";i:22;s:1:"b";s:22:"package_pricing.create";s:1:"c";s:5:"admin";s:1:"d";s:15:"package_pricing";s:1:"r";a:1:{i:0;i:1;}}i:22;a:5:{s:1:"a";i:23;s:1:"b";s:20:"package_pricing.edit";s:1:"c";s:5:"admin";s:1:"d";s:15:"package_pricing";s:1:"r";a:1:{i:0;i:1;}}i:23;a:5:{s:1:"a";i:24;s:1:"b";s:22:"package_pricing.delete";s:1:"c";s:5:"admin";s:1:"d";s:15:"package_pricing";s:1:"r";a:1:{i:0;i:1;}}i:24;a:5:{s:1:"a";i:25;s:1:"b";s:17:"notification.send";s:1:"c";s:5:"admin";s:1:"d";s:12:"notification";s:1:"r";a:1:{i:0;i:1;}}i:25;a:5:{s:1:"a";i:26;s:1:"b";s:9:"page.view";s:1:"c";s:5:"admin";s:1:"d";s:4:"page";s:1:"r";a:1:{i:0;i:1;}}i:26;a:5:{s:1:"a";i:27;s:1:"b";s:11:"page.create";s:1:"c";s:5:"admin";s:1:"d";s:4:"page";s:1:"r";a:1:{i:0;i:1;}}i:27;a:5:{s:1:"a";i:28;s:1:"b";s:9:"page.edit";s:1:"c";s:5:"admin";s:1:"d";s:4:"page";s:1:"r";a:1:{i:0;i:1;}}i:28;a:5:{s:1:"a";i:29;s:1:"b";s:11:"page.delete";s:1:"c";s:5:"admin";s:1:"d";s:4:"page";s:1:"r";a:1:{i:0;i:1;}}i:29;a:5:{s:1:"a";i:30;s:1:"b";s:19:"email-settings.view";s:1:"c";s:5:"admin";s:1:"d";s:14:"email-settings";s:1:"r";a:1:{i:0;i:1;}}i:30;a:5:{s:1:"a";i:31;s:1:"b";s:24:"email-configuration.edit";s:1:"c";s:5:"admin";s:1:"d";s:14:"email-settings";s:1:"r";a:1:{i:0;i:1;}}i:31;a:5:{s:1:"a";i:32;s:1:"b";s:20:"email-templates.edit";s:1:"c";s:5:"admin";s:1:"d";s:14:"email-settings";s:1:"r";a:1:{i:0;i:1;}}i:32;a:5:{s:1:"a";i:33;s:1:"b";s:27:"email-global-templates.edit";s:1:"c";s:5:"admin";s:1:"d";s:14:"email-settings";s:1:"r";a:1:{i:0;i:1;}}i:33;a:5:{s:1:"a";i:34;s:1:"b";s:13:"settings.view";s:1:"c";s:5:"admin";s:1:"d";s:8:"settings";s:1:"r";a:1:{i:0;i:1;}}i:34;a:5:{s:1:"a";i:35;s:1:"b";s:26:"notification-settings.view";s:1:"c";s:5:"admin";s:1:"d";s:8:"settings";s:1:"r";a:1:{i:0;i:1;}}i:35;a:5:{s:1:"a";i:36;s:1:"b";s:26:"notification-settings.edit";s:1:"c";s:5:"admin";s:1:"d";s:8:"settings";s:1:"r";a:1:{i:0;i:1;}}i:36;a:5:{s:1:"a";i:37;s:1:"b";s:27:"advertisement-settings.view";s:1:"c";s:5:"admin";s:1:"d";s:8:"settings";s:1:"r";a:1:{i:0;i:1;}}i:37;a:5:{s:1:"a";i:38;s:1:"b";s:27:"advertisement-settings.edit";s:1:"c";s:5:"admin";s:1:"d";s:8:"settings";s:1:"r";a:1:{i:0;i:1;}}i:38;a:5:{s:1:"a";i:39;s:1:"b";s:17:"app-settings.view";s:1:"c";s:5:"admin";s:1:"d";s:8:"settings";s:1:"r";a:1:{i:0;i:1;}}i:39;a:5:{s:1:"a";i:40;s:1:"b";s:17:"app-settings.edit";s:1:"c";s:5:"admin";s:1:"d";s:8:"settings";s:1:"r";a:1:{i:0;i:1;}}}s:5:"roles";a:1:{i:0;a:3:{s:1:"a";i:1;s:1:"b";s:11:"Super Admin";s:1:"c";s:5:"admin";}}}', 1734675925);

-- --------------------------------------------------------

--
-- Table structure for table "cache_locks"
--

CREATE TABLE "cache_locks" (
  "key" VARCHAR(255) NOT NULL PRIMARY KEY,
  "owner" VARCHAR(255) NOT NULL,
  "expiration" INTEGER NOT NULL
);

-- --------------------------------------------------------

--
-- Table structure for table "countries"
--

CREATE TABLE "countries" (
  "id" BIGSERIAL PRIMARY KEY,
  "name" VARCHAR(100) NOT NULL,
  "icon" VARCHAR(255) NOT NULL,
  "status" SMALLINT DEFAULT 0, -- 0: active, 1: inactive
  "created_at" TIMESTAMP NULL DEFAULT NULL,
  "updated_at" TIMESTAMP NULL DEFAULT NULL
);

INSERT INTO "countries" ("id", "name", "icon", "status", "created_at", "updated_at") VALUES
(1, 'Bangladesh', 'assets/uploads/countries/1733908259_1732794653_16.Flag-Bangladesh.webp', 0, '2024-12-11 03:10:59', '2024-12-11 03:10:59'),
(2, 'India', 'assets/uploads/countries/1733908269_1732794662_1699126075_935.download.jpg', 0, '2024-12-11 03:11:09', '2024-12-11 03:11:09'),
(3, 'Pakistan', 'assets/uploads/countries/1733908279_1732794736_1699126143_137.istockphoto-1069756720-612x612.jpg', 0, '2024-12-11 03:11:19', '2024-12-11 03:11:19');

-- --------------------------------------------------------

--
-- Table structure for table "devices"
--

CREATE TABLE "devices" (
  "id" BIGSERIAL PRIMARY KEY,
  "device_id" VARCHAR(255) NOT NULL,
  "fcm_token" VARCHAR(255) NOT NULL,
  "created_at" TIMESTAMP NULL DEFAULT NULL,
  "updated_at" TIMESTAMP NULL DEFAULT NULL
);

INSERT INTO "devices" ("id", "device_id", "fcm_token", "created_at", "updated_at") VALUES
(1, 'SKQ1.211019.001', 'd2_XEaToQSisJY5CEc9gtr:APA91bGAkdYRvWr2quFFkLbETd7LhPuMcWPVzFWQ5A-9FMqw0Q3eUcPq_cIgU9cT67QrQyFqaf54ltIoTkk-_HrX5b0EhGXRxLb0tO65RX0garL6OKDKYZQ', '2024-12-19 06:36:52', '2024-12-19 08:25:03');

-- --------------------------------------------------------

--
-- Table structure for table "email_configurations"
--

CREATE TABLE "email_configurations" (
  "id" BIGSERIAL PRIMARY KEY,
  "email_send_method" VARCHAR(255) NOT NULL,
  "smtp_host" VARCHAR(255) DEFAULT NULL,
  "smtp_port" VARCHAR(255) DEFAULT NULL,
  "smtp_username" VARCHAR(255) DEFAULT NULL,
  "smtp_password" VARCHAR(255) DEFAULT NULL,
  "smtp_encryption" VARCHAR(255) DEFAULT NULL,
  "mail_from_address" VARCHAR(255) DEFAULT NULL,
  "mail_from_name" VARCHAR(255) DEFAULT NULL,
  "created_at" TIMESTAMP NULL DEFAULT NULL,
  "updated_at" TIMESTAMP NULL DEFAULT NULL
);

INSERT INTO "email_configurations" ("id", "email_send_method", "smtp_host", "smtp_port", "smtp_username", "smtp_password", "smtp_encryption", "mail_from_address", "mail_from_name", "created_at", "updated_at") VALUES
(1, 'smtp', 'smtp.gmail.com', '587', 'test@gmail.com', 'test', 'tls', 'test@gmail.com', 'VPN CodeCanyon', '2024-12-19 06:24:59', '2024-12-19 06:24:59');

-- --------------------------------------------------------

--
-- Table structure for table "email_templates"
--

CREATE TABLE "email_templates" (
  "id" BIGSERIAL PRIMARY KEY,
  "name" VARCHAR(255) NOT NULL,
  "slug" VARCHAR(255) NOT NULL UNIQUE,
  "subject" VARCHAR(255) NOT NULL,
  "body" TEXT NOT NULL,
  "created_at" TIMESTAMP NULL DEFAULT NULL,
  "updated_at" TIMESTAMP NULL DEFAULT NULL
);

INSERT INTO "email_templates" ("id", "name", "slug", "subject", "body", "created_at", "updated_at") VALUES
(1, 'OTP Verification', 'otp-verification', 'OTP Verification', '<p>Your OTP is: {{otp}}</p>', '2024-12-19 06:24:59', '2024-12-19 06:24:59'),
(2, 'Welcome Email', 'welcome-email', 'Welcome to VPN CodeCanyon', '<p>Welcome to VPN CodeCanyon!</p>', '2024-12-19 06:24:59', '2024-12-19 06:24:59');

-- --------------------------------------------------------

--
-- Table structure for table "failed_jobs"
--

CREATE TABLE "failed_jobs" (
  "id" BIGSERIAL PRIMARY KEY,
  "uuid" VARCHAR(255) NOT NULL UNIQUE,
  "connection" TEXT NOT NULL,
  "queue" TEXT NOT NULL,
  "payload" TEXT NOT NULL,
  "exception" TEXT NOT NULL,
  "failed_at" TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- --------------------------------------------------------

--
-- Table structure for table "global_email_templates"
--

CREATE TABLE "global_email_templates" (
  "id" BIGSERIAL PRIMARY KEY,
  "email_header" TEXT DEFAULT NULL,
  "email_footer" TEXT DEFAULT NULL,
  "created_at" TIMESTAMP NULL DEFAULT NULL,
  "updated_at" TIMESTAMP NULL DEFAULT NULL
);

INSERT INTO "global_email_templates" ("id", "email_header", "email_footer", "created_at", "updated_at") VALUES
(1, '<h1>VPN CodeCanyon</h1>', '<p>© 2024 VPN CodeCanyon. All rights reserved.</p>', '2024-12-19 06:24:59', '2024-12-19 06:24:59');

-- --------------------------------------------------------

--
-- Table structure for table "jobs"
--

CREATE TABLE "jobs" (
  "id" BIGSERIAL PRIMARY KEY,
  "queue" VARCHAR(255) NOT NULL,
  "payload" TEXT NOT NULL,
  "attempts" SMALLINT NOT NULL,
  "reserved_at" INTEGER DEFAULT NULL,
  "available_at" INTEGER NOT NULL,
  "created_at" INTEGER NOT NULL
);

CREATE INDEX "jobs_queue_index" ON "jobs" ("queue");

-- --------------------------------------------------------

--
-- Table structure for table "job_batches"
--

CREATE TABLE "job_batches" (
  "id" VARCHAR(255) PRIMARY KEY,
  "name" VARCHAR(255) NOT NULL,
  "total_jobs" INTEGER NOT NULL,
  "pending_jobs" INTEGER NOT NULL,
  "failed_jobs" INTEGER NOT NULL,
  "failed_job_ids" TEXT NOT NULL,
  "options" TEXT DEFAULT NULL,
  "cancelled_at" INTEGER DEFAULT NULL,
  "created_at" INTEGER NOT NULL,
  "finished_at" INTEGER DEFAULT NULL
);

-- --------------------------------------------------------

--
-- Table structure for table "migrations"
--

CREATE TABLE "migrations" (
  "id" SERIAL PRIMARY KEY,
  "migration" VARCHAR(255) NOT NULL,
  "batch" INTEGER NOT NULL
);

INSERT INTO "migrations" ("id", "migration", "batch") VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2024_11_26_055728_create_permission_tables', 1),
(5, '2024_11_26_055729_create_admins_table', 1),
(6, '2024_11_26_055730_create_countries_table', 1),
(7, '2024_11_26_055731_create_servers_table', 1),
(8, '2024_11_26_055732_create_package_pricings_table', 1),
(9, '2024_11_26_055733_create_user_packages_table', 1),
(10, '2024_11_26_055734_create_devices_table', 1),
(11, '2024_11_26_055735_create_app_settings_table', 1),
(12, '2024_11_26_055736_create_advertisements_table', 1),
(13, '2024_11_26_055737_create_pages_table', 1),
(14, '2024_11_26_055738_create_email_configurations_table', 1),
(15, '2024_11_26_055739_create_email_templates_table', 1),
(16, '2024_11_26_055740_create_global_email_templates_table', 1),
(17, '2024_11_26_055741_create_personal_access_tokens_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table "model_has_permissions"
--

CREATE TABLE "model_has_permissions" (
  "permission_id" BIGINT NOT NULL,
  "model_type" VARCHAR(255) NOT NULL,
  "model_id" BIGINT NOT NULL,
  PRIMARY KEY ("permission_id", "model_id", "model_type")
);

CREATE INDEX "model_has_permissions_model_id_model_type_index" ON "model_has_permissions" ("model_id", "model_type");

-- --------------------------------------------------------

--
-- Table structure for table "model_has_roles"
--

CREATE TABLE "model_has_roles" (
  "role_id" BIGINT NOT NULL,
  "model_type" VARCHAR(255) NOT NULL,
  "model_id" BIGINT NOT NULL,
  PRIMARY KEY ("role_id", "model_id", "model_type")
);

CREATE INDEX "model_has_roles_model_id_model_type_index" ON "model_has_roles" ("model_id", "model_type");

INSERT INTO "model_has_roles" ("role_id", "model_type", "model_id") VALUES
(1, 'App\\Models\\Admin', 1);

-- --------------------------------------------------------

--
-- Table structure for table "package_pricings"
--

CREATE TABLE "package_pricings" (
  "id" BIGSERIAL PRIMARY KEY,
  "package_name" VARCHAR(255) NOT NULL,
  "product_id" VARCHAR(255) NOT NULL,
  "package_duration" INTEGER NOT NULL,
  "package_price" DECIMAL(10,2) NOT NULL,
  "status" SMALLINT DEFAULT 0, -- 0: active, 1: inactive
  "created_at" TIMESTAMP NULL DEFAULT NULL,
  "updated_at" TIMESTAMP NULL DEFAULT NULL
);

INSERT INTO "package_pricings" ("id", "package_name", "product_id", "package_duration", "package_price", "status", "created_at", "updated_at") VALUES
(1, 'Basic Plan', '123', 7, 5.99, 0, '2024-12-11 03:40:10', '2024-12-11 03:40:47'),
(2, 'Advanced Plan', '345', 30, 19.99, 0, '2024-12-11 03:41:12', '2024-12-11 03:41:12'),
(3, 'Premium Plan', '789', 90, 40.00, 0, '2024-12-11 03:41:30', '2024-12-11 03:41:30'),
(4, 'New Pack', '142', 3, 12.00, 1, '2024-12-18 23:31:36', '2024-12-19 08:01:11');

-- --------------------------------------------------------

--
-- Table structure for table "pages"
--

CREATE TABLE "pages" (
  "id" BIGSERIAL PRIMARY KEY,
  "title" VARCHAR(255) NOT NULL,
  "slug" VARCHAR(255) NOT NULL UNIQUE,
  "page_content" TEXT NOT NULL,
  "status" SMALLINT DEFAULT 0, -- 0: active, 1: inactive
  "created_at" TIMESTAMP NULL DEFAULT NULL,
  "updated_at" TIMESTAMP NULL DEFAULT NULL
);

-- --------------------------------------------------------

--
-- Table structure for table "password_reset_tokens"
--

CREATE TABLE "password_reset_tokens" (
  "email" VARCHAR(255) PRIMARY KEY,
  "token" VARCHAR(255) NOT NULL,
  "created_at" TIMESTAMP NULL DEFAULT NULL
);

-- --------------------------------------------------------

--
-- Table structure for table "permissions"
--

CREATE TABLE "permissions" (
  "id" BIGSERIAL PRIMARY KEY,
  "name" VARCHAR(255) NOT NULL,
  "guard_name" VARCHAR(255) NOT NULL,
  "group_name" VARCHAR(255) DEFAULT NULL,
  "created_at" TIMESTAMP NULL DEFAULT NULL,
  "updated_at" TIMESTAMP NULL DEFAULT NULL,
  UNIQUE ("name", "guard_name")
);

INSERT INTO "permissions" ("id", "name", "guard_name", "group_name", "created_at", "updated_at") VALUES
(1, 'dashboard.view', 'admin', 'dashboard', '2024-12-19 06:24:59', '2024-12-19 06:24:59'),
(2, 'role.view', 'admin', 'role', '2024-12-19 06:24:59', '2024-12-19 06:24:59'),
(3, 'role.create', 'admin', 'role', '2024-12-19 06:24:59', '2024-12-19 06:24:59'),
(4, 'role.edit', 'admin', 'role', '2024-12-19 06:24:59', '2024-12-19 06:24:59'),
(5, 'role.delete', 'admin', 'role', '2024-12-19 06:24:59', '2024-12-19 06:24:59'),
(6, 'admin.view', 'admin', 'admin', '2024-12-19 06:24:59', '2024-12-19 06:24:59'),
(7, 'admin.create', 'admin', 'admin', '2024-12-19 06:24:59', '2024-12-19 06:24:59'),
(8, 'admin.edit', 'admin', 'admin', '2024-12-19 06:24:59', '2024-12-19 06:24:59'),
(9, 'admin.delete', 'admin', 'admin', '2024-12-19 06:24:59', '2024-12-19 06:24:59'),
(10, 'user.view', 'admin', 'user', '2024-12-19 06:24:59', '2024-12-19 06:24:59'),
(11, 'user.edit', 'admin', 'user', '2024-12-19 06:24:59', '2024-12-19 06:24:59'),
(12, 'user.delete', 'admin', 'user', '2024-12-19 06:24:59', '2024-12-19 06:24:59'),
(13, 'country.view', 'admin', 'country', '2024-12-19 06:24:59', '2024-12-19 06:24:59'),
(14, 'country.create', 'admin', 'country', '2024-12-19 06:24:59', '2024-12-19 06:24:59'),
(15, 'country.edit', 'admin', 'country', '2024-12-19 06:24:59', '2024-12-19 06:24:59'),
(16, 'country.delete', 'admin', 'country', '2024-12-19 06:24:59', '2024-12-19 06:24:59'),
(17, 'server.view', 'admin', 'server', '2024-12-19 06:24:59', '2024-12-19 06:24:59'),
(18, 'server.create', 'admin', 'server', '2024-12-19 06:24:59', '2024-12-19 06:24:59'),
(19, 'server.edit', 'admin', 'server', '2024-12-19 06:24:59', '2024-12-19 06:24:59'),
(20, 'server.delete', 'admin', 'server', '2024-12-19 06:24:59', '2024-12-19 06:24:59'),
(21, 'package_pricing.view', 'admin', 'package_pricing', '2024-12-19 06:24:59', '2024-12-19 06:24:59'),
(22, 'package_pricing.create', 'admin', 'package_pricing', '2024-12-19 06:24:59', '2024-12-19 06:24:59'),
(23, 'package_pricing.edit', 'admin', 'package_pricing', '2024-12-19 06:24:59', '2024-12-19 06:24:59'),
(24, 'package_pricing.delete', 'admin', 'package_pricing', '2024-12-19 06:24:59', '2024-12-19 06:24:59'),
(25, 'notification.send', 'admin', 'notification', '2024-12-19 06:24:59', '2024-12-19 06:24:59'),
(26, 'page.view', 'admin', 'page', '2024-12-19 06:24:59', '2024-12-19 06:24:59'),
(27, 'page.create', 'admin', 'page', '2024-12-19 06:24:59', '2024-12-19 06:24:59'),
(28, 'page.edit', 'admin', 'page', '2024-12-19 06:24:59', '2024-12-19 06:24:59'),
(29, 'page.delete', 'admin', 'page', '2024-12-19 06:24:59', '2024-12-19 06:24:59'),
(30, 'email-settings.view', 'admin', 'email-settings', '2024-12-19 06:24:59', '2024-12-19 06:24:59'),
(31, 'email-configuration.edit', 'admin', 'email-settings', '2024-12-19 06:24:59', '2024-12-19 06:24:59'),
(32, 'email-templates.edit', 'admin', 'email-settings', '2024-12-19 06:24:59', '2024-12-19 06:24:59'),
(33, 'email-global-templates.edit', 'admin', 'email-settings', '2024-12-19 06:24:59', '2024-12-19 06:24:59'),
(34, 'settings.view', 'admin', 'settings', '2024-12-19 06:24:59', '2024-12-19 06:24:59'),
(35, 'notification-settings.view', 'admin', 'settings', '2024-12-19 06:24:59', '2024-12-19 06:24:59'),
(36, 'notification-settings.edit', 'admin', 'settings', '2024-12-19 06:24:59', '2024-12-19 06:24:59'),
(37, 'advertisement-settings.view', 'admin', 'settings', '2024-12-19 06:24:59', '2024-12-19 06:24:59'),
(38, 'advertisement-settings.edit', 'admin', 'settings', '2024-12-19 06:24:59', '2024-12-19 06:24:59'),
(39, 'app-settings.view', 'admin', 'settings', '2024-12-19 06:24:59', '2024-12-19 06:24:59'),
(40, 'app-settings.edit', 'admin', 'settings', '2024-12-19 06:24:59', '2024-12-19 06:24:59');

-- --------------------------------------------------------

--
-- Table structure for table "personal_access_tokens"
--

CREATE TABLE "personal_access_tokens" (
  "id" BIGSERIAL PRIMARY KEY,
  "tokenable_type" VARCHAR(255) NOT NULL,
  "tokenable_id" BIGINT NOT NULL,
  "name" VARCHAR(255) NOT NULL,
  "token" VARCHAR(64) NOT NULL UNIQUE,
  "abilities" TEXT,
  "last_used_at" TIMESTAMP NULL DEFAULT NULL,
  "expires_at" TIMESTAMP NULL DEFAULT NULL,
  "created_at" TIMESTAMP NULL DEFAULT NULL,
  "updated_at" TIMESTAMP NULL DEFAULT NULL
);

CREATE INDEX "personal_access_tokens_tokenable_type_tokenable_id_index" ON "personal_access_tokens" ("tokenable_type", "tokenable_id");

-- --------------------------------------------------------

--
-- Table structure for table "roles"
--

CREATE TABLE "roles" (
  "id" BIGSERIAL PRIMARY KEY,
  "name" VARCHAR(255) NOT NULL,
  "guard_name" VARCHAR(255) NOT NULL,
  "created_at" TIMESTAMP NULL DEFAULT NULL,
  "updated_at" TIMESTAMP NULL DEFAULT NULL,
  UNIQUE ("name", "guard_name")
);

INSERT INTO "roles" ("id", "name", "guard_name", "created_at", "updated_at") VALUES
(1, 'super-admin', 'admin', '2024-12-19 06:24:59', '2024-12-19 06:24:59'),
(2, 'admin', 'admin', '2024-12-19 06:24:59', '2024-12-19 06:24:59');

-- --------------------------------------------------------

--
-- Table structure for table "role_has_permissions"
--

CREATE TABLE "role_has_permissions" (
  "permission_id" BIGINT NOT NULL,
  "role_id" BIGINT NOT NULL,
  PRIMARY KEY ("permission_id", "role_id")
);

INSERT INTO "role_has_permissions" ("permission_id", "role_id") VALUES
(1, 2), (2, 2), (3, 2), (4, 2), (5, 2), (6, 2), (7, 2), (8, 2), (9, 2), (10, 2),
(11, 2), (12, 2), (13, 2), (14, 2), (15, 2), (16, 2), (17, 2), (18, 2), (19, 2), (20, 2),
(21, 2), (22, 2), (23, 2), (24, 2), (25, 2), (26, 2), (27, 2), (28, 2), (29, 2), (30, 2),
(31, 2), (32, 2), (33, 2), (34, 2), (35, 2), (36, 2), (37, 2), (38, 2), (39, 2), (40, 2);

CREATE INDEX "role_has_permissions_role_id_foreign" ON "role_has_permissions" ("role_id");

-- --------------------------------------------------------

--
-- Table structure for table "servers"
--

CREATE TABLE "servers" (
  "id" BIGSERIAL PRIMARY KEY,
  "country_id" BIGINT NOT NULL,
  "server_name" VARCHAR(255) NOT NULL,
  "server_ip" VARCHAR(255) NOT NULL,
  "server_domain_name" VARCHAR(255) DEFAULT NULL,
  "username" VARCHAR(255) NOT NULL,
  "password" VARCHAR(255) NOT NULL,
  "ovpn_configuration" TEXT NOT NULL,
  "status" SMALLINT DEFAULT 0, -- 0: active, 1: inactive
  "created_at" TIMESTAMP NULL DEFAULT NULL,
  "updated_at" TIMESTAMP NULL DEFAULT NULL
);

-- --------------------------------------------------------

--
-- Table structure for table "sessions"
--

CREATE TABLE "sessions" (
  "id" VARCHAR(255) PRIMARY KEY,
  "user_id" BIGINT DEFAULT NULL,
  "ip_address" VARCHAR(45) DEFAULT NULL,
  "user_agent" TEXT,
  "payload" TEXT NOT NULL,
  "last_activity" INTEGER NOT NULL
);

CREATE INDEX "sessions_user_id_index" ON "sessions" ("user_id");
CREATE INDEX "sessions_last_activity_index" ON "sessions" ("last_activity");

-- --------------------------------------------------------

--
-- Table structure for table "users"
--

CREATE TABLE "users" (
  "id" BIGSERIAL PRIMARY KEY,
  "name" VARCHAR(255) NOT NULL,
  "email" VARCHAR(255) NOT NULL UNIQUE,
  "email_verified_at" TIMESTAMP NULL DEFAULT NULL,
  "password" VARCHAR(255) NOT NULL,
  "remember_token" VARCHAR(100) DEFAULT NULL,
  "created_at" TIMESTAMP NULL DEFAULT NULL,
  "updated_at" TIMESTAMP NULL DEFAULT NULL
);

INSERT INTO "users" ("id", "name", "email", "email_verified_at", "password", "remember_token", "created_at", "updated_at") VALUES
(1, 'Abu Motaleb', 'user@gmail.com', NULL, '$2y$12$ryUdY7MTej2G7mnEWzitfOCx6FWdC9K7y/beISI.Vu9Oa/C2khHNe', NULL, '2024-12-19 06:25:00', '2024-12-19 06:25:00');

-- --------------------------------------------------------

--
-- Table structure for table "user_packages"
--

CREATE TABLE "user_packages" (
  "id" BIGSERIAL PRIMARY KEY,
  "user_id" BIGINT NOT NULL,
  "package_pricing_id" BIGINT NOT NULL,
  "purchase_date" TIMESTAMP NOT NULL,
  "expiry_date" TIMESTAMP NOT NULL,
  "status" SMALLINT DEFAULT 0, -- 0: active, 1: expired
  "created_at" TIMESTAMP NULL DEFAULT NULL,
  "updated_at" TIMESTAMP NULL DEFAULT NULL
);

INSERT INTO "user_packages" ("id", "user_id", "package_pricing_id", "purchase_date", "expiry_date", "status", "created_at", "updated_at") VALUES
(1, 1, 1, '2024-12-19 06:25:00', '2024-12-26 06:25:00', 0, '2024-12-19 06:25:00', '2024-12-19 06:25:00');

-- --------------------------------------------------------

--
-- Foreign Key Constraints
--

ALTER TABLE "model_has_permissions" ADD CONSTRAINT "model_has_permissions_permission_id_foreign" FOREIGN KEY ("permission_id") REFERENCES "permissions" ("id") ON DELETE CASCADE;

ALTER TABLE "model_has_roles" ADD CONSTRAINT "model_has_roles_role_id_foreign" FOREIGN KEY ("role_id") REFERENCES "roles" ("id") ON DELETE CASCADE;

ALTER TABLE "role_has_permissions" ADD CONSTRAINT "role_has_permissions_permission_id_foreign" FOREIGN KEY ("permission_id") REFERENCES "permissions" ("id") ON DELETE CASCADE;
ALTER TABLE "role_has_permissions" ADD CONSTRAINT "role_has_permissions_role_id_foreign" FOREIGN KEY ("role_id") REFERENCES "roles" ("id") ON DELETE CASCADE;

ALTER TABLE "servers" ADD CONSTRAINT "servers_country_id_foreign" FOREIGN KEY ("country_id") REFERENCES "countries" ("id") ON DELETE CASCADE;

ALTER TABLE "user_packages" ADD CONSTRAINT "user_packages_user_id_foreign" FOREIGN KEY ("user_id") REFERENCES "users" ("id") ON DELETE CASCADE;
ALTER TABLE "user_packages" ADD CONSTRAINT "user_packages_package_pricing_id_foreign" FOREIGN KEY ("package_pricing_id") REFERENCES "package_pricings" ("id") ON DELETE CASCADE;

COMMIT;

-- End of PostgreSQL conversion
-- All MySQL-specific syntax has been converted to PostgreSQL format
-- Tables use BIGSERIAL for auto-incrementing primary keys
-- Data types converted: TINYINT -> SMALLINT, LONGTEXT -> TEXT
-- Backticks replaced with double quotes for identifiers
-- Foreign key constraints added at the end
-- ENUM types created separately and referenced in tables