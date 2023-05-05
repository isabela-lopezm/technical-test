-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 05-05-2023 a las 17:56:10
-- Versión del servidor: 10.4.22-MariaDB
-- Versión de PHP: 8.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `test_service`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contracts`
--

CREATE TABLE `contracts` (
  `id` int(11) NOT NULL,
  `code` varchar(10) NOT NULL,
  `state` enum('Activo','Inactivo') NOT NULL,
  `property_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `contracts`
--

INSERT INTO `contracts` (`id`, `code`, `state`, `property_id`) VALUES
(1, '110A', 'Activo', 1),
(2, '111B', 'Activo', 2),
(3, '112C', 'Inactivo', 3),
(4, '113D', 'Inactivo', 4),
(5, '114E', 'Inactivo', 5),
(6, '115F', 'Inactivo', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contracts_people`
--

CREATE TABLE `contracts_people` (
  `contract_id` int(11) NOT NULL,
  `person_id` int(11) NOT NULL,
  `role` enum('Arrendatario','Propietario','Deudor') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `contracts_people`
--

INSERT INTO `contracts_people` (`contract_id`, `person_id`, `role`) VALUES
(1, 1, 'Arrendatario'),
(1, 2, 'Propietario'),
(1, 3, 'Propietario'),
(2, 4, 'Arrendatario'),
(2, 2, 'Propietario'),
(2, 5, 'Deudor'),
(3, 6, 'Arrendatario'),
(3, 2, 'Propietario'),
(3, 3, 'Propietario'),
(3, 7, 'Deudor'),
(3, 8, 'Deudor'),
(4, 9, 'Arrendatario'),
(4, 3, 'Propietario'),
(5, 10, 'Arrendatario'),
(5, 3, 'Propietario'),
(5, 2, 'Propietario'),
(5, 7, 'Deudor'),
(5, 5, 'Deudor'),
(5, 8, 'Deudor'),
(6, 7, 'Arrendatario'),
(6, 4, 'Propietario'),
(6, 1, 'Deudor'),
(6, 3, 'Deudor');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `people`
--

CREATE TABLE `people` (
  `id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `last_name` varchar(20) NOT NULL,
  `id_document` int(11) NOT NULL,
  `email` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `people`
--

INSERT INTO `people` (`id`, `name`, `last_name`, `id_document`, `email`) VALUES
(1, 'Marta', 'Fernandez', 12345, 'mf@gmail.com'),
(2, 'Pedro', 'Diaz', 23456, 'pd@hotmail.com'),
(3, 'Luis', 'Martinez', 34567, 'lm@gmail.com'),
(4, 'Luisa', 'Osorio', 45678, 'lo@gmail.com'),
(5, 'Laura', 'Torres', 56789, 'lt@gmail.com'),
(6, 'Tatiana', 'Cardenas', 67890, 'tc@gmail.com'),
(7, 'Roberto', 'Casas', 78901, 'rc@hotmail.com'),
(8, 'Maria', 'Rojas', 89012, 'mr@gmail.com'),
(9, 'Carlos', 'Rosero', 90123, 'cr@gmail.com'),
(10, 'Felipe', 'Orozco', 98765, 'fo@hotmail.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `properties`
--

CREATE TABLE `properties` (
  `id` int(11) NOT NULL,
  `address` varchar(30) NOT NULL,
  `type` enum('Casa','Apartamento','Local') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `properties`
--

INSERT INTO `properties` (`id`, `address`, `type`) VALUES
(1, 'Calle 12 # 34-56', 'Casa'),
(2, 'Carrera 56 # 78N-90', 'Casa'),
(3, 'Avenida 19 #123-45', 'Casa'),
(4, 'Calle 45 # 68-92', 'Apartamento'),
(5, 'Carrera 95N # 12-34', 'Local');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `contracts`
--
ALTER TABLE `contracts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `property_id` (`property_id`);

--
-- Indices de la tabla `contracts_people`
--
ALTER TABLE `contracts_people`
  ADD KEY `contract_id` (`contract_id`),
  ADD KEY `person_id` (`person_id`);

--
-- Indices de la tabla `people`
--
ALTER TABLE `people`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `properties`
--
ALTER TABLE `properties`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `contracts`
--
ALTER TABLE `contracts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `people`
--
ALTER TABLE `people`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `properties`
--
ALTER TABLE `properties`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `contracts`
--
ALTER TABLE `contracts`
  ADD CONSTRAINT `contracts_ibfk_1` FOREIGN KEY (`property_id`) REFERENCES `properties` (`id`);

--
-- Filtros para la tabla `contracts_people`
--
ALTER TABLE `contracts_people`
  ADD CONSTRAINT `contracts_people_ibfk_1` FOREIGN KEY (`contract_id`) REFERENCES `contracts` (`id`),
  ADD CONSTRAINT `contracts_people_ibfk_2` FOREIGN KEY (`person_id`) REFERENCES `people` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
