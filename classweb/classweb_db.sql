-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 11, 2021 at 07:23 AM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `classweb_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `assignment`
--

CREATE TABLE `assignment` (
  `id` bigint(20) NOT NULL,
  `file` varchar(100) NOT NULL,
  `assignment_name` varchar(255) NOT NULL,
  `due_date` date NOT NULL,
  `description` longtext NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
(25, 'Can add all assignment', 7, 'add_allassignment'),
(26, 'Can change all assignment', 7, 'change_allassignment'),
(27, 'Can delete all assignment', 7, 'delete_allassignment'),
(28, 'Can view all assignment', 7, 'view_allassignment'),
(29, 'Can add files', 8, 'add_files'),
(30, 'Can change files', 8, 'change_files'),
(31, 'Can delete files', 8, 'delete_files'),
(32, 'Can view files', 8, 'view_files'),
(33, 'Can add pelcone', 9, 'add_pelcone'),
(34, 'Can change pelcone', 9, 'change_pelcone'),
(35, 'Can delete pelcone', 9, 'delete_pelcone'),
(36, 'Can view pelcone', 9, 'view_pelcone'),
(37, 'Can add professor unique id', 10, 'add_professoruniqueid'),
(38, 'Can change professor unique id', 10, 'change_professoruniqueid'),
(39, 'Can delete professor unique id', 10, 'delete_professoruniqueid'),
(40, 'Can view professor unique id', 10, 'view_professoruniqueid'),
(41, 'Can add student unique id', 11, 'add_studentuniqueid'),
(42, 'Can change student unique id', 11, 'change_studentuniqueid'),
(43, 'Can delete student unique id', 11, 'delete_studentuniqueid'),
(44, 'Can view student unique id', 11, 'view_studentuniqueid');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$260000$it27ryoBY5iLxLY1rx07K7$osyTPNOMBGZhB9/2qdKsGsbVi+EYPRZ4l65fYFXA8/I=', '2021-12-18 22:10:25.795051', 0, 'mkmk', 'Mohammad', 'Islam', 'kabirulislam.civil@gmail.com', 0, 1, '2021-12-11 06:20:25.184931'),
(2, 'pbkdf2_sha256$260000$htZ0Br0Etmd5ngWD9dOxgj$vFONtPAeOvZfZMMqG3qmdu8X6ibfCD59/5vd9hN3ZxQ=', NULL, 0, 'mklk', 'Mohammad', 'Islam', 'kabirulislam@gmail.com', 0, 1, '2021-12-11 06:21:37.161168'),
(3, 'pbkdf2_sha256$260000$GlikCI1KFl8x5YLkjjGOVQ$NPiGnF1W+AIQl2E7v8G1t8hlmGpa/VQWT6mf3rhAPIM=', '2021-12-18 21:04:53.252595', 0, 'islam', '', '', 'islam@gmail.com', 1, 1, '2021-12-18 03:08:09.374572'),
(4, 'pbkdf2_sha256$260000$r9V1nO3ToIs3hHXlnmRv2A$JZTbM61l4CMWI7L1OziRUAo/MJ6YV6ZKle08YudBFRo=', NULL, 0, 'admin', 'rakib', 'rakib', 'rakib@gmail.com', 0, 0, '2021-12-18 03:10:16.945134'),
(5, 'pbkdf2_sha256$260000$ewg0iBcLwXAux5WQd5jD19$b0/CHyNZYplsfN7krDNT8ueQ7MBzNAB4KTnbA57C1+s=', NULL, 0, 'kkkk', 'kslin', 'kkk', 'ikabirul40@yahoo.com', 0, 0, '2021-12-18 03:11:05.174789'),
(6, 'pbkdf2_sha256$260000$gtJpbA4BnYr0Yfxsa0q7B4$ycVy/f7rDMAAxONgDZZJoyb85LR7QMEHG7olLLoHu0o=', NULL, 0, 'tttt', 'kslin', 'kkk', 'ikabirul@yahoo.com', 0, 0, '2021-12-18 03:11:33.887888'),
(7, 'pbkdf2_sha256$260000$1S18TqeLV1ovjkyc0neNGe$SzobiwmbwY3wKiWomuIY9x728Vw7POXkMAlFQkjy2CY=', NULL, 0, 'kobra', 'Ali ', 'Mohammad', 'kkk@gmail.com', 1, 1, '2021-12-18 03:13:52.110588');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2021-12-18 03:09:25.596274', '1', 'ProfessorUniqueId object (1)', 1, '[{\"added\": {}}]', 10, 3);

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(7, 'classweb_app', 'allassignment'),
(8, 'classweb_app', 'files'),
(9, 'classweb_app', 'pelcone'),
(10, 'classweb_app', 'professoruniqueid'),
(11, 'classweb_app', 'studentuniqueid'),
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2021-12-06 23:03:58.940810'),
(2, 'auth', '0001_initial', '2021-12-06 23:03:59.224758'),
(3, 'admin', '0001_initial', '2021-12-06 23:03:59.272544'),
(4, 'admin', '0002_logentry_remove_auto_add', '2021-12-06 23:03:59.288390'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2021-12-06 23:03:59.288390'),
(6, 'contenttypes', '0002_remove_content_type_name', '2021-12-06 23:03:59.324864'),
(7, 'auth', '0002_alter_permission_name_max_length', '2021-12-06 23:03:59.356981'),
(8, 'auth', '0003_alter_user_email_max_length', '2021-12-06 23:03:59.356981'),
(9, 'auth', '0004_alter_user_username_opts', '2021-12-06 23:03:59.373257'),
(10, 'auth', '0005_alter_user_last_login_null', '2021-12-06 23:03:59.389230'),
(11, 'auth', '0006_require_contenttypes_0002', '2021-12-06 23:03:59.389230'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2021-12-06 23:03:59.409552'),
(13, 'auth', '0008_alter_user_username_max_length', '2021-12-06 23:03:59.409552'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2021-12-06 23:03:59.432108'),
(15, 'auth', '0010_alter_group_name_max_length', '2021-12-06 23:03:59.432108'),
(16, 'auth', '0011_update_proxy_permissions', '2021-12-06 23:03:59.447917'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2021-12-06 23:03:59.463575'),
(18, 'sessions', '0001_initial', '2021-12-06 23:03:59.484470'),
(19, 'classweb_app', '0001_initial', '2021-12-18 03:06:37.501581'),
(20, 'classweb_app', '0002_auto_20211218_1544', '2021-12-18 20:44:56.841639'),
(21, 'classweb_app', '0003_auto_20211218_1557', '2021-12-18 20:57:50.400265'),
(22, 'classweb_app', '0004_auto_20211218_1757', '2021-12-18 23:24:23.659012'),
(23, 'classweb_app', '0005_auto_20211218_1803', '2021-12-18 23:24:23.688002');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('ch1g920390kpmj74dns0sg5hos0vxdf2', '.eJxVjE0OwiAUBu_C2hB-iva5dN8zkA8eSNXQpLQr490NSRe6nZnMW3jsW_F7S6ufWVyFFqdfFhCfqXbBD9T7IuNSt3UOsifysE1OC6fX7Wj_BgWt9K0b3SUz5aSMIg2XoHSA5UyGaNCBxmAZJmrinM-wiIDVGXEwQVkjPl_rwTh3:1myhuL:EUADkxtwxiCUYmcFW24HSH0zN3ShYpVMDUZzXBANZWM', '2022-01-01 22:10:25.803220');

-- --------------------------------------------------------

--
-- Table structure for table `files`
--

CREATE TABLE `files` (
  `id` bigint(20) NOT NULL,
  `filename` varchar(100) DEFAULT NULL,
  `pdf` varchar(255) DEFAULT NULL,
  `owner` varchar(255) DEFAULT NULL,
  `cover` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `pelcone`
--

CREATE TABLE `pelcone` (
  `id` bigint(20) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `owner` varchar(100) DEFAULT NULL,
  `pdf` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pelcone`
