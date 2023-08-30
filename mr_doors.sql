-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Авг 30 2023 г., 05:41
-- Версия сервера: 8.0.30
-- Версия PHP: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `mr_doors`
--

-- --------------------------------------------------------

--
-- Структура таблицы `products`
--

CREATE TABLE `products` (
  `product_id` int NOT NULL,
  `product_name` varchar(55) NOT NULL,
  `product_img` varchar(100) NOT NULL,
  `product_category` varchar(55) NOT NULL,
  `product_price` int NOT NULL,
  `product_material` varchar(55) NOT NULL,
  `product_in_cart` int NOT NULL,
  `product_recommended` int NOT NULL,
  `product_amount` int NOT NULL,
  `product_in_favorite` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `products`
--

INSERT INTO `products` (`product_id`, `product_name`, `product_img`, `product_category`, `product_price`, `product_material`, `product_in_cart`, `product_recommended`, `product_amount`, `product_in_favorite`) VALUES
(1, 'Спальня, коллекция \"Седименти\"', 'img/categories/bedrooms.png', 'Спальни', 222768, 'ДСП', 0, 1, 0, 0),
(2, 'Кухня фасадами под дерево', 'img/categories/kitchens.png', 'Столовые', 150000, 'ЛДСП', 0, 1, 0, 0),
(3, 'Кабинет, коллекция \"Метрополитан\"', 'img/categories/living_rooms.png', 'Жилые зоны', 159927, 'ЛДСП', 0, 0, 0, 0),
(4, 'Диван UOMO, охра', 'img/products/Sof006_F0.jpg', 'Диваны', 89000, 'Искусственная кожа', 0, 1, 0, 0),
(5, 'Диван UOMO, серый', 'img/products/Sof008_F0.jpg', 'Диваны', 89000, 'Рогожка', 0, 0, 0, 0),
(6, 'Диван UOMO, бежевый', 'img/products/001.webp', 'Диваны', 89000, 'Велюр', 0, 1, 0, 0),
(7, 'Спальня с кроватью AVVIO, серая', 'img/products/01.webp', 'Кровати', 96000, 'Велюр', 0, 0, 0, 0),
(8, 'Спальня с кроватью AVVIO, серая', 'img/products/bdr110.webp', 'Кровати', 96000, 'Велюр', 0, 1, 0, 0),
(9, 'Спальня с кроватью GIGLIO, серая', 'img/products/bdr110.webp', 'Кровати', 96000, 'Велюр', 0, 1, 0, 0),
(10, 'Спальня с кроватью AVVIO, серая', 'img/products/bdr112_fr.jpg', 'Кровати', 57000, 'Велюр', 0, 1, 0, 0),
(11, 'Спальня с кроватью Nano, серая', 'img/products/bdr100_6.webp', 'Кровати', 90000, 'Велюр', 0, 0, 0, 0),
(12, 'Спальня с кроватью Nano, синяя', 'img/products/bdr102.jpg', 'Кровати', 50000, 'Искусственная замша', 0, 1, 0, 0),
(13, 'Спальня с кроватью Simple, серая', 'img/products/bdr098_5-_002_.webp', 'Кровати', 70000, 'Велюр, Teddy 004', 0, 1, 10, 0),
(14, 'Мягкие стеновые панели в спальню Portofino, оранжевые', 'img/products/bdr087.webp', 'Кровати', 70000, 'Велюр', 0, 1, 0, 0),
(15, 'Пуф Ponte круглый на подиуме', 'img/products/Puff02_01.webp', 'На этом сидеть', 11469, 'Мягкое что-то', 0, 0, 0, 0),
(16, 'Спальня с кроватью Simple, зеленая', 'img/products/bdr098_var.webp', 'Кровати', 11469, 'Велюр', 0, 0, 0, 0),
(17, 'Мягкие стеновые панели в спальню Ravello, зеленые', '/img/products/bdr081x.webp', 'Спальни', 50000, 'Велюр', 0, 0, 0, 0),
(18, 'Пуф Ponte круглый на подиуме', '/img/products/puff01_01.webp', 'На этом сидеть', 50000, 'Мягкое что-то', 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `user_id` int NOT NULL,
  `user_login` varchar(100) NOT NULL,
  `user_password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`user_id`, `user_login`, `user_password`) VALUES
(1, 'test', '123123'),
(2, '123', '123'),
(3, '321', '321'),
(4, 'yashindows', '$2b$10$0xknI6H58fegkx77PVfnqedx.2SnaxrmkVL3gFW3pfFM1t/YGl18a'),
(5, 'sda', '$2b$10$PZUcpyN98Znl9GNrWYEVje8ktRRhH/RJb.F1RbQ20iL8BLT3eqaMG'),
(17, 'hello', '$2b$10$upP2JJqIo56LdnBIHmPrAOz6yZvN66qPJE.EMloECSqjdvyMwhn2y'),
(18, 'pasha', '$2b$10$9O5a.JBz.jN/KXUDYir8LuT1cWefxluNWtctsBF91fOS5OFHTGPSG'),
(19, 'ryr', '$2b$10$NZoIZTNSr58GKIG92css2.BBu/wvhx1I.NrPdIUHJJLKE4RFZ6ZCm'),
(20, 'ooo', '$2b$10$vAHA8.a8PJFHIbWGxoi3cuJU.74uTDXTrCUgxzCfsa.4UjoUPPRfS'),
(21, 'ooo', '$2b$10$WV/jycsdJAFGQR/i3r9oXOP7roSSQK5.nSsfB5dgzefmUCgJ4hb.G'),
(22, 'jjj', '$2b$10$lvFQ/76oGpegUjbJCj29FeL.28dGnfSq2CR4PzV8RJQYNbNbPOfUS'),
(23, '222', '$2b$10$f.3aJurhYwvEdycb1VGbre1J3gFW6aLWhgwk4fK94YCLXJg.6UULK'),
(24, '333', '$2b$10$OGwpSW8Vxym6x6V2DkhYAuRceUgCvkTCFAUjkX.Op/1QlWzS80ryG'),
(25, 'qqq', '$2b$10$hxjdAqG1OqRCia2BpoEFAOXNZgjykzdq8Foma7T3spYpKncpiVbCa'),
(26, '123', '123'),
(27, 'qwe', '$2b$10$xEK7XUN5fr9NKjcYmHClquC9N3VuiNubNnN6pBhQYRUSv..QG7.Ze'),
(28, 'Pavel', '$2b$10$0gRvuur/IkvrTnmX5qrRk.D6P7muvSPrsj6o67Ckxu.vscYKD.G5G'),
(29, 'chtotib', '$2b$10$wZlictvN7H..K6VisbqBu.JgvYBe5uF8HeogvUF1fATdytoEw7R1W');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
