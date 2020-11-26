-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : jeu. 26 nov. 2020 à 07:53
-- Version du serveur :  10.4.14-MariaDB
-- Version de PHP : 7.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `kuhnya`
--

-- --------------------------------------------------------

--
-- Structure de la table `budget`
--

CREATE TABLE `budget` (
  `id` int(11) NOT NULL,
  `name` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `budget`
--

INSERT INTO `budget` (`id`, `name`) VALUES
(1, 'Cheapos'),
(2, 'Standard'),
(3, 'Luxe');

-- --------------------------------------------------------

--
-- Structure de la table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `title` varchar(70) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `category`
--

INSERT INTO `category` (`id`, `title`, `description`) VALUES
(1, 'Entrée', 'Ipsam tempore adipisci id molestias nisi placeat dolor nihil dolorem rem quae non ipsam optio.'),
(2, 'Plat Principal', 'Dolores dolorem dignissimos eos dolor aut reiciendis tempore est adipisci unde numquam nostrum eveniet in ad aut unde ducimus.'),
(3, 'Dessert', 'Placeat aliquid itaque sed consequatur reiciendis adipisci porro nostrum mollitia earum similique velit ipsam eligendi rerum.'),
(4, 'Boisson', 'Labore impedit praesentium ab qui velit quia velit nemo.'),
(5, 'Festif', 'Quidem aspernatur autem atque sed quas vitae quae velit quae explicabo dolorum itaque ipsum sed quia.'),
(6, 'Grignotage', 'Fugit hic natus reprehenderit voluptatem sit voluptas ab impedit dolorum dolor unde dolor explicabo molestiae.'),
(7, 'Hiver', 'Sunt enim sed et a voluptas est molestiae et eos eius et non ut quia doloremque sunt eaque.'),
(8, 'Eté', 'Omnis adipisci velit voluptatibus quam voluptatem ut ab facilis culpa.'),
(9, 'Automne', 'Un plat idéal pour la rentrée !');

-- --------------------------------------------------------

--
-- Structure de la table `comment`
--

CREATE TABLE `comment` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `recipe_id` int(11) NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `validated` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `comment`
--

INSERT INTO `comment` (`id`, `user_id`, `recipe_id`, `content`, `created_at`, `validated`) VALUES
(1, 5, 1, 'Odio non inventore temporibus rerum voluptates temporibus ex. Fugiat aut id repudiandae blanditiis fuga et. Ullam sed quo quisquam.', '2020-11-08 05:05:03', 1),
(2, 8, 1, 'Ipsa enim facilis est voluptatibus commodi quo asperiores. Omnis quidem veniam non ut sit.', '2020-11-12 02:09:02', 1),
(3, 5, 1, 'Consectetur et sunt ipsam voluptatem. Ipsa et debitis at vero.', '2020-11-10 10:46:28', 1),
(4, 5, 1, 'Dolores sit cumque amet voluptas praesentium. Itaque delectus quas quam voluptatum mollitia laboriosam. Nesciunt accusantium perferendis est fugit ea cumque.', '2020-11-04 13:59:50', 1),
(5, 4, 1, 'Amet provident architecto qui id veritatis quis. Quia velit dolores commodi sed aperiam.', '2020-10-09 05:15:23', 1),
(6, 5, 2, 'Vero distinctio quas debitis et. Recusandae vel minima delectus accusamus.', '2020-11-09 00:43:09', 1),
(7, 6, 2, 'Inventore quae voluptas non sint. Eum velit beatae molestias illum dolorem.', '2020-11-10 19:26:25', 1),
(8, 5, 2, 'Ea adipisci ut adipisci deleniti qui aut. Qui minima est maxime incidunt delectus dolorum eos velit. Ea dolor est ipsa nulla quam ut.', '2020-11-05 17:22:57', 1),
(9, 7, 2, 'Esse non culpa impedit eum reiciendis fugit sapiente. In est laboriosam voluptates dignissimos sit fugit omnis itaque.', '2020-11-07 20:53:19', 1),
(14, 7, 4, 'Ex doloremque consectetur reiciendis doloremque fugiat aut qui reprehenderit. Eos aliquam necessitatibus magni aut facilis et. Sint rerum asperiores modi aut.', '2020-10-23 18:54:12', 1),
(15, 8, 4, 'Provident dolor unde quo. Porro ut laudantium quos sapiente ipsam. Et sed delectus dolore et voluptas.', '2020-10-17 03:13:29', 1),
(16, 7, 4, 'Assumenda eum voluptate asperiores nobis quia alias amet. Minima qui quo nisi doloribus.', '2020-10-21 04:09:49', 1),
(17, 8, 4, 'Impedit doloremque in quia at sed commodi tempore. Quis et cumque nostrum. Nihil provident dolor molestias sed aliquid deserunt.', '2020-11-11 22:43:44', 1),
(18, 8, 4, 'Hic fuga voluptatem ex sed mollitia quo esse eligendi. Molestias impedit ducimus reprehenderit hic quod enim. Omnis quis dignissimos nobis aut.', '2020-11-06 00:02:41', 1),
(19, 5, 5, 'Enim non voluptatem ut pariatur hic. Consequatur fuga qui expedita id totam.', '2020-11-13 07:25:18', 1),
(20, 4, 5, 'Nihil odit aut dignissimos exercitationem. Et dolore eum quasi quam necessitatibus molestias. Aut temporibus dolorem commodi quia consequuntur enim voluptatum.', '2020-11-12 19:04:56', 1),
(21, 8, 5, 'Quasi nam distinctio nam inventore sed maiores. Nobis quo harum porro et.', '2020-11-12 17:23:50', 1),
(22, 4, 5, 'Libero odio autem culpa ipsa qui. Cum labore maiores est voluptatum. Ipsum quo vero debitis vel modi voluptatem quia voluptatibus.', '2020-11-13 03:15:38', 1),
(23, 5, 6, 'Cum perferendis nihil aliquid. Suscipit facere iure sed nam vel dolorem eligendi. Labore rerum aut maxime et sit.', '2020-09-22 06:48:02', 1),
(24, 5, 6, 'Explicabo eos minima ipsam enim consequatur minima qui optio. Fugit illum qui molestias quo deserunt est a et.', '2020-10-26 04:46:47', 1),
(25, 5, 6, 'Laudantium quo beatae ea voluptatem. Cum occaecati quae consequuntur atque.', '2020-10-28 02:38:40', 1),
(26, 8, 6, 'Molestiae libero voluptates rerum. Vero placeat quasi omnis aut neque molestiae. Totam aliquid quia ex consequatur vel culpa.', '2020-11-04 04:50:48', 1),
(27, 8, 6, 'Corporis ut illo molestias et aliquid recusandae. Sed porro perferendis et iusto. Quo optio suscipit accusantium quod suscipit.', '2020-09-08 03:29:49', 1),
(38, 5, 9, 'Omnis omnis autem voluptas pariatur reprehenderit. Ut maiores quae error fugit sed. Tempora facere qui quaerat maiores blanditiis.', '2020-07-21 00:17:27', 1),
(39, 5, 9, 'Voluptatem architecto voluptate modi molestias commodi voluptatem inventore. Quisquam dolorem porro nihil incidunt qui. Dolore praesentium nihil tenetur saepe.', '2020-07-08 15:31:48', 1),
(40, 4, 9, 'Alias consequatur perferendis vero. Qui saepe porro praesentium inventore perspiciatis autem reprehenderit.', '2020-09-28 17:09:06', 1),
(41, 6, 10, 'Consectetur nobis nostrum praesentium repellendus. Voluptatum quo rerum asperiores ipsa in. Consequatur qui excepturi aperiam voluptatem esse est.', '2020-11-02 08:10:32', 1),
(42, 4, 10, 'Nostrum quia sint ut blanditiis aut aliquid et. Laborum voluptas neque blanditiis quos beatae aut.', '2020-07-14 06:33:36', 1),
(43, 7, 10, 'Veritatis provident earum ea. Molestias et enim nisi.', '2020-09-17 03:39:24', 1),
(44, 6, 10, 'Eum sit voluptatibus consequatur ipsum modi. Enim corporis doloribus deleniti nihil deleniti quae ut. Sit dolorem enim iste corrupti vitae enim deserunt qui.', '2020-10-17 09:09:45', 1),
(45, 8, 10, 'Quos fuga sapiente cum qui quia incidunt veritatis. Commodi ipsam at voluptas est non officia. Repellendus itaque ad commodi doloribus illum.', '2020-09-21 18:45:20', 1),
(46, 7, 10, 'Asperiores id delectus est eos ut quae omnis. Repellat qui et ab sapiente.', '2020-10-29 08:25:38', 1),
(47, 6, 10, 'Magni vel qui veniam ut corrupti assumenda. Similique mollitia nostrum hic dolores distinctio nihil rerum.', '2020-10-31 12:10:55', 1),
(48, 8, 11, 'Ipsam consequatur qui quia ad odit. Tempora autem et laborum unde. Ut atque voluptatum quidem nemo et nostrum culpa corrupti.', '2020-11-10 17:27:34', 1),
(49, 8, 11, 'Repellat error delectus vel est. Mollitia architecto saepe aut iusto. Voluptatibus modi iusto earum occaecati a nemo est.', '2020-11-12 11:37:00', 1),
(50, 6, 11, 'Distinctio sed similique facilis rerum expedita est et. Itaque veritatis eos aut esse est consectetur adipisci optio.', '2020-11-12 08:05:20', 1),
(51, 5, 11, 'Repellendus accusamus sed repellendus aut qui sint rerum commodi. Porro numquam dolores eveniet quia quaerat temporibus.', '2020-11-12 08:07:13', 1),
(52, 4, 11, 'Aliquam nam quis cum eum voluptas neque voluptatibus. Ipsa ipsa nesciunt dolorum consequatur. Delectus ab perspiciatis praesentium est eum qui et.', '2020-11-11 18:43:49', 1),
(53, 8, 11, 'Omnis deleniti natus soluta sed voluptas porro quo. Cupiditate et doloremque in aut voluptatem. Consectetur inventore sed et rerum.', '2020-11-13 07:10:08', 1),
(54, 7, 11, 'Possimus nihil expedita qui assumenda. Impedit earum voluptatum illo molestias nobis tempore. Illum fugiat nulla sint dolor necessitatibus.', '2020-11-10 19:48:23', 1),
(55, 6, 11, 'Consequatur consectetur nobis delectus occaecati asperiores veritatis. Voluptas ut nulla tempora inventore officia tempore exercitationem.', '2020-11-12 01:52:46', 1),
(56, 7, 12, 'Autem qui rerum quaerat repellat. Distinctio reprehenderit cumque accusantium sit deserunt minima. Alias quasi eaque animi doloribus maxime.', '2020-08-31 15:32:02', 1),
(57, 8, 12, 'Earum fugiat voluptas assumenda aut qui. Quibusdam repellendus non eius eum eius natus et eum.', '2020-10-11 00:02:40', 1),
(58, 5, 12, 'Sunt fugit exercitationem amet. In sapiente qui ut autem molestiae accusamus. Assumenda ut quidem molestias enim iste.', '2020-07-17 21:55:13', 1),
(59, 4, 12, 'In doloremque rem ducimus asperiores sed vel et a. Nihil ut impedit sit.', '2020-10-07 17:54:30', 1),
(60, 7, 12, 'Tempore ex vero facilis voluptatem culpa iure qui. Dolor aliquid deleniti molestiae. Odio a aut qui ratione necessitatibus non dolores.', '2020-09-30 01:53:31', 1),
(61, 7, 12, 'Iure qui reprehenderit aperiam omnis dignissimos soluta assumenda. Natus at atque quod quas eos perspiciatis sed. Nisi ullam iste ullam voluptatem consectetur.', '2020-07-17 10:25:11', 1),
(62, 8, 12, 'Quia quis sunt a vel quia consectetur. Ut consectetur error eaque reprehenderit temporibus fugiat.', '2020-07-28 02:15:45', 1),
(63, 6, 12, 'Voluptatem dicta et cumque molestias deserunt. Est iure et praesentium voluptas.', '2020-10-14 22:02:37', 1),
(71, 4, 14, 'Id reprehenderit perferendis ea vel aliquam atque. Ipsum nobis doloribus magnam dolores ad quia temporibus. Dolorum voluptatem consectetur iure quam.', '2020-11-11 10:58:07', 1),
(72, 4, 14, 'Consectetur voluptatem eaque repudiandae delectus. Deserunt incidunt aliquid cum similique.', '2020-10-28 07:25:10', 1),
(73, 8, 14, 'Laboriosam maiores ut asperiores omnis nihil accusantium porro. Et incidunt ut exercitationem non ducimus. Distinctio non facilis aut tempore ipsam cumque.', '2020-11-12 03:53:32', 1),
(74, 6, 15, 'Et dolor cum sequi voluptas. Et perferendis omnis numquam rerum quis rerum.', '2020-10-30 08:46:04', 1),
(75, 7, 15, 'Adipisci aut non qui nesciunt cupiditate aliquam in. Et ut aperiam porro facere facilis dolorum officia.', '2020-11-02 00:02:43', 1),
(76, 8, 15, 'Neque non deleniti modi reiciendis et sunt est. Fugiat fugiat ducimus dolores alias.', '2020-11-01 18:04:17', 1),
(77, 6, 15, 'Autem quaerat distinctio facere dicta omnis. Aut tempore aut facere non.', '2020-10-09 13:18:26', 1),
(78, 5, 15, 'Sed laborum rerum quasi et enim velit qui. Ratione explicabo qui repudiandae id deserunt. Facilis tempore omnis voluptatibus laudantium.', '2020-10-15 09:37:45', 1),
(79, 5, 15, 'Veniam exercitationem dolore quo iusto optio ipsa est. Quia suscipit fugit minus perspiciatis. Quibusdam repellendus fugit est tempora.', '2020-10-19 06:17:20', 1),
(80, 6, 16, 'Atque harum aliquid ipsum ex veritatis laborum. Blanditiis beatae excepturi expedita praesentium eos provident velit. Quia vitae reiciendis suscipit modi quia illum molestias.', '2020-09-08 08:59:34', 1),
(81, 4, 16, 'Laboriosam numquam voluptas debitis dolores. Delectus et delectus blanditiis ea nihil sunt. Qui est autem alias maxime est incidunt et.', '2020-09-19 15:29:22', 1),
(82, 6, 16, 'Optio at corrupti qui perferendis est. In libero sed autem rem aperiam.', '2020-08-24 20:33:48', 1),
(83, 6, 16, 'Corrupti deserunt alias amet aut sunt sit suscipit. Labore dolorem iusto adipisci sed deleniti atque. Blanditiis repellat ut corporis quidem similique.', '2020-09-08 02:17:23', 1),
(84, 7, 17, 'Cumque voluptatem eius maxime sit ipsam. Ea harum aut similique. Autem dolorum enim sapiente ducimus hic omnis rem eos.', '2020-07-05 23:25:33', 1),
(85, 7, 17, 'Ducimus unde in sed est. Occaecati maxime ducimus at veniam.', '2020-07-18 11:43:27', 1),
(86, 5, 17, 'Fugiat error dicta provident id aliquam quis. Et sed sit iste sunt beatae.', '2020-10-25 12:04:39', 1),
(87, 8, 17, 'Voluptatem fugit vero qui sit. Ab maxime voluptatibus ea tempore aperiam aut ratione. Voluptate reprehenderit illo voluptas qui aperiam eos.', '2020-11-03 04:52:08', 1),
(88, 6, 17, 'Facilis nostrum neque omnis. Veritatis sed dolorem consequatur.', '2020-07-18 17:43:01', 1),
(89, 8, 17, 'Dolores quo eligendi omnis eos eligendi sint. Iusto id illum eligendi sit. Et iusto repudiandae itaque quia eos sed.', '2020-06-11 05:48:07', 1),
(90, 7, 17, 'Nisi sint quod eos soluta autem sint officiis. Recusandae doloribus odit perspiciatis nisi officia suscipit. Enim quisquam laudantium ut voluptatum consequatur dolorum consequatur temporibus.', '2020-06-22 21:16:27', 1),
(91, 6, 18, 'Sint laboriosam assumenda aliquid. Quo velit saepe molestias qui.', '2020-06-17 16:13:15', 1),
(92, 4, 18, 'Itaque quam sunt nulla. Omnis sit sit quae debitis laborum. Aspernatur autem et aperiam.', '2020-08-20 18:55:48', 1),
(93, 6, 18, 'Ut vero quisquam repudiandae deserunt consequuntur quidem non. Deserunt delectus praesentium laboriosam perferendis quasi quibusdam atque quaerat.', '2020-06-22 21:08:45', 1),
(94, 4, 18, 'Temporibus eos odit inventore molestias fugiat. Et minima quisquam et earum placeat.', '2020-09-18 12:46:50', 1),
(95, 6, 18, 'Consequatur est consequatur amet maiores dolorem. Est debitis quos a consequuntur est quaerat dolorem earum. Et eius quia corrupti saepe architecto eum.', '2020-06-21 07:15:25', 1),
(96, 8, 18, 'Sunt voluptatum animi accusantium. Sed nostrum excepturi quia voluptates eos.', '2020-06-08 16:30:33', 1),
(97, 6, 19, 'Iusto molestiae error rerum a. Tempore sit perferendis sequi. Sit cumque id aut sunt.', '2020-06-26 04:02:35', 1),
(98, 5, 19, 'Aliquid a et cum et suscipit quisquam hic sit. Voluptatem qui laborum officia dolorum quo aut.', '2020-08-16 05:35:17', 1),
(99, 5, 19, 'Et dignissimos illum accusantium mollitia totam aspernatur quia. Et sunt reiciendis sit nulla aut quos eligendi.', '2020-06-21 22:16:26', 1),
(100, 7, 20, 'Modi est voluptatum non repellendus. Aut natus nostrum aut beatae.', '2020-09-02 10:41:31', 1),
(101, 4, 20, 'Possimus vel dicta ad asperiores dolorem. Dolore quibusdam error exercitationem aut dolorem. Distinctio a deleniti quia corporis alias.', '2020-08-15 12:05:22', 1),
(102, 4, 20, 'Perferendis itaque laudantium quibusdam sit. Nostrum libero nihil est sequi exercitationem fugit. Consequatur quas voluptatem sequi itaque aliquam.', '2020-09-15 12:43:13', 1),
(103, 4, 20, 'Sed vitae assumenda sed dolore numquam magnam accusamus. Hic praesentium pariatur corrupti est vitae.', '2020-10-06 16:01:46', 1),
(104, 7, 20, 'Delectus adipisci soluta dignissimos non iste. Dolor voluptas ut consequatur suscipit ut animi commodi amet. Veniam nihil est ad tempora voluptas eos.', '2020-08-08 16:13:45', 1),
(105, 6, 20, 'Soluta sed maiores praesentium voluptas hic vitae. Ea voluptatem necessitatibus ut consequatur illum officiis.', '2020-10-21 15:37:34', 1),
(106, 7, 21, 'Consequuntur alias consequatur velit animi quis maiores. Perferendis expedita maxime amet minima aut molestiae error.', '2020-09-26 18:17:45', 1),
(107, 8, 21, 'Et ut at nostrum omnis. Error quo similique sunt alias asperiores enim provident. Quod magnam enim et officia laudantium aliquam et vero.', '2020-11-06 07:41:27', 1),
(108, 8, 21, 'Explicabo sunt qui ea quia delectus aut. Aliquid et inventore aut iste.', '2020-11-11 03:54:31', 1),
(109, 5, 21, 'Inventore itaque repellendus architecto placeat tenetur et. Ut quod tempore eos velit magnam aut ipsa sed. Tempora maxime modi amet.', '2020-10-27 18:38:45', 1),
(123, 4, 34, 'Mon premier message !', '2020-11-24 16:16:59', 1);

-- --------------------------------------------------------

--
-- Structure de la table `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20201112095027', '2020-11-12 10:50:59', 16725),
('DoctrineMigrations\\Version20201112142507', '2020-11-12 15:25:25', 7719),
('DoctrineMigrations\\Version20201112145433', '2020-11-12 15:54:46', 123),
('DoctrineMigrations\\Version20201124132624', '2020-11-24 14:26:39', 286);

-- --------------------------------------------------------

--
-- Structure de la table `image`
--

CREATE TABLE `image` (
  `id` int(11) NOT NULL,
  `recipe_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `image`
--

INSERT INTO `image` (`id`, `recipe_id`, `name`, `description`) VALUES
(1, 1, 'img1.jpg', 'Praesentium possimus id esse sint nobis odio. Possimus vero error rem temporibus qui aliquam. Accusamus sequi perspiciatis dignissimos temporibus. Ut neque quos aut id corrupti dolor.'),
(2, 1, 'img2.jpg', 'Sunt consectetur ducimus tenetur quis et corporis corporis. Dolores rerum totam delectus et et. Cumque possimus quam voluptatem facere fuga quaerat. Id deleniti eveniet blanditiis est. Quam voluptates possimus quod maxime. Deserunt dolore eveniet consequu'),
(3, 2, 'img3.jpg', 'Et eum eveniet labore labore rerum. Odit dicta deserunt sint sed. Tempore soluta repellendus repellat ad repellendus. Commodi quas ducimus consequatur neque totam. Neque aliquam dicta veniam eos illum iure laudantium.'),
(4, 2, 'img4.jpg', 'Soluta veniam rem doloribus. Sed quaerat et eos soluta qui. Tempore quis et veritatis non aspernatur. Aut maiores ipsam illum quod. Praesentium assumenda in omnis. Ipsa inventore vel distinctio suscipit neque architecto explicabo.'),
(5, 2, 'img5.jpg', 'Ab amet illum rem quia velit. Enim rem corrupti eos earum aperiam. Omnis officiis facilis odio voluptatem aut quisquam ut. Tempora consectetur officia est laudantium amet et consequatur. Magni tenetur fugit tempore vitae voluptatibus.'),
(6, 2, 'img6.jpg', 'Maxime et assumenda et culpa debitis quibusdam aspernatur. Magni libero ea voluptatem. Inventore quia consequatur rerum quis. Necessitatibus temporibus atque ut. Non perferendis rerum ut deserunt sit. Laudantium ipsam cupiditate exercitationem quidem haru'),
(9, 4, 'img10.jpg', 'Debitis culpa dolore consequatur cum sint eos non. Ratione explicabo a consequatur natus sed sunt. Beatae sed voluptate ut laboriosam qui. Architecto qui vel ratione alias.'),
(10, 4, 'img7.jpg', 'Iusto autem enim et. Veritatis voluptatum ad dolor quod quia et suscipit. Sunt voluptates saepe itaque nisi non odio perspiciatis dolor. Odio repellat et ut rem rem nobis.'),
(11, 4, 'img4.jpg', 'Quod voluptate dolor provident et eos expedita. Fuga magnam in maxime. Praesentium aliquam commodi occaecati praesentium. Est ea provident quam temporibus animi. Fugiat rerum sit magni et eos consequatur impedit necessitatibus.'),
(12, 5, 'img1.jpg', 'Porro qui saepe molestiae alias ut quo. Et enim libero qui sit vitae. Sit corrupti nesciunt repudiandae similique. Suscipit sequi quis magni exercitationem eos. Perspiciatis quam sunt aut inventore veritatis soluta.'),
(13, 5, 'img2.jpg', 'Pariatur corporis dolorem molestias veniam ex ab aut. Quos dicta quia voluptatibus in. Eos aut tempore modi dolores labore natus saepe. Est et alias nihil consequatur mollitia quae. Velit facilis est enim quis est. Voluptas nobis nam rerum odio aperiam id'),
(14, 6, 'img3.jpg', 'Fuga quibusdam et quae. Qui sint voluptatem voluptatem possimus minus. Voluptatibus officiis ut dolore. Esse consequatur sint consequatur est. Debitis perspiciatis ullam aut sit qui.'),
(15, 6, 'img4.jpg', 'Possimus repudiandae eum minima assumenda. Exercitationem ad in aut sunt sint illum et soluta. Minus consequatur sunt eos id ab sequi libero harum. In quasi molestias quo iste. Ea pariatur vitae animi. Ad cumque sequi voluptatem architecto ex.'),
(21, 9, 'img1.jpg', 'Porro culpa voluptatem dolorum perferendis expedita tempora. Tempore perspiciatis accusamus labore est. Soluta omnis nemo sed aut.'),
(22, 9, 'img2.jpg', 'Molestiae aut adipisci nihil illum. Omnis ex ea optio quo. Aut adipisci et consequatur doloremque rem. Animi dolorum minus animi quia autem id. Expedita ad vel impedit exercitationem culpa qui ut doloremque.'),
(23, 10, 'img3.jpg', 'Harum est omnis ut consequatur vitae quia quod. Ut delectus rerum consequatur fugit. Vero tempora dolorum vel dolorem maxime cupiditate suscipit. Mollitia amet doloremque inventore dolores voluptas sed sit.'),
(24, 10, 'img4.jpg', 'Commodi et nostrum possimus aut iste nemo. Corporis quod iste recusandae. Quisquam ducimus est voluptatem reprehenderit perferendis. Ex voluptas tenetur voluptas eligendi aut excepturi aut. Quia illo architecto iusto alias.'),
(26, 11, 'notfound.jpg', 'Placeat eaque nostrum neque et. Unde ratione et neque. Et exercitationem rerum culpa occaecati rerum numquam.'),
(27, 11, 'notfound.jpg', 'Dolorem laboriosam cumque velit sed. Ipsam quibusdam sequi placeat quia quam quas enim ratione. Ratione dolorum odio laboriosam accusamus officiis consequatur.'),
(28, 11, 'notfound.jpg', 'Exercitationem nemo deleniti nemo voluptatem voluptatibus. Quidem neque repellendus cum sed veritatis neque. Recusandae ducimus veritatis in distinctio praesentium cupiditate. Sint quia fuga et vitae quia recusandae necessitatibus. Praesentium aut quidem '),
(29, 12, 'notfound.jpg', 'Voluptatem soluta doloribus deserunt. Labore vitae blanditiis at debitis distinctio vero rerum. Dolorem optio quod velit accusantium autem. Aut aperiam delectus laudantium atque.'),
(30, 12, 'notfound.jpg', 'Aut est impedit facere non. Eum animi sed et earum. Quia esse perspiciatis ea nemo autem illum in. Accusamus aut provident aut est itaque. Qui ea et omnis minima voluptatem non.'),
(31, 12, 'notfound.jpg', 'Aut consequuntur quidem laborum quo quibusdam. Dolores ratione enim consequatur. Blanditiis quis dolore aliquam fugit nostrum eius qui qui. Modi ut aut dolorem odit eum.'),
(34, 14, 'notfound.jpg', 'Et ab est illum assumenda voluptas quia culpa. Sint accusamus esse natus minus quae eius. Aut temporibus enim fugit nihil aut excepturi non. Perspiciatis corrupti recusandae ipsa neque repellat.'),
(35, 14, 'notfound.jpg', 'Sequi assumenda totam quae et voluptas fugit consequatur. Repellat magnam enim praesentium qui. Rem possimus inventore quo. Eligendi nulla qui architecto. Eum facere dicta accusantium laudantium id.'),
(36, 15, 'notfound.jpg', 'Alias possimus saepe molestiae temporibus. Sed optio veniam dolorum iste et et. Dolorem fugiat natus vel facere blanditiis ipsum aut alias. Doloribus consequatur vel cum quod doloribus dolor ullam.'),
(37, 15, 'notfound.jpg', 'Vel tempora fugiat a ut qui. Doloremque ut veniam tenetur sint commodi quidem. Aperiam mollitia temporibus omnis facilis voluptatem facilis. Quo officiis quos est facilis pariatur quo non commodi. Odit nemo sed dolor aperiam.'),
(38, 15, 'notfound.jpg', 'Aut asperiores culpa quasi labore possimus. Illum illum omnis delectus nostrum. Est cum omnis est aut consequatur. Maxime repellat omnis quis aliquid. Saepe ab reprehenderit velit rem amet dolores.'),
(39, 15, 'notfound.jpg', 'Alias fugiat qui autem fuga. Consequatur est voluptas qui explicabo repudiandae. Maiores dolorem in ducimus mollitia veritatis nobis ducimus amet. Sint voluptates mollitia sunt earum totam.'),
(40, 16, 'notfound.jpg', 'Cumque eos perspiciatis cupiditate minus modi molestiae. Voluptatum consequatur omnis omnis. Sint aut molestiae harum.'),
(41, 16, 'notfound.jpg', 'Autem accusantium voluptate odio est quidem at. Et iure voluptatum ut enim sunt mollitia temporibus. Ducimus quis porro exercitationem qui iure facere asperiores. Nam velit facilis repellendus.'),
(42, 16, 'notfound.jpg', 'Et velit ut quos tenetur numquam. Dolorem sequi et error. Culpa cupiditate tenetur est amet similique labore. Ratione voluptas et quidem fugit sequi porro consequatur.'),
(43, 17, 'notfound.jpg', 'Doloribus eligendi qui eligendi quisquam laudantium iure. Non et magni dolores perspiciatis corrupti. Nihil nobis explicabo eveniet natus quis.'),
(44, 17, 'notfound.jpg', 'Amet atque sapiente autem velit quae laboriosam. Ullam consequatur debitis vel delectus. Culpa similique pariatur numquam quasi veritatis quae. Quis in fugiat consequatur rerum sit.'),
(45, 17, 'notfound.jpg', 'Explicabo impedit officiis alias optio nostrum voluptatibus molestias. Provident dolor quia dolore fuga eum. Cupiditate expedita voluptatem accusantium commodi non.'),
(46, 17, 'notfound.jpg', 'Exercitationem qui consequatur accusantium doloribus quia sunt laborum. Exercitationem qui est alias rem perspiciatis a. Earum aut nisi eveniet nesciunt. Labore sapiente ipsum quos ullam soluta. Veniam aperiam quos eius incidunt.'),
(47, 18, 'notfound.jpg', 'Rerum quod labore dolor dicta est. Quisquam earum corporis et saepe id earum aut non. Placeat explicabo eos magnam magnam ad quos. Culpa eum ut sint eveniet unde. Et beatae sint aut veritatis id deserunt.'),
(48, 19, 'notfound.jpg', 'Atque aut possimus id facilis ut aut qui similique. Expedita praesentium id necessitatibus quis aliquid laboriosam. Nesciunt cum necessitatibus qui ut dicta ut. Sequi officiis quis molestias. Quam animi qui et aut quia est amet. Rerum dignissimos eius qui'),
(49, 20, 'notfound.jpg', 'Perspiciatis animi neque voluptas recusandae saepe quam. Dolor ut harum repellat voluptatem et nihil voluptas. Ullam atque laudantium quisquam. Dolor sint sit quia earum et et commodi. Aperiam error rerum recusandae. Est veritatis ipsum rem quo sit sunt b'),
(50, 21, 'notfound.jpg', 'Qui velit velit incidunt vel labore beatae eum. Ea laudantium eos qui minima rem velit sapiente quo. Dolores deserunt veritatis laboriosam blanditiis distinctio cupiditate hic nobis. Et dignissimos eos et eveniet magnam.'),
(51, 21, 'notfound.jpg', 'Ipsam hic maiores nobis ipsum incidunt aut. Suscipit aut consequatur voluptatum aut quidem saepe expedita aut. Facilis dignissimos quia quae repellendus. Aut necessitatibus tenetur sed. Animi esse ratione rerum excepturi soluta qui quo animi.'),
(65, 34, 'Bliny-a-la-Russe1.jpeg', 'Bliny-a-la-Russe1.jpeg'),
(66, 34, 'Bliny-a-la-Russe2.jpeg', 'Bliny-a-la-Russe2.jpeg'),
(67, 34, 'Bliny-a-la-Russe3.jpeg', 'Bliny-a-la-Russe3.jpeg');

-- --------------------------------------------------------

--
-- Structure de la table `ingredient`
--

CREATE TABLE `ingredient` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `unit` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `ingredient`
--

INSERT INTO `ingredient` (`id`, `name`, `unit`) VALUES
(1, 'Vinaigre', 'l'),
(2, 'Fraise', 'gr'),
(3, 'Gingembre', 'gr'),
(4, 'Carotte', NULL),
(5, 'Cohen', 'gr'),
(7, 'Grenier', 'l'),
(8, 'Lucas', 'kg'),
(9, 'Allain', 'gr'),
(10, 'Chretien', 'l'),
(11, 'Hoarau', 'gr'),
(12, 'Roussel', 'kg'),
(13, 'Auger', 'gr'),
(14, 'Hernandez', 'l'),
(15, 'Robert', 'kg'),
(16, 'Bonneau', 'gr'),
(17, 'Richard', 'kg'),
(18, 'Blondel', 'gr'),
(20, 'Lecomte', 'kg'),
(21, 'Pomme de Terre', 'kg'),
(22, 'Chocolat', 'gr'),
(25, 'Orange', NULL),
(26, 'Miel', 'gr');

-- --------------------------------------------------------

--
-- Structure de la table `level`
--

CREATE TABLE `level` (
  `id` int(11) NOT NULL,
  `name` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `level`
--

INSERT INTO `level` (`id`, `name`) VALUES
(1, 'Facile'),
(2, 'Intermédiaire'),
(3, 'Difficile');

-- --------------------------------------------------------

--
-- Structure de la table `like`
--

CREATE TABLE `like` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `recipe_id` int(11) NOT NULL,
  `rating` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `like`
--

INSERT INTO `like` (`id`, `user_id`, `recipe_id`, `rating`) VALUES
(1, 8, 1, 3),
(2, 6, 1, 3),
(3, 8, 1, 1),
(4, 5, 1, 3),
(5, 7, 1, 2),
(6, 6, 1, 1),
(7, 8, 1, 4),
(8, 8, 2, 2),
(9, 7, 2, 2),
(10, 7, 2, 4),
(11, 7, 2, 5),
(16, 6, 4, 3),
(17, 4, 4, 4),
(18, 4, 4, 3),
(19, 7, 4, 2),
(20, 5, 5, 3),
(21, 7, 5, 3),
(22, 6, 5, 3),
(23, 6, 5, 3),
(24, 5, 5, 1),
(25, 6, 6, 3),
(26, 8, 6, 1),
(27, 6, 6, 2),
(28, 8, 6, 5),
(29, 7, 6, 4),
(41, 7, 9, 2),
(42, 7, 9, 4),
(43, 8, 9, 4),
(44, 8, 10, 4),
(45, 7, 10, 2),
(46, 8, 10, 4),
(47, 6, 10, 5),
(48, 5, 11, 5),
(49, 4, 11, 5),
(50, 8, 11, 1),
(51, 5, 11, 2),
(52, 4, 11, 4),
(53, 5, 12, 1),
(54, 5, 12, 3),
(55, 7, 12, 3),
(56, 7, 12, 4),
(57, 6, 12, 5),
(58, 6, 12, 5),
(65, 7, 14, 5),
(66, 6, 14, 1),
(67, 6, 14, 2),
(68, 4, 14, 4),
(69, 4, 14, 2),
(70, 4, 15, 3),
(71, 8, 15, 3),
(72, 7, 15, 4),
(73, 6, 15, 5),
(74, 4, 15, 5),
(75, 5, 15, 5),
(76, 6, 16, 5),
(77, 8, 16, 2),
(78, 7, 16, 3),
(79, 7, 16, 2),
(80, 6, 16, 1),
(81, 8, 16, 4),
(82, 4, 17, 1),
(83, 7, 17, 5),
(84, 7, 17, 4),
(85, 7, 17, 5),
(86, 8, 17, 1),
(87, 7, 17, 5),
(88, 5, 17, 5),
(89, 7, 18, 1),
(90, 4, 18, 3),
(91, 4, 18, 1),
(92, 7, 18, 1),
(93, 4, 18, 4),
(94, 7, 18, 2),
(95, 8, 19, 1),
(96, 6, 19, 5),
(97, 8, 19, 3),
(98, 4, 19, 2),
(99, 4, 19, 4),
(100, 5, 20, 1),
(101, 4, 20, 5),
(102, 4, 20, 5),
(103, 4, 20, 2),
(104, 6, 20, 4),
(105, 5, 20, 3),
(106, 5, 20, 5),
(107, 7, 21, 5),
(108, 6, 21, 1),
(109, 5, 21, 2),
(110, 5, 21, 3),
(111, 5, 21, 2),
(112, 8, 21, 1),
(124, 4, 2, 4),
(125, 4, 5, 5),
(130, 9, 11, 5),
(132, 4, 10, 5),
(133, 4, 33, 4),
(134, 4, 34, 4),
(135, 4, 16, 5);

-- --------------------------------------------------------

--
-- Structure de la table `prep`
--

CREATE TABLE `prep` (
  `id` int(11) NOT NULL,
  `time` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `prep`
--

INSERT INTO `prep` (`id`, `time`) VALUES
(1, 15),
(2, 30),
(3, 45),
(4, 60),
(5, 75),
(6, 90);

-- --------------------------------------------------------

--
-- Structure de la table `recipe`
--

CREATE TABLE `recipe` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `level_id` int(11) NOT NULL,
  `prep_time_id` int(11) NOT NULL,
  `budget_id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `guests_nb` int(11) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `recipe`
--

INSERT INTO `recipe` (`id`, `user_id`, `level_id`, `prep_time_id`, `budget_id`, `title`, `slug`, `description`, `guests_nb`, `created_at`) VALUES
(1, 4, 2, 5, 1, 'Nihil ipsum animi.', 'nihil-ipsum-animi', '<p>Maxime aliquam voluptatum officiis quo id est. Rerum adipisci laudantium reiciendis architecto. Sint commodi placeat eaque possimus.</p><p>Eveniet ab enim excepturi incidunt et. Pariatur debitis qui atque tempora dolores natus. Iusto ratione iusto ex consequatur.</p><p>Voluptate et porro molestias illum consequatur. Expedita corporis non incidunt quis et. Corrupti in aut sit. Id optio quisquam rerum sit ipsum unde.</p><p>Dicta omnis quia velit suscipit laborum dolorem. Exercitationem voluptatem non non ea. Tempore labore maiores eaque reiciendis id.</p><p>Similique recusandae aut non inventore. At ipsa labore odio minus officiis. Asperiores in et itaque eum velit est reiciendis doloremque.</p>', 4, '2020-09-29 21:33:07'),
(2, 8, 1, 3, 1, 'Unde ex voluptatum molestias.', 'unde-ex-voluptatum-molestias', '<p>Id pariatur enim dolor quo ut. Inventore qui quos aut ducimus hic quia. Quia quos aliquid quia quia necessitatibus dicta magnam. Quidem nihil natus ut et delectus tempore aut. Quia at qui aut officiis tempora aut.</p><p>Et officia sunt consequatur voluptatem. Vitae repudiandae quod laboriosam at quos et aut alias. Suscipit dolorum et hic ut.</p><p>Aut atque culpa labore facilis eaque. Non non itaque eaque. Dolorum quos assumenda consequuntur veritatis itaque.</p><p>Aut quia ut officiis voluptas. Delectus accusamus culpa ducimus non dolorum. Consequatur assumenda provident ut sunt beatae ut. Nihil sit laudantium labore quaerat necessitatibus non ut. Necessitatibus hic quo ut mollitia mollitia minima.</p><p>Minima autem aut eveniet similique error enim non modi. Consequuntur sed qui sunt non delectus ea nesciunt. Libero dicta fugiat rerum assumenda enim. Officia animi qui enim et qui excepturi dolores qui.</p>', 4, '2020-10-28 20:14:23'),
(4, 7, 1, 4, 2, 'Culpa officia tenetur iure.', 'culpa-officia-tenetur-iure', '<p>Numquam a voluptatem reprehenderit nihil ut odit nihil. Incidunt rerum voluptatum sit soluta. Officia sint omnis quas porro tempore et officiis fugit. Tempore in similique aut harum.</p><p>Ducimus nesciunt laborum culpa dolorem sunt. Fuga est sint consectetur quibusdam veritatis.</p><p>Ut ex delectus voluptas est fugit quibusdam eum. Dicta corporis suscipit natus repudiandae dolores hic sapiente enim.</p><p>Dolor architecto animi officia voluptate et earum. Occaecati vitae nobis omnis qui maiores perferendis eaque. Magni ut vitae est tempore. Tempore similique et quia nulla.</p><p>Accusamus modi totam et sed magni eveniet distinctio. Sint dolor cum neque eaque.</p>', 2, '2020-10-13 23:28:03'),
(5, 6, 3, 6, 3, 'Reiciendis adipisci sequi modi quas.', 'reiciendis-adipisci-sequi-modi-quas', '<p>Voluptas fugiat sapiente mollitia ad adipisci excepturi magnam. Eos commodi dicta illo aut odit. Qui placeat est nulla maiores totam laborum dolorem deleniti.</p><p>Dolorem in sit error perferendis perspiciatis dolor. Nemo mollitia asperiores ducimus quia voluptate sint voluptatem. Sed eveniet eos et et impedit. Eius eum eaque cum non et facere sit.</p><p>Tempore aliquam occaecati nemo voluptatem. Cupiditate voluptatum laboriosam a recusandae et sit. Expedita voluptatum sit sed velit vitae totam in.</p><p>Dicta aut aut doloremque commodi. Laboriosam vel rerum doloribus nam. Quos odit laboriosam voluptatibus repellendus quae. Sint aut eos aut quia doloribus sed.</p><p>Culpa quia mollitia blanditiis sint facere enim enim. Aut modi optio beatae sapiente. Quisquam quidem quibusdam maiores aut ducimus sint consectetur. Nam cum eum voluptas temporibus facere doloribus.</p>', 6, '2020-11-12 04:36:45'),
(6, 8, 1, 4, 3, 'Occaecati provident dolores.', 'occaecati-provident-dolores', '<p>Et ut dolorem praesentium qui adipisci ratione. Dolores amet et est molestiae quam. Et molestiae vero necessitatibus vel.</p><p>Atque deserunt soluta ut cum rerum quod. Beatae non numquam exercitationem quisquam vel consectetur. Deserunt placeat libero ea et blanditiis quisquam. Consectetur nisi quis in molestiae illum neque est.</p><p>Alias voluptatem sapiente voluptatem facere. Blanditiis qui non vitae est. Explicabo veniam quam temporibus nemo adipisci.</p><p>Magni fugiat nostrum consequuntur harum laudantium ea quam voluptas. Quisquam eligendi aut perferendis ad consectetur iusto asperiores. Eveniet perferendis et odio et est totam quam.</p><p>Asperiores temporibus voluptatem similique tempora. Voluptas illum mollitia doloribus quis. Ratione quod sequi qui. Et quasi sit odio est doloremque quod.</p>', 4, '2020-08-03 17:40:40'),
(9, 4, 2, 6, 3, 'Hic error dolorem aut.', 'hic-error-dolorem-aut', '<p>Dignissimos non rerum quia repellat aut dolore. Non iusto dignissimos nulla est laudantium. Ipsam provident molestiae aliquid cumque. Ex nesciunt omnis quia qui error.</p><p>Consequatur sed molestiae voluptate quia natus illum. Provident voluptatem qui consequatur ut saepe. In sit voluptatem delectus eos cupiditate minima quibusdam.</p><p>Rerum laboriosam unde sed ipsa excepturi voluptas laborum et. Aspernatur nostrum eos quisquam. Placeat illo nisi voluptas. Aut officia facilis enim qui dolor. Minus veniam odit rerum deserunt ducimus.</p><p>Animi ipsum omnis asperiores rerum. Sunt velit sequi praesentium. Veniam iusto perspiciatis veniam provident asperiores fugiat.</p><p>Iure odio eum eius iste odio veniam. Ea quis et laborum assumenda. Distinctio sit illum sint aliquid consequatur. Eveniet velit maxime vel consectetur.</p>', 4, '2020-07-03 03:02:56'),
(10, 6, 1, 3, 1, 'In iste.', 'in-iste', '<p>Quidem officiis quae rem eum excepturi. Deserunt repellendus quis unde ratione impedit eum eius quas. Nihil illum qui molestiae distinctio molestiae eius voluptatem ipsam. Adipisci tempora harum perferendis voluptates ad iusto.</p><p>Sit laborum accusantium omnis. Eaque ullam sint rerum voluptatibus voluptatem consequuntur qui. Numquam quam fuga occaecati.</p><p>Eum et ea minima sapiente vero tenetur ipsum. Ratione molestiae rerum magni reprehenderit repellat veniam voluptatem. Quisquam id eos eos quam. Error voluptas sed ab deserunt qui voluptas cumque qui. Qui voluptatibus nam ut magni enim est occaecati.</p><p>In soluta in necessitatibus quo. Corporis omnis enim architecto ut. Et maxime aut vitae voluptatem id.</p><p>Vel perferendis incidunt libero et pariatur molestiae possimus. Sed mollitia ut itaque quam eos. Sed voluptatum et necessitatibus tenetur.</p>', 6, '2020-07-01 02:05:22'),
(11, 7, 3, 5, 3, 'Iste accusamus laudantium.', 'iste-accusamus-laudantium', '<p>Ut veritatis voluptas quibusdam officia ratione tempora. Asperiores aut at natus id sunt delectus consequuntur.</p><p>Eum placeat voluptas eum et distinctio ea. Voluptatem vel eum fugit iusto est dolore. Eaque fuga qui voluptatem temporibus.</p><p>Libero veniam tempora est sit aut inventore blanditiis atque. Est consequatur ea nesciunt minima et aut autem. Dolorum incidunt velit fuga sint.</p><p>Dicta cum quod animi quas beatae debitis non. Et perspiciatis maxime reiciendis laborum eum. Amet aliquid non aut amet vero error. Eius cum ullam quo aliquid quia pariatur labore.</p><p>Possimus laborum architecto delectus aliquam alias incidunt atque repellat. Maxime et mollitia voluptas ipsa et. Dolores minus minima quia sed reiciendis soluta illum. Est suscipit ullam qui qui et incidunt.</p>', 8, '2020-11-09 21:02:20'),
(12, 4, 2, 4, 1, 'Sunt eos sequi sunt sint.', 'sunt-eos-sequi-sunt-sint', '<p>Perferendis quas rem enim quibusdam veritatis consequatur asperiores. Dolor nobis consequatur debitis aliquid eaque iste. Impedit cumque impedit qui et omnis ut omnis architecto.</p><p>Quam non debitis dicta. Id qui illo est voluptatum. Et animi corrupti totam harum.</p><p>Necessitatibus vero recusandae nesciunt minus amet. Et deserunt harum aliquid ut.</p><p>Consequuntur sint quam blanditiis ex non eveniet dolorum. Et tenetur totam dicta rerum. Excepturi nisi autem est quo id velit. Eaque quis corporis voluptas iure consequatur explicabo eum.</p><p>Autem et explicabo eos veniam rerum dolor. Et ut distinctio illum iste est. Illum animi et qui nemo incidunt perferendis. Nihil aut error similique illum. Consequatur rerum dolorem explicabo possimus.</p>', 8, '2020-07-06 07:38:08'),
(14, 4, 2, 4, 3, 'Sit quis quisquam et.', 'sit-quis-quisquam-et', '<p>Ex facere ducimus voluptatem nulla explicabo molestias. Nisi sed ut error praesentium. Excepturi libero sint debitis vel et.</p><p>Cum inventore repellat eum dolorem voluptatem ipsa cumque accusamus. Praesentium nihil numquam corporis et architecto. Id qui quisquam necessitatibus id ullam alias accusantium deleniti. Dignissimos voluptas voluptas eum corrupti maxime placeat temporibus.</p><p>Totam quia et illum ut quas doloribus quisquam. Sapiente ipsam voluptatem quis ut neque aut. Nulla libero est distinctio itaque tenetur. Natus atque earum consequatur. Id incidunt voluptas quam voluptatem dignissimos provident adipisci.</p><p>Culpa est corporis sit occaecati sunt quia tempora. Vel voluptas dolores possimus quisquam ut autem est.</p><p>Quod voluptates quos consequuntur et. Ut aut aspernatur delectus. Dolorem dolor assumenda voluptatem repellendus delectus id omnis. A temporibus vel iusto maiores aut placeat.</p>', 4, '2020-10-11 15:31:59'),
(15, 8, 1, 5, 2, 'Aut dolorem adipisci repellat.', 'aut-dolorem-adipisci-repellat', '<p>Porro voluptates voluptatem nobis. Vitae dolorum veritatis voluptas aliquid ipsam earum sunt. Sed quasi nemo sed suscipit aperiam sunt. Nesciunt non perferendis omnis ducimus.</p><p>Ipsa vero officiis blanditiis rerum deleniti officia. Consequatur accusamus incidunt neque reprehenderit in quae ex.</p><p>Veritatis voluptatem voluptatum autem distinctio. Neque aut recusandae autem tempore. Exercitationem quisquam placeat molestiae veniam et.</p><p>Voluptas distinctio natus autem deleniti placeat repudiandae. Delectus qui et velit error. Non repellat ipsa occaecati deleniti esse autem omnis. Repudiandae atque similique quaerat sit et ut.</p><p>Minus aut totam dolor quae necessitatibus error. Ipsum consectetur dolorum veritatis quisquam. Facilis fugiat unde velit aut impedit consequatur modi suscipit.</p>', 2, '2020-10-06 07:23:34'),
(16, 6, 2, 6, 2, 'Nulla commodi perspiciatis.', 'nulla-commodi-perspiciatis', '<p>Facere hic enim occaecati quo. Vel sit voluptatibus cupiditate quo est dignissimos et. Fugiat doloribus et reprehenderit officia doloremque iste quae. Debitis sed aut voluptate est dolore possimus. Culpa maiores nemo dolores exercitationem aut quaerat.</p><p>Et sit esse dolorem quia. Atque neque quibusdam quam dolor unde. Iusto voluptates vero ipsa sint sit nobis. Molestiae dolor eum quos sed.</p><p>Harum tempora sed consectetur quis aut maiores. Dolorem sed quia incidunt quasi vitae sint dolorum et. Fugit sed rerum nemo rerum numquam rerum. Vel error molestiae necessitatibus enim blanditiis veniam.</p><p>Eum ut eum suscipit aliquam voluptas quia. Eos debitis similique sint tenetur. Distinctio fugit corrupti non rerum sed necessitatibus.</p><p>Corporis est est odit ratione. Ut autem debitis unde sint illum sequi. Perspiciatis vel sed placeat libero.</p>', 4, '2020-08-16 10:55:09'),
(17, 6, 1, 1, 1, 'Deleniti explicabo qui.', 'deleniti-explicabo-qui', '<p>Voluptate nulla sequi temporibus. Aut est eaque tenetur. Consequuntur officia non inventore amet iusto.</p><p>Rerum est placeat est officiis doloribus quam autem. Earum veritatis provident eum distinctio perspiciatis. Magni quia enim qui accusamus.</p><p>In voluptatem veniam ea quam. Dolore dicta ipsa sequi ut.</p><p>Voluptatem quis tenetur vero officiis voluptatum vero. Explicabo ut soluta aliquam veniam et eum. Veniam facilis labore aut aut quo vel.</p><p>Doloremque quis porro dolores tenetur est quae. Alias eaque similique est iste. Suscipit magni impedit voluptatem nesciunt expedita eos. Aut hic sed quisquam molestiae sint delectus. Esse tempore facilis repellat ab accusamus.</p>', 2, '2020-06-02 12:22:01'),
(18, 5, 2, 4, 2, 'Beatae nisi nihil.', 'beatae-nisi-nihil', '<p>Deserunt quam est assumenda enim sint enim. Ex laudantium id velit quam ex dolores. Iure omnis quisquam qui cupiditate necessitatibus. Ut veritatis consequatur ut necessitatibus quia.</p><p>Animi maxime praesentium omnis ut illum enim enim. Est expedita quos earum qui consequatur et praesentium. Dolorem cumque ab vero maiores et. Et recusandae sunt rem fugit eos voluptas ullam.</p><p>Inventore quos consequatur at neque temporibus at sint occaecati. Ut et iusto facilis aliquam accusantium atque dolore. Quisquam voluptas rerum corporis.</p><p>Alias non eaque impedit est nisi et. Aliquid rem rem et voluptate eligendi. Laborum debitis veniam repellendus.</p><p>Vitae natus corporis ut earum nisi autem. Voluptatibus voluptas sint officiis dolorum similique sapiente fugit. Suscipit cupiditate deleniti voluptatem dolores sequi. Molestiae numquam totam iure in. Laborum sint aut labore blanditiis qui fuga aut.</p>', 4, '2020-05-29 20:34:02'),
(19, 7, 1, 6, 2, 'Ducimus earum non.', 'ducimus-earum-non', '<p>Quia in at sapiente ut aut dolorum aut. Repellat tempora et possimus nobis libero et numquam. Soluta iusto sit est quidem. Impedit voluptatem nihil odit expedita architecto impedit officia recusandae. Deserunt dolorem aliquam velit earum sit dignissimos quisquam fugit.</p><p>Alias sit accusamus enim officia qui fuga. Maxime aut sit nihil vel. Est quam in labore voluptatibus quisquam sed voluptas nemo. Sed aut et saepe nobis qui.</p><p>Cupiditate consectetur velit voluptatem numquam. Qui vel necessitatibus impedit nesciunt id consequatur qui. A repudiandae placeat velit enim odio rerum.</p><p>Quas voluptates perspiciatis perferendis sit omnis velit laborum est. Nisi perferendis qui fugiat natus quaerat id. Quia dolor vel beatae officia rem aperiam recusandae. Nam soluta vitae delectus nostrum perferendis aut voluptatibus.</p><p>Aspernatur perspiciatis perspiciatis odit adipisci. Sint dolores quis assumenda architecto omnis dolor. Ipsam aspernatur optio id sit fuga. Facere a vero velit nisi odit sit.</p>', 6, '2020-05-17 04:09:07'),
(20, 8, 2, 4, 2, 'Nobis sed distinctio.', 'nobis-sed-distinctio', '<p>Qui ipsum cupiditate voluptas quos. Laudantium alias quo voluptas omnis in et. Nihil inventore optio accusamus consectetur sit cumque voluptatem vel.</p><p>Consequatur ullam saepe et explicabo aut et. Et in dolores neque iusto placeat laudantium. Fugit et aut officiis reprehenderit voluptatem laborum molestiae. Ab non quaerat blanditiis aut omnis. Nulla pariatur tempora architecto et.</p><p>Est nesciunt magnam occaecati voluptatem sed vero. Ut incidunt ratione itaque aspernatur aspernatur repudiandae maiores. Laboriosam consequatur praesentium cum omnis dicta. Officia quo minima nostrum quia alias esse.</p><p>At et repellat velit quasi laudantium sed. Molestiae corrupti provident sint. Sunt earum repellat qui dolorem eum.</p><p>Nulla non et aliquam dolor laborum harum. Dignissimos at voluptates consequuntur voluptatem aut beatae. Consectetur delectus quae animi laboriosam dolorem vitae.</p>', 6, '2020-08-04 03:25:39'),
(21, 4, 3, 6, 3, 'Provident dignissimos hic.', 'provident-dignissimos-hic', '<p>Et facere quo iste officiis perferendis commodi. Beatae laborum laudantium delectus earum voluptatem officiis ea. Omnis id non eum magni possimus adipisci ducimus. At deleniti et ut ut omnis earum facere.</p><p>Expedita libero eos fugit laborum et error. Pariatur dolorum aut non atque incidunt. Rerum maiores sit voluptas rem excepturi nihil et.</p><p>Et laboriosam tenetur omnis iure officiis alias est. Error omnis ex aliquid id adipisci repellat aperiam.</p><p>Accusamus sit consequatur et eveniet. Et repudiandae quo est ea pariatur.</p><p>Veritatis accusamus totam architecto quia. Aut minima dolor repellendus nesciunt.</p>', 4, '2020-09-19 16:12:24'),
(33, 4, 1, 2, 1, 'Crêpes', 'Crepes', 'Blablabla', 3, '2020-11-24 11:23:40'),
(34, 4, 1, 1, 1, 'Bliny à la Russe', 'Bliny-a-la-Russe', 'Recette pleine d\'amour.', 4, '2020-11-24 16:05:37');

-- --------------------------------------------------------

--
-- Structure de la table `recipe_category`
--

CREATE TABLE `recipe_category` (
  `recipe_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `recipe_category`
--

INSERT INTO `recipe_category` (`recipe_id`, `category_id`) VALUES
(1, 3),
(2, 1),
(2, 2),
(4, 5),
(4, 7),
(5, 1),
(5, 2),
(5, 5),
(5, 7),
(5, 8),
(6, 4),
(9, 3),
(9, 4),
(9, 8),
(10, 5),
(10, 6),
(10, 8),
(11, 6),
(11, 7),
(12, 4),
(12, 8),
(14, 2),
(14, 8),
(15, 6),
(16, 1),
(16, 2),
(16, 5),
(16, 8),
(17, 2),
(17, 5),
(17, 6),
(17, 7),
(17, 8),
(18, 3),
(18, 4),
(18, 5),
(19, 1),
(19, 7),
(20, 3),
(21, 5),
(21, 6),
(21, 7),
(33, 3),
(33, 5),
(33, 6),
(33, 7),
(34, 3),
(34, 5),
(34, 6),
(34, 7);

-- --------------------------------------------------------

--
-- Structure de la table `recipe_ingredient`
--

CREATE TABLE `recipe_ingredient` (
  `id` int(11) NOT NULL,
  `recipe_id` int(11) NOT NULL,
  `ingredient_id` int(11) NOT NULL,
  `quantity` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `recipe_ingredient`
--

INSERT INTO `recipe_ingredient` (`id`, `recipe_id`, `ingredient_id`, `quantity`) VALUES
(1, 1, 9, 0),
(3, 1, 4, 3),
(4, 1, 18, 3),
(5, 2, 14, 4),
(6, 2, 13, 10),
(7, 2, 11, 5),
(8, 2, 9, 5),
(9, 2, 11, 10),
(10, 2, 15, 1),
(18, 4, 12, 1),
(19, 4, 3, 10),
(20, 4, 1, 10),
(21, 4, 11, 8),
(22, 4, 10, 7),
(23, 5, 2, 3),
(24, 5, 16, 1),
(25, 5, 8, 10),
(26, 5, 12, 7),
(27, 5, 18, 5),
(28, 6, 16, 8),
(29, 6, 8, 9),
(30, 6, 18, 5),
(31, 6, 1, 7),
(32, 6, 16, 7),
(33, 6, 17, 8),
(45, 9, 12, 10),
(46, 9, 5, 8),
(47, 9, 16, 8),
(48, 9, 14, 3),
(49, 9, 2, 7),
(50, 9, 14, 5),
(51, 9, 4, 6),
(52, 10, 14, 10),
(53, 10, 12, 5),
(54, 10, 16, 3),
(55, 10, 8, 10),
(56, 10, 4, 2),
(57, 10, 5, 6),
(59, 10, 5, 10),
(60, 11, 14, 0),
(61, 11, 7, 0),
(63, 11, 9, 9),
(64, 11, 13, 7),
(65, 11, 3, 2),
(66, 11, 16, 5),
(67, 12, 12, 3),
(68, 12, 10, 4),
(69, 12, 11, 0),
(70, 12, 20, 9),
(76, 14, 15, 1),
(77, 14, 4, 5),
(78, 14, 5, 8),
(80, 15, 10, 7),
(81, 15, 1, 7),
(82, 15, 1, 6),
(83, 15, 14, 10),
(84, 15, 12, 9),
(85, 15, 17, 4),
(87, 16, 20, 0),
(89, 16, 16, 6),
(90, 16, 5, 2),
(91, 16, 3, 6),
(92, 17, 20, 3),
(93, 17, 17, 1),
(94, 17, 16, 0),
(95, 17, 12, 8),
(96, 18, 12, 6),
(98, 18, 3, 4),
(100, 18, 4, 1),
(101, 18, 7, 9),
(102, 19, 4, 7),
(103, 19, 9, 10),
(105, 19, 3, 0),
(106, 19, 3, 6),
(107, 20, 5, 5),
(108, 20, 10, 5),
(109, 20, 20, 9),
(110, 20, 1, 5),
(111, 20, 10, 6),
(112, 21, 16, 5),
(113, 21, 2, 9),
(114, 21, 20, 5),
(115, 21, 20, 10),
(116, 21, 8, 5),
(133, 33, 2, 200),
(134, 33, 3, 20),
(135, 34, 1, 0.5),
(136, 34, 5, 200),
(138, 34, 3, 10);

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `active` tinyint(1) NOT NULL,
  `roles` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:json)',
  `username` varchar(70) COLLATE utf8mb4_unicode_ci NOT NULL,
  `vkey` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `password`, `email`, `avatar`, `created_at`, `active`, `roles`, `username`, `vkey`) VALUES
(4, '$argon2id$v=19$m=65536,t=4,p=1$bW8zUXg1VHJGcXcxNlpXeA$DHHO0EJkLcKc+zLWmoqWKcHsx0ysPWeRf0LNn4kti54', 'plop1@plop.fr', 'marguerite.jpg', '2020-10-20 11:56:52', 1, '[\"ROLE_ADMIN\"]', 'Marguerite', NULL),
(5, '$argon2id$v=19$m=65536,t=4,p=1$R09NRVQ1WEhrZXJ3dnk3NQ$gED26Sick+Ww/Jv8+lNrB0WTUiTYiheROQnqkcdKE7A', 'plop2@plop.fr', 'emmanuel.jpg', '2020-10-09 15:50:49', 1, '[]', 'Emmanuel', NULL),
(6, '$argon2id$v=19$m=65536,t=4,p=1$QjBsbHMzcWdSRzd5NUhMVg$PeVUmsqwrCubAP8pP100GTUYuLxonT92jvf4iLrImd4', 'plop3@plop.fr', 'david.jpg', '2020-09-28 09:16:32', 1, '[]', 'David', NULL),
(7, '$argon2id$v=19$m=65536,t=4,p=1$a3JySk0uYzdHMGZ0Y2QvQQ$Kwl0C3YEBaPqwQ1Thy3hZNBudG1n7aq11fQooS36k64', 'plop4@plop.fr', 'roger.jpg', '2020-10-14 01:00:33', 1, '[\"ROLE_EDITOR\"]', 'Roger', NULL),
(8, '$argon2id$v=19$m=65536,t=4,p=1$eVVqTW1Vc0RSNVZJa1ZXcg$fPWAF2UHa1kAsb+k1LgPNdG6PX6xzYUdIQ+FDPWBJIo', 'plop5@plop.fr', 'remy.jpg', '2020-10-29 03:33:04', 1, '[]', 'Rémy', NULL),
(9, '$argon2id$v=19$m=65536,t=4,p=1$SEFWNUpsSkV3WXpma3Y4Sg$ijHXHwU9WpYyTy5I4AJsruZ5/2JdUTCVnTtU8XhfTiA', 'maks@maks.ru', 'maks.jpg', '2020-11-19 08:14:20', 1, '[]', 'Maks', NULL),
(10, '$argon2id$v=19$m=65536,t=4,p=1$RFJqcE5VdVdoaXpzQ2E5UA$UJnrX0Ubcsp+m9yTOT7Wp53esl3VVcw3OW7yCeHK/oI', 'test@test.fr', 'test-a-la-noix.jpeg', '2020-11-20 09:53:40', 1, '[]', 'test à la noix', NULL),
(11, '$argon2id$v=19$m=65536,t=4,p=1$ejlhRHZra0FhRlVxY1Z0YQ$Ft95Q5R0lCpUAAqZvV3xvHPFNQftvRaM7hKWkjMtPmQ', 'cha@cha.fr', 'Charlotte.jpeg', '2020-11-20 10:07:45', 1, '[]', 'Charlotte', NULL),
(12, '$argon2id$v=19$m=65536,t=4,p=1$eTlGNWVLTk9STENKQlQ5ZA$J8tIWh05STKLZI1lfg8I5a1wOrtP52WYPk57mpuKvWw', 'plooo@plop.kr', 'Plop.jpeg', '2020-11-20 10:09:48', 1, '[]', 'Plop', NULL),
(14, '$argon2id$v=19$m=65536,t=4,p=1$MjJ4S0FKa1V0SXpCSEs4eQ$Rk791rQN3s+b48qRcdGNQGHACGdlz6G7BcyvPqgHnQY', 'plop100@plop.fr', 'Un-utilisateur-vraiment-chiant.jpeg', '2020-11-23 14:55:57', 1, '[]', 'Un utilisateur vraiment chiant', NULL),
(16, '$argon2id$v=19$m=65536,t=4,p=1$ajd0dXlCSG1YMDB1aWFtbA$A3MoHAWlrX6ojJ3N6zgsE4Bo1rDc8RH6SuYvBVnaN6Q', 'mash@mash.ru', 'Masha.jpeg', '2020-11-23 17:25:43', 1, '[]', 'Masha', NULL),
(20, '$argon2id$v=19$m=65536,t=4,p=1$YVdUclN1UVYwYUxLNVouVQ$oYnpeAdzcZ43FUSDkfKXlvMsQroZ58KQDW7255NGKWE', 'maillll@mail.com', 'mailmannnn.jpeg', '2020-11-24 14:41:35', 1, '[]', 'mailmannnn', NULL),
(21, '$argon2id$v=19$m=65536,t=4,p=1$cWZ1YjNLZGR3dE55QUl0bQ$ShAAMDUFFnXUnTewdgGDKFBT+XKF9h4Wrpmp7KsPfMQ', 'flash@flash.fr', 'flashman.jpeg', '2020-11-24 14:46:05', 1, '[\"ROLE_EDITOR\"]', 'flashman', NULL),
(22, '$argon2id$v=19$m=65536,t=4,p=1$UzdOWmxweFF5NEJJUW1ENQ$UsXvHjOJEOLz5hnUyMEaJrVHVbG4TtQ0atG9ANCGvDU', 'girl@girl.fr', 'flashgirl.jpeg', '2020-11-24 14:54:06', 1, '[]', 'flashgirl', NULL),
(23, '$argon2id$v=19$m=65536,t=4,p=1$LzRwZHdlSHUuRjlrT3VKaQ$GXCZ8mpNqmNMPzb7Rrpk5imeWBJfnFHpGKBS29omo6c', 'sbire@sbire.fr', 'sbire.jpeg', '2020-11-24 15:28:18', 0, '[]', 'sbire', '6cfe75c861fcf3a70a47697f12bd39c8'),
(24, '$argon2id$v=19$m=65536,t=4,p=1$TlQ3a1RYZGQwNUJCU0dxNg$sM8rqNwsLEfKCzKEWlJ0NDWa+1cXtSIhXyk9vZ80ieU', 'sbireman@sbire.fr', 'SbireMan.jpeg', '2020-11-24 16:31:31', 1, '[]', 'SbireMan', NULL);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `budget`
--
ALTER TABLE `budget`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_9474526C59D8A214` (`recipe_id`),
  ADD KEY `IDX_9474526CA76ED395` (`user_id`);

--
-- Index pour la table `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Index pour la table `image`
--
ALTER TABLE `image`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_C53D045F59D8A214` (`recipe_id`);

--
-- Index pour la table `ingredient`
--
ALTER TABLE `ingredient`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `level`
--
ALTER TABLE `level`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `like`
--
ALTER TABLE `like`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_AC6340B359D8A214` (`recipe_id`),
  ADD KEY `IDX_AC6340B3A76ED395` (`user_id`);

--
-- Index pour la table `prep`
--
ALTER TABLE `prep`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `recipe`
--
ALTER TABLE `recipe`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_DA88B1375FB14BA7` (`level_id`),
  ADD KEY `IDX_DA88B137713C4367` (`prep_time_id`),
  ADD KEY `IDX_DA88B13736ABA6B8` (`budget_id`),
  ADD KEY `IDX_DA88B137A76ED395` (`user_id`);

--
-- Index pour la table `recipe_category`
--
ALTER TABLE `recipe_category`
  ADD PRIMARY KEY (`recipe_id`,`category_id`),
  ADD KEY `IDX_70DCBC5F59D8A214` (`recipe_id`),
  ADD KEY `IDX_70DCBC5F12469DE2` (`category_id`);

--
-- Index pour la table `recipe_ingredient`
--
ALTER TABLE `recipe_ingredient`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_22D1FE1359D8A214` (`recipe_id`),
  ADD KEY `IDX_22D1FE13933FE08C` (`ingredient_id`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `budget`
--
ALTER TABLE `budget`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT pour la table `comment`
--
ALTER TABLE `comment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=124;

--
-- AUTO_INCREMENT pour la table `image`
--
ALTER TABLE `image`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

--
-- AUTO_INCREMENT pour la table `ingredient`
--
ALTER TABLE `ingredient`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT pour la table `level`
--
ALTER TABLE `level`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `like`
--
ALTER TABLE `like`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=136;

--
-- AUTO_INCREMENT pour la table `prep`
--
ALTER TABLE `prep`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `recipe`
--
ALTER TABLE `recipe`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT pour la table `recipe_ingredient`
--
ALTER TABLE `recipe_ingredient`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=143;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `FK_9474526C59D8A214` FOREIGN KEY (`recipe_id`) REFERENCES `recipe` (`id`),
  ADD CONSTRAINT `FK_9474526CA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `image`
--
ALTER TABLE `image`
  ADD CONSTRAINT `FK_C53D045F59D8A214` FOREIGN KEY (`recipe_id`) REFERENCES `recipe` (`id`);

--
-- Contraintes pour la table `like`
--
ALTER TABLE `like`
  ADD CONSTRAINT `FK_AC6340B359D8A214` FOREIGN KEY (`recipe_id`) REFERENCES `recipe` (`id`),
  ADD CONSTRAINT `FK_AC6340B3A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `recipe`
--
ALTER TABLE `recipe`
  ADD CONSTRAINT `FK_DA88B13736ABA6B8` FOREIGN KEY (`budget_id`) REFERENCES `budget` (`id`),
  ADD CONSTRAINT `FK_DA88B1375FB14BA7` FOREIGN KEY (`level_id`) REFERENCES `level` (`id`),
  ADD CONSTRAINT `FK_DA88B137713C4367` FOREIGN KEY (`prep_time_id`) REFERENCES `prep` (`id`),
  ADD CONSTRAINT `FK_DA88B137A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `recipe_category`
--
ALTER TABLE `recipe_category`
  ADD CONSTRAINT `FK_70DCBC5F12469DE2` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_70DCBC5F59D8A214` FOREIGN KEY (`recipe_id`) REFERENCES `recipe` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `recipe_ingredient`
--
ALTER TABLE `recipe_ingredient`
  ADD CONSTRAINT `FK_22D1FE1359D8A214` FOREIGN KEY (`recipe_id`) REFERENCES `recipe` (`id`),
  ADD CONSTRAINT `FK_22D1FE13933FE08C` FOREIGN KEY (`ingredient_id`) REFERENCES `ingredient` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
