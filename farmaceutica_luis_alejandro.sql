-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 26-11-2023 a las 06:35:17
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `farmaceutica_luis_alejandro`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cita`
--

CREATE TABLE `cita` (
  `idCita` int(5) NOT NULL,
  `nombrePaciente` varchar(20) NOT NULL,
  `apellidoPaternoPaciente` varchar(30) NOT NULL,
  `apellidoMaternoPaciente` varchar(30) NOT NULL,
  `fechaCita` varchar(20) NOT NULL,
  `horaCita` varchar(20) NOT NULL,
  `nombreMedico` varchar(25) NOT NULL,
  `constultorioCita` int(2) NOT NULL,
  `analisisCita` varchar(90) NOT NULL,
  `estatus` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cita`
--

INSERT INTO `cita` (`idCita`, `nombrePaciente`, `apellidoPaternoPaciente`, `apellidoMaternoPaciente`, `fechaCita`, `horaCita`, `nombreMedico`, `constultorioCita`, `analisisCita`, `estatus`) VALUES
(1, 'Luis', 'Alejandro', 'Lopez', '09/11/2023', '10:00 am', 'Miguel', 1, 'DOLOR DE CABEZA', ''),
(2, 'Luis', 'Alejandro', 'Lopez', '16/11/2023', '10:00 am', 'Miguel', 2, 'Dolor estomacal, posible vomito', ''),
(3, 'Luis', 'Alejandro', 'Lopez', '21/11/2023', '10:00 am', 'Miguel', 1, 'VOMITO', 'pendiente'),
(4, 'Luis', 'Alejandro', 'Lopez', '01/11/2023', '10:00 am', 'Liliana', 1, 'DOLOR DE CABEZA', 'pendiente'),
(5, 'Luis', 'Alejandro', 'Lopez', '22/11/2023', '10:00 am', 'Miguel', 1, 'LELE PACHA', 'pendiente'),
(6, 'Luis', 'Alejandro', 'Lopez', '22/11/2023', '3:00 pm', 'Miguel', 2, 'DOLOR DE GARGANTA', 'pendiente'),
(7, 'Miguel', 'Hernandez', 'Hernandez', '22/11/2023', '10:00 am', 'Liliana', 1, 'Ninguno', 'pendiente'),
(8, 'Miguel', 'Hernandez', 'Hernandez', '23/11/2023', '11:00 am', 'Miguel', 1, 'Dolor estomacal', 'pendiente'),
(9, 'Miguel', 'Lopez', 'Lopez', '23/11/2023', '1:00 pm', 'Miguel', 1, 'Ninguno', 'pendiente'),
(10, 'Miguel', 'Hernandez', 'Hernandez', '23/11/2023', '3:00 pm', 'Miguel', 2, 'DOLOR DE CABEZA', 'pendiente');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `idCliente` int(10) NOT NULL,
  `rfcCliente` varchar(10) NOT NULL,
  `nombreCliente` varchar(20) NOT NULL,
  `apellidoPaterno` varchar(20) NOT NULL,
  `apellidoMaterno` varchar(20) NOT NULL,
  `numeroTelefono` int(10) NOT NULL,
  `correoElectronico` varchar(30) NOT NULL,
  `calleCliente` varchar(40) NOT NULL,
  `numeroExterior` int(5) NOT NULL,
  `numeroInterior` varchar(5) NOT NULL,
  `codigoPostal` int(5) NOT NULL,
  `colonia` varchar(40) NOT NULL,
  `municipio` varchar(30) NOT NULL,
  `estado` varchar(15) NOT NULL,
  `pais` varchar(10) NOT NULL,
  `fechaRegistro` varchar(20) NOT NULL,
  `estatus` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`idCliente`, `rfcCliente`, `nombreCliente`, `apellidoPaterno`, `apellidoMaterno`, `numeroTelefono`, `correoElectronico`, `calleCliente`, `numeroExterior`, `numeroInterior`, `codigoPostal`, `colonia`, `municipio`, `estado`, `pais`, `fechaRegistro`, `estatus`) VALUES
