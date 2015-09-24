CREATE TABLE IF NOT EXISTS `pav2`.`Provincias` (
  `idProvincia` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `nroProvincia` INT NOT NULL COMMENT '',
  `nombreProvincia` VARCHAR(45) NOT NULL COMMENT '',
  PRIMARY KEY (`idProvincia`)  COMMENT '',
  UNIQUE INDEX `nroProvincia_UNIQUE` (`nroProvincia` ASC)  COMMENT '')
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `pav2`.`Usuario` (
  `idUsuario` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `nombreUsuario` VARCHAR(45) NOT NULL COMMENT '',
  `contraseña` VARCHAR(45) NOT NULL COMMENT '',
  `rol` VARCHAR(45) NOT NULL COMMENT '',
  PRIMARY KEY (`idUsuario`)  COMMENT '',
  UNIQUE INDEX `nombreUsuario_UNIQUE` (`nombreUsuario` ASC)  COMMENT '')
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `pav2`.`Clientes` (
  `idCliente` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `dni` INT NULL COMMENT '',
  `cuil` INT NULL COMMENT '',
  `nombreCliente` VARCHAR(45) NOT NULL COMMENT '',
  `calle` VARCHAR(45) NOT NULL COMMENT '',
  `numero` INT NOT NULL COMMENT '',
  `idLocalidad` INT NOT NULL COMMENT '',
  `fechaDeRegistro` DATE NOT NULL COMMENT '',
  `esEmpresa` BIT(1) NOT NULL COMMENT '',
  `tipoDNI` VARCHAR(45) NOT NULL COMMENT '',
  `idUsuario` INT NOT NULL COMMENT '',
  `idProvincia` INT NOT NULL COMMENT '',
  PRIMARY KEY (`idCliente`)  COMMENT '',
  UNIQUE INDEX `nroContacto_UNIQUE` (`dni` ASC)  COMMENT '',
  UNIQUE INDEX `cuil_UNIQUE` (`cuil` ASC)  COMMENT '',
  INDEX `fk_Usuario_idx` (`idUsuario` ASC)  COMMENT '',
  INDEX `fk_Provincias_idx` (`idProvincia` ASC)  COMMENT '',
  CONSTRAINT `fk_Usuario`
    FOREIGN KEY (`idUsuario`)
    REFERENCES `pav2`.`Usuario` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_provincias`
    FOREIGN KEY (`idProvincia`)
    REFERENCES `pav2`.`Provincias` (`idProvincia`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `pav2`.`Talles` (
  `idTalle` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `nroTalle` INT NOT NULL COMMENT '',
  `nombreTalle` VARCHAR(2) NOT NULL COMMENT '',
  PRIMARY KEY (`idTalle`)  COMMENT '',
  UNIQUE INDEX `nroTalle_UNIQUE` (`nroTalle` ASC)  COMMENT '')
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `pav2`.`Productos` (
  `idProducto` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `nroProducto` INT NOT NULL COMMENT '',
  `nombreProducto` VARCHAR(45) NOT NULL COMMENT '',
  `idTalle` INT NOT NULL COMMENT '',
  `precioVenta` DOUBLE NOT NULL COMMENT '',
  `precioCompra` DOUBLE NOT NULL COMMENT '',
  `esAccesorio` BIT(1) NOT NULL COMMENT '',
  `marca` VARCHAR(45) NOT NULL COMMENT '',
  `stock` INT NOT NULL COMMENT '',
  PRIMARY KEY (`idProducto`)  COMMENT '',
  UNIQUE INDEX `nroProducto_UNIQUE` (`nroProducto` ASC)  COMMENT '',
  INDEX `fk_Talle_idx` (`idTalle` ASC)  COMMENT '',
  CONSTRAINT `fk_Productos_Talles1`
    FOREIGN KEY (`idTalle`)
    REFERENCES `pav2`.`Talles` (`idTalle`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `pav2`.`Proveedores` (
  `idProveedor` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `cuil` INT NOT NULL COMMENT '',
  `razonSocial` VARCHAR(45) NOT NULL COMMENT '',
  `calle` VARCHAR(45) NOT NULL COMMENT '',
  `numero` INT NOT NULL COMMENT '',
  `idLocalidad` INT NOT NULL COMMENT '',
  `fechaDeRegistro` DATE NOT NULL COMMENT '',
  `esDelExterior` BIT(1) NOT NULL COMMENT '',
  `idProvincia` INT NOT NULL COMMENT '',
  PRIMARY KEY (`idProveedor`)  COMMENT '',
  UNIQUE INDEX `nroProveedor_UNIQUE` (`cuil` ASC)  COMMENT '',
  INDEX `fk_Provincias_idx` (`idProvincia` ASC)  COMMENT '',
  CONSTRAINT `fk_Proveedores_Provincias1`
    FOREIGN KEY (`idProvincia`)
    REFERENCES `pav2`.`Provincias` (`idProvincia`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



CREATE TABLE IF NOT EXISTS `pav2`.`Facturas` (
  `idFactura` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `nroFactura` INT NOT NULL COMMENT '',
  `tipoFactura` VARCHAR(1) NOT NULL COMMENT '',
  `idCliente` INT NOT NULL COMMENT '',
  `fecha` DATE NOT NULL COMMENT '',
  `estado` VARCHAR(45) NOT NULL COMMENT '',
  PRIMARY KEY (`idFactura`)  COMMENT '',
  UNIQUE INDEX `nroFactural_UNIQUE` (`nroFactura` ASC)  COMMENT '',
  UNIQUE INDEX `tipoFactura_UNIQUE` (`tipoFactura` ASC)  COMMENT '',
  INDEX `fk_Clientes_idx` (`idCliente` ASC)  COMMENT '',
  CONSTRAINT `fk_Clientes`
    FOREIGN KEY (`idCliente`)
    REFERENCES `pav2`.`Clientes` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `pav2`.`DetallesFactura` (
  `idDetalleFactura` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `idFactura` INT NOT NULL COMMENT '',
  `idProducto` INT NOT NULL COMMENT '',
  `cantidad` INT NOT NULL COMMENT '',
  `precioIndividual` DOUBLE NOT NULL COMMENT '',
  PRIMARY KEY (`idDetalleFactura`)  COMMENT '',
  INDEX `fk_Factura_idx` (`idFactura` ASC)  COMMENT '',
  INDEX `fk_Producto_idx` (`idProducto` ASC)  COMMENT '',
  CONSTRAINT `fk_DetallesFactura_Facturas1`
    FOREIGN KEY (`idFactura`)
    REFERENCES `pav2`.`Facturas` (`idFactura`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_DetallesFactura_Productos1`
    FOREIGN KEY (`idProducto`)
    REFERENCES `pav2`.`Productos` (`idProducto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



CREATE TABLE IF NOT EXISTS `pav2`.`Compras` (
  `idCompra` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `nroCompra` INT NOT NULL COMMENT '',
  `monto` VARCHAR(45) NOT NULL COMMENT '',
  `fecha` DATE NOT NULL COMMENT '',
  `estado` BIT(1) NOT NULL COMMENT '',
  `idProveedor` INT NOT NULL COMMENT '',
  PRIMARY KEY (`idCompra`)  COMMENT '',
  UNIQUE INDEX `nroCompra_UNIQUE` (`nroCompra` ASC)  COMMENT '',
  INDEX `fk_Proveedor_idx` (`idProveedor` ASC)  COMMENT '',
  CONSTRAINT `fk_Compras_Proveedores1`
    FOREIGN KEY (`idProveedor`)
    REFERENCES `pav2`.`Proveedores` (`idProveedor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `pav2`.`DetallesCompra` (
  `idDetalleCompra` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `idCompra` INT NOT NULL COMMENT '',
  `idProducto` INT NOT NULL COMMENT '',
  `Cantidad` INT NOT NULL COMMENT '',
  `precio` DOUBLE NOT NULL COMMENT '',
  PRIMARY KEY (`idDetalleCompra`)  COMMENT '',
  INDEX `fk_Compra_idx` (`idCompra` ASC)  COMMENT '',
  INDEX `fk_Producto_idx` (`idProducto` ASC)  COMMENT '',
  CONSTRAINT `fk_DetallesCompra_Compras1`
    FOREIGN KEY (`idCompra`)
    REFERENCES `pav2`.`Compras` (`idCompra`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_DetallesCompra_Productos1`
    FOREIGN KEY (`idProducto`)
    REFERENCES `pav2`.`Productos` (`idProducto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



CREATE TABLE IF NOT EXISTS `pav2`.`Envios` (
  `idEnvio` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `nroEnvio` INT NOT NULL COMMENT '',
  `fecha` DATE NOT NULL COMMENT '',
  `idProvincia` INT NOT NULL COMMENT '',
  `montoTotalEnvio` DOUBLE NOT NULL COMMENT '',
  PRIMARY KEY (`idEnvio`)  COMMENT '',
  UNIQUE INDEX `nroEnvio_UNIQUE` (`nroEnvio` ASC)  COMMENT '',
  INDEX `fk_Provincia_idx` (`idProvincia` ASC)  COMMENT '',
  CONSTRAINT `fk_Envios_Provincias1`
    FOREIGN KEY (`idProvincia`)
    REFERENCES `pav2`.`Provincias` (`idProvincia`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `pav2`.`detallesEnvio` (
  `idDetalleEnvio` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `idEnvio` INT NOT NULL COMMENT '',
  `idCompra` INT NOT NULL COMMENT '',
  `precioEnvio` DOUBLE NOT NULL COMMENT '',
  PRIMARY KEY (`idDetalleEnvio`)  COMMENT '',
  INDEX `fk_Envio_idx` (`idEnvio` ASC)  COMMENT '',
  INDEX `fk_Compra_idx` (`idCompra` ASC)  COMMENT '',
  CONSTRAINT `fk_detallesEnvio_Envios1`
    FOREIGN KEY (`idEnvio`)
    REFERENCES `pav2`.`Envios` (`idEnvio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_detallesEnvio_Compras1`
    FOREIGN KEY (`idCompra`)
    REFERENCES `pav2`.`Compras` (`idCompra`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
