-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 07-11-2020 a las 12:49:16
-- Versión del servidor: 10.1.38-MariaDB
-- Versión de PHP: 7.3.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `cr09_alejandro_rodriguez_delivery`
--
CREATE DATABASE IF NOT EXISTS `cr09_alejandro_rodriguez_delivery` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `cr09_alejandro_rodriguez_delivery`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `address`
--

CREATE TABLE `address` (
  `address_id` int(64) NOT NULL,
  `city` varchar(15) NOT NULL,
  `street` varchar(15) NOT NULL,
  `house_number` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `address`
--

INSERT INTO `address` (`address_id`, `city`, `street`, `house_number`) VALUES
(1, 'Vienna', 'Schüttelstrasse', 13),
(2, 'Rio Bueno', 'Cochrane', 1642),
(3, 'Fakecity', 'Fakestreet', 123),
(4, 'Fakecity', 'Realstreet', 321),
(5, 'Fakecity', 'Existingstreet', 1313),
(6, 'Hamburg', 'Knowidont', 54);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `employee`
--

CREATE TABLE `employee` (
  `employee_id` int(64) NOT NULL,
  `first_name` varchar(15) NOT NULL,
  `last_name` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `employee`
--

INSERT INTO `employee` (`employee_id`, `first_name`, `last_name`) VALUES
(1, 'Serri', 'Ghiath'),
(2, 'Afek', 'Anem'),
(3, 'Delivery', 'Man'),
(4, 'Rale', 'Mena');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `family_dependants`
--

CREATE TABLE `family_dependants` (
  `dependant_id` int(64) NOT NULL,
  `first_name` varchar(15) NOT NULL,
  `last name` varchar(15) NOT NULL,
  `relation` varchar(15) NOT NULL,
  `fk_employee_id` int(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `insurance`
--

CREATE TABLE `insurance` (
  `insurance_id` int(64) NOT NULL,
  `company` varchar(15) NOT NULL,
  `amount_covered` int(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `measures`
--

CREATE TABLE `measures` (
  `measures_id` int(64) NOT NULL,
  `weight` int(6) NOT NULL,
  `size` int(6) NOT NULL,
  `price` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `measures`
--

INSERT INTO `measures` (`measures_id`, `weight`, `size`, `price`) VALUES
(2, 1, 2, 1000),
(3, 2, 2, 1500),
(4, 2, 3, 2000),
(5, 3, 3, 2500);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `office`
--

CREATE TABLE `office` (
  `office_id` int(64) NOT NULL,
  `fk_address_id` int(64) NOT NULL,
  `fk_goods_id` int(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `office`
--

INSERT INTO `office` (`office_id`, `fk_address_id`, `fk_goods_id`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 6, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `office_goods`
--

CREATE TABLE `office_goods` (
  `goods_id` int(64) NOT NULL,
  `has_fridge` tinyint(1) NOT NULL,
  `has_microwave` tinyint(1) NOT NULL,
  `has_sugar` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `office_goods`
--

INSERT INTO `office_goods` (`goods_id`, `has_fridge`, `has_microwave`, `has_sugar`) VALUES
(1, 1, 0, 1),
(2, 1, 1, 1),
(3, 0, 0, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `package`
--

CREATE TABLE `package` (
  `package_id` int(64) NOT NULL,
  `sending_date` date NOT NULL,
  `receiving_date` date NOT NULL,
  `fk_measures_id` int(64) NOT NULL,
  `fk_employee_id` int(64) NOT NULL,
  `fk_sender_id` int(64) NOT NULL,
  `fk_office_id` int(64) NOT NULL,
  `fk_receiver_id` int(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `package`
--

INSERT INTO `package` (`package_id`, `sending_date`, `receiving_date`, `fk_measures_id`, `fk_employee_id`, `fk_sender_id`, `fk_office_id`, `fk_receiver_id`) VALUES
(1, '2020-11-06', '2020-11-13', 2, 1, 1, 1, 2),
(2, '2020-11-17', '2020-11-20', 5, 2, 2, 2, 3),
(3, '2020-10-05', '2020-12-18', 3, 4, 2, 2, 1),
(4, '2020-11-05', '2020-11-07', 2, 1, 2, 1, 2),
(5, '2020-11-06', '2020-11-21', 2, 1, 2, 2, 2),
(6, '2020-11-28', '2020-11-30', 4, 3, 2, 3, 1),
(7, '2020-11-12', '2020-11-22', 4, 2, 3, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `receiver`
--

CREATE TABLE `receiver` (
  `receiver_id` int(64) NOT NULL,
  `first_name` varchar(15) NOT NULL,
  `last_name` varchar(15) NOT NULL,
  `phone` int(15) NOT NULL,
  `fk_address_id` int(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `receiver`
--

INSERT INTO `receiver` (`receiver_id`, `first_name`, `last_name`, `phone`, `fk_address_id`) VALUES
(1, 'Alejandro', 'Rodriguez', 43685886, 1),
(2, 'Victor', 'Hugo', 43689568, 3),
(3, 'Serri', 'Ghiath', 43688564, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sender`
--

CREATE TABLE `sender` (
  `sender_id` int(64) NOT NULL,
  `first_name` varchar(15) NOT NULL,
  `last_name` varchar(15) NOT NULL,
  `phone` int(15) NOT NULL,
  `fk_address_id` int(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `sender`
--

INSERT INTO `sender` (`sender_id`, `first_name`, `last_name`, `phone`, `fk_address_id`) VALUES
(1, 'Alejandro', 'Rodriguez', 436766758, 1),
(2, 'Irma', 'Alvarado', 438584340, 2),
(3, 'Sebastian', 'Delgado', 569231234, 2);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`address_id`);

--
-- Indices de la tabla `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`employee_id`);

--
-- Indices de la tabla `family_dependants`
--
ALTER TABLE `family_dependants`
  ADD PRIMARY KEY (`dependant_id`),
  ADD KEY `fk_employee_id` (`fk_employee_id`);

--
-- Indices de la tabla `insurance`
--
ALTER TABLE `insurance`
  ADD PRIMARY KEY (`insurance_id`);

--
-- Indices de la tabla `measures`
--
ALTER TABLE `measures`
  ADD PRIMARY KEY (`measures_id`);

--
-- Indices de la tabla `office`
--
ALTER TABLE `office`
  ADD PRIMARY KEY (`office_id`),
  ADD KEY `fk_office_address_id` (`fk_address_id`),
  ADD KEY `fk_goods_id` (`fk_goods_id`);

--
-- Indices de la tabla `office_goods`
--
ALTER TABLE `office_goods`
  ADD PRIMARY KEY (`goods_id`);

--
-- Indices de la tabla `package`
--
ALTER TABLE `package`
  ADD PRIMARY KEY (`package_id`),
  ADD KEY `fk_measures_id` (`fk_measures_id`),
  ADD KEY `fk_employee_id` (`fk_employee_id`),
  ADD KEY `fk_sender_id` (`fk_sender_id`),
  ADD KEY `fk_office_id` (`fk_office_id`),
  ADD KEY `fk_receiver_id` (`fk_receiver_id`);

--
-- Indices de la tabla `receiver`
--
ALTER TABLE `receiver`
  ADD PRIMARY KEY (`receiver_id`),
  ADD KEY `fk_receiver_address_id` (`fk_address_id`);

--
-- Indices de la tabla `sender`
--
ALTER TABLE `sender`
  ADD PRIMARY KEY (`sender_id`),
  ADD KEY `fk_sender_address_id` (`fk_address_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `address`
--
ALTER TABLE `address`
  MODIFY `address_id` int(64) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `employee`
--
ALTER TABLE `employee`
  MODIFY `employee_id` int(64) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `family_dependants`
--
ALTER TABLE `family_dependants`
  MODIFY `dependant_id` int(64) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `insurance`
--
ALTER TABLE `insurance`
  MODIFY `insurance_id` int(64) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `measures`
--
ALTER TABLE `measures`
  MODIFY `measures_id` int(64) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `office`
--
ALTER TABLE `office`
  MODIFY `office_id` int(64) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `office_goods`
--
ALTER TABLE `office_goods`
  MODIFY `goods_id` int(64) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `package`
--
ALTER TABLE `package`
  MODIFY `package_id` int(64) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `receiver`
--
ALTER TABLE `receiver`
  MODIFY `receiver_id` int(64) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `sender`
--
ALTER TABLE `sender`
  MODIFY `sender_id` int(64) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `family_dependants`
--
ALTER TABLE `family_dependants`
  ADD CONSTRAINT `family_dependants_ibfk_1` FOREIGN KEY (`fk_employee_id`) REFERENCES `employee` (`employee_id`);

--
-- Filtros para la tabla `office`
--
ALTER TABLE `office`
  ADD CONSTRAINT `fk_goods_id` FOREIGN KEY (`fk_goods_id`) REFERENCES `office_goods` (`goods_id`),
  ADD CONSTRAINT `fk_office_address_id` FOREIGN KEY (`fk_address_id`) REFERENCES `address` (`address_id`);

--
-- Filtros para la tabla `package`
--
ALTER TABLE `package`
  ADD CONSTRAINT `fk_employee_id` FOREIGN KEY (`fk_employee_id`) REFERENCES `employee` (`employee_id`),
  ADD CONSTRAINT `fk_measures_id` FOREIGN KEY (`fk_measures_id`) REFERENCES `measures` (`measures_id`),
  ADD CONSTRAINT `fk_office_id` FOREIGN KEY (`fk_office_id`) REFERENCES `office` (`office_id`),
  ADD CONSTRAINT `fk_receiver_id` FOREIGN KEY (`fk_receiver_id`) REFERENCES `receiver` (`receiver_id`),
  ADD CONSTRAINT `fk_sender_id` FOREIGN KEY (`fk_sender_id`) REFERENCES `sender` (`sender_id`);

--
-- Filtros para la tabla `receiver`
--
ALTER TABLE `receiver`
  ADD CONSTRAINT `fk_receiver_address_id` FOREIGN KEY (`fk_address_id`) REFERENCES `address` (`address_id`);

--
-- Filtros para la tabla `sender`
--
ALTER TABLE `sender`
  ADD CONSTRAINT `fk_sender_address_id` FOREIGN KEY (`fk_address_id`) REFERENCES `address` (`address_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
