-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 22, 2024 at 04:58 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `roadsiderunner`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts_booking`
--

CREATE TABLE `accounts_booking` (
  `id` int(11) NOT NULL,
  `lat` varchar(100) NOT NULL,
  `lang` varchar(100) NOT NULL,
  `service_type` varchar(15) NOT NULL,
  `service_name` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  `phone` varchar(13) NOT NULL,
  `email` varchar(50) NOT NULL,
  `vehicle_name` varchar(50) NOT NULL,
  `vehicle_model` varchar(50) NOT NULL,
  `vehicle_image` varchar(100) NOT NULL,
  `note` longtext NOT NULL,
  `user_id` int(11) NOT NULL,
  `userprofile_id` bigint(20) NOT NULL,
  `status` varchar(50) NOT NULL,
  `sprovider_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `accounts_service`
--

CREATE TABLE `accounts_service` (
  `sno` int(11) NOT NULL,
  `services` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `accounts_serviceprovider`
--

CREATE TABLE `accounts_serviceprovider` (
  `id` int(11) NOT NULL,
  `description` longtext NOT NULL,
  `phone` varchar(13) NOT NULL,
  `lat` varchar(100) NOT NULL,
  `lang` varchar(100) NOT NULL,
  `service_type` varchar(15) NOT NULL,
  `service_name` longtext NOT NULL,
  `address` longtext NOT NULL,
  `pincode` int(11) NOT NULL,
  `profile` varchar(100) NOT NULL,
  `user_id` int(11) NOT NULL,
  `userprofile_id` bigint(20) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `accounts_userprofile`
--

CREATE TABLE `accounts_userprofile` (
  `id` bigint(20) NOT NULL,
  `city` varchar(50) DEFAULT NULL,
  `phone` varchar(25) NOT NULL,
  `gender` varchar(25) NOT NULL,
  `address` longtext NOT NULL,
  `postal_code` varchar(255) DEFAULT NULL,
  `profile_picture` varchar(100) NOT NULL,
  `user_type` varchar(15) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add user profile', 7, 'add_userprofile'),
(26, 'Can change user profile', 7, 'change_userprofile'),
(27, 'Can delete user profile', 7, 'delete_userprofile'),
(28, 'Can view user profile', 7, 'view_userprofile'),
(29, 'Can add service', 8, 'add_service'),
(30, 'Can change service', 8, 'change_service'),
(31, 'Can delete service', 8, 'delete_service'),
(32, 'Can view service', 8, 'view_service'),
(33, 'Can add service provider', 9, 'add_serviceprovider'),
(34, 'Can change service provider', 9, 'change_serviceprovider'),
(35, 'Can delete service provider', 9, 'delete_serviceprovider'),
(36, 'Can view service provider', 9, 'view_serviceprovider'),
(37, 'Can add booking', 10, 'add_booking'),
(38, 'Can change booking', 10, 'change_booking'),
(39, 'Can delete booking', 10, 'delete_booking'),
(40, 'Can view booking', 10, 'view_booking'),
(41, 'Can add contact', 11, 'add_contact'),
(42, 'Can change contact', 11, 'change_contact'),
(43, 'Can delete contact', 11, 'delete_contact'),
(44, 'Can view contact', 11, 'view_contact'),
(45, 'Can add feedback', 12, 'add_feedback'),
(46, 'Can change feedback', 12, 'change_feedback'),
(47, 'Can delete feedback', 12, 'delete_feedback'),
(48, 'Can view feedback', 12, 'view_feedback');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `client_contact`
--

CREATE TABLE `client_contact` (
  `cid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `phone` varchar(13) NOT NULL,
  `email` varchar(50) NOT NULL,
  `subject` varchar(50) NOT NULL,
  `message` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `client_feedback`
--

CREATE TABLE `client_feedback` (
  `sno` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `message` longtext NOT NULL,
  `rating` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(10, 'accounts', 'booking'),
(8, 'accounts', 'service'),
(9, 'accounts', 'serviceprovider'),
(7, 'accounts', 'userprofile'),
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(11, 'client', 'contact'),
(12, 'client', 'feedback'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2023-10-04 03:51:42.784633'),
(2, 'auth', '0001_initial', '2023-10-04 03:51:43.030168'),
(3, 'accounts', '0001_initial', '2023-10-04 03:51:43.095926'),
(4, 'accounts', '0002_alter_userprofile_age_alter_userprofile_city_name_and_more', '2023-10-04 03:51:43.103099'),
(5, 'accounts', '0003_state_rename_city_name_userprofile_city_and_more', '2023-10-04 03:51:43.236444'),
(6, 'accounts', '0004_alter_city_districtid_alter_city_state_id_and_more', '2023-10-04 03:51:43.552238'),
(7, 'accounts', '0005_rename_districts_district', '2023-10-04 03:51:43.619215'),
(8, 'accounts', '0006_rename_districtid_city_district_and_more', '2023-10-04 03:51:43.799460'),
(9, 'accounts', '0007_remove_district_state_alter_userprofile_city_and_more', '2023-10-04 03:51:43.952555'),
(10, 'accounts', '0008_alter_userprofile_profile_picture', '2023-10-04 03:51:43.952555'),
(11, 'accounts', '0009_remove_userprofile_age_alter_userprofile_city_and_more', '2023-10-04 03:51:44.003528'),
(12, 'accounts', '0010_service', '2023-10-04 03:51:44.025555'),
(13, 'accounts', '0011_detailservice', '2023-10-04 03:51:44.102049'),
(14, 'accounts', '0012_detailservice_name', '2023-10-04 03:51:44.123428'),
(15, 'accounts', '0013_alter_detailservice_lang_alter_detailservice_lat', '2023-10-04 03:51:44.202690'),
(16, 'accounts', '0014_rename_detailservice_serviceprovider', '2023-10-04 03:51:44.222587'),
(17, 'accounts', '0015_booking', '2023-10-04 03:51:44.301847'),
(18, 'accounts', '0016_booking_status', '2023-10-04 03:51:44.318496'),
(19, 'accounts', '0017_alter_booking_status', '2023-10-04 03:51:44.323906'),
(20, 'accounts', '0018_alter_booking_status', '2023-10-04 03:51:44.340053'),
(21, 'accounts', '0019_booking_sprovider_name_booking_sprovider_phone_and_more', '2023-10-04 03:51:44.516906'),
(22, 'accounts', '0020_remove_booking_sprovider_name_and_more', '2023-10-04 03:51:44.586933'),
(23, 'accounts', '0021_alter_booking_status', '2023-10-04 03:51:44.618282'),
(24, 'accounts', '0022_alter_booking_status', '2023-10-04 03:51:44.618282'),
(25, 'accounts', '0023_alter_booking_status', '2023-10-04 03:51:44.666994'),
(26, 'accounts', '0024_alter_booking_status', '2023-10-04 03:51:44.680684'),
(27, 'accounts', '0025_alter_booking_status', '2023-10-04 03:51:44.690895'),
(28, 'accounts', '0026_feedback', '2023-10-04 03:51:44.735895'),
(29, 'accounts', '0027_delete_feedback', '2023-10-04 03:51:44.744894'),
(30, 'accounts', '0028_alter_booking_status', '2023-10-04 03:51:44.752896'),
(31, 'admin', '0001_initial', '2023-10-04 03:51:44.817389'),
(32, 'admin', '0002_logentry_remove_auto_add', '2023-10-04 03:51:44.821187'),
(33, 'admin', '0003_logentry_add_action_flag_choices', '2023-10-04 03:51:44.835524'),
(34, 'contenttypes', '0002_remove_content_type_name', '2023-10-04 03:51:44.867110'),
(35, 'auth', '0002_alter_permission_name_max_length', '2023-10-04 03:51:44.904759'),
(36, 'auth', '0003_alter_user_email_max_length', '2023-10-04 03:51:44.910620'),
(37, 'auth', '0004_alter_user_username_opts', '2023-10-04 03:51:44.920676'),
(38, 'auth', '0005_alter_user_last_login_null', '2023-10-04 03:51:44.937770'),
(39, 'auth', '0006_require_contenttypes_0002', '2023-10-04 03:51:44.937770'),
(40, 'auth', '0007_alter_validators_add_error_messages', '2023-10-04 03:51:44.951844'),
(41, 'auth', '0008_alter_user_username_max_length', '2023-10-04 03:51:44.955434'),
(42, 'auth', '0009_alter_user_last_name_max_length', '2023-10-04 03:51:44.971296'),
(43, 'auth', '0010_alter_group_name_max_length', '2023-10-04 03:51:44.985231'),
(44, 'auth', '0011_update_proxy_permissions', '2023-10-04 03:51:44.988032'),
(45, 'auth', '0012_alter_user_first_name_max_length', '2023-10-04 03:51:45.003945'),
(46, 'client', '0001_initial', '2023-10-04 03:51:45.005104'),
(47, 'client', '0002_feedback', '2023-10-04 03:51:45.037915'),
(48, 'sessions', '0001_initial', '2023-10-04 03:51:45.052889');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts_booking`
--
ALTER TABLE `accounts_booking`
  ADD PRIMARY KEY (`id`),
  ADD KEY `accounts_booking_user_id_2ea98fac_fk_auth_user_id` (`user_id`),
  ADD KEY `accounts_booking_userprofile_id_852ef620_fk_accounts_` (`userprofile_id`),
  ADD KEY `accounts_booking_sprovider_id_779697a4_fk_accounts_` (`sprovider_id`);

--
-- Indexes for table `accounts_service`
--
ALTER TABLE `accounts_service`
  ADD PRIMARY KEY (`sno`);

--
-- Indexes for table `accounts_serviceprovider`
--
ALTER TABLE `accounts_serviceprovider`
  ADD PRIMARY KEY (`id`),
  ADD KEY `accounts_detailservice_user_id_d4ae289b_fk_auth_user_id` (`user_id`),
  ADD KEY `accounts_detailservi_userprofile_id_1cbf0f3a_fk_accounts_` (`userprofile_id`);

--
-- Indexes for table `accounts_userprofile`
--
ALTER TABLE `accounts_userprofile`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `client_contact`
--
ALTER TABLE `client_contact`
  ADD PRIMARY KEY (`cid`);

--
-- Indexes for table `client_feedback`
--
ALTER TABLE `client_feedback`
  ADD PRIMARY KEY (`sno`),
  ADD KEY `client_feedback_user_id_077a7b68_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts_booking`
--
ALTER TABLE `accounts_booking`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `accounts_service`
--
ALTER TABLE `accounts_service`
  MODIFY `sno` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `accounts_serviceprovider`
--
ALTER TABLE `accounts_serviceprovider`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `accounts_userprofile`
--
ALTER TABLE `accounts_userprofile`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `client_contact`
--
ALTER TABLE `client_contact`
  MODIFY `cid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `client_feedback`
--
ALTER TABLE `client_feedback`
  MODIFY `sno` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `accounts_booking`
--
ALTER TABLE `accounts_booking`
  ADD CONSTRAINT `accounts_booking_sprovider_id_779697a4_fk_accounts_` FOREIGN KEY (`sprovider_id`) REFERENCES `accounts_serviceprovider` (`id`),
  ADD CONSTRAINT `accounts_booking_user_id_2ea98fac_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `accounts_booking_userprofile_id_852ef620_fk_accounts_` FOREIGN KEY (`userprofile_id`) REFERENCES `accounts_userprofile` (`id`);

--
-- Constraints for table `accounts_serviceprovider`
--
ALTER TABLE `accounts_serviceprovider`
  ADD CONSTRAINT `accounts_detailservi_userprofile_id_1cbf0f3a_fk_accounts_` FOREIGN KEY (`userprofile_id`) REFERENCES `accounts_userprofile` (`id`),
  ADD CONSTRAINT `accounts_detailservice_user_id_d4ae289b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `accounts_userprofile`
--
ALTER TABLE `accounts_userprofile`
  ADD CONSTRAINT `accounts_userprofile_user_id_92240672_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `client_feedback`
--
ALTER TABLE `client_feedback`
  ADD CONSTRAINT `client_feedback_user_id_077a7b68_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
