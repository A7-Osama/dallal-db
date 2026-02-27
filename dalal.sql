-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 25, 2026 at 01:33 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dalal`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) NOT NULL,
  `username` varchar(150) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `token` varchar(255) DEFAULT NULL,
  `role` enum('super_admin','editor','moderator') NOT NULL DEFAULT 'super_admin',
  `status` enum('active','disabled') NOT NULL DEFAULT 'active',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `username`, `password_hash`, `token`, `role`, `status`, `created_at`, `updated_at`) VALUES
(8, 'admin1', '$2y$10$kERxKmDu9DI7AMeXoKP1A.G0EB8kQPwDEzrZvNeQmIBoPzUbtLNwy', 'c42aab3b320c0d24d71f23e4f5f3a764476d24e9094c6d0fec14734560ef73b2', 'super_admin', 'active', '2025-12-14 23:22:22', '2026-01-24 09:24:22'),
(9, 'momo', '$2y$10$0PAd/z7SD.VxO9KmEyJ6AOmWccg0OKJ86W6M1KLMRyWlbBCVavcES', 'f1ffbb974034dd31af31b2ebc04e304fbc920e8db34522a9bbd8c1b954e1816b', 'moderator', 'active', '2025-12-14 23:22:22', '2026-01-21 21:58:42'),
(10, 'eded', '$2y$10$7dT3jtGcPyCwPpD9iwrM.Ot0xcev/l5vS0GHpN8d/8FD658slVB7G', '9fbf83d0c7df4847444e50689148297805b92e6949a9e4dc97660b3d616b2592', 'editor', 'active', '2025-12-14 23:22:22', '2026-01-21 21:59:27'),
(11, 'aaa', '$2y$10$m0p0AtDHK9J.OmNyPoySwe5oF15JLzWQdtuT793Sg2Xkr6ZUmZJdK', NULL, 'super_admin', 'disabled', '2025-12-14 23:22:22', '2025-12-21 04:35:24');

-- --------------------------------------------------------

--
-- Table structure for table `ads`
--

CREATE TABLE `ads` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `admin_id` bigint(20) DEFAULT NULL,
  `type` enum('apartment','house','land','shop') NOT NULL,
  `offer_type` enum('sale_freehold','sale_waqf','rent') NOT NULL,
  `title` varchar(255) NOT NULL,
  `city` enum('sanaa','taiz','aden','ibb','dhamar','hodeidah','hadramout','yareem','saada','amran','raymah','mahweet','haggah','lahj','mahrah','shabwa','marib','aljawf','albayda','aldhale','socotra','abian') NOT NULL,
  `location_text` varchar(255) NOT NULL,
  `google_map_url` varchar(500) DEFAULT NULL,
  `price` bigint(20) NOT NULL,
  `currency` varchar(10) NOT NULL DEFAULT 'YER',
  `negotiable` tinyint(1) DEFAULT 0,
  `area` double NOT NULL,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `extra_details` text DEFAULT NULL,
  `rooms` int(11) DEFAULT NULL,
  `living_rooms` int(11) DEFAULT NULL,
  `bathrooms` int(11) DEFAULT NULL,
  `kitchens` int(11) DEFAULT NULL,
  `floors` int(11) DEFAULT NULL,
  `status` enum('pending','published','rejected') NOT NULL DEFAULT 'pending',
  `reject_reason` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ad_media`
--

CREATE TABLE `ad_media` (
  `id` bigint(20) NOT NULL,
  `ad_id` bigint(20) NOT NULL,
  `type` enum('image','video') NOT NULL,
  `file_path` mediumtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `banners`
--

CREATE TABLE `banners` (
  `id` bigint(20) NOT NULL,
  `admin_id` bigint(20) DEFAULT NULL,
  `image_url` mediumtext NOT NULL,
  `link_url` varchar(255) DEFAULT NULL,
  `sponsor_name` varchar(255) NOT NULL,
  `sponsor_phone` varchar(50) NOT NULL,
  `cost` bigint(20) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `active` tinyint(1) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `banners`
--

INSERT INTO `banners` (`id`, `admin_id`, `image_url`, `link_url`, `sponsor_name`, `sponsor_phone`, `cost`, `start_date`, `end_date`, `active`, `created_at`, `updated_at`) VALUES
(3, 8, 'admin/storage/admin_uploads/banner_69456a4b601985.66605737.webp', 'https://www.al-kbous.com/ar/coffee-and-tea/tea/', 'احمد معاذ الرازي', '774488012', 30, '2025-12-19', '2026-02-28', 1, '2025-12-19 15:09:23', '2026-01-20 07:12:29'),
(4, 8, 'admin/storage/admin_uploads/banner_69456cded85187.50773903.png', NULL, 'مطاعم \"المذاق\" للفلافل', '775000123', 100, '2025-12-19', '2026-02-28', 1, '2025-12-19 15:18:32', '2025-12-19 15:20:35'),
(5, 8, 'admin/storage/admin_uploads/banner_69456cf3ea4774.35864612.png', NULL, 'معرض \"بيتك المريح\" للأجهزة', '778012345', 150, '2025-12-30', '2025-12-19', 1, '2025-12-19 15:20:14', '2025-12-19 15:20:14'),
(6, 8, 'admin/storage/admin_uploads/banner_69456d59c57919.17730734.png', 'https://3almalt9nia.com/', 'عالم التقنية (Tech World)', '777888124', 200, '2025-12-19', '2026-02-28', 1, '2025-12-19 15:21:12', '2026-01-20 13:23:49');

-- --------------------------------------------------------

--
-- Table structure for table `favorites`
--

CREATE TABLE `favorites` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `ad_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `featured_ads`
--

CREATE TABLE `featured_ads` (
  `id` bigint(20) NOT NULL,
  `ad_id` bigint(20) NOT NULL,
  `package_id` bigint(20) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `likes`
--

CREATE TABLE `likes` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `ad_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `admin_id` bigint(20) DEFAULT NULL,
  `message` text NOT NULL,
  `is_read` tinyint(1) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `otp_codes`
--

CREATE TABLE `otp_codes` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `phone` varchar(20) NOT NULL,
  `otp_code` int(5) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `packages`
--

CREATE TABLE `packages` (
  `id` bigint(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `duration_days` int(11) NOT NULL,
  `price` bigint(20) NOT NULL,
  `admin_id` bigint(20) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `packages`
--

INSERT INTO `packages` (`id`, `name`, `duration_days`, `price`, `admin_id`, `created_at`, `updated_at`) VALUES
(24, 'الباقة الأساسية', 30, 10, 8, '2025-12-17 19:46:25', '2025-12-17 19:46:25'),
(25, 'الباقة المميزة', 60, 20, 8, '2025-12-17 20:01:18', '2025-12-17 20:01:18'),
(26, 'الباقة الذهبية', 90, 30, 8, '2025-12-17 20:01:51', '2025-12-17 20:01:51');

-- --------------------------------------------------------

--
-- Table structure for table `reports`
--

CREATE TABLE `reports` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `ad_id` bigint(20) NOT NULL,
  `admin_id` bigint(20) DEFAULT NULL,
  `reason` enum('fake','wrong_info','fraud','other') NOT NULL,
  `description` text DEFAULT NULL,
  `status` enum('open','closed') DEFAULT 'open',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `static_content`
--

CREATE TABLE `static_content` (
  `id` bigint(20) NOT NULL,
  `admin_id` bigint(20) DEFAULT NULL,
  `page` varchar(50) NOT NULL,
  `content` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `static_content`
--

INSERT INTO `static_content` (`id`, `admin_id`, `page`, `content`, `created_at`, `updated_at`) VALUES
(1, 8, 'about_us', 'تطبيق دلاّل هو تطبيق إلكتروني متخصص في عرض وتسويق العقارات، يهدف إلى تسهيل عملية البيع والشراء والإيجار بين المالكين والباحثين عن العقار بطريقة بسيطة وآمنة.\n\nنسعى في دلاّل إلى توفير تجربة استخدام مميزة من خلال:\n\n- عرض الإعلانات العقارية بشكل واضح ومنظم\n\n- تمكين المستخدمين من الوصول السريع إلى العقارات المناسبة\n\n- توفير أدوات تواصل مباشرة بين المعلن والمهتم\n\n- ضمان جودة المحتوى عبر مراجعة الإعلانات والبلاغات\n\nنؤمن بالشفافية والمصداقية، ونعمل باستمرار على تطوير خدماتنا لتلبية احتياجات السوق العقاري وتحقيق رضا المستخدمين.', '2025-12-19 15:28:30', '2025-12-19 15:40:27'),
(2, 8, 'privacy_policy', 'نحن في تطبيق دلاّل نحترم خصوصيتك ونلتزم بحماية بياناتك الشخصية. توضح هذه السياسة كيفية جمع واستخدام وحماية المعلومات الخاصة بالمستخدمين.\n\nالمعلومات التي نقوم بجمعها:\n\n1- الاسم ورقم الهاتف\n\n2- بيانات التواصل (مثل واتساب رقم الهاتف)\n\n3- معلومات الإعلانات التي يتم نشرها\n\n4- بيانات الاستخدام داخل التطبيق\n\nكيفية استخدام المعلومات:\n\n1- إنشاء وإدارة حساب المستخدم\n\n2- عرض الإعلانات العقارية\n\n3- تحسين جودة الخدمات وتجربة المستخدم\n\n4- التواصل مع المستخدم عند الحاجة\n\nحماية البيانات:\n\nنلتزم باتخاذ جميع الإجراءات التقنية والتنظيمية اللازمة لحماية بياناتك من الوصول غير المصرح به أو الاستخدام غير القانوني.\n\nلن يتم مشاركة بياناتك مع أي طرف ثالث إلا في حال كان ذلك مطلوبًا بموجب القانون.', '2025-12-19 15:29:52', '2025-12-19 15:40:29'),
(3, 8, 'terms_of_use', 'باستخدامك لتطبيق دلاّل، فإنك توافق على الشروط والأحكام التالية:\n\n1- يتحمل المستخدم مسؤولية صحة ودقة المعلومات التي يقوم بنشرها في الإعلانات.\n\n2- يمنع نشر أي محتوى مخالف للقوانين أو الآداب العامة أو يحتوي على احتيال أو تضليل.\n\n3- يحق لإدارة التطبيق مراجعة الإعلانات وقبولها أو رفضها أو حذفها .\n\n4- يحق لإدارة التطبيق تعليق أو حظر أي حساب يخالف هذه الشروط.\n\n5- التطبيق غير مسؤول عن أي اتفاق يتم بين المستخدمين خارج نطاق المنصة.\n\nاستمرارك في استخدام التطبيق يعني موافقتك الكاملة على هذه الشروط.', '2025-12-19 15:31:04', '2025-12-19 15:40:52'),
(4, 8, 'contact_us', 'نحن في تطبيق دلاّل سعداء بالتواصل معكم والرد على استفساراتكم.\n\nيمكنكم التواصل معنا عبر وسائل الاتصال التالية:\n\n- رقم الهاتف:\n+967774980813\n\n- البريد الإلكتروني:\nsupport@dallal-app.com\n\nيرجى التواصل خلال أوقات الدوام الرسمية، وسيقوم فريق الدعم بالرد عليكم في أقرب وقت ممكن.', '2025-12-19 15:32:26', '2025-12-19 15:41:03');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) NOT NULL,
  `name` varchar(150) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `is_phone_verified` tinyint(1) NOT NULL DEFAULT 0,
  `whatsapp` varchar(20) DEFAULT NULL,
  `password_hash` varchar(255) NOT NULL,
  `date_of_birth` date NOT NULL,
  `profile_image` mediumtext DEFAULT NULL,
  `status` enum('active','blocked','pending_deletion') NOT NULL DEFAULT 'active',
  `token` text DEFAULT NULL,
  `admin_id` bigint(20) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `ads`
--
ALTER TABLE `ads`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `admin_id` (`admin_id`);

--
-- Indexes for table `ad_media`
--
ALTER TABLE `ad_media`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ad_id` (`ad_id`);

--
-- Indexes for table `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`id`),
  ADD KEY `admin_id` (`admin_id`);

--
-- Indexes for table `favorites`
--
ALTER TABLE `favorites`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`,`ad_id`),
  ADD KEY `ad_id` (`ad_id`);

--
-- Indexes for table `featured_ads`
--
ALTER TABLE `featured_ads`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ad_id` (`ad_id`),
  ADD KEY `package_id` (`package_id`);

--
-- Indexes for table `likes`
--
ALTER TABLE `likes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`,`ad_id`),
  ADD KEY `ad_id` (`ad_id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `admin_id` (`admin_id`);

--
-- Indexes for table `otp_codes`
--
ALTER TABLE `otp_codes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id_2` (`user_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `packages`
--
ALTER TABLE `packages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `admin_id` (`admin_id`);

--
-- Indexes for table `reports`
--
ALTER TABLE `reports`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `ad_id` (`ad_id`),
  ADD KEY `admin_id` (`admin_id`);

--
-- Indexes for table `static_content`
--
ALTER TABLE `static_content`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `page` (`page`),
  ADD KEY `admin_id` (`admin_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `phone` (`phone`),
  ADD UNIQUE KEY `whatsapp` (`whatsapp`),
  ADD KEY `admin_id` (`admin_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `ads`
--
ALTER TABLE `ads`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=121;

--
-- AUTO_INCREMENT for table `ad_media`
--
ALTER TABLE `ad_media`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=127;

--
-- AUTO_INCREMENT for table `banners`
--
ALTER TABLE `banners`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `favorites`
--
ALTER TABLE `favorites`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=86;

--
-- AUTO_INCREMENT for table `featured_ads`
--
ALTER TABLE `featured_ads`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `likes`
--
ALTER TABLE `likes`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=156;

--
-- AUTO_INCREMENT for table `otp_codes`
--
ALTER TABLE `otp_codes`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=126;

--
-- AUTO_INCREMENT for table `packages`
--
ALTER TABLE `packages`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `reports`
--
ALTER TABLE `reports`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `static_content`
--
ALTER TABLE `static_content`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=181;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `ads`
--
ALTER TABLE `ads`
  ADD CONSTRAINT `ads_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ads_ibfk_2` FOREIGN KEY (`admin_id`) REFERENCES `admins` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `ad_media`
--
ALTER TABLE `ad_media`
  ADD CONSTRAINT `ad_media_ibfk_1` FOREIGN KEY (`ad_id`) REFERENCES `ads` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `banners`
--
ALTER TABLE `banners`
  ADD CONSTRAINT `banners_ibfk_1` FOREIGN KEY (`admin_id`) REFERENCES `admins` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `favorites`
--
ALTER TABLE `favorites`
  ADD CONSTRAINT `favorites_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `favorites_ibfk_2` FOREIGN KEY (`ad_id`) REFERENCES `ads` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `featured_ads`
--
ALTER TABLE `featured_ads`
  ADD CONSTRAINT `featured_ads_ibfk_1` FOREIGN KEY (`ad_id`) REFERENCES `ads` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `featured_ads_ibfk_2` FOREIGN KEY (`package_id`) REFERENCES `packages` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `likes`
--
ALTER TABLE `likes`
  ADD CONSTRAINT `likes_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `likes_ibfk_2` FOREIGN KEY (`ad_id`) REFERENCES `ads` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `notifications_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `notifications_ibfk_2` FOREIGN KEY (`admin_id`) REFERENCES `admins` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `otp_codes`
--
ALTER TABLE `otp_codes`
  ADD CONSTRAINT `otp_codes_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `packages`
--
ALTER TABLE `packages`
  ADD CONSTRAINT `packages_ibfk_1` FOREIGN KEY (`admin_id`) REFERENCES `admins` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `reports`
--
ALTER TABLE `reports`
  ADD CONSTRAINT `reports_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `reports_ibfk_2` FOREIGN KEY (`ad_id`) REFERENCES `ads` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `reports_ibfk_3` FOREIGN KEY (`admin_id`) REFERENCES `admins` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `static_content`
--
ALTER TABLE `static_content`
  ADD CONSTRAINT `static_content_ibfk_1` FOREIGN KEY (`admin_id`) REFERENCES `admins` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`admin_id`) REFERENCES `admins` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
