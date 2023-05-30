-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Май 30 2023 г., 17:39
-- Версия сервера: 10.4.27-MariaDB
-- Версия PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `digital_technology`
--

-- --------------------------------------------------------

--
-- Структура таблицы `addresses`
--

CREATE TABLE `addresses` (
  `address_id` int(10) UNSIGNED NOT NULL,
  `address_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Дамп данных таблицы `addresses`
--

INSERT INTO `addresses` (`address_id`, `address_name`) VALUES
(1, 'Санкт-Петербург, Невский проспект 105, кв.7'),
(2, 'Санкт-Петербург, проспект Науки 13, кв.54'),
(3, 'Санкт-Петербург, улица Обручевых 5, кв.137'),
(4, 'Санкт-Петербург, улица Политехническая 45, кв.2'),
(5, 'Санкт-Петербург, проспект Испытателей 15, кв.99'),
(6, 'Санкт-Петербург, Светлановский проспект 7, кв.6'),
(7, 'Санкт-Петербург, улица Художников 4, кв.23');

-- --------------------------------------------------------

--
-- Структура таблицы `addresses_users`
--

CREATE TABLE `addresses_users` (
  `address_user_id` int(10) UNSIGNED NOT NULL,
  `address_user_address_id` int(10) UNSIGNED NOT NULL,
  `address_user_user_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Дамп данных таблицы `addresses_users`
--

INSERT INTO `addresses_users` (`address_user_id`, `address_user_address_id`, `address_user_user_id`) VALUES
(1, 5, 1),
(2, 3, 1),
(3, 1, 2),
(4, 3, 2),
(5, 7, 5),
(6, 7, 4),
(7, 6, 3),
(8, 4, 5),
(9, 5, 2);

-- --------------------------------------------------------

--
-- Структура таблицы `carts`
--

CREATE TABLE `carts` (
  `cart_id` int(10) UNSIGNED NOT NULL,
  `cart_product_id` int(10) UNSIGNED NOT NULL,
  `cart_product_count` tinyint(2) UNSIGNED NOT NULL,
  `cart_order_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Дамп данных таблицы `carts`
--

INSERT INTO `carts` (`cart_id`, `cart_product_id`, `cart_product_count`, `cart_order_id`) VALUES
(1, 1, 2, 1),
(2, 2, 1, 1),
(3, 4, 2, 2),
(4, 9, 1, 2),
(5, 3, 1, 3),
(6, 7, 1, 4),
(7, 8, 2, 4),
(8, 1, 3, 5),
(9, 2, 1, 6),
(10, 3, 1, 6),
(11, 6, 2, 7);

-- --------------------------------------------------------

--
-- Структура таблицы `categories`
--

CREATE TABLE `categories` (
  `category_id` int(10) UNSIGNED NOT NULL,
  `category_name` varchar(255) NOT NULL,
  `category_is_deleted` tinyint(1) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Дамп данных таблицы `categories`
--

INSERT INTO `categories` (`category_id`, `category_name`, `category_is_deleted`) VALUES
(1, 'Смартфоны', 0),
(2, 'Ноутбуки', 0),
(3, 'Планшеты', 0),
(11, 'Умные часы', 0),
(12, 'Телевизоры', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `connects`
--

CREATE TABLE `connects` (
  `connect_id` int(10) UNSIGNED NOT NULL,
  `connect_user_id` int(10) UNSIGNED NOT NULL,
  `connect_token` char(32) NOT NULL,
  `connect_token_time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Дамп данных таблицы `connects`
--

INSERT INTO `connects` (`connect_id`, `connect_user_id`, `connect_token`, `connect_token_time`) VALUES
(42, 22, '88230g4c9a45b736c67adg6g658fgd44', '2023-03-24 18:22:37'),
(50, 22, '82ba9cfbgbfb9ee298d509g7de02gd24', '2023-03-29 16:59:09');

-- --------------------------------------------------------

--
-- Структура таблицы `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `genders`
--

CREATE TABLE `genders` (
  `gender_id` tinyint(1) UNSIGNED NOT NULL,
  `gender_name` varchar(255) NOT NULL,
  `gender_short_name` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Дамп данных таблицы `genders`
--

INSERT INTO `genders` (`gender_id`, `gender_name`, `gender_short_name`) VALUES
(1, 'Мужской', 'М'),
(2, 'Женский', 'Ж');

-- --------------------------------------------------------

--
-- Структура таблицы `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Дамп данных таблицы `jobs`
--

INSERT INTO `jobs` (`id`, `queue`, `payload`, `attempts`, `reserved_at`, `available_at`, `created_at`) VALUES
(2, 'default', '{\"uuid\":\"afa2bf48-ed07-48e8-a2f7-05b40fc4a7e5\",\"displayName\":\"App\\\\Jobs\\\\AfterCreateManufacturerJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\AfterCreateManufacturerJob\",\"command\":\"O:35:\\\"App\\\\Jobs\\\\AfterCreateManufacturerJob\\\":1:{s:49:\\\"\\u0000App\\\\Jobs\\\\AfterCreateManufacturerJob\\u0000manufacturer\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:23:\\\"App\\\\Models\\\\Manufacturer\\\";s:2:\\\"id\\\";i:39;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}\"}}', 0, NULL, 1683723198, 1683723198),
(3, 'default', '{\"uuid\":\"5da00c35-e1cb-4c7f-a42e-bb73d23c9328\",\"displayName\":\"App\\\\Jobs\\\\AfterCreateManufacturerJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\AfterCreateManufacturerJob\",\"command\":\"O:35:\\\"App\\\\Jobs\\\\AfterCreateManufacturerJob\\\":1:{s:49:\\\"\\u0000App\\\\Jobs\\\\AfterCreateManufacturerJob\\u0000manufacturer\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:23:\\\"App\\\\Models\\\\Manufacturer\\\";s:2:\\\"id\\\";i:40;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}\"}}', 0, NULL, 1683723231, 1683723231);

-- --------------------------------------------------------

--
-- Структура таблицы `manufacturers`
--

CREATE TABLE `manufacturers` (
  `manufacturer_id` int(10) UNSIGNED NOT NULL,
  `manufacturer_name` varchar(255) NOT NULL,
  `manufacturer_is_deleted` tinyint(1) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Дамп данных таблицы `manufacturers`
--

INSERT INTO `manufacturers` (`manufacturer_id`, `manufacturer_name`, `manufacturer_is_deleted`) VALUES
(1, 'Apple', 0),
(2, 'Samsung', 0),
(3, 'Huawei', 0),
(4, 'Lenovo', 0),
(26, 'Xiomi', 0),
(31, 'Oppo', 0),
(38, 'Sony', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `marks`
--

CREATE TABLE `marks` (
  `mark_id` int(10) UNSIGNED NOT NULL,
  `mark_value` tinyint(1) UNSIGNED NOT NULL,
  `mark_user_id` int(10) UNSIGNED NOT NULL,
  `mark_product_id` int(10) UNSIGNED NOT NULL,
  `mark_comment` tinytext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Дамп данных таблицы `marks`
--

INSERT INTO `marks` (`mark_id`, `mark_value`, `mark_user_id`, `mark_product_id`, `mark_comment`) VALUES
(1, 4, 1, 1, NULL),
(2, 5, 1, 2, NULL),
(3, 5, 2, 1, NULL),
(4, 5, 3, 1, NULL),
(5, 3, 3, 1, NULL),
(6, 4, 3, 3, NULL),
(7, 5, 4, 1, NULL),
(8, 3, 2, 7, NULL),
(9, 5, 3, 4, NULL),
(10, 1, 5, 4, NULL),
(11, 4, 5, 8, NULL),
(12, 3, 4, 6, NULL),
(13, 4, 2, 9, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(2, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2023_05_08_123341_create_jobs_table', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `orders`
--

CREATE TABLE `orders` (
  `order_id` int(10) UNSIGNED NOT NULL,
  `order_address_user_id` int(10) UNSIGNED DEFAULT NULL,
  `order_registration_time` datetime NOT NULL,
  `order_delivery_time` datetime NOT NULL,
  `order_status_id` tinyint(2) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Дамп данных таблицы `orders`
--

INSERT INTO `orders` (`order_id`, `order_address_user_id`, `order_registration_time`, `order_delivery_time`, `order_status_id`) VALUES
(1, 1, '2023-02-02 12:45:00', '2023-02-15 12:00:00', 1),
(2, 2, '2023-02-05 13:15:00', '2023-02-15 12:00:00', 2),
(3, 3, '2023-02-06 16:15:00', '2023-02-16 12:00:00', 5),
(4, 1, '2023-02-06 18:25:00', '2023-02-19 12:00:00', 3),
(5, 1, '2023-02-08 10:50:00', '2023-02-18 12:00:00', 3),
(6, 1, '2023-02-09 14:05:00', '2023-02-17 12:00:00', 3),
(7, 1, '2023-02-12 16:10:00', '2023-02-20 12:00:00', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `products`
--

CREATE TABLE `products` (
  `product_id` int(10) UNSIGNED NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_category_id` int(10) UNSIGNED NOT NULL,
  `product_price` int(10) UNSIGNED DEFAULT NULL,
  `product_manufacturer_id` int(10) UNSIGNED NOT NULL,
  `product_availability` smallint(4) UNSIGNED NOT NULL,
  `product_description` tinytext DEFAULT NULL,
  `product_is_deleted` tinyint(1) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Дамп данных таблицы `products`
--

INSERT INTO `products` (`product_id`, `product_name`, `product_category_id`, `product_price`, `product_manufacturer_id`, `product_availability`, `product_description`, `product_is_deleted`) VALUES
(1, 'iPhone 14', 1, 89990, 1, 10, NULL, 0),
(2, 'Macbook Pro 13', 2, 129990, 1, 5, NULL, 0),
(3, 'iPad Air', 3, 49990, 1, 7, NULL, 0),
(4, 'Galaxy S23', 1, 79990, 2, 6, NULL, 0),
(5, 'Galaxy book', 2, 72990, 2, 3, NULL, 0),
(6, 'Galaxy Tab S8', 3, 64390, 2, 2, NULL, 0),
(7, 'P50', 1, 79990, 3, 9, NULL, 0),
(8, 'MateBook 14', 2, 74990, 3, 12, NULL, 0),
(9, 'MatePad Pro', 3, 60990, 3, 4, NULL, 0),
(11, 'iPhone 12 Pro Max', 1, 89990, 1, 4, NULL, 0),
(12, 'iPhone 11', 1, 69990, 1, 1, NULL, 0),
(14, 'iPhone 14 Pro', 2, 99990, 1, 5, NULL, 0),
(17, 'iPhone 11', 1, 38990, 1, 5, NULL, 0),
(21, 'Xperia Z1', 1, 79990, 38, 15, NULL, 0),
(22, 'iPhone', 1, 1000, 4, 5, 'asdf', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `statuses`
--

CREATE TABLE `statuses` (
  `status_id` tinyint(2) UNSIGNED NOT NULL,
  `status_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Дамп данных таблицы `statuses`
--

INSERT INTO `statuses` (`status_id`, `status_name`) VALUES
(1, 'Создан'),
(2, 'Оплачен'),
(3, 'В работе'),
(4, 'Доставлен'),
(5, 'Отменен');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `user_fio` varchar(255) DEFAULT NULL,
  `user_email` varchar(255) NOT NULL,
  `user_password` char(64) NOT NULL,
  `user_dob` date DEFAULT NULL,
  `user_gender_id` tinyint(1) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`user_id`, `user_fio`, `user_email`, `user_password`, `user_dob`, `user_gender_id`) VALUES
(1, 'Иванов Иван Иванович', 'ivan@mail.com', '123password', '1995-05-01', 1),
(2, 'Петров Петр Петрович', 'petr@yandex.ru', 'pass1234', '2000-01-02', 1),
(3, 'Сидоров Илья Владимирович', 'sidorov@mail.com', '12345', '2005-06-03', 1),
(4, 'Сидорова Анна Ивановна', 'anna@yandex.ru', '12345pass', '1987-04-10', 2),
(5, 'Тарасова Мария Анатольевна', 'mashat@rambler.ru', 'password1', '1975-10-05', 2),
(9, NULL, 'ivan.petrov@gmail.com', '827ccb0eea8a706c4c34a16891f84e7b', NULL, NULL),
(16, NULL, 'ivan.petrov@mail.ru', 'bd462d5d7e7d5f8416515c6b0f3ed640', NULL, NULL),
(17, NULL, 'petrov@mail.ru', 'fe60374e15ae5f50e67cf94fed349337', NULL, NULL),
(18, NULL, 'ivaniv.ivan@yandex.ru', '601a30b0ddaace9477677d1d3321a680', NULL, NULL),
(19, NULL, 'vlad.p@yandex.ru', '8bac2bf478ff896c4c41aecc8d8c3b44', NULL, NULL),
(20, NULL, 'random@mail.ru', '61bd60c60d9fb60cc8fc7767669d40a1', NULL, NULL),
(21, NULL, 'random@gmail.com', '2af9b1ba42dc5eb01743e6b3759b6e4b', NULL, NULL),
(22, NULL, 'randomdsf@mail.com', '827ccb0eea8a706c4c34a16891f84e7b', NULL, NULL),
(23, NULL, 'vlad@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL),
(24, NULL, 'petr@mail.ru', '827ccb0eea8a706c4c34a16891f84e7b', NULL, NULL);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `addresses`
--
ALTER TABLE `addresses`
  ADD PRIMARY KEY (`address_id`);

--
-- Индексы таблицы `addresses_users`
--
ALTER TABLE `addresses_users`
  ADD PRIMARY KEY (`address_user_id`),
  ADD KEY `address_user_address_id` (`address_user_address_id`),
  ADD KEY `address_user_user_id` (`address_user_user_id`);

--
-- Индексы таблицы `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`cart_id`),
  ADD KEY `cart_product_id` (`cart_product_id`),
  ADD KEY `cart_order_id` (`cart_order_id`);

--
-- Индексы таблицы `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`),
  ADD UNIQUE KEY `category_name` (`category_name`);

--
-- Индексы таблицы `connects`
--
ALTER TABLE `connects`
  ADD PRIMARY KEY (`connect_id`),
  ADD KEY `connect_user_id` (`connect_user_id`);

--
-- Индексы таблицы `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Индексы таблицы `genders`
--
ALTER TABLE `genders`
  ADD PRIMARY KEY (`gender_id`);

--
-- Индексы таблицы `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Индексы таблицы `manufacturers`
--
ALTER TABLE `manufacturers`
  ADD PRIMARY KEY (`manufacturer_id`),
  ADD UNIQUE KEY `manufacturer_name` (`manufacturer_name`);

--
-- Индексы таблицы `marks`
--
ALTER TABLE `marks`
  ADD PRIMARY KEY (`mark_id`),
  ADD KEY `mark_user_id` (`mark_user_id`),
  ADD KEY `mark_product_id` (`mark_product_id`);

--
-- Индексы таблицы `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `order_address_user_id` (`order_address_user_id`),
  ADD KEY `order_status_id` (`order_status_id`);

--
-- Индексы таблицы `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `product_category_id` (`product_category_id`),
  ADD KEY `product_manufacturer_id` (`product_manufacturer_id`);

--
-- Индексы таблицы `statuses`
--
ALTER TABLE `statuses`
  ADD PRIMARY KEY (`status_id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `user_email` (`user_email`),
  ADD KEY `user_gender_id` (`user_gender_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `addresses`
--
ALTER TABLE `addresses`
  MODIFY `address_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT для таблицы `addresses_users`
--
ALTER TABLE `addresses_users`
  MODIFY `address_user_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT для таблицы `carts`
--
ALTER TABLE `carts`
  MODIFY `cart_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT для таблицы `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT для таблицы `connects`
--
ALTER TABLE `connects`
  MODIFY `connect_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT для таблицы `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `genders`
--
ALTER TABLE `genders`
  MODIFY `gender_id` tinyint(1) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `manufacturers`
--
ALTER TABLE `manufacturers`
  MODIFY `manufacturer_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT для таблицы `marks`
--
ALTER TABLE `marks`
  MODIFY `mark_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT для таблицы `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT для таблицы `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT для таблицы `statuses`
--
ALTER TABLE `statuses`
  MODIFY `status_id` tinyint(2) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `addresses_users`
--
ALTER TABLE `addresses_users`
  ADD CONSTRAINT `addresses_users_ibfk_1` FOREIGN KEY (`address_user_address_id`) REFERENCES `addresses` (`address_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `addresses_users_ibfk_2` FOREIGN KEY (`address_user_user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `carts_ibfk_1` FOREIGN KEY (`cart_product_id`) REFERENCES `products` (`product_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `carts_ibfk_2` FOREIGN KEY (`cart_order_id`) REFERENCES `orders` (`order_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `connects`
--
ALTER TABLE `connects`
  ADD CONSTRAINT `connects_ibfk_1` FOREIGN KEY (`connect_user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `marks`
--
ALTER TABLE `marks`
  ADD CONSTRAINT `marks_ibfk_1` FOREIGN KEY (`mark_user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `marks_ibfk_2` FOREIGN KEY (`mark_product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`order_address_user_id`) REFERENCES `addresses_users` (`address_user_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`order_status_id`) REFERENCES `statuses` (`status_id`) ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`product_category_id`) REFERENCES `categories` (`category_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `products_ibfk_2` FOREIGN KEY (`product_manufacturer_id`) REFERENCES `manufacturers` (`manufacturer_id`) ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`user_gender_id`) REFERENCES `genders` (`gender_id`) ON DELETE SET NULL ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
