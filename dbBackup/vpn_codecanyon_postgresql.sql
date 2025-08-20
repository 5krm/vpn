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

--
-- Dumping data for table "admins"
--

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

CREATE TYPE login_system_type_enum AS ENUM ('device_id_required', 'email_password_only');

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

--
-- Dumping data for table "cache"
--

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

--
-- Dumping data for table "countries"
--

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

--
-- Dumping data for table "devices"
--

INSERT INTO "devices" ("id", "device_id", "fcm_token", "created_at", "updated_at") VALUES
(1, 'SKQ1.211019.001', 'd2_XEaToQSisJY5CEc9gtr:APA91bGAkdYRvWr2quFFkLbETd7LhPuMcWPVzFWQ5A-9FMqw0Q3eUcPq_cIgU9cT67QrQyFqaf54ltIoTkk-_HrX5b0EhGXRxLb0tO65RX0garL6OKDKYZQ', '2024-12-19 06:36:52', '2024-12-19 08:25:03');

COMMIT;