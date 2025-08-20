-- PostgreSQL SQL Dump
-- Database: "vpn_codecanyon"

-- Table structure for table "admins"
CREATE TABLE "admins" (
  "id" BIGSERIAL PRIMARY KEY,
  "username" VARCHAR(50) NOT NULL UNIQUE,
  "name" VARCHAR(100) NOT NULL,
  "email" VARCHAR(100) NOT NULL UNIQUE,
  "email_verified_at" TIMESTAMP NULL DEFAULT NULL,
  "password" VARCHAR(255) NOT NULL,
  "status" SMALLINT DEFAULT 0,
  "remember_token" VARCHAR(100) DEFAULT NULL,
  "created_at" TIMESTAMP NULL DEFAULT NULL,
  "updated_at" TIMESTAMP NULL DEFAULT NULL
);

-- Dumping data for table "admins"
INSERT INTO "admins" ("id", "username", "name", "email", "email_verified_at", "password", "status", "remember_token", "created_at", "updated_at") VALUES
(1, 'admin', 'Abu Motaleb', 'admin@gmail.com', NULL, '$2y$12$ryUdY7MTej2G7mnEWzitfOCx6FWdC9K7y/beISI.Vu9Oa/C2khHNe', 0, 'oKpRJMkpkAJcotDh7VVjRpEC4oXJ7LycHEDfhETytkhnlVoAxdFr50z2SsYU', '2024-12-19 06:24:59', '2024-12-19 06:24:59');

-- Table structure for table "advertisements"
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

-- Table structure for table "app_settings"
CREATE TABLE "app_settings" (
  "id" BIGSERIAL PRIMARY KEY,
  "login_system_type" VARCHAR(50) NOT NULL DEFAULT 'email_password_only',
  "faq_url" VARCHAR(255) DEFAULT NULL,
  "contact_us_url" VARCHAR(255) DEFAULT NULL,
  "privacy_policy_url" VARCHAR(255) DEFAULT NULL,
  "terms_and_conditions_url" VARCHAR(255) DEFAULT NULL,
  "created_at" TIMESTAMP NULL DEFAULT NULL,
  "updated_at" TIMESTAMP NULL DEFAULT NULL
);

-- Table structure for table "cache"
CREATE TABLE "cache" (
  "key" VARCHAR(255) NOT NULL PRIMARY KEY,
  "value" TEXT NOT NULL,
  "expiration" INTEGER NOT NULL
);

-- Table structure for table "cache_locks"
CREATE TABLE "cache_locks" (
  "key" VARCHAR(255) NOT NULL PRIMARY KEY,
  "owner" VARCHAR(255) NOT NULL,
  "expiration" INTEGER NOT NULL
);

-- Table structure for table "countries"
CREATE TABLE "countries" (
  "id" BIGSERIAL PRIMARY KEY,
  "name" VARCHAR(100) NOT NULL,
  "icon" VARCHAR(255) NOT NULL,
  "status" SMALLINT DEFAULT 0,
  "created_at" TIMESTAMP NULL DEFAULT NULL,
  "updated_at" TIMESTAMP NULL DEFAULT NULL
);

-- Dumping data for table "countries"
INSERT INTO "countries" ("id", "name", "icon", "status", "created_at", "updated_at") VALUES
(1, 'Bangladesh', 'assets/uploads/countries/1733908259_1732794653_16.Flag-Bangladesh.webp', 0, '2024-12-11 03:10:59', '2024-12-11 03:10:59'),
(2, 'India', 'assets/uploads/countries/1733908269_1732794662_1699126075_935.download.jpg', 0, '2024-12-11 03:11:09', '2024-12-11 03:11:09'),
(3, 'Pakistan', 'assets/uploads/countries/1733908279_1732794736_1699126143_137.istockphoto-1069756720-612x612.jpg', 0, '2024-12-11 03:11:19', '2024-12-11 03:11:19');

-- Table structure for table "devices"
CREATE TABLE "devices" (
  "id" BIGSERIAL PRIMARY KEY,
  "device_id" VARCHAR(255) NOT NULL,
  "fcm_token" VARCHAR(255) NOT NULL,
  "created_at" TIMESTAMP NULL DEFAULT NULL,
  "updated_at" TIMESTAMP NULL DEFAULT NULL
);

