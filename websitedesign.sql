CREATE DATABASE IF NOT EXISTS `webdesign` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `webdesign`;

CREATE TABLE IF NOT EXISTS `admin` (
  `adminAccount` varchar(20) NOT NULL,
  `password` varchar(255) NOT NULL,
  `name` varchar(20) NOT NULL,
  `email` varchar(20) NOT NULL,
  PRIMARY KEY (`adminAccount`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `admin` (`adminAccount`, `password`, `name`, `email`) VALUES
('admin1', '21232f297a57a5a743894a0e4a801fc3', 'admin 1', 'admin1@gmail.com');

CREATE TABLE IF NOT EXISTS `category` (
  `categoryID` varchar(20) NOT NULL,
  `categoryName` varchar(20) NOT NULL,
  `country` varchar(20) NOT NULL,
  `detail` varchar(20) NOT NULL,
  PRIMARY KEY (`categoryID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1);

CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `product` (
  `productID` varchar(20) NOT NULL,
  `productName` varchar(20) NOT NULL,
  `price` int(20) NOT NULL,
  `image` varchar(20) DEFAULT NULL,
  `detail` varchar(20) NOT NULL,
  `categoryID` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`productID`),
  KEY `produc_FK` (`categoryID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `tbadmins` (
  `adminID` int(11) NOT NULL,
  `adminAccount` varchar(50) NOT NULL,
  `adminPassword` varchar(255) NOT NULL,
  PRIMARY KEY (`adminID`),
  UNIQUE KEY `adminAccount` (`adminAccount`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `tbadmins` (`adminID`, `adminAccount`, `adminPassword`) VALUES
(1, 'admin1', 'admin1');

CREATE TABLE IF NOT EXISTS `tbcart` (
  `cartID` int(11) NOT NULL AUTO_INCREMENT,
  `cartDate` datetime NOT NULL,
  `totalPrice` double NOT NULL,
  `cartStatus` tinyint(1) NOT NULL,
  `customerID` int(11) NOT NULL,
  PRIMARY KEY (`cartID`),
  KEY `fk_tbcart_tbcustomer` (`customerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `tbcartdetail` (
  `cartdetailID` int(11) NOT NULL AUTO_INCREMENT,
  `productID` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` double NOT NULL,
  `cartID` int(11) NOT NULL,
  PRIMARY KEY (`cartdetailID`),
  KEY `fk_tbcartdetail_tbproduct` (`productID`),
  KEY `fk_tbcartdetail_tbcart` (`cartID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `tbcomment` (
  `commentID` int(11) NOT NULL,
  `customerID` int(11) NOT NULL,
  `commentDetail` varchar(255) NOT NULL,
  `commentDate` datetime NOT NULL,
  `productID` int(11) DEFAULT NULL,
  PRIMARY KEY (`commentID`),
  KEY `fk_tbcomment_tbproduct` (`productID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `tbcustomer` (
  `customerID` int(11) NOT NULL,
  `customerPassworld` varchar(255) NOT NULL,
  `customerName` varchar(50) NOT NULL,
  `customerPhone` varchar(20) NOT NULL,
  `customerEmail` varchar(50) NOT NULL,
  PRIMARY KEY (`customerID`),
  UNIQUE KEY `customerName` (`customerName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `tbproducers` (
  `producerID` int(11) NOT NULL,
  `producerName` varchar(50) NOT NULL,
  PRIMARY KEY (`producerID`),
  UNIQUE KEY `producerName` (`producerName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `tbproducers` (`producerID`, `producerName`) VALUES
(1, 'Apple'),
(2, 'Samsung'),
(3, 'Xiaomi');

CREATE TABLE IF NOT EXISTS `tbproducts` (
  `productID` int(11) NOT NULL AUTO_INCREMENT,
  `productName` varchar(50) NOT NULL,
  `productPrice` double NOT NULL,
  `productDetail` varchar(255) NOT NULL,
  `producerID` int(11) NOT NULL,
  `productImage1` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`productID`),
  UNIQUE KEY `productName` (`productName`),
  KEY `fk_tbproduct_tbproducer` (`producerID`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4;

INSERT INTO `tbproducts` (`productID`, `productName`, `productPrice`, `productDetail`, `producerID`, `productImage1`) VALUES
(17, 'Samsung Galaxy S22 Ultra', 1000, 'Ốp lưng này ngon hơn bạn gái cũ', 2, 'smart-clear-view-samsung-galaxy-s22-ultra-1.-600x600.jpg'),
(18, 'Iphone 13 Pro Max Case', 111, 'Ốp lưng này ko ngon vì nó rẻ', 1, '20210924_151256.jpg');

CREATE TABLE IF NOT EXISTS `user` (
  `userID` varchar(20) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `avatar` varchar(20) NOT NULL,
  `mail` varchar(20) NOT NULL,
  PRIMARY KEY (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `user` (`userID`, `username`, `password`, `avatar`, `mail`) VALUES
('', 'bomsocu', '123456', '', 'trinhquangduy3442@gm');

CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


ALTER TABLE `product`
  ADD CONSTRAINT `produc_FK` FOREIGN KEY (`categoryID`) REFERENCES `category` (`categoryID`);

ALTER TABLE `tbcart`
  ADD CONSTRAINT `fk_tbcart_tbcustomer` FOREIGN KEY (`customerID`) REFERENCES `tbcustomer` (`customerID`) ON DELETE CASCADE;

ALTER TABLE `tbcartdetail`
  ADD CONSTRAINT `fk_tbcartdetail_tbcart` FOREIGN KEY (`cartID`) REFERENCES `tbcart` (`cartID`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_tbcartdetail_tbproduct` FOREIGN KEY (`productID`) REFERENCES `tbproducts` (`productID`) ON DELETE CASCADE;

ALTER TABLE `tbcomment`
  ADD CONSTRAINT `fk_tbcomment_tbproduct` FOREIGN KEY (`productID`) REFERENCES `tbproducts` (`productID`) ON DELETE CASCADE;

ALTER TABLE `tbproducts`
  ADD CONSTRAINT `fk_tbproduct_tbproducer` FOREIGN KEY (`producerID`) REFERENCES `tbproducers` (`producerID`) ON DELETE CASCADE;
USE `phpmyadmin`;