-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Project
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Project
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Project` DEFAULT CHARACTER SET utf8 ;
USE `Project` ;

-- -----------------------------------------------------
-- Table `Project`.`Artist`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Project`.`Artist` ;

CREATE TABLE IF NOT EXISTS `Project`.`Artist` (
  `name` VARCHAR(45) NOT NULL,
  `country of origin` VARCHAR(45) NULL,
  `sex` VARCHAR(15) NULL,
  `birthdata` DATE NULL,
  `age` INT NULL,
  `style` VARCHAR(45) NULL,
  `century` VARCHAR(45) NULL,
  PRIMARY KEY (`name`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Project`.`Employee`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Project`.`Employee` ;

CREATE TABLE IF NOT EXISTS `Project`.`Employee` (
  `ssn` INT NOT NULL,
  `fname` VARCHAR(45) NULL,
  `Lname` VARCHAR(45) NULL,
  `sex` VARCHAR(15) NULL,
  `Bdate` DATE NULL,
  `address` VARCHAR(45) NULL,
  `phone_no` VARCHAR(45) NULL,
  `salary` FLOAT NULL,
  PRIMARY KEY (`ssn`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Project`.`Tour_guide`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Project`.`Tour_guide` ;

CREATE TABLE IF NOT EXISTS `Project`.`Tour_guide` (
  `idTour_guide` INT NOT NULL,
  `Employee_ssn` INT NOT NULL,
  PRIMARY KEY (`idTour_guide`),
  CONSTRAINT `fk_Tour_guide_Employee1`
    FOREIGN KEY (`Employee_ssn`)
    REFERENCES `Project`.`Employee` (`ssn`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Project`.`Visitor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Project`.`Visitor` ;

CREATE TABLE IF NOT EXISTS `Project`.`Visitor` (
  `ssn` INT NOT NULL,
  `fname` VARCHAR(45) NULL,
  `Lname` VARCHAR(45) NULL,
  `idguide` INT NOT NULL,
  PRIMARY KEY (`ssn`),
  CONSTRAINT `fk_Visitor_Tour_guide1`
    FOREIGN KEY (`idguide`)
    REFERENCES `Project`.`Tour_guide` (`idTour_guide`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Project`.`seller`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Project`.`seller` ;

CREATE TABLE IF NOT EXISTS `Project`.`seller` (
  `idseller` INT NOT NULL,
  `Employee_ssn` INT NOT NULL,
  PRIMARY KEY (`idseller`, `Employee_ssn`),
  CONSTRAINT `fk_seller_Employee1`
    FOREIGN KEY (`Employee_ssn`)
    REFERENCES `Project`.`Employee` (`ssn`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Project`.`Art_object`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Project`.`Art_object` ;

CREATE TABLE IF NOT EXISTS `Project`.`Art_object` (
  `id` INT NOT NULL,
  `price` FLOAT NULL,
  `Artist_name` VARCHAR(46) NOT NULL,
  `Visitor_ssn` INT NULL,
  `idseller` INT NULL,
  PRIMARY KEY (`id`, `Artist_name`),
  CONSTRAINT `fk_Art_object_Artist1`
    FOREIGN KEY (`Artist_name`)
    REFERENCES `Project`.`Artist` (`name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Art_object_Visitor1`
    FOREIGN KEY (`Visitor_ssn`)
    REFERENCES `Project`.`Visitor` (`ssn`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Art_object_seller1`
    FOREIGN KEY (`idseller`)
    REFERENCES `Project`.`seller` (`idseller`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Project`.`Statue`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Project`.`Statue` ;

CREATE TABLE IF NOT EXISTS `Project`.`Statue` (
  `Art_object_id` INT NOT NULL,
  `height` FLOAT NULL,
  `weight` FLOAT NULL,
  `Name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Art_object_id`, `Name`),
  CONSTRAINT `fk_Statue_Art_object`
    FOREIGN KEY (`Art_object_id`)
    REFERENCES `Project`.`Art_object` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Project`.`Sculpture`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Project`.`Sculpture` ;

CREATE TABLE IF NOT EXISTS `Project`.`Sculpture` (
  `Art_object_id` INT NOT NULL,
  `height` FLOAT NULL,
  `weight` FLOAT NULL,
  `Name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Art_object_id`, `Name`),
  CONSTRAINT `fk_Sculpture_Art_object1`
    FOREIGN KEY (`Art_object_id`)
    REFERENCES `Project`.`Art_object` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Project`.`Painting`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Project`.`Painting` ;

CREATE TABLE IF NOT EXISTS `Project`.`Painting` (
  `Art_object_id` INT NOT NULL,
  `Name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Art_object_id`, `Name`),
  CONSTRAINT `fk_Painting_Art_object1`
    FOREIGN KEY (`Art_object_id`)
    REFERENCES `Project`.`Art_object` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Project`.`Manager`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Project`.`Manager` ;

CREATE TABLE IF NOT EXISTS `Project`.`Manager` (
  `idManager` INT NOT NULL,
  `Employee_ssn` INT NOT NULL,
  PRIMARY KEY (`idManager`, `Employee_ssn`),
  CONSTRAINT `fk_Manager_Employee1`
    FOREIGN KEY (`Employee_ssn`)
    REFERENCES `Project`.`Employee` (`ssn`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Project`.`Security`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Project`.`Security` ;

CREATE TABLE IF NOT EXISTS `Project`.`Security` (
  `idSecurity` INT NOT NULL,
  `Employee_ssn` INT NOT NULL,
  PRIMARY KEY (`idSecurity`, `Employee_ssn`),
  CONSTRAINT `fk_Security_Employee1`
    FOREIGN KEY (`Employee_ssn`)
    REFERENCES `Project`.`Employee` (`ssn`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Project`.`Museum`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Project`.`Museum` ;

CREATE TABLE IF NOT EXISTS `Project`.`Museum` (
  `name` VARCHAR(45) NOT NULL,
  `country` VARCHAR(45) NULL,
  PRIMARY KEY (`name`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Project`.`Borrowe_from`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Project`.`Borrowe_from` ;

CREATE TABLE IF NOT EXISTS `Project`.`Borrowe_from` (
  `Museum_name` VARCHAR(45) NULL,
  `Art_object_id` INT NULL,
  `borrowDate` DATE NULL,
  `returnDate` DATE NULL,
  PRIMARY KEY (`Museum_name`, `Art_object_id`),
  CONSTRAINT `fk_Museum_has_Art_object_Museum1`
    FOREIGN KEY (`Museum_name`)
    REFERENCES `Project`.`Museum` (`name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Museum_has_Art_object_Art_object1`
    FOREIGN KEY (`Art_object_id`)
    REFERENCES `Project`.`Art_object` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Data for table `Project`.`Artist`
-- -----------------------------------------------------
START TRANSACTION;
USE `Project`;
INSERT INTO `Project`.`Artist` (`name`, `country of origin`, `sex`, `birthdata`, `age`, `style`, `century`) VALUES ('Vincent van Gogh', 'Zundert,Nether ands', 'M', '1853-03-30', 37, 'expression', '20th');
INSERT INTO `Project`.`Artist` (`name`, `country of origin`, `sex`, `birthdata`, `age`, `style`, `century`) VALUES ('Salvador Dali', 'Figueres,Italy', 'M', '1904-05-11', 85, 'surrealism', '19th');
INSERT INTO `Project`.`Artist` (`name`, `country of origin`, `sex`, `birthdata`, `age`, `style`, `century`) VALUES ('Pablo Picasso', 'Malaga,Spainish', 'M', '1881-10-25', 91, 'Cubism', '19th');
INSERT INTO `Project`.`Artist` (`name`, `country of origin`, `sex`, `birthdata`, `age`, `style`, `century`) VALUES ('Leonardo DaVinci', 'Anchiano,Italy', 'M', '1452-04-15', 67, 'renaissance', '15th ');
INSERT INTO `Project`.`Artist` (`name`, `country of origin`, `sex`, `birthdata`, `age`, `style`, `century`) VALUES ('Jean-Michael Basquiat', 'New York,USA', 'M', '1960-12-22', 28, 'contemporary', '20th');
INSERT INTO `Project`.`Artist` (`name`, `country of origin`, `sex`, `birthdata`, `age`, `style`, `century`) VALUES ('Frida Kahlo', 'Mexico City,Mexico', 'F', '1907-07-06', 47, 'naive art', '20th');
INSERT INTO `Project`.`Artist` (`name`, `country of origin`, `sex`, `birthdata`, `age`, `style`, `century`) VALUES ('Edgar Degas', 'Paris,France', 'M', '1834-07-19', 83, 'impressionism', '19th');
INSERT INTO `Project`.`Artist` (`name`, `country of origin`, `sex`, `birthdata`, `age`, `style`, `century`) VALUES ('Donatello', 'florence,italy', 'M', '1386-02-20', 80, 'renaissance', '15th');
INSERT INTO `Project`.`Artist` (`name`, `country of origin`, `sex`, `birthdata`, `age`, `style`, `century`) VALUES ('Henry Moore', 'Yorkshire,England ', 'M', '1898-07-30', 88, 'ranaissance', '20th');
INSERT INTO `Project`.`Artist` (`name`, `country of origin`, `sex`, `birthdata`, `age`, `style`, `century`) VALUES ('Praxiteles', 'Athens,Greek', 'M', '1698-02-02', 90, 'expression', '15th');
INSERT INTO `Project`.`Artist` (`name`, `country of origin`, `sex`, `birthdata`, `age`, `style`, `century`) VALUES ('Auguste Rodin', 'Paris,France', 'M', '1840-02-12', 77, 'expression', '19th');
INSERT INTO `Project`.`Artist` (`name`, `country of origin`, `sex`, `birthdata`, `age`, `style`, `century`) VALUES ('Alberto Giacometti', 'Borgonovo,Switzerland', 'M', '1966-11-01', 64, 'surrealism', '20th');

COMMIT;


-- -----------------------------------------------------
-- Data for table `Project`.`Employee`
-- -----------------------------------------------------
START TRANSACTION;
USE `Project`;
INSERT INTO `Project`.`Employee` (`ssn`, `fname`, `Lname`, `sex`, `Bdate`, `address`, `phone_no`, `salary`) VALUES (123456789, 'john', 'smith', 'm', '1965-01-09', '731 fondren,houston,tx', '374844398', 30500);
INSERT INTO `Project`.`Employee` (`ssn`, `fname`, `Lname`, `sex`, `Bdate`, `address`, `phone_no`, `salary`) VALUES (108455468, 'franklin', 'wong', 'm', '1955-12-08', '638 voss,houston,tx', '583484439', 40020);
INSERT INTO `Project`.`Employee` (`ssn`, `fname`, `Lname`, `sex`, `Bdate`, `address`, `phone_no`, `salary`) VALUES (325643783, 'alicia', 'zelaya', 'f', '1968-01-19', '321 castle,spring,tx', '474929575', 20340);
INSERT INTO `Project`.`Employee` (`ssn`, `fname`, `Lname`, `sex`, `Bdate`, `address`, `phone_no`, `salary`) VALUES (987654321, 'jennifer', 'wallace', 'f', '1941-06-20', '291 berry,bellaire,tx', '584849865', 55000);
INSERT INTO `Project`.`Employee` (`ssn`, `fname`, `Lname`, `sex`, `Bdate`, `address`, `phone_no`, `salary`) VALUES (321982938, 'ramesh', 'narayan', 'm', '1962-09-15', '975 fire,humble,tx', '869439034', 15000);
INSERT INTO `Project`.`Employee` (`ssn`, `fname`, `Lname`, `sex`, `Bdate`, `address`, `phone_no`, `salary`) VALUES (453453453, 'joyce', 'borg', 'f', '1972-07-31', '587 rice,houston,tx', '587554734', 45050);
INSERT INTO `Project`.`Employee` (`ssn`, `fname`, `Lname`, `sex`, `Bdate`, `address`, `phone_no`, `salary`) VALUES (983249323, 'james', 'jabbar', 'm', '1937-11-10', '904 stone,houston,tx', '394855845', 35500);
INSERT INTO `Project`.`Employee` (`ssn`, `fname`, `Lname`, `sex`, `Bdate`, `address`, `phone_no`, `salary`) VALUES (463548901, 'mark', 'daves', 'm', '1991-12-20', '687 voss,spring,tx', '655698760', 11000);
INSERT INTO `Project`.`Employee` (`ssn`, `fname`, `Lname`, `sex`, `Bdate`, `address`, `phone_no`, `salary`) VALUES (545786865, 'jena', 'taite', 'f', '2000-03-19', '545 fondern,humble,tx', '545348899', 20000);
INSERT INTO `Project`.`Employee` (`ssn`, `fname`, `Lname`, `sex`, `Bdate`, `address`, `phone_no`, `salary`) VALUES (357689980, 'jeef', 'beber', 'm', '1990-12-22', '847 fire,bellaire', '483753494', 38437);
INSERT INTO `Project`.`Employee` (`ssn`, `fname`, `Lname`, `sex`, `Bdate`, `address`, `phone_no`, `salary`) VALUES (943874372, 'lena', 'keef', 'f', '2001-01-02', '384 castle,', NULL, NULL);
INSERT INTO `Project`.`Employee` (`ssn`, `fname`, `Lname`, `sex`, `Bdate`, `address`, `phone_no`, `salary`) VALUES (493893283, 'eshan', 'jack', 'm', '1995-11-20', '123 rats,bandle,tx', '654983298', 35500);
INSERT INTO `Project`.`Employee` (`ssn`, `fname`, `Lname`, `sex`, `Bdate`, `address`, `phone_no`, `salary`) VALUES (654789356, 'lauciana', 'rondi', 'f', '1997-12-6', '567 dan,varble,tx', '732109876', 15000);
INSERT INTO `Project`.`Employee` (`ssn`, `fname`, `Lname`, `sex`, `Bdate`, `address`, `phone_no`, `salary`) VALUES (829373256, 'gonam', 'jossef', 'm', '1994-1-1', '139 ladi,qruat,tx', '546987231', 30000);
INSERT INTO `Project`.`Employee` (`ssn`, `fname`, `Lname`, `sex`, `Bdate`, `address`, `phone_no`, `salary`) VALUES (584873482, 'feer', 'ponem', 'm', '1994-07-09', '675 londy,trace,tx', '897543187', 70000);
INSERT INTO `Project`.`Employee` (`ssn`, `fname`, `Lname`, `sex`, `Bdate`, `address`, `phone_no`, `salary`) VALUES (329489392, 'keef', 'terag', 'm', '1992-07-12', '237, hese,klash,tx', NULL, NULL);
INSERT INTO `Project`.`Employee` (`ssn`, `fname`, `Lname`, `sex`, `Bdate`, `address`, `phone_no`, `salary`) VALUES (219389894, 'sophie', 'gadree', 'f', '1988-04-06', '126,udon,rabic,tx', '542096433', 8300);
INSERT INTO `Project`.`Employee` (`ssn`, `fname`, `Lname`, `sex`, `Bdate`, `address`, `phone_no`, `salary`) VALUES (873249328, 'fares', 'daro', 'm', '1979-06-08', '13,weely,emrat,tx', '065123098', 3700);
INSERT INTO `Project`.`Employee` (`ssn`, `fname`, `Lname`, `sex`, `Bdate`, `address`, `phone_no`, `salary`) VALUES (786331983, 'jad', 'feern', 'm', '1986-11-05', '126,undy,hard,tx', '562390763', 54000);
INSERT INTO `Project`.`Employee` (`ssn`, `fname`, `Lname`, `sex`, `Bdate`, `address`, `phone_no`, `salary`) VALUES (654345645, 'lensy', 'hadi', 'f', '1991-07-04', '412,clon,feek,tx', '867534268', 9000);

COMMIT;


-- -----------------------------------------------------
-- Data for table `Project`.`Tour_guide`
-- -----------------------------------------------------
START TRANSACTION;
USE `Project`;
INSERT INTO `Project`.`Tour_guide` (`idTour_guide`, `Employee_ssn`) VALUES (4902, 123456789);
INSERT INTO `Project`.`Tour_guide` (`idTour_guide`, `Employee_ssn`) VALUES (4435, 463548901);
INSERT INTO `Project`.`Tour_guide` (`idTour_guide`, `Employee_ssn`) VALUES (3623, 943874372);

COMMIT;


-- -----------------------------------------------------
-- Data for table `Project`.`Visitor`
-- -----------------------------------------------------
START TRANSACTION;
USE `Project`;
INSERT INTO `Project`.`Visitor` (`ssn`, `fname`, `Lname`, `idguide`) VALUES (394748348, 'emma', 'watson', 4902);
INSERT INTO `Project`.`Visitor` (`ssn`, `fname`, `Lname`, `idguide`) VALUES (567564312, 'nell', 'cambel', 4902);
INSERT INTO `Project`.`Visitor` (`ssn`, `fname`, `Lname`, `idguide`) VALUES (329475302, 'emy', 'leni', 4902);
INSERT INTO `Project`.`Visitor` (`ssn`, `fname`, `Lname`, `idguide`) VALUES (389547853, 'sara', 'tate', 4435);
INSERT INTO `Project`.`Visitor` (`ssn`, `fname`, `Lname`, `idguide`) VALUES (928304800, 'joan', 'gerver', 4435);
INSERT INTO `Project`.`Visitor` (`ssn`, `fname`, `Lname`, `idguide`) VALUES (492843780, 'wit', 'spano', 4435);
INSERT INTO `Project`.`Visitor` (`ssn`, `fname`, `Lname`, `idguide`) VALUES (932840028, 'asco', 'ewart', 3623);
INSERT INTO `Project`.`Visitor` (`ssn`, `fname`, `Lname`, `idguide`) VALUES (937439340, 'chan', 'peck', 4902);
INSERT INTO `Project`.`Visitor` (`ssn`, `fname`, `Lname`, `idguide`) VALUES (900076543, 'lora', 'ieni', 3623);
INSERT INTO `Project`.`Visitor` (`ssn`, `fname`, `Lname`, `idguide`) VALUES (867656632, 'Farida', 'Khaled', 3623);
INSERT INTO `Project`.`Visitor` (`ssn`, `fname`, `Lname`, `idguide`) VALUES (345678768, 'Alicia', 'Zelaya', 4902);
INSERT INTO `Project`.`Visitor` (`ssn`, `fname`, `Lname`, `idguide`) VALUES (543899722, 'James', 'Borg', 4902);

COMMIT;


-- -----------------------------------------------------
-- Data for table `Project`.`seller`
-- -----------------------------------------------------
START TRANSACTION;
USE `Project`;
INSERT INTO `Project`.`seller` (`idseller`, `Employee_ssn`) VALUES (4848, 325643783);
INSERT INTO `Project`.`seller` (`idseller`, `Employee_ssn`) VALUES (7866, 357689980);
INSERT INTO `Project`.`seller` (`idseller`, `Employee_ssn`) VALUES (8761, 545786865);
INSERT INTO `Project`.`seller` (`idseller`, `Employee_ssn`) VALUES (1329, 321982938);
INSERT INTO `Project`.`seller` (`idseller`, `Employee_ssn`) VALUES (2381, 493893283);
INSERT INTO `Project`.`seller` (`idseller`, `Employee_ssn`) VALUES (3244, 584873482);
INSERT INTO `Project`.`seller` (`idseller`, `Employee_ssn`) VALUES (5456, 983249323);
INSERT INTO `Project`.`seller` (`idseller`, `Employee_ssn`) VALUES (6543, 329489392);
INSERT INTO `Project`.`seller` (`idseller`, `Employee_ssn`) VALUES (3434, 219389894);
INSERT INTO `Project`.`seller` (`idseller`, `Employee_ssn`) VALUES (4534, 873249328);
INSERT INTO `Project`.`seller` (`idseller`, `Employee_ssn`) VALUES (8723, 786331983);
INSERT INTO `Project`.`seller` (`idseller`, `Employee_ssn`) VALUES (4654, 943874372);

COMMIT;


-- -----------------------------------------------------
-- Data for table `Project`.`Art_object`
-- -----------------------------------------------------
START TRANSACTION;
USE `Project`;
INSERT INTO `Project`.`Art_object` (`id`, `price`, `Artist_name`, `Visitor_ssn`, `idseller`) VALUES (3246, 45670, 'Vincent van Gogh', 394748348, 4848);
INSERT INTO `Project`.`Art_object` (`id`, `price`, `Artist_name`, `Visitor_ssn`, `idseller`) VALUES (7832, 56478, 'Salvador Dali', 567564312, 7866);
INSERT INTO `Project`.`Art_object` (`id`, `price`, `Artist_name`, `Visitor_ssn`, `idseller`) VALUES (9872, 30000, 'Pablo Picasso', 329475302, 4654);
INSERT INTO `Project`.`Art_object` (`id`, `price`, `Artist_name`, `Visitor_ssn`, `idseller`) VALUES (3456, 68890, 'Leonardo DaVinci', 389547853, 8761);
INSERT INTO `Project`.`Art_object` (`id`, `price`, `Artist_name`, `Visitor_ssn`, `idseller`) VALUES (9874, 90787, 'Jean-Michael Basquiat', 928304800, 1329);
INSERT INTO `Project`.`Art_object` (`id`, `price`, `Artist_name`, `Visitor_ssn`, `idseller`) VALUES (3435, 12354, 'Frida Kahlo', 492843780, 2381);
INSERT INTO `Project`.`Art_object` (`id`, `price`, `Artist_name`, `Visitor_ssn`, `idseller`) VALUES (8763, 98644, 'Edgar Degas', 932840028, 3244);
INSERT INTO `Project`.`Art_object` (`id`, `price`, `Artist_name`, `Visitor_ssn`, `idseller`) VALUES (5748, 48600, 'Donatello', 937439340, 5456);
INSERT INTO `Project`.`Art_object` (`id`, `price`, `Artist_name`, `Visitor_ssn`, `idseller`) VALUES (4563, 95302, 'Henry Moore', 900076543, 6543);
INSERT INTO `Project`.`Art_object` (`id`, `price`, `Artist_name`, `Visitor_ssn`, `idseller`) VALUES (5675, 18283, 'Praxiteles', 867656632, 3434);
INSERT INTO `Project`.`Art_object` (`id`, `price`, `Artist_name`, `Visitor_ssn`, `idseller`) VALUES (3454, 48484, 'Auguste Rodin', 345678768, 4534);
INSERT INTO `Project`.`Art_object` (`id`, `price`, `Artist_name`, `Visitor_ssn`, `idseller`) VALUES (4423, 28470, 'Alberto Giacometti', 543899722, 8723);
INSERT INTO `Project`.`Art_object` (`id`, `price`, `Artist_name`, `Visitor_ssn`, `idseller`) VALUES (5643, 56436, 'khertic dallon', 928304800, 3434);
INSERT INTO `Project`.`Art_object` (`id`, `price`, `Artist_name`, `Visitor_ssn`, `idseller`) VALUES (9854, 67575, 'laronc de mopa', 937439340, 3434);
INSERT INTO `Project`.`Art_object` (`id`, `price`, `Artist_name`, `Visitor_ssn`, `idseller`) VALUES (6523, 876439, 'kadlic vared', 543899722, 4654);
INSERT INTO `Project`.`Art_object` (`id`, `price`, `Artist_name`, `Visitor_ssn`, `idseller`) VALUES (5432, 66432, 'larot var', 345678768, 1329);
INSERT INTO `Project`.`Art_object` (`id`, `price`, `Artist_name`, `Visitor_ssn`, `idseller`) VALUES (5412, 653353, 'oplec tymaa', 867656632, 3434);
INSERT INTO `Project`.`Art_object` (`id`, `price`, `Artist_name`, `Visitor_ssn`, `idseller`) VALUES (2435, 8765, 'lorine gaster', 389547853, 4654);
INSERT INTO `Project`.`Art_object` (`id`, `price`, `Artist_name`, `Visitor_ssn`, `idseller`) VALUES (5809, 764328, 'ojanda yaron', 928304800, 7866);
INSERT INTO `Project`.`Art_object` (`id`, `price`, `Artist_name`, `Visitor_ssn`, `idseller`) VALUES (7643, 6543, 'tyman resa', 492843780, 7866);
INSERT INTO `Project`.`Art_object` (`id`, `price`, `Artist_name`, `Visitor_ssn`, `idseller`) VALUES (0976, 984327, 'faron vary', 937439340, 4654);
INSERT INTO `Project`.`Art_object` (`id`, `price`, `Artist_name`, `Visitor_ssn`, `idseller`) VALUES (5423, 123789, 'odalt magnit', 329475302, 8761);
INSERT INTO `Project`.`Art_object` (`id`, `price`, `Artist_name`, `Visitor_ssn`, `idseller`) VALUES (5678, 987654, 'weqton mace', 937439340, 2381);
INSERT INTO `Project`.`Art_object` (`id`, `price`, `Artist_name`, `Visitor_ssn`, `idseller`) VALUES (6739, 123567, 'tyradn barocer', 900076543, 3244);
INSERT INTO `Project`.`Art_object` (`id`, `price`, `Artist_name`, `Visitor_ssn`, `idseller`) VALUES (9653, 76543, 'oumer tear', 543899722, 8761);
INSERT INTO `Project`.`Art_object` (`id`, `price`, `Artist_name`, `Visitor_ssn`, `idseller`) VALUES (5209, 546735, 'sunser werd', 867656632, 4848);

COMMIT;


-- -----------------------------------------------------
-- Data for table `Project`.`Statue`
-- -----------------------------------------------------
START TRANSACTION;
USE `Project`;
INSERT INTO `Project`.`Statue` (`Art_object_id`, `height`, `weight`, `Name`) VALUES (5675, 636, 50, 'de milo');
INSERT INTO `Project`.`Statue` (`Art_object_id`, `height`, `weight`, `Name`) VALUES (2435, 432, 87, 'Greek art');
INSERT INTO `Project`.`Statue` (`Art_object_id`, `height`, `weight`, `Name`) VALUES (5809, 343, 34, 'hermes ');
INSERT INTO `Project`.`Statue` (`Art_object_id`, `height`, `weight`, `Name`) VALUES (3454, 334, 23, 'Rodin Eve');
INSERT INTO `Project`.`Statue` (`Art_object_id`, `height`, `weight`, `Name`) VALUES (3456, 442, 43, 'Adam');
INSERT INTO `Project`.`Statue` (`Art_object_id`, `height`, `weight`, `Name`) VALUES (7643, 387, 98, 'Bronze');
INSERT INTO `Project`.`Statue` (`Art_object_id`, `height`, `weight`, `Name`) VALUES (4423, 345, 30, 'Spoone Woman');
INSERT INTO `Project`.`Statue` (`Art_object_id`, `height`, `weight`, `Name`) VALUES (0976, 435, 34, 'The Nose');
INSERT INTO `Project`.`Statue` (`Art_object_id`, `height`, `weight`, `Name`) VALUES (5423, 543, 45, 'City square');

COMMIT;


-- -----------------------------------------------------
-- Data for table `Project`.`Sculpture`
-- -----------------------------------------------------
START TRANSACTION;
USE `Project`;
INSERT INTO `Project`.`Sculpture` (`Art_object_id`, `height`, `weight`, `Name`) VALUES (8763, 12.4, 182, 'Hourse at Trough');
INSERT INTO `Project`.`Sculpture` (`Art_object_id`, `height`, `weight`, `Name`) VALUES (5643, 39.2, 453, 'Dancer in the Role of Harlequin');
INSERT INTO `Project`.`Sculpture` (`Art_object_id`, `height`, `weight`, `Name`) VALUES (5748, 34, 765, 'David');
INSERT INTO `Project`.`Sculpture` (`Art_object_id`, `height`, `weight`, `Name`) VALUES (9854, 56, 342, 'Virgin and child with for Angels');
INSERT INTO `Project`.`Sculpture` (`Art_object_id`, `height`, `weight`, `Name`) VALUES (6523, 75.3, 455, 'Saint George');
INSERT INTO `Project`.`Sculpture` (`Art_object_id`, `height`, `weight`, `Name`) VALUES (4563, 43, 676, 'King and Queen');
INSERT INTO `Project`.`Sculpture` (`Art_object_id`, `height`, `weight`, `Name`) VALUES (5432, 45.6, 756, 'Family Group');
INSERT INTO `Project`.`Sculpture` (`Art_object_id`, `height`, `weight`, `Name`) VALUES (5412, 65.7, 653, 'Oval with Points');

COMMIT;


-- -----------------------------------------------------
-- Data for table `Project`.`Painting`
-- -----------------------------------------------------
START TRANSACTION;
USE `Project`;
INSERT INTO `Project`.`Painting` (`Art_object_id`, `Name`) VALUES (3246, 'The Potato Eaters');
INSERT INTO `Project`.`Painting` (`Art_object_id`, `Name`) VALUES (5678, 'SunFlowers');
INSERT INTO `Project`.`Painting` (`Art_object_id`, `Name`) VALUES (6739, 'Bedroom in Arles');
INSERT INTO `Project`.`Painting` (`Art_object_id`, `Name`) VALUES (9872, 'La Vie');
INSERT INTO `Project`.`Painting` (`Art_object_id`, `Name`) VALUES (9653, 'Family of Saltimbanques');
INSERT INTO `Project`.`Painting` (`Art_object_id`, `Name`) VALUES (5209, 'The Weeping Woman');
INSERT INTO `Project`.`Painting` (`Art_object_id`, `Name`) VALUES (9874, 'Untitled');
INSERT INTO `Project`.`Painting` (`Art_object_id`, `Name`) VALUES (7832, 'Warrior');
INSERT INTO `Project`.`Painting` (`Art_object_id`, `Name`) VALUES (3435, 'Rading with Death');

COMMIT;


-- -----------------------------------------------------
-- Data for table `Project`.`Manager`
-- -----------------------------------------------------
START TRANSACTION;
USE `Project`;
INSERT INTO `Project`.`Manager` (`idManager`, `Employee_ssn`) VALUES (3454, 654789356);
INSERT INTO `Project`.`Manager` (`idManager`, `Employee_ssn`) VALUES (9874, 108455468);
INSERT INTO `Project`.`Manager` (`idManager`, `Employee_ssn`) VALUES (4543, 829373256);

COMMIT;


-- -----------------------------------------------------
-- Data for table `Project`.`Security`
-- -----------------------------------------------------
START TRANSACTION;
USE `Project`;
INSERT INTO `Project`.`Security` (`idSecurity`, `Employee_ssn`) VALUES (4743, 987654321);
INSERT INTO `Project`.`Security` (`idSecurity`, `Employee_ssn`) VALUES (4894, 453453453);
INSERT INTO `Project`.`Security` (`idSecurity`, `Employee_ssn`) VALUES (6544, 654345645);

COMMIT;


-- -----------------------------------------------------
-- Data for table `Project`.`Museum`
-- -----------------------------------------------------
START TRANSACTION;
USE `Project`;
INSERT INTO `Project`.`Museum` (`name`, `country`) VALUES ('National Portrait Gallary', 'London,England');
INSERT INTO `Project`.`Museum` (`name`, `country`) VALUES ('The Coutauld nstitute Of Art', 'London,England');
INSERT INTO `Project`.`Museum` (`name`, `country`) VALUES ('The Louvre', 'Paris,France');
INSERT INTO `Project`.`Museum` (`name`, `country`) VALUES ('Grand Palais', 'Paris,France');
INSERT INTO `Project`.`Museum` (`name`, `country`) VALUES ('Salar Jung ', 'Delhi,India');
INSERT INTO `Project`.`Museum` (`name`, `country`) VALUES ('Mysore Sand Sculpture', 'Delhi,India');
INSERT INTO `Project`.`Museum` (`name`, `country`) VALUES ('El Prabo', 'Madrid,Spain');
INSERT INTO `Project`.`Museum` (`name`, `country`) VALUES ('The Renia Sofia National Art Centre', 'Madrid,Spain');

COMMIT;


-- -----------------------------------------------------
-- Data for table `Project`.`Borrowe_from`
-- -----------------------------------------------------
START TRANSACTION;
USE `Project`;
INSERT INTO `Project`.`Borrowe_from` (`Museum_name`, `Art_object_id`, `borrowDate`, `returnDate`) VALUES ('National Portrait Gallary', 3246, '2023-01-12', '2023-02-12');
INSERT INTO `Project`.`Borrowe_from` (`Museum_name`, `Art_object_id`, `borrowDate`, `returnDate`) VALUES ('National Portrait Gallary', 7832, '2023-01-22', '2023-03-01');
INSERT INTO `Project`.`Borrowe_from` (`Museum_name`, `Art_object_id`, `borrowDate`, `returnDate`) VALUES ('National Portrait Gallary', 9872, '2023-01-01', '2023-01-17');
INSERT INTO `Project`.`Borrowe_from` (`Museum_name`, `Art_object_id`, `borrowDate`, `returnDate`) VALUES ('The Coutauld nstitute Of Art', 3456, '2023-01-17', '2023-03-01');
INSERT INTO `Project`.`Borrowe_from` (`Museum_name`, `Art_object_id`, `borrowDate`, `returnDate`) VALUES ('The Coutauld nstitute Of Art', 9874, '2023-03-02', '2023-04-11');
INSERT INTO `Project`.`Borrowe_from` (`Museum_name`, `Art_object_id`, `borrowDate`, `returnDate`) VALUES ('The Coutauld nstitute Of Art', 3435, '2023-02-13', '2023-02-23');
INSERT INTO `Project`.`Borrowe_from` (`Museum_name`, `Art_object_id`, `borrowDate`, `returnDate`) VALUES ('The Louvre', 8763, '2023-01-15', '2023-01-23');
INSERT INTO `Project`.`Borrowe_from` (`Museum_name`, `Art_object_id`, `borrowDate`, `returnDate`) VALUES ('The Louvre', 5748, '2023-01-20', '2023-02-01');
INSERT INTO `Project`.`Borrowe_from` (`Museum_name`, `Art_object_id`, `borrowDate`, `returnDate`) VALUES ('The Louvre', 4563, '2023-01-01', '2023-02-01');
INSERT INTO `Project`.`Borrowe_from` (`Museum_name`, `Art_object_id`, `borrowDate`, `returnDate`) VALUES ('Grand Palais', 5675, '2023-01-02', '2023-01-20');
INSERT INTO `Project`.`Borrowe_from` (`Museum_name`, `Art_object_id`, `borrowDate`, `returnDate`) VALUES ('Grand Palais', 3454, '2023-01-24', '2023-01-29');
INSERT INTO `Project`.`Borrowe_from` (`Museum_name`, `Art_object_id`, `borrowDate`, `returnDate`) VALUES ('Salar Jung ', 4423, '2023-01-20', '2023-01-22');
INSERT INTO `Project`.`Borrowe_from` (`Museum_name`, `Art_object_id`, `borrowDate`, `returnDate`) VALUES ('Salar Jung ', 5643, '2023-04-13', '2023-05-01');
INSERT INTO `Project`.`Borrowe_from` (`Museum_name`, `Art_object_id`, `borrowDate`, `returnDate`) VALUES ('Mysore Sand Sculpture', 9854, '2023-07-12', '2023-08-01');
INSERT INTO `Project`.`Borrowe_from` (`Museum_name`, `Art_object_id`, `borrowDate`, `returnDate`) VALUES ('Mysore Sand Sculpture', 6523, '2023-02-01', '2023-02-05');
INSERT INTO `Project`.`Borrowe_from` (`Museum_name`, `Art_object_id`, `borrowDate`, `returnDate`) VALUES ('El Prabo', 5432, '2023-02-01', '2023-02-11');
INSERT INTO `Project`.`Borrowe_from` (`Museum_name`, `Art_object_id`, `borrowDate`, `returnDate`) VALUES ('El Prabo', 5412, '2023-02-12', '2023-02-22');
INSERT INTO `Project`.`Borrowe_from` (`Museum_name`, `Art_object_id`, `borrowDate`, `returnDate`) VALUES ('The Renia Sofia National Art Centre', 2435, '2023-09-12', '2023-10-11');
INSERT INTO `Project`.`Borrowe_from` (`Museum_name`, `Art_object_id`, `borrowDate`, `returnDate`) VALUES ('The Renia Sofia National Art Centre', 5809, '2023-02-01', '2023-03-01');

COMMIT;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
