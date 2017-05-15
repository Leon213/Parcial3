-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 15-05-2017 a las 01:41:28
-- Versión del servidor: 5.7.14
-- Versión de PHP: 5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `parcial3`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `docentes`
--

CREATE TABLE `docentes` (
  `idDocentes` int(11) NOT NULL,
  `pNombre` varchar(25) COLLATE latin1_spanish_ci NOT NULL,
  `sNombre` varchar(25) COLLATE latin1_spanish_ci DEFAULT NULL,
  `pApellido` varchar(25) COLLATE latin1_spanish_ci NOT NULL,
  `sApellido` varchar(25) COLLATE latin1_spanish_ci DEFAULT NULL,
  `usuario` varchar(15) COLLATE latin1_spanish_ci NOT NULL,
  `passwrd` varchar(250) COLLATE latin1_spanish_ci NOT NULL,
  `rol` int(11) NOT NULL,
  `escuela` int(11) NOT NULL,
  `fechaAdd` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `docentes`
--

INSERT INTO `docentes` (`idDocentes`, `pNombre`, `sNombre`, `pApellido`, `sApellido`, `usuario`, `passwrd`, `rol`, `escuela`, `fechaAdd`) VALUES
(1, 'Milton', '', 'Narvaez', '', 'milton.narvaez', 'milton.narvaez', 1, 1, '2017-05-14 19:06:09'),
(2, 'Milton', 'Antonio', 'Narvaez', 'Guerrero', 'Milton.Narvaez', 'Milton.Narvaez', 2, 1, '2017-05-14 21:29:54'),
(3, 'Marvin', 'Leonel', 'Rivas', 'Trejo', 'Marvin.Rivas', 'Marvin.Rivas', 2, 2, '2017-05-14 21:32:50'),
(4, 'Luis', 'David', 'Villalta', 'Villalta', 'Luis.Villalta', 'Luis.Villalta', 2, 2, '2017-05-14 21:35:05'),
(6, 'Luis', 'Antonio', 'Villalta', NULL, 'Luis.Villalta', 'Luis.Villalta', 2, 1, '2017-05-14 21:56:28'),
(7, 'Luis', 'Antonio', 'Villalta', NULL, 'Luis.Villalta', 'Luis.Villalta', 2, 1, '2017-05-14 21:56:28'),
(8, 'Luis', NULL, 'Villalta', NULL, 'Luis.Villalta', 'Luis.Villalta', 2, 1, '2017-05-14 21:58:22'),
(9, 'Luis', NULL, 'Villalta', NULL, 'Luis.Villalta5', 'Luis.Villalta5', 2, 2, '2017-05-14 22:01:58');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `escuelas`
--

CREATE TABLE `escuelas` (
  `idEscuela` int(11) NOT NULL,
  `nombreEscuela` varchar(40) COLLATE latin1_spanish_ci NOT NULL,
  `descripcion` varchar(500) COLLATE latin1_spanish_ci NOT NULL,
  `fe` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `escuelas`
--

INSERT INTO `escuelas` (`idEscuela`, `nombreEscuela`, `descripcion`, `fe`) VALUES
(1, 'Ciencias de la Computacion', 'Escuela que ve la ingenieria y el tecnico computacion', '2017-05-14 15:04:10'),
(2, 'Electronica', ':D', '2017-05-14 15:04:10');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `idRol` int(11) NOT NULL,
  `nombreRol` varchar(40) COLLATE latin1_spanish_ci NOT NULL,
  `descripcion` varchar(500) COLLATE latin1_spanish_ci NOT NULL,
  `fechaAdd` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`idRol`, `nombreRol`, `descripcion`, `fechaAdd`) VALUES
(1, 'Director', 'Director de escuela', '2017-05-14 14:59:20'),
(2, 'Docente', 'docente normal', '2017-05-14 14:59:20');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `visitas`
--

CREATE TABLE `visitas` (
  `idVisita` int(11) NOT NULL,
  `docente` int(11) NOT NULL,
  `institucion` varchar(75) COLLATE latin1_spanish_ci NOT NULL,
  `fechaVisita` date NOT NULL,
  `objetivo` varchar(500) COLLATE latin1_spanish_ci NOT NULL,
  `fechaAdd` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `visitas`
--

INSERT INTO `visitas` (`idVisita`, `docente`, `institucion`, `fechaVisita`, `objetivo`, `fechaAdd`) VALUES
(1, 1, 'ITR', '2017-01-01', 'asd', '2017-05-15 00:29:09'),
(2, 3, 'ITR', '2017-06-11', 'exito', '2017-05-15 01:25:47');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `docentes`
--
ALTER TABLE `docentes`
  ADD PRIMARY KEY (`idDocentes`),
  ADD KEY `IndiceEscuela` (`escuela`),
  ADD KEY `IndiceRol` (`rol`) USING BTREE;

--
-- Indices de la tabla `escuelas`
--
ALTER TABLE `escuelas`
  ADD PRIMARY KEY (`idEscuela`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`idRol`);

--
-- Indices de la tabla `visitas`
--
ALTER TABLE `visitas`
  ADD PRIMARY KEY (`idVisita`),
  ADD KEY `indiceDocente` (`docente`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `docentes`
--
ALTER TABLE `docentes`
  MODIFY `idDocentes` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT de la tabla `escuelas`
--
ALTER TABLE `escuelas`
  MODIFY `idEscuela` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `idRol` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `visitas`
--
ALTER TABLE `visitas`
  MODIFY `idVisita` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `docentes`
--
ALTER TABLE `docentes`
  ADD CONSTRAINT `fk_docente_escuela` FOREIGN KEY (`escuela`) REFERENCES `escuelas` (`idEscuela`),
  ADD CONSTRAINT `fk_docente_rol` FOREIGN KEY (`rol`) REFERENCES `roles` (`idRol`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
