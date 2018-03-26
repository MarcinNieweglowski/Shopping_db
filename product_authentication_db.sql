CREATE DATABASE IF NOT EXISTS `product_authentication_db_tracker`;

use `product_authentication_db_tracker`;

SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS `app_user`;
CREATE TABLE `app_user` (
	`user_id` INT NOT NULL AUTO_INCREMENT,
    `first_name` VARCHAR(45) DEFAULT NULL,
    `last_name` VARCHAR(45) DEFAULT NULL,
    `app_username` VARCHAR(45) DEFAULT NULL,
    `user_password` VARCHAR(45) DEFAULT NULL,
    `authority` VARCHAR(45) DEFAULT NULL,
    `email` VARCHAR(45) DEFAULT NULL,
    PRIMARY KEY (`user_id`)
    )ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=LATIN1;
    
insert into `app_user` values
	(1, "Marcin", "Nieweglowski", "marcin", "pass", "ROLE_USER", "marcin.nieweglowski89@gmail.com");
    
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `product_name` VARCHAR(45) DEFAULT NULL,
    `quantity_needed` INT DEFAULT NULL,
    `status` INT DEFAULT NULL,
    `user_id_fk` INT DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `FK_user_idx` (`user_id_fk`),
    CONSTRAINT `user_id_idx` FOREIGN KEY (`user_id_fk`)
        REFERENCES `app_user` (`user_id`)
        ON DELETE NO ACTION ON UPDATE NO ACTION
)  ENGINE=INNODB AUTO_INCREMENT=1 DEFAULT CHARSET=LATIN1;
  
SET FOREIGN_KEY_CHECKS = 1;
    
insert into `product` values
	(1, "Banana", 4 , 2, 1),
    (2, "Milk", 10, 3, 1),
    (3, "Salami", 2, 0, 1);

	