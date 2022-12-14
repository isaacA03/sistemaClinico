-- MySQL Script generated by MySQL Workbench
-- Sat Sep 24 18:02:40 2022
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Especialidades`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Especialidades` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`usuarios` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `rol` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`medicos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`medicos` (
  `identificacion` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `apellidos` VARCHAR(45) NOT NULL,
  `fecha_registro` DATE NOT NULL,
  `id_especialidad` INT NOT NULL,
  `id_usuario` INT NOT NULL,
  PRIMARY KEY (`identificacion`),
  INDEX `fk_medicos_especialidades_idx` (`id_especialidad` ASC) VISIBLE,
  INDEX `fk_medicos_usuario_idx` (`id_usuario` ASC) VISIBLE,
  CONSTRAINT `fk_medico_especialidades`
    FOREIGN KEY (`id_especialidad`)
    REFERENCES `mydb`.`Especialidades` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_medico_usuario`
    FOREIGN KEY (`id_usuario`)
    REFERENCES `mydb`.`usuarios` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`pacientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`pacientes` (
  `dni` INT NOT NULL AUTO_INCREMENT,
  `nombres` VARCHAR(45) NOT NULL,
  `apellidos` VARCHAR(45) NOT NULL,
  `edad` INT NOT NULL,
  `sexo` VARCHAR(45) NOT NULL,
  `ocupacion` VARCHAR(45) NOT NULL,
  `fecha_nacimiento` DATE NOT NULL,
  `estado_civil` VARCHAR(45) NOT NULL,
  `nacionalidad` VARCHAR(45) NOT NULL,
  `grado_instruccion` VARCHAR(45) NOT NULL,
  `id_usuario` INT NOT NULL,
  PRIMARY KEY (`dni`),
  INDEX `fk_paciente_usuario_idx` (`id_usuario` ASC) VISIBLE,
  CONSTRAINT `fk_paciente_usuario`
    FOREIGN KEY (`id_usuario`)
    REFERENCES `mydb`.`usuarios` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`citas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`citas` (
  `codigo` INT NOT NULL AUTO_INCREMENT,
  `fecha` DATE NOT NULL,
  `hora` TIME NOT NULL,
  `estado` VARCHAR(45) NOT NULL,
  `id_paciente` INT NOT NULL,
  `id_medico` INT NOT NULL,
  PRIMARY KEY (`codigo`),
  INDEX `fk_citas_paciente_idx` (`id_paciente` ASC) VISIBLE,
  INDEX `fk_citas_,medico_idx` (`id_medico` ASC) VISIBLE,
  CONSTRAINT `fk_citas_paciente`
    FOREIGN KEY (`id_paciente`)
    REFERENCES `mydb`.`pacientes` (`dni`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_citas_,medico`
    FOREIGN KEY (`id_medico`)
    REFERENCES `mydb`.`medicos` (`identificacion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`historias_clinicas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`historias_clinicas` (
  `numero_histori` INT NOT NULL AUTO_INCREMENT,
  `fecha_ingreso` DATE NOT NULL,
  `motivo_hospitalizacion` VARCHAR(255) NOT NULL,
  `malestar_actual` TEXT NOT NULL,
  `enfermedad_actual` TEXT NOT NULL,
  `antecedentes_familiares` TEXT NOT NULL,
  `antecedentes_personales` TEXT NOT NULL,
  `habitos_fisiologicos` TEXT NOT NULL,
  `id_paciente` INT NOT NULL,
  PRIMARY KEY (`numero_histori`),
  INDEX `fk_paciente_historia_idx` (`id_paciente` ASC) VISIBLE,
  CONSTRAINT `fk_paciente_historia`
    FOREIGN KEY (`id_paciente`)
    REFERENCES `mydb`.`pacientes` (`dni`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`horarios_atencion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`horarios_atencion` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `fecha` DATE NOT NULL,
  `horaInicio` TIME NOT NULL,
  `horaFin` TIME NOT NULL,
  `horarios_atencioncol` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`horarios_medicos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`horarios_medicos` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_medico` INT NOT NULL,
  `id_horario` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_horario_medico_idx` (`id_medico` ASC) VISIBLE,
  INDEX `fk_horario_atencion_idx` (`id_horario` ASC) VISIBLE,
  CONSTRAINT `fk_horario_medico`
    FOREIGN KEY (`id_medico`)
    REFERENCES `mydb`.`medicos` (`identificacion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_horario_atencion`
    FOREIGN KEY (`id_horario`)
    REFERENCES `mydb`.`horarios_atencion` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
