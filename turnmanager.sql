-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 22-01-2024 a las 23:32:59
-- Versión del servidor: 10.4.27-MariaDB
-- Versión de PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `turnmanager`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `citizen`
--

CREATE TABLE `citizen` (
  `id` int(11) NOT NULL,
  `dni` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `surname` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `citizen`
--

INSERT INTO `citizen` (`id`, `dni`, `name`, `surname`) VALUES
(1, '12345678', 'Prueba', 'de funcion'),
(2, '654321', 'Enrique', 'Martin de la sierra'),
(3, '1111111', 'este es', 'de prueba');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `turn`
--

CREATE TABLE `turn` (
  `id` int(11) NOT NULL,
  `turnDate` date DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `citizen_id` int(11) DEFAULT NULL,
  `attended` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `turn`
--

INSERT INTO `turn` (`id`, `turnDate`, `description`, `citizen_id`, `attended`) VALUES
(1, '2024-02-01', 'esto va pero a que precio', 2, 1),
(2, '2024-01-30', 'recreando error', 3, 0),
(3, '2024-01-25', 'arreglando error pero probando el mismo ciudadano de prueba', 3, 0),
(4, '2024-01-31', 'a ver si con esta validacion no se duplica', 3, 0),
(5, '2024-01-30', 'ojo que va como quiero', 2, 0),
(6, '2024-01-18', 'este ya ha pasado pero aun no he desarrollado el attended', 2, 0),
(8, '2024-01-10', 'no va por ciudadano?', 2, 0),
(10, '2024-01-15', 'este lo genera como atendido?', 3, 1),
(11, '2024-01-16', 'va attended', 2, 1),
(27, '2024-02-01', 'atendido a futuro', 2, 1),
(29, '2024-02-01', 'este no puede estar atendido', 2, 0);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `citizen`
--
ALTER TABLE `citizen`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `turn`
--
ALTER TABLE `turn`
  ADD PRIMARY KEY (`id`),
  ADD KEY `citizen_id` (`citizen_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `citizen`
--
ALTER TABLE `citizen`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `turn`
--
ALTER TABLE `turn`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `turn`
--
ALTER TABLE `turn`
  ADD CONSTRAINT `turn_ibfk_1` FOREIGN KEY (`citizen_id`) REFERENCES `citizen` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
