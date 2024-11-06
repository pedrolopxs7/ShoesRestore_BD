create database ShoesRestore;

use ShoesRestore;

-- -----------------------------------------------------
-- Tabela `Sapateiro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Sapateiro` (
  `idSapateiro` INT NOT NULL,
  `Nome` VARCHAR(90) NOT NULL,
  `Email` VARCHAR(90) NOT NULL,
  `CPF` INT NOT NULL,
  `Telefone` INT NOT NULL,
  `Estado` VARCHAR(45) NOT NULL,
  `Cidade` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idSapateiro`)
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Tabela `Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Cliente` (
  `idCliente` INT NOT NULL AUTO_INCREMENT,
  `Nome` VARCHAR(90) NOT NULL,
  `Email` VARCHAR(90) NOT NULL,
  `CPF` INT NOT NULL,
  `Telefone` INT NOT NULL,
  `Estado` VARCHAR(45) NOT NULL,
  `Cidade` VARCHAR(45) NOT NULL,
  `Sapateiro_idSapateiro` INT NOT NULL,
  PRIMARY KEY (`idCliente`),
  INDEX `fk_Cliente_Sapateiro1_idx` (`Sapateiro_idSapateiro` ASC),
  CONSTRAINT `fk_Cliente_Sapateiro1`
    FOREIGN KEY (`Sapateiro_idSapateiro`)
    REFERENCES `Sapateiro` (`idSapateiro`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Tabela `Reparo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Reparo` (
  `idReparo` INT NOT NULL,  
  `Valor` INT NOT NULL,
  `DataSolicitação` DATE NOT NULL,
  `DataEntrega` DATE NOT NULL,
  PRIMARY KEY (`idReparo`)
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Tabela `Sapatos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Sapatos` (
  `idSapatos` INT NOT NULL,
  `Modelo` VARCHAR(90) NOT NULL,
  `Tamanho` INT NOT NULL,
  `Cor` VARCHAR(45) NOT NULL,
  `DescriçãoAdicional` VARCHAR(100) NOT NULL,
  `Cliente_idCliente` INT NOT NULL,
  `Reparo_idReparo` INT NOT NULL,
  `Sapateiro_idSapateiro` INT NOT NULL,
  PRIMARY KEY (`idSapatos`, `Cliente_idCliente`),
  INDEX `fk_Sapatos_Cliente_idx` (`Cliente_idCliente` ASC),
  INDEX `fk_Sapatos_Reparo1_idx` (`Reparo_idReparo` ASC),
  INDEX `fk_Sapatos_Sapateiro1_idx` (`Sapateiro_idSapateiro` ASC),
  CONSTRAINT `fk_Sapatos_Cliente`
    FOREIGN KEY (`Cliente_idCliente`)
    REFERENCES `Cliente` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Sapatos_Reparo1`
    FOREIGN KEY (`Reparo_idReparo`)
    REFERENCES `Reparo` (`idReparo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Sapatos_Sapateiro1`
    FOREIGN KEY (`Sapateiro_idSapateiro`)
    REFERENCES `Sapateiro` (`idSapateiro`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE = InnoDB;