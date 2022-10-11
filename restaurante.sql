-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 11-10-2022 a las 04:58:02
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `restaurante`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `categories`
--

INSERT INTO `categories` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'entrada', 'Productos de tipo pasabocas.', NULL, NULL),
(2, 'ppicar', 'Picadas.', NULL, NULL),
(3, 'asados', NULL, NULL, NULL),
(4, 'dominyfest', 'Para Domingos y festivos.', NULL, NULL),
(5, 'pescados', 'Platillos los cuales su proteína principal es el pescado.', NULL, NULL),
(6, 'comidarap', 'Comida rápida para cualquier momento del día.', NULL, NULL),
(7, 'postres', 'Platos para deleitar el gusto en el mundo del dulce.', NULL, NULL),
(8, 'bebicali', 'Bebidas Calientes.', NULL, NULL),
(9, 'addic', 'Adiciones.', NULL, NULL),
(10, 'patacones', NULL, NULL, NULL),
(11, 'bebidas', 'Bebidas.', NULL, NULL),
(12, 'cervezas', NULL, NULL, NULL),
(13, 'licores', NULL, NULL, NULL),
(14, 'vinos', NULL, NULL, NULL),
(15, 'cocteles', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2022_10_10_224201_create_categories_table', 1),
(6, '2022_10_10_224236_create_products_table', 1),
(7, '2022_10_10_224301_create_orders_table', 1),
(8, '2022_10_10_224355_create_order_products_table', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `description` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `order_products`
--

CREATE TABLE `order_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL,
  `subtotal` int(11) NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` int(11) NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `products`
--

INSERT INTO `products` (`id`, `name`, `description`, `price`, `image`, `type`, `created_at`, `updated_at`) VALUES
(1, 'Nachos', 'Salsa de queso, guacamole.', 7000, NULL, 1, NULL, NULL),
(2, 'Empanadas', '5 Unidades.', 7000, NULL, 1, NULL, NULL),
(3, 'Arepas con Hogao', '5 unidades.', 7000, NULL, 1, NULL, NULL),
(4, 'Patacones con hogao', '5 unidades.', 7000, NULL, 1, NULL, NULL),
(5, 'Plato de chorizos', 'Arepa, maduro, limón, tomate.', 16000, NULL, 2, NULL, NULL),
(6, 'Plato de chicharrón', 'Papa, arepa, patacón, tomate.', 15000, NULL, 2, NULL, NULL),
(7, 'Picada para 2', '100 gr de chicharrón, 150 gr de cerdo, res, chorizo picado, papa frita, tomate.', 37000, NULL, 2, NULL, NULL),
(8, 'Picada para 4', '300 gr de chicharrón, 300 gr de cerdo, res, 2 chorizos picados, papa frita, tomate.', 72000, NULL, 2, NULL, NULL),
(9, 'Churrasco', 'Res 250 gr, papa, patacón, tomate, arepa.', 30000, NULL, 3, NULL, NULL),
(10, 'Asado Don Pedro', 'Cerdo 100 gr, res 100 gr, pollo 100 gr, papa, patacón, tomate, arepa.', 30000, NULL, 3, NULL, NULL),
(11, 'Lomo de cerdo', 'Lomo de cerdo 250 gr, papa a la francesa, patacón, tomate, arepa.', 24000, NULL, 3, NULL, NULL),
(12, 'Carne Asada de Cerdo', 'Cerdo 250 gr, papa a la francesa, patacón, tomate, arepa.', 22000, NULL, 3, NULL, NULL),
(13, 'Carne Asada de Res', 'Res 250 gr, papa a la francesa, patacón, tomate, arepa.', 24000, NULL, 3, NULL, NULL),
(14, 'Pechuga a la Plancha', 'Pechuga 250 gr, papa a la francesa, patacón, tomate, arepa.', 22000, NULL, 3, NULL, NULL),
(15, 'Pechuga gratinada', 'Pechuga 250 gr, papa a la francesa, patacón, tomate, arepa.', 24000, NULL, 3, NULL, NULL),
(16, 'Frijolada', NULL, 22000, NULL, 4, NULL, NULL),
(17, 'Mondongo', NULL, 22000, NULL, 4, NULL, NULL),
(18, 'MiniPaisa', 'Arroz, frijol, carne molida, chicharrón, chorizo, huevo, aguacate, arepa, patacón.', 22000, NULL, 4, NULL, NULL),
(19, 'Sobre barriga a la Criolla', 'Papa, yuca, arroz, ensalada, carne.', 22000, NULL, 4, NULL, NULL),
(20, 'Sancocho de espinazo', NULL, 22000, NULL, 4, NULL, NULL),
(21, 'Mazamorra', NULL, 6000, NULL, 4, NULL, NULL),
(22, 'Mojarra frita', 'Ensalada, patacón, papas a la francesa, limón.', 27000, NULL, 5, NULL, NULL),
(23, 'Trucha frita', 'Ensalada, patacón, papas a la francesa, limón.', 27000, NULL, 5, NULL, NULL),
(24, 'Hamburguesa Ooopele', 'Carne de res 150 gr, tocineta, queso, lechuga, tomate, ripio y salsas. ', 17000, NULL, 6, NULL, NULL),
(25, 'Perro Caliente', 'Salchicha tipo americano, ripio, tocineta, queso gratinado, salsas y papas a la francesa.', 13000, NULL, 6, NULL, NULL),
(26, 'Menú infantil', 'Pinchos de pollo 2 unidades, papas a la francesa y salsas.', 13000, NULL, 6, NULL, NULL),
(27, 'Salchipapas', NULL, 13000, NULL, 6, NULL, NULL),
(28, 'Brownie con helado', NULL, 9000, NULL, 7, NULL, NULL),
(29, 'Maracuyá, Limón', NULL, 4000, NULL, 7, NULL, NULL),
(30, 'Aguapanela con queso y arepa', NULL, 7000, NULL, 8, NULL, NULL),
(31, 'Milo Caliente', NULL, 7000, NULL, 8, NULL, NULL),
(32, 'Café con leche', NULL, 5000, NULL, 8, NULL, NULL),
(33, 'Aromáticas', NULL, 2000, NULL, 8, NULL, NULL),
(34, 'Café Suave', NULL, 2000, NULL, 8, NULL, NULL),
(35, 'Chocolate en agua o en panela', NULL, 4000, NULL, 8, NULL, NULL),
(36, 'Chocolate en leche', NULL, 5000, NULL, 8, NULL, NULL),
(37, 'Capuchino Vainilla', NULL, 6000, NULL, 8, NULL, NULL),
(38, 'Capuchino Clásico', NULL, 6000, NULL, 8, NULL, NULL),
(39, 'Capuchino con Licor', NULL, 9000, NULL, 8, NULL, NULL),
(40, 'Café Americano', NULL, 2000, NULL, 8, NULL, NULL),
(41, 'Café Late', NULL, 5000, NULL, 8, NULL, NULL),
(42, 'Mocachino', '(Café, choco, leche).', 7000, NULL, 8, NULL, NULL),
(43, 'Late Moca', '(Más leche).', 7000, NULL, 8, NULL, NULL),
(44, 'Chocolate con masmelos', NULL, 7000, NULL, 8, NULL, NULL),
(45, 'Papa a la francesa', '150 gr.', 5000, NULL, 9, NULL, NULL),
(46, 'Arroz', NULL, 4000, NULL, 9, NULL, NULL),
(47, 'Ensalada', NULL, 4000, NULL, 9, NULL, NULL),
(48, 'Frijol', NULL, 5000, NULL, 9, NULL, NULL),
(49, 'Patacón con pollo y queso', NULL, 17000, NULL, 10, NULL, NULL),
(50, 'Patacón con pollo y champiñones', NULL, 17000, NULL, 10, NULL, NULL),
(51, 'Patacón con carne desmechada, maicitos, queso', NULL, 17000, NULL, 10, NULL, NULL),
(52, 'Patacón mixto', 'Con pollo y carne.', 20000, NULL, 10, NULL, NULL),
(53, 'Milo frío', NULL, 9000, NULL, 11, NULL, NULL),
(54, 'Limonada de cereza', NULL, 9000, NULL, 11, NULL, NULL),
(55, 'Limonada de coco', NULL, 9000, NULL, 11, NULL, NULL),
(56, 'Jugos naturales en agua', 'Guanábana, Mora, Maracuyá, Lulo y Mango.', 7000, NULL, 11, NULL, NULL),
(57, 'Jugos naturales en leche', 'Guanábana, Mora, Maracuyá, Lulo y Mango.', 9000, NULL, 11, NULL, NULL),
(58, 'Limonada Natural', NULL, 7000, NULL, 11, NULL, NULL),
(59, 'Malteada de la casa', '(Brownie, Vainilla, Fresa).', 10000, NULL, 11, NULL, NULL),
(60, 'Soda Hatzu', NULL, 6000, NULL, 11, NULL, NULL),
(61, 'Té Hatzu', NULL, 8000, NULL, 11, NULL, NULL),
(62, 'Soda', NULL, 5000, NULL, 11, NULL, NULL),
(63, 'Agua x 600 ml', NULL, 4000, NULL, 11, NULL, NULL),
(64, 'Agua Cristal', NULL, 5000, NULL, 11, NULL, NULL),
(65, 'Mr Tea', NULL, 4000, NULL, 11, NULL, NULL),
(66, 'Hit', NULL, 4000, NULL, 11, NULL, NULL),
(67, 'H2O', NULL, 5000, NULL, 11, NULL, NULL),
(68, 'Cristal Aloe', NULL, 4000, NULL, 11, NULL, NULL),
(69, 'Gatorade', NULL, 6000, NULL, 11, NULL, NULL),
(70, 'Gaseosa', '(Manzana, Colombiana, Uva, Pepsi, Cocacola).', 4000, NULL, 11, NULL, NULL),
(71, 'Speed', NULL, 3000, NULL, 11, NULL, NULL),
(72, 'Red Bull', NULL, 9000, NULL, 11, NULL, NULL),
(73, 'Poker', NULL, 6000, NULL, 12, NULL, NULL),
(74, 'Corona', NULL, 8000, NULL, 12, NULL, NULL),
(75, 'Heineken', NULL, 8000, NULL, 12, NULL, NULL),
(76, 'Club Colombia', NULL, 6000, NULL, 12, NULL, NULL),
(77, 'Smirnoff', NULL, 10000, NULL, 12, NULL, NULL),
(78, 'Aguila Light', NULL, 6000, NULL, 12, NULL, NULL),
(79, '3 cordilleras', '(Rosada, Negra, Mulata).', 8000, NULL, 12, NULL, NULL),
(80, 'Media de Ron 8 años', NULL, 65000, NULL, 13, NULL, NULL),
(81, 'Botella de Ron 8 años', NULL, 100000, NULL, 13, NULL, NULL),
(82, 'Media de Ron 5 años ', NULL, 60000, NULL, 13, NULL, NULL),
(83, 'Botella de Ron 5 años', NULL, 90000, NULL, 13, NULL, NULL),
(84, 'Media de Aguardiente Light', NULL, 40000, NULL, 13, NULL, NULL),
(85, 'Media de Aguardiente', NULL, 40000, NULL, 13, NULL, NULL),
(86, 'Wisky Bucanas 375 ml', NULL, 110000, NULL, 13, NULL, NULL),
(87, 'Wisky Old Parr 750 ml', NULL, 175000, NULL, 13, NULL, NULL),
(88, 'Wisky Old Parr 500 ml', NULL, 130000, NULL, 13, NULL, NULL),
(89, 'Wisky Something special 750 ml', NULL, 90000, NULL, 13, NULL, NULL),
(90, 'Wisky Something special 375 ml', NULL, 70000, NULL, 13, NULL, NULL),
(91, 'Santa Ana Cabernet', NULL, 60000, NULL, 14, NULL, NULL),
(92, 'Santa Ana Blanco', NULL, 60000, NULL, 14, NULL, NULL),
(93, 'Volcanes Cabernet', NULL, 80000, NULL, 14, NULL, NULL),
(94, 'Volcanes Carmenere', NULL, 80000, NULL, 14, NULL, NULL),
(95, 'Volcanes Blanco', NULL, 80000, NULL, 14, NULL, NULL),
(96, 'Miel de reinas', NULL, 30000, NULL, 14, NULL, NULL),
(97, 'Gato Negro', NULL, 70000, NULL, 14, NULL, NULL),
(98, 'Reservado Chileno', NULL, 50000, NULL, 14, NULL, NULL),
(99, 'Mango', '(Mango, Vodka).', 17000, NULL, 15, NULL, NULL),
(100, 'Cereza', '(Cereza, Vodka).', 17000, NULL, 15, NULL, NULL),
(101, 'Daiquiri', '(Ron Blanco, Limón).', 17000, NULL, 15, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `order_products`
--
ALTER TABLE `order_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `products_id` (`product_id`);

--
-- Indices de la tabla `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indices de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indices de la tabla `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `type` (`type`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `order_products`
--
ALTER TABLE `order_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=102;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `order_products`
--
ALTER TABLE `order_products`
  ADD CONSTRAINT `order_id` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  ADD CONSTRAINT `products_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Filtros para la tabla `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`type`) REFERENCES `categories` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
