-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 07-07-2025 a las 23:47:40
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `meraki`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tip_user`
--

CREATE TABLE `tip_user` (
  `id_tip_user` int(10) NOT NULL,
  `tip_user` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tip_user`
--

INSERT INTO `tip_user` (`id_tip_user`, `tip_user`) VALUES
(1, 'superadmin'),
(2, 'vigilante'),
(3, 'numerario');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user`
--

CREATE TABLE `user` (
  `doc` bigint(12) NOT NULL,
  `nombres` text NOT NULL,
  `celular` bigint(12) NOT NULL,
  `profesion` varchar(30) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `password` varchar(500) NOT NULL,
  `desc_perf` varchar(150) DEFAULT NULL,
  `tip_user_u` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `user`
--

INSERT INTO `user` (`doc`, `nombres`, `celular`, `profesion`, `email`, `password`, `desc_perf`, `tip_user_u`) VALUES
(1070466003, 'ALEX SANTIAGO', 3166650721, 'SEGURIDAD', 'alexsantiago@gmail.com', '12345678p', 'Vigilante con 8 años de experiencia, puntual, responsable y comprometido al 100% con la seguridad.', 2),
(1070599001, 'JUAN ESTEBAN', 3222886718, 'NUMERARIO', 'juanespinos@gmail.com', '12345678q', 'Numerario comprometido con la puntualidad, el trabajo duro e inteligente.', 3),
(1070599003, 'JULIO  CESAR', 3166650784, 'SEGURIDAD', 'julio@gmail.com', '12345678i', 'vigilante comprometido las 24 horas con la seguridad y el bienestar comun.', 2),
(1070599004, 'JOAN SEBASTIAN', 3166650796, 'SEGURIDAD', 'sebassalazar029@gmail.com', '12345678S', 'Vigilante honesto, entusiasmado con proteger el bienestar comun.', 2),
(1070599667, 'KEVIN FLOREZ', 3182766212, 'SEGURIDAD', 'kevin@gmail.com', '12345678e', 'Vigilante con 3 años de experiencia, responsable, puntual y entrgado a la seguridad de las personas. ', 2);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `tip_user`
--
ALTER TABLE `tip_user`
  ADD PRIMARY KEY (`id_tip_user`);

--
-- Indices de la tabla `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`doc`),
  ADD KEY `tip_user` (`tip_user_u`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `tip_user`
--
ALTER TABLE `tip_user`
  MODIFY `id_tip_user` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`tip_user_u`) REFERENCES `tip_user` (`id_tip_user`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
