-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 22-07-2015 a las 00:29:53
-- Versión del servidor: 5.6.17
-- Versión de PHP: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `pruebaauth`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `group_`
--

CREATE TABLE IF NOT EXISTS `group_` (
  `groupId` varchar(100) NOT NULL,
  `userId` varchar(100) NOT NULL,
  PRIMARY KEY (`groupId`,`userId`),
  KEY `userId_foreign` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `group_`
--

INSERT INTO `group_` (`groupId`, `userId`) VALUES
('admin', 'user1'),
('user', 'user2'),
('admin', 'user3'),
('user', 'user3');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_`
--

CREATE TABLE IF NOT EXISTS `user_` (
  `userId` varchar(100) NOT NULL DEFAULT '',
  `password` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `user_`
--

INSERT INTO `user_` (`userId`, `password`) VALUES
('user1', '0a041b9462caa4a31bac3567e0b6e6fd9100787db2ab433d96f6d178cabfce90'),
('user2', '6025d18fe48abd45168528f18a82e265dd98d421a7084aa09f61b341703901a3'),
('user3', '5860faf02b6bc6222ba5aca523560f0e364ccd8b67bee486fe8bf7c01d492ccb'),
('user4', '5269ef980de47819ba3d14340f4665262c41e933dc92c1a27dd5d01b047ac80e');

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `group_`
--
ALTER TABLE `group_`
  ADD CONSTRAINT `userId_foreign` FOREIGN KEY (`userId`) REFERENCES `user_` (`userid`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
