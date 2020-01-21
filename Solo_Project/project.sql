-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema users
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `users` ;

-- -----------------------------------------------------
-- Schema users
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `users` DEFAULT CHARACTER SET utf8 ;
USE `users` ;

-- -----------------------------------------------------
-- Table `users`.`users`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `users`.`users` ;

CREATE TABLE IF NOT EXISTS `users`.`users` (
`id_users` INT NOT NULL AUTO_INCREMENT,
`first_name` VARCHAR(255) NULL,
`last_name` VARCHAR(255) NULL,
`email` VARCHAR(255) NULL,
`password` VARCHAR(255) NULL,
`created_at` DATETIME NULL,
`updated_at` DATETIME NULL,
PRIMARY KEY (`id_users`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `users`.`thoughts`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `users`.`thoughts` ;

CREATE TABLE IF NOT EXISTS `users`.`thoughts` (
`id_thoughts` INT NOT NULL AUTO_INCREMENT,
`content` VARCHAR(255) NULL,
`author` INT NOT NULL,
`created_at` DATETIME NULL,
`updated_at` DATETIME NULL,
PRIMARY KEY (`id_thoughts`),
INDEX `fk_thoughts_users_idx` (`author` ASC) VISIBLE,
CONSTRAINT `fk_thoughts_users`
FOREIGN KEY (`author`)
REFERENCES `users`.`users` (`id_users`)
ON DELETE NO ACTION
ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `users`.`liked_thoughts`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `users`.`liked_thoughts` ;

CREATE TABLE IF NOT EXISTS `users`.`liked_thoughts` (
`thoughts_id_thoughts` INT NOT NULL,
`users_id_users` INT NOT NULL,
PRIMARY KEY (`thoughts_id_thoughts`, `users_id_users`),
INDEX `fk_thoughts_has_users_users1_idx` (`users_id_users` ASC) VISIBLE,
INDEX `fk_thoughts_has_users_thoughts1_idx` (`thoughts_id_thoughts` ASC) VISIBLE,
CONSTRAINT `fk_thoughts_has_users_thoughts1`
FOREIGN KEY (`thoughts_id_thoughts`)
REFERENCES `users`.`thoughts` (`id_thoughts`)
ON DELETE NO ACTION
ON UPDATE NO ACTION,
CONSTRAINT `fk_thoughts_has_users_users1`
FOREIGN KEY (`users_id_users`)
REFERENCES `users`.`users` (`id_users`)
ON DELETE NO ACTION
ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