-- Dumping data for table "devices"
INSERT INTO "devices" ("id", "device_id", "fcm_token", "created_at", "updated_at") VALUES
(1, 'SKQ1.211019.001', 'd2_XEaToQSisJY5CEc9gtr:APA91bGAkdYRvWr2quFFkLbETd7LhPuMcWPVzFWQ5A-9FMqw0Q3eUcPq_cIgU9cT67QrQyFqaf54ltIoTkk-_HrX5b0EhGXRxLb0tO65RX0garL6OKDKYZQ', '2024-12-19 06:36:52', '2024-12-19 08:25:03');

-- Table structure for table "email_configurations"
CREATE TABLE "email_configurations" (
  "id" BIGSERIAL PRIMARY KEY,
  "email_send_method" VARCHAR(255) DEFAULT NULL,
  "mail_host" VARCHAR(255) DEFAULT NULL,
  "mail_port" VARCHAR(255) DEFAULT NULL,
  "mail_encryption_method" VARCHAR(255) DEFAULT NULL,
  "mail_username" VARCHAR(255) DEFAULT NULL,
  "mail_password" VARCHAR(255) DEFAULT NULL,
  "mail_from_address" VARCHAR(255) DEFAULT NULL,
  "mail_from_name" VARCHAR(255) DEFAULT NULL,
  "created_at" TIMESTAMP NULL DEFAULT NULL,
  "updated_at" TIMESTAMP NULL DEFAULT NULL
);

-- Dumping data for table "email_configurations"
INSERT INTO "email_configurations" ("id", "email_send_method", "mail_host", "mail_port", "mail_encryption_method", "mail_username", "mail_password", "mail_from_address", "mail_from_name", "created_at", "updated_at") VALUES
(1, 'smtp', 'sandbox.smtp.mailtrap.io', '2525', NULL, '2d2be775bb62bf', 'b3dd151a1a7924', 'vpn@gmail.com', 'VPN', '2024-12-12 00:07:34', '2024-12-12 00:07:34');

-- Table structure for table "email_templates"
CREATE TABLE "email_templates" (
  "id" BIGSERIAL PRIMARY KEY,
  "name" VARCHAR(255) NOT NULL,
  "slug" VARCHAR(255) NOT NULL UNIQUE,
  "subject" VARCHAR(255) NOT NULL,
  "content" TEXT NOT NULL,
  "created_at" TIMESTAMP NULL DEFAULT NULL,
  "updated_at" TIMESTAMP NULL DEFAULT NULL
);

-- Dumping data for table "email_templates"
INSERT INTO "email_templates" ("id", "name", "slug", "subject", "content", "created_at", "updated_at") VALUES
(1, 'Password Reset Link', 'password-reset-link', 'Reset Your Password', '<p>Dear <strong>{{ user_name }}</strong>, &nbsp;</p>\r\n\r\n<p>We received a request to reset your password. You can reset your password by clicking the button below: &nbsp;</p>\r\n\r\n<p>{{ reset_button }} &nbsp;</p>\r\n\r\n<p>If you didn&rsquo;t request this, you can safely ignore this email. Rest assured, your account security is important to us. &nbsp;</p>\r\n\r\n<p>If you experience any issues with the reset link or need further assistance, please don&rsquo;t hesitate to reach out to our support team. &nbsp;</p>\r\n\r\n<p>Best regards, &nbsp;<br />\r\n<strong>VPN</strong><br />\r\n&nbsp;</p>', NULL, '2024-12-12 00:23:04'),
(2, 'Password Reset OTP', 'password-reset-otp', 'Your OTP for Password Reset', '<p>Dear <strong>{{ user_name }}</strong>,</p>\r\n\r\n<p>We&rsquo;ve received a request to verify your account. Please use the following One-Time Password (OTP) to proceed with the verification process:</p>\r\n\r\n<p><strong>**{{ otp_code }}**</strong></p>\r\n\r\n<p>This OTP is valid for {{ validity_duration }} minutes. Please ensure you complete the process within this timeframe.</p>\r\n\r\n<p>If you did not request this verification, please disregard this email. Your account security is important to us.</p>\r\n\r\n<p>If you encounter any issues or need further assistance, feel free to reach out to our support team.</p>\r\n\r\n<p>Best regards, &nbsp;<br />\r\n<strong>VPN</strong><br />\r\n&nbsp;</p>', '2024-12-12 00:20:17', '2024-12-12 00:12:23');

-- Table structure for table "failed_jobs"
CREATE TABLE "failed_jobs" (
  "id" BIGSERIAL PRIMARY KEY,
  "uuid" VARCHAR(255) NOT NULL UNIQUE,
  "connection" TEXT NOT NULL,
  "queue" TEXT NOT NULL,
  "payload" TEXT NOT NULL,
  "exception" TEXT NOT NULL,
  "failed_at" TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Table structure for table "global_email_templates"
CREATE TABLE "global_email_templates" (
  "id" BIGSERIAL PRIMARY KEY,
  "email_header" TEXT NOT NULL DEFAULT '',
  "email_footer" VARCHAR(255) NOT NULL DEFAULT '',
  "created_at" TIMESTAMP NULL DEFAULT NULL,
  "updated_at" TIMESTAMP NULL DEFAULT NULL
);

-- Dumping data for table "global_email_templates"
INSERT INTO "global_email_templates" ("id", "email_header", "email_footer", "created_at", "updated_at") VALUES
(1, 'assets/uploads/email_templates/1733983532_logo.png', '<p>vpn@example.com</p>', '2024-12-12 00:05:32', '2024-12-12 00:06:22');

-- Table structure for table "jobs"
CREATE TABLE "jobs" (
  "id" BIGSERIAL PRIMARY KEY,
  "queue" VARCHAR(255) NOT NULL,
  "payload" TEXT NOT NULL,
  "attempts" SMALLINT NOT NULL,
  "reserved_at" INTEGER DEFAULT NULL,
  "available_at" INTEGER NOT NULL,
  "created_at" INTEGER NOT NULL
);

-- Table structure for table "job_batches"
CREATE TABLE "job_batches" (
  "id" VARCHAR(255) NOT NULL PRIMARY KEY,
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

-- Table structure for table "migrations"
CREATE TABLE "migrations" (
  "id" SERIAL PRIMARY KEY,
  "migration" VARCHAR(255) NOT NULL,
  "batch" INTEGER NOT NULL
);

-- Dumping data for table "migrations"
INSERT INTO "migrations" ("id", "migration", "batch") VALUES
(36, '0001_01_01_000000_create_users_table', 1),
(37, '0001_01_01_000001_create_cache_table', 1),
(38, '0001_01_01_000002_create_jobs_table', 1),
(39, '2024_08_08_100120_create_admins_table', 1),
(40, '2024_08_08_101551_create_personal_access_tokens_table', 1),
(41, '2024_08_11_060739_create_permission_tables', 1),
(42, '2024_08_12_082558_create_email_configurations_table', 1),
(43, '2024_08_12_082620_create_email_templates_table', 1),
(44, '2024_08_12_082641_create_global_email_templates_table', 1),
(45, '2024_09_04_184356_create_pages_table', 1),
(46, '2024_09_11_151600_create_devices_table', 1),
(47, '2024_09_11_175416_create_advertisements_table', 1),
(48, '2024_11_28_144738_create_countries_table', 1),
(49, '2024_11_28_170208_create_app_settings_table', 1),
(50, '2024_12_03_151759_create_servers_table', 1),
(51, '2024_12_05_133050_create_package_pricings_table', 1),
(52, '2024_12_10_160551_create_user_packages_table', 1);

-- Table structure for table "model_has_permissions"
CREATE TABLE "model_has_permissions" (
  "permission_id" BIGINT NOT NULL,
  "model_type" VARCHAR(255) NOT NULL,
  "model_id" BIGINT NOT NULL,
  PRIMARY KEY ("permission_id", "model_id", "model_type")
);

-- Table structure for table "model_has_roles"
CREATE TABLE "model_has_roles" (
  "role_id" BIGINT NOT NULL,
  "model_type" VARCHAR(255) NOT NULL,
  "model_id" BIGINT NOT NULL,
  PRIMARY KEY ("role_id", "model_id", "model_type")
);

-- Dumping data for table "model_has_roles"
INSERT INTO "model_has_roles" ("role_id", "model_type", "model_id") VALUES
(1, 'App.Models.Admin', 1);

-- Table structure for table "package_pricings"
CREATE TABLE "package_pricings" (
  "id" BIGSERIAL PRIMARY KEY,
  "package_name" VARCHAR(255) NOT NULL,
  "product_id" VARCHAR(255) NOT NULL,
  "package_duration" INTEGER NOT NULL,
  "package_price" DECIMAL(10,2) NOT NULL,
  "status" SMALLINT DEFAULT 0,
  "created_at" TIMESTAMP NULL DEFAULT NULL,
  "updated_at" TIMESTAMP NULL DEFAULT NULL
);

-- Dumping data for table "package_pricings"
INSERT INTO "package_pricings" ("id", "package_name", "product_id", "package_duration", "package_price", "status", "created_at", "updated_at") VALUES
(1, 'Basic Plan', '123', 7, 5.99, 0, '2024-12-11 03:40:10', '2024-12-11 03:40:47'),
(2, 'Advanced Plan', '345', 30, 19.99, 0, '2024-12-11 03:41:12', '2024-12-11 03:41:12'),
(3, 'Premium Plan', '789', 90, 40.00, 0, '2024-12-11 03:41:30', '2024-12-11 03:41:30'),
(4, 'New Pack', '142', 3, 12.00, 1, '2024-12-18 23:31:36', '2024-12-19 08:01:11');

-- Table structure for table "pages"
CREATE TABLE "pages" (
  "id" BIGSERIAL PRIMARY KEY,
  "title" VARCHAR(255) NOT NULL,
  "slug" VARCHAR(255) NOT NULL UNIQUE,
  "page_content" TEXT NOT NULL,
  "status" SMALLINT DEFAULT 0,
  "created_at" TIMESTAMP NULL DEFAULT NULL,
  "updated_at" TIMESTAMP NULL DEFAULT NULL
);

-- Table structure for table "password_reset_tokens"
CREATE TABLE "password_reset_tokens" (
  "email" VARCHAR(255) NOT NULL,
  "token" VARCHAR(255) NOT NULL,
  "created_at" TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY ("email")
);

-- Table structure for table "permissions"
CREATE TABLE "permissions" (
  "id" BIGSERIAL PRIMARY KEY,
  "name" VARCHAR(255) NOT NULL UNIQUE,
  "guard_name" VARCHAR(255) NOT NULL,
  "group_name" VARCHAR(255) DEFAULT NULL,
  "created_at" TIMESTAMP NULL DEFAULT,
    "created_at" TIMESTAMP NULL DEFAULT NULL,
  "updated_at" TIMESTAMP NULL DEFAULT NULL
);

-- Dumping data for table "permissions"
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

-- Table structure for table "personal_access_tokens"
CREATE TABLE "personal_access_tokens" (
  "id" BIGSERIAL PRIMARY KEY,
  "tokenable_type" VARCHAR(255) NOT NULL,
  "tokenable_id" BIGINT NOT NULL,
  "name" VARCHAR(255) NOT NULL,
  "token" VARCHAR(64) NOT NULL UNIQUE,
  "abilities" TEXT DEFAULT NULL,
  "last_used_at" TIMESTAMP NULL DEFAULT NULL,
  "expires_at" TIMESTAMP NULL DEFAULT NULL,
  "created_at" TIMESTAMP NULL DEFAULT NULL,
  "updated_at" TIMESTAMP NULL DEFAULT NULL
);

-- Dumping data for table "personal_access_tokens"
INSERT INTO "personal_access_tokens" ("id", "tokenable_type", "tokenable_id", "name", "token", "abilities", "last_used_at", "expires_at", "created_at", "updated_at") VALUES
(5, 'App.Models.User', 1, 'user_token', 'db4e9ec4440c6775a755f1d7c5d78cd23c500c60fff2522ebdac6a8af5d72d70', '[\"*\"]', '2024-12-19 07:45:08', NULL, '2024-12-19 07:41:21', '2024-12-19 07:45:08'),
(6, 'App.Models.User', 1, 'user_token', 'f47cc6d919f17c201b405360b702fc395b5e24aeb0e49090408962540b931ec2', '[\"*\"]', NULL, NULL, '2024-12-19 07:45:46', '2024-12-19 07:45:46'),
(7, 'App.Models.User', 1, 'user_token', '414a0a923d00dec182d2d835a466f6024a1eb0a01c4a6d54ca7fc1cb374e4aa4', '[\"*\"]', NULL, NULL, '2024-12-19 07:47:12', '2024-12-19 07:47:12'),
(8, 'App.Models.User', 1, 'user_token', '8d22e4f6aeb4f2170e4b279ed1ec72ed5250d4fb55084a28603c2a4254da2210', '[\"*\"]', '2024-12-19 07:48:19', NULL, '2024-12-19 07:48:18', '2024-12-19 07:48:19'),
(9, 'App.Models.User', 1, 'user_token', '0575047cf72efdacd9c76fa808cf3bc56cba782c82629064e4b17bf598770d3c', '[\"*\"]', '2024-12-19 08:12:17', NULL, '2024-12-19 08:12:17', '2024-12-19 08:12:17'),
(10, 'App.Models.User', 1, 'user_token', 'cbd3d6a933d10fa223e5a90df4b1495d7d39e521c5064837833a7095baff523d', '[\"*\"]', '2024-12-19 08:23:13', NULL, '2024-12-19 08:12:36', '2024-12-19 08:23:13'),
(11, 'App.Models.User', 1, 'user_token', '8795b56f34b9fade686783e9ab61cf3a384f0e62b0a89d152f323496a6898cd4', '[\"*\"]', '2024-12-19 08:25:02', NULL, '2024-12-19 08:25:02', '2024-12-19 08:25:02');

-- Table structure for table "roles"
CREATE TABLE "roles" (
  "id" BIGSERIAL PRIMARY KEY,
  "name" VARCHAR(255) NOT NULL UNIQUE,
  "guard_name" VARCHAR(255) NOT NULL,
  "created_at" TIMESTAMP NULL DEFAULT NULL,
  "updated_at" TIMESTAMP NULL DEFAULT NULL
);

-- Dumping data for table "roles"
INSERT INTO "roles" ("id", "name", "guard_name", "created_at", "updated_at") VALUES
(1, 'Super Admin', 'admin', '2024-12-19 06:24:59', '2024-12-19 06:24:59');

-- Table structure for table "role_has_permissions"
CREATE TABLE "role_has_permissions" (
  "permission_id" BIGINT NOT NULL,
  "role_id" BIGINT NOT NULL,
  PRIMARY KEY ("permission_id", "role_id")
);

-- Dumping data for table "role_has_permissions"
INSERT INTO "role_has_permissions" ("permission_id", "role_id") VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(27, 1),
(28, 1),
(29, 1),
(30, 1),
(31, 1),
(32, 1),
(33, 1),
(34, 1),
(35, 1),
(36, 1),
(37, 1),
(38, 1),
(39, 1),
(40, 1);

-- Table structure for table "servers"
CREATE TABLE "servers" (
  "id" BIGSERIAL PRIMARY KEY,
  "country_id" BIGINT NOT NULL,
  "vpn_country" VARCHAR(255) NOT NULL,
  "name" VARCHAR(255) NOT NULL,
  "vpn_credentials_username" VARCHAR(255) NOT NULL,
  "vpn_credentials_password" VARCHAR(255) NOT NULL,
  "udp_configuration" TEXT DEFAULT NULL,
  "tcp_configuration" TEXT DEFAULT NULL,
  "access_type" VARCHAR(255) NOT NULL,
  "status" SMALLINT DEFAULT 0,
  "created_at" TIMESTAMP NULL DEFAULT NULL,
  "updated_at" TIMESTAMP NULL DEFAULT NULL
);