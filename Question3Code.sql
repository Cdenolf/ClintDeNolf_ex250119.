-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Question3ERD
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Question3ERD
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Question3ERD` ;
USE `Question3ERD` ;

-- -----------------------------------------------------
-- Table `Question3ERD`.`Syndrome`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Question3ERD`.`Syndrome` (
  `Syndrome_id` INT(11) NOT NULL,
  `Syndrome_name` VARCHAR(45) NOT NULL,
  `Syndrome_description` VARCHAR(45) NULL,
  PRIMARY KEY (`Syndrome_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Question3ERD`.`Patient`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Question3ERD`.`Patient` (
  `Patient_id` INT(11) NOT NULL,
  `Patient_name` VARCHAR(45) NOT NULL,
  `Patient_gender` ENUM("M", "F") NULL,
  `Patient_age` INT(4) NULL,
  `Syndrome_id` INT(11) NOT NULL,
  PRIMARY KEY (`Patient_id`),
  UNIQUE INDEX `Syndrome_id_UNIQUE` (`Syndrome_id` ASC) VISIBLE,
  CONSTRAINT `fk_Patient_1`
    FOREIGN KEY (`Syndrome_id`)
    REFERENCES `Question3ERD`.`Syndrome` (`Syndrome_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Question3ERD`.`Gene`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Question3ERD`.`Gene` (
  `Gene_name` CHAR(40) NOT NULL,
  `Gene_description` VARCHAR(45) NULL,
  PRIMARY KEY (`Gene_name`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Question3ERD`.`Mutation`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Question3ERD`.`Mutation` (
  `idMutation` INT(11) NOT NULL,
  `Start` INT(15) NOT NULL,
  `End` INT(15) NOT NULL,
  `Chromosome` INT(5) NOT NULL,
  `Gene_name` CHAR(40) NOT NULL,
  `Patient_id` INT(11) NOT NULL,
  PRIMARY KEY (`idMutation`),
  UNIQUE INDEX `Gene_name_UNIQUE` (`Gene_name` ASC) VISIBLE,
  UNIQUE INDEX `Patient_id_UNIQUE` (`Patient_id` ASC) VISIBLE,
  CONSTRAINT `fk_Mutation_1`
    FOREIGN KEY (`Patient_id`)
    REFERENCES `Question3ERD`.`Patient` (`Patient_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Mutation_2`
    FOREIGN KEY (`Gene_name`)
    REFERENCES `Question3ERD`.`Gene` (`Gene_name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
