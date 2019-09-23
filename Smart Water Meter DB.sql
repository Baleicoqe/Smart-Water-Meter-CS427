
-- -----------------------------------------------------
-- Table users
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS users (
  user_id INT NOT NULL AUTO_INCREMENT,
  first_name VARCHAR(45) NULL,
  last_name VARCHAR(45) NULL,
  other_name VARCHAR(45) NULL,
  gender VARCHAR(45) NULL,
  address VARCHAR(265) NULL,
  email VARCHAR(60) NULL,
  password VARCHAR(45) NULL,
  mobile INT NULL,
  telephone INT NULL,
  reg_date DATETIME NULL,
  user_status VARCHAR(45) NULL,
  PRIMARY KEY (user_id))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table smart_device
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS smart_device (
  device_id INT NOT NULL AUTO_INCREMENT,
  ip_address VARCHAR(60) NULL,
  user_id_fk INT NULL,
  PRIMARY KEY (device_id),
  FOREIGN KEY (user_id_fk)
    REFERENCES users (user_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table water_usage
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS water_usage (
  usage_id INT NOT NULL AUTO_INCREMENT,
  device_id_fk INT NULL,
  usage_date_time DATETIME NULL,
  salinity DECIMAL NULL,
  volume DECIMAL NULL,
  temperature DECIMAL NULL,
  PRIMARY KEY (usage_id),
  FOREIGN KEY (device_id_fk)
    REFERENCES smart_device (device_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table billing
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS billing (
  billing_id INT NOT NULL AUTO_INCREMENT,
  user_id_fk INT NULL,
  billing_date DATE NULL,
  billing_month INT NULL,
  billing_year INT NULL,
  billing_cost DECIMAL NULL,
  PRIMARY KEY (billing_id),
  FOREIGN KEY (user_id_fk)
    REFERENCES users (user_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table payment
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS payment (
  payment_id INT NOT NULL AUTO_INCREMENT,
  billing_id_fk INT NULL,
  payment_date DATE NULL,
  payment_amount DECIMAL NULL,
  PRIMARY KEY (payment_id),
  FOREIGN KEY (billing_id_fk)
    REFERENCES billing (billing_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table notification
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS notification (
  notification_id INT NOT NULL AUTO_INCREMENT,
  user_id_fk INT NULL,
  notification_detail VARCHAR(100) NULL,
  notification_date DATETIME NULL,
  notification_status VARCHAR(45) NULL,
  PRIMARY KEY (notification_id),
  FOREIGN KEY (user_id_fk)
    REFERENCES users (user_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