(1, 'AELL01920L', 'Miguel', 'Lopez', 'Lopez', 0, 'll621870@gmail.com', 'VACIO', 0, '0', 0, 'VACIO', '', '', '', '', 0),
(2, 'LOP19289OP', 'Miguel', 'Hernandez', 'Hernandez', 63718190, 'll621870@gmail.com', 'VACIO', 2, '0', 53570, 'VACIO', 'VACIO', 'VACIO', 'VACIO', '22/11/2023', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `entrega`
--

CREATE TABLE `entrega` (
  `idEntrega` int(11) NOT NULL,
  `fechaEntrega` varchar(20) NOT NULL,
  `horaEntrega` varchar(20) NOT NULL,
  `puntoEntrega` varchar(30) NOT NULL,
  `intentos` int(11) NOT NULL,
  `notasAdicionales` varchar(50) NOT NULL,
  `estado` varchar(20) NOT NULL,
  `idPedido` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura`
--

CREATE TABLE `factura` (
  `idFactura` int(11) NOT NULL,
  `idCliente` int(11) NOT NULL,
  `idPedido` int(11) NOT NULL,
  `nombreEmpresa` varchar(20) NOT NULL,
  `direccionTPV` varchar(40) NOT NULL,
  `estado` varchar(10) NOT NULL,
  `pais` varchar(10) NOT NULL,
  `fechaFactura` varchar(20) NOT NULL,
  `horaFactura` varchar(10) NOT NULL,
  `observacionesFactura` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `medico`
--

CREATE TABLE `medico` (
  `cedulaMedico` varchar(25) NOT NULL,
  `nombreMedico` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `medico`
--

INSERT INTO `medico` (`cedulaMedico`, `nombreMedico`) VALUES
('CL090389', 'Liliana'),
('MD123456', 'Miguel');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pagos`
--

CREATE TABLE `pagos` (
  `idPago` int(11) NOT NULL,
  `fechaPago` varchar(20) NOT NULL,
  `horaPago` varchar(20) NOT NULL,
  `informacionAdicional` varchar(40) NOT NULL,
  `idPedido` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido`
--

CREATE TABLE `pedido` (
  `idPedido` int(11) NOT NULL,
  `fechaPedido` varchar(20) NOT NULL,
  `horaPedido` varchar(20) NOT NULL,
  `estatus` varchar(10) NOT NULL,
  `idCliente` int(11) DEFAULT NULL,
  `totalPagar` int(5) NOT NULL,
  `informacionAdicional` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidoproducto`
--

CREATE TABLE `pedidoproducto` (
  `idPedido` int(11) NOT NULL,
  `idProducto` int(11) NOT NULL,
  `numeroPiezas` int(11) NOT NULL,
  `subtotalPagar` double NOT NULL,
  `porcentajeDescuento` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `idProducto` int(11) NOT NULL,
  `nombreProducto` varchar(30) NOT NULL,
  `descripcionProducto` varchar(50) NOT NULL,
  `precioProducto` double NOT NULL,
  `numeroPiezas` int(11) NOT NULL,
  `estadoProducto` varchar(50) NOT NULL,
  `informacionAdicional` varchar(50) NOT NULL,
  `idVendedor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`idProducto`, `nombreProducto`, `descripcionProducto`, `precioProducto`, `numeroPiezas`, `estadoProducto`, `informacionAdicional`, `idVendedor`) VALUES
(1, 'Paracetamol', 'Antidesinflamatorio', 30, 9, 'Nuevo', 'Vacio', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reportes`
--

CREATE TABLE `reportes` (
  `idReporte` int(11) NOT NULL,
  `totaTarjeta` double NOT NULL,
  `totalEfectivo` double NOT NULL,
  `totalRemisiones` double NOT NULL,
  `cajaChica` double NOT NULL,
  `fecha` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `reportes`
--

INSERT INTO `reportes` (`idReporte`, `totaTarjeta`, `totalEfectivo`, `totalRemisiones`, `cajaChica`, `fecha`) VALUES
(2, 5000, 0, 5000, 500, '28/10/2023'),
(3, 150, 0, 150, 500, '29/10/2023'),
(4, 0, 650, 650, 500, '30/10/2023'),
(10, 90, 0, 90, 500, '02/11/2023'),
(11, 0, 1500, 1500, 500, '27/10/2023'),
(13, 0, 4500, 4500, 500, '03/11/2023'),
(16, 890, 0, 890, 500, '04/11/2023'),
(18, 0, 400, 0, 500, '05/11/2023'),
(19, 0, 890, 890, 500, '06/11/2023'),
(20, 2890, 0, 2890, 500, '07/11/2023'),
(128, 1500, 0, 1500, 500, '31/10/2023'),
(291, 0, 700, 700, 500, '26/10/2023'),
(989, 0, 1500, 1500, 500, '01/11/2023'),
(990, 300, 2600, 2900, 500, '08/11/2023'),
(992, 1680, 1248, 2928, 500, '09/11/2023');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ticket`
--

CREATE TABLE `ticket` (
  `idTicket` int(11) NOT NULL,
  `idPedido` int(11) NOT NULL,
  `idVendedor` int(11) NOT NULL,
  `montoEfectivo` double NOT NULL,
  `montoTarjeta` double NOT NULL,
  `estatus` varchar(15) NOT NULL,
  `fecha` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ticket`
--

INSERT INTO `ticket` (`idTicket`, `idPedido`, `idVendedor`, `montoEfectivo`, `montoTarjeta`, `estatus`, `fecha`) VALUES
(1, 1, 10215, 1500, 0, 'ENVIADO', '15/10/2023'),
(2, 3, 55, 1500, 0, 'ENVIADO', '27/10/2023'),
(5, 8, 90, 1600, 0, 'ENVIADO', '08/11/2023'),
(9, 8, 12, 100, 0, 'ENVIADO', '08/11/2023'),
(12, 12, 9, 0, 290, 'ENVIADO', '09/11/2023'),
(16, 9, 18, 900, 0, 'ENVIADO', '08/11/2023'),
(19, 8, 2, 348, 0, 'ENVIADO', '09/11/2023'),
(20, 20, 8, 0, 400, 'ENVIADO', '09/11/2023'),
(21, 21, 9, 900, 0, 'ENVIADO', '09/11/2023'),
(26, 27, 8, 0, 990, 'ENVIADO', '09/11/2023'),
(70, 2, 10, 0, 300, 'ENVIADO', '08/11/2023'),
(1263, 123, 15, 1560, 0, 'ENVIADO', '05/11/2023'),
(15798, 65, 15, 0, 3650, 'ENVIADO', '05/11/2023');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vendedor`
--

CREATE TABLE `vendedor` (
  `idVendedor` int(11) NOT NULL,
  `nombreVendedor` varchar(20) NOT NULL,
  `apellidoPaterno` varchar(20) NOT NULL,
  `apellidoMaterno` varchar(20) NOT NULL,
  `correoVendedor` varchar(30) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(15) NOT NULL,
  `fechaRegistro` varchar(20) NOT NULL,
  `estatus` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cita`
--
ALTER TABLE `cita`
  ADD PRIMARY KEY (`idCita`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`idCliente`);

--
-- Indices de la tabla `entrega`
--
ALTER TABLE `entrega`
  ADD PRIMARY KEY (`idEntrega`),
  ADD KEY `idPedido` (`idPedido`);

--
-- Indices de la tabla `factura`
--
ALTER TABLE `factura`
  ADD PRIMARY KEY (`idFactura`),
  ADD KEY `idPedido` (`idPedido`);

--
-- Indices de la tabla `medico`
--
ALTER TABLE `medico`
  ADD PRIMARY KEY (`cedulaMedico`);

--
-- Indices de la tabla `pagos`
--
ALTER TABLE `pagos`
  ADD PRIMARY KEY (`idPago`),
  ADD KEY `idPedido` (`idPedido`);

--
-- Indices de la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`idPedido`),
  ADD KEY `idCliente` (`idCliente`);

--
-- Indices de la tabla `pedidoproducto`
--
ALTER TABLE `pedidoproducto`
  ADD PRIMARY KEY (`idPedido`),
  ADD KEY `idProducto` (`idProducto`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`idProducto`),
  ADD KEY `idVendedor` (`idVendedor`);

--
-- Indices de la tabla `reportes`
--
ALTER TABLE `reportes`
  ADD PRIMARY KEY (`idReporte`);

--
-- Indices de la tabla `ticket`
--
ALTER TABLE `ticket`
  ADD PRIMARY KEY (`idTicket`),
  ADD KEY `idPedido` (`idPedido`);

--
-- Indices de la tabla `vendedor`
--
ALTER TABLE `vendedor`
  ADD PRIMARY KEY (`idVendedor`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cita`
--
ALTER TABLE `cita`
  MODIFY `idCita` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `idCliente` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `entrega`
--
ALTER TABLE `entrega`
  MODIFY `idEntrega` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `factura`
--
ALTER TABLE `factura`
  MODIFY `idFactura` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pagos`
--
ALTER TABLE `pagos`
  MODIFY `idPago` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pedido`
--
ALTER TABLE `pedido`
  MODIFY `idPedido` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pedidoproducto`
--
ALTER TABLE `pedidoproducto`
  MODIFY `idPedido` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `idProducto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `reportes`
--
ALTER TABLE `reportes`
  MODIFY `idReporte` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=993;

--
-- AUTO_INCREMENT de la tabla `ticket`
--
ALTER TABLE `ticket`
  MODIFY `idTicket` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15799;

--
-- AUTO_INCREMENT de la tabla `vendedor`
--
ALTER TABLE `vendedor`
  MODIFY `idVendedor` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `entrega`
--
ALTER TABLE `entrega`
  ADD CONSTRAINT `entrega_ibfk_1` FOREIGN KEY (`idPedido`) REFERENCES `pedido` (`idPedido`);

--
-- Filtros para la tabla `pagos`
--
ALTER TABLE `pagos`
  ADD CONSTRAINT `pagos_ibfk_1` FOREIGN KEY (`idPedido`) REFERENCES `pedido` (`idPedido`);

--
-- Filtros para la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `pedido_ibfk_1` FOREIGN KEY (`idPedido`) REFERENCES `factura` (`idPedido`);

--
-- Filtros para la tabla `pedidoproducto`
--
ALTER TABLE `pedidoproducto`
  ADD CONSTRAINT `pedidoproducto_ibfk_1` FOREIGN KEY (`idProducto`) REFERENCES `producto` (`idProducto`),
  ADD CONSTRAINT `pedidoproducto_ibfk_2` FOREIGN KEY (`idPedido`) REFERENCES `pedido` (`idPedido`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