--

INSERT INTO `pelcone` (`id`, `name`, `owner`, `pdf`) VALUES
(1, 'Assignment 1', 'Something', 'store/pdfs/Sosur_TmY6Ymg.pdf'),
(2, 'Assignment 10', NULL, 'store/pdfs/খলত_ভই_U2ikLxO.pdf'),
(3, 'Myassubnd', NULL, 'store/pdfs/Sosur_Qrom2J3.pdf'),
(4, 'Assignment 10', NULL, 'store/pdfs/খলত_ভই_MtaXZNn.pdf'),
(5, 'Assignment 1121', NULL, 'store/pdfs/খলত_ভই_qGRPT2e.pdf'),
(6, 'assss', NULL, 'store/pdfs/খলত_ভই_pJFHYrg.pdf'),
(7, 'Assignment 100', NULL, 'store/pdfs/Sosur_d62EgMO.pdf');

-- --------------------------------------------------------

--
-- Table structure for table `professor_unique_id`
--

CREATE TABLE `professor_unique_id` (
  `id` bigint(20) NOT NULL,
  `institution_id` bigint(20) NOT NULL,
  `unique_id` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `professor_unique_id`
--

INSERT INTO `professor_unique_id` (`id`, `institution_id`, `unique_id`) VALUES
(1, 99999, '99999kkkkk');

-- --------------------------------------------------------

--
-- Table structure for table `student_unique_id`
--

CREATE TABLE `student_unique_id` (
  `id` bigint(20) NOT NULL,
  `institution_id` bigint(20) NOT NULL,
  `unique_id` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `stu_file`
--

CREATE TABLE `stu_file` (
  `assignment_name` varchar(100) DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `description` text DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `file` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `stu_file`
--

INSERT INTO `stu_file` (`assignment_name`, `due_date`, `description`, `status`, `file`) VALUES
('Assignment 07', '2021-12-30', '                            dfhgdfugdf  fkjgh     ', 1, 'store/stu_files/খলত_ভই_d2MxA5d.pdf');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `assignment`
--
ALTER TABLE `assignment`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `files`
--
ALTER TABLE `files`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pelcone`
--
ALTER TABLE `pelcone`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `professor_unique_id`
--
ALTER TABLE `professor_unique_id`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `student_unique_id`
--
ALTER TABLE `student_unique_id`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `assignment`
--
ALTER TABLE `assignment`
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

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
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `files`
--
ALTER TABLE `files`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pelcone`
--
ALTER TABLE `pelcone`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `professor_unique_id`
--
ALTER TABLE `professor_unique_id`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `student_unique_id`
--
ALTER TABLE `student_unique_id`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

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
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;