-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 28-11-2018 a las 07:26:35
-- Versión del servidor: 5.7.19
-- Versión de PHP: 5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `proyectofinal`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `agentes`
--

DROP TABLE IF EXISTS `agentes`;
CREATE TABLE IF NOT EXISTS `agentes` (
  `Id_Agente` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre_completo` varchar(100) NOT NULL,
  `Fecha_nacimiento` varchar(100) NOT NULL,
  `Especialidad` varchar(100) NOT NULL,
  `Idiomas` varchar(100) NOT NULL,
  `Telefono` bigint(20) NOT NULL,
  `Email` varchar(100) NOT NULL,
  PRIMARY KEY (`Id_Agente`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `agentes`
--

INSERT INTO `agentes` (`Id_Agente`, `Nombre_completo`, `Fecha_nacimiento`, `Especialidad`, `Idiomas`, `Telefono`, `Email`) VALUES
(1, 'Ricardo Landry', '29/03/1996', 'Residencias', 'Español', 4772154326, 'rlan@gmail.com'),
(2, 'Sandra Mireles', '26/09/1995', 'Suites', 'Espanol', 4779826545, 'smir@gmail.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `area_experiencia`
--

DROP TABLE IF EXISTS `area_experiencia`;
CREATE TABLE IF NOT EXISTS `area_experiencia` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `nombre` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `casa`
--

DROP TABLE IF EXISTS `casa`;
CREATE TABLE IF NOT EXISTS `casa` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `costo` decimal(10,2) DEFAULT NULL,
  `calle` varchar(50) DEFAULT NULL,
  `colonia` varchar(50) DEFAULT NULL,
  `num_ext` varchar(10) DEFAULT NULL,
  `num_int` varchar(10) DEFAULT NULL,
  `habitaciones` int(11) DEFAULT NULL,
  `medidas` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `casa`
--

INSERT INTO `casa` (`id`, `costo`, `calle`, `colonia`, `num_ext`, `num_int`, `habitaciones`, `medidas`) VALUES
(1, '300000.00', 'Fuerte del Alfaro', 'Villa insurgentes', '211', NULL, 2, '15x7'),
(2, '750000.50', 'Prueba', 'Colonia', '175', '2', 5, '20X20'),
(3, '600000.00', 'Prueba1', 'Colonia1', '325', NULL, 6, '30X20'),
(4, '500000.00', 'Prueba2', 'Colonia2', '210', '2', 1, '10X15');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cita`
--

DROP TABLE IF EXISTS `cita`;
CREATE TABLE IF NOT EXISTS `cita` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_contacto` int(10) UNSIGNED DEFAULT NULL,
  `fecha` timestamp NULL DEFAULT NULL,
  `motivo` text,
  `estatus` varchar(10) DEFAULT NULL,
  `id_publicacion` int(11) UNSIGNED NOT NULL,
  `id_usuario` int(11) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_publicacion` (`id_publicacion`),
  KEY `id_usuario` (`id_usuario`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

DROP TABLE IF EXISTS `cliente`;
CREATE TABLE IF NOT EXISTS `cliente` (
  `Id_cliente` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(50) NOT NULL,
  `Password` varchar(50) NOT NULL,
  `Calle` varchar(50) NOT NULL,
  `Colonia` varchar(50) NOT NULL,
  `Ciudad` varchar(50) NOT NULL,
  `Rfc` varchar(50) NOT NULL,
  `Telefono` varchar(50) NOT NULL,
  `Tipo` varchar(50) NOT NULL,
  `Correo` varchar(50) NOT NULL,
  PRIMARY KEY (`Id_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`Id_cliente`, `Nombre`, `Password`, `Calle`, `Colonia`, `Ciudad`, `Rfc`, `Telefono`, `Tipo`, `Correo`) VALUES
(1, 'Ricardo', '123', 'No', 'Prueba', 'No', '123', '123', 'admin', 'rl@gmail.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `foto`
--

DROP TABLE IF EXISTS `foto`;
CREATE TABLE IF NOT EXISTS `foto` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_casa` int(11) UNSIGNED NOT NULL,
  `ruta` text,
  PRIMARY KEY (`id`),
  KEY `id_casa` (`id_casa`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `peticion`
--

DROP TABLE IF EXISTS `peticion`;
CREATE TABLE IF NOT EXISTS `peticion` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_usuario` int(11) UNSIGNED NOT NULL,
  `id_publicacion` int(11) UNSIGNED NOT NULL,
  `mensaje` text,
  `estatus` char(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_usuario` (`id_usuario`),
  KEY `id_publicacion` (`id_publicacion`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `publicacion`
--

DROP TABLE IF EXISTS `publicacion`;
CREATE TABLE IF NOT EXISTS `publicacion` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_usuario` int(11) UNSIGNED NOT NULL,
  `descripcion` text,
  `fecha_publicacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estatus` char(10) DEFAULT NULL,
  `id_casa` int(11) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_usuario` (`id_usuario`),
  KEY `id_casa` (`id_casa`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `publicacion`
--

INSERT INTO `publicacion` (`id`, `id_usuario`, `descripcion`, `fecha_publicacion`, `estatus`, `id_casa`) VALUES
(2, 1, 'Segundo', '2018-09-21 05:00:00', 'Compra', 1),
(3, 2, 'Prueba de varios', '2018-09-26 05:00:00', 'Renta', 2),
(4, 2, 'Prueba 2', '2018-06-29 05:00:00', 'Venta', 3),
(1, 1, 'Prueba 3', '2018-10-15 05:00:00', 'Venta', 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

DROP TABLE IF EXISTS `usuario`;
CREATE TABLE IF NOT EXISTS `usuario` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `correo` varchar(50) NOT NULL,
  `password` text,
  `tipo` char(2) NOT NULL,
  `nombre` varchar(30) DEFAULT NULL,
  `apellido_paterno` varchar(30) DEFAULT NULL,
  `apellido_materno` varchar(30) DEFAULT NULL,
  `calle` varchar(20) DEFAULT NULL,
  `colonia` varchar(20) DEFAULT NULL,
  `num_ext` varchar(10) DEFAULT NULL,
  `num_int` varchar(10) DEFAULT NULL,
  `telefono_fijo` int(10) DEFAULT NULL,
  `telefono_celular` int(10) DEFAULT NULL,
  `foto` text,
  `estatus` char(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `correo` (`correo`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id`, `correo`, `password`, `tipo`, `nombre`, `apellido_paterno`, `apellido_materno`, `calle`, `colonia`, `num_ext`, `num_int`, `telefono_fijo`, `telefono_celular`, `foto`, `estatus`) VALUES
(1, 'rldlandry@gmail.com', '123', 'v', 'Ricardo', 'Landry', 'Delgado', 'Fuerte de Alfaro', 'Villa Insurgentes', '211', NULL, 7737551, 477357489, 'vendedor1.jpg', 'activo'),
(2, 'sandra@gmail.com', '321', 'c', 'Sandra', 'Mireles', 'Tovar', 'Calle prueba', 'Colonia', '321', NULL, 7523265, 477326598, 'usuario1.jpg', 'activo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta`
--

DROP TABLE IF EXISTS `venta`;
CREATE TABLE IF NOT EXISTS `venta` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id_usuario` int(11) UNSIGNED NOT NULL,
  `id_casa` int(11) UNSIGNED NOT NULL,
  `total` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_usuario` (`id_usuario`),
  KEY `id_casa` (`id_casa`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
