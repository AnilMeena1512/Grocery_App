/** Grocery Store **/

/** create a schema**/
CREATE SCHEMA `grocery_store_2` ;

/** we will create a products table to manage our product **/

CREATE TABLE `grocery_store_2`.`products` (
  `product_id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `uom_id` INT NOT NULL,
  `price_per_unit` DOUBLE NOT NULL,
  PRIMARY KEY (`product_id`));

/** unit of measure(uom) table 
kg:2;
each:1;
**/
CREATE TABLE `grocery_store_2`.`uom` (
  `uom_id` INT NOT NULL,
  `uom_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`uom_id`));
/** insert values in UOM table **/
INSERT INTO `grocery_store_2`.`uom` (`uom_id`, `uom_name`) VALUES ('1', 'each');
INSERT INTO `grocery_store_2`.`uom` (`uom_id`, `uom_name`) VALUES ('2', 'kg');

/** now apply foreign key on uom_id between products and uom table 
taking uom table as reference table **/

ALTER TABLE `grocery_store_2`.`products` 
ADD INDEX `fk_uon_id_idx` (`uom_id` ASC) VISIBLE;
;
ALTER TABLE `grocery_store_2`.`products` 
ADD CONSTRAINT `fk_uon_id`
  FOREIGN KEY (`uom_id`)
  REFERENCES `grocery_store_2`.`uom` (`uom_id`)
  ON DELETE NO ACTION
  ON UPDATE RESTRICT;

/** created a table to keep orders record **/

CREATE TABLE `grocery_store_2`.`orders` (
  `order_id` INT NOT NULL,
  `customer_name` VARCHAR(45) NOT NULL,
  `total` DOUBLE NOT NULL,
  `datetime` DATETIME NOT NULL,
  `orderscol` VARCHAR(45) NULL,
  PRIMARY KEY (`order_id`));

/** Now we created another Table named order_details
to keep every order's deatil **/

CREATE TABLE `grocery_store_2`.`order_details` (
  `order_id` INT NOT NULL,
  `product_id` INT NOT NULL,
  `quantity` DOUBLE NOT NULL,
  `total_price` DOUBLE NOT NULL,
  PRIMARY KEY (`order_id`));

/** Now apply foreign key concepts **/
 
/** between order_details table and orders table on order_id
taking orders table as referenece table **/

/**between order_details table and products table on product_id
taking products table as referenece table **/

ALTER TABLE `grocery_store_2`.`order_details` 
ADD INDEX `fk_product_id_idx` (`product_id` ASC) VISIBLE;
;
ALTER TABLE `grocery_store_2`.`order_details` 
ADD CONSTRAINT `fk_order_id`
  FOREIGN KEY (`order_id`)
  REFERENCES `grocery_store_2`.`orders` (`order_id`)
  ON DELETE NO ACTION
  ON UPDATE RESTRICT,
ADD CONSTRAINT `fk_product_id`
  FOREIGN KEY (`product_id`)
  REFERENCES `grocery_store_2`.`products` (`product_id`)
  ON DELETE NO ACTION
  ON UPDATE RESTRICT;
