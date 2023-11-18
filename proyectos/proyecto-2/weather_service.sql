-- proyecto 2
-- Estefani Valverde carné 2021554564

drop database if exists weather_service;
create database if not exists weather_service;
use weather_service;

drop table if exists country;
drop table if exists state;
drop table if exists city;
drop table if exists forecast;
drop table if exists forecast_log;

create table if not exists country (
id int primary key auto_increment,
country_name varchar(100) not null

);

create table if not exists state (
id int primary key auto_increment,
state_name varchar(100) not null

);

create table if not exists city (
id int primary key auto_increment,
city_name varchar(100) not null,
zipCode varchar(100) not null

);

create table if not exists forecast (
id int primary key auto_increment,
city_id int,
foreign key (city_id) references city (id),
zipCode varchar(100) not null,
temperature int not null,
dateP date not null

);

create table if not exists forecast_log (
id int primary key auto_increment,
dataF varchar(100) not null

);

CREATE TABLE forecast_log (
    id INT NOT NULL AUTO_INCREMENT,
    last_modified_on DATE NOT NULL,
    forecast_id INT NOT NULL,
    entry_text VARCHAR(255) NOT NULL,
    PRIMARY KEY (id)
);

DELIMITER //

CREATE PROCEDURE InsertarPais(
    IN p_CountryName VARCHAR(100)
)
BEGIN
    DECLARE exito INT DEFAULT 0;
    

    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
    END;
    START TRANSACTION;
    
    INSERT INTO country (country_name) VALUES (p_CountryName);
   
    COMMIT;
    SET exito = 1;
    
    SELECT exito;
    
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE ObtenerPaises()
BEGIN
    SELECT * FROM country;
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE BuscarPais(
    IN p_ID INT
)
BEGIN
    SELECT * FROM country WHERE id = p_ID;
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE ActualizarPais(
    IN p_ID INT,
    IN p_NuevoNombre VARCHAR(100)
)
BEGIN
    DECLARE exito INT DEFAULT 0;
    
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
    END;
    START TRANSACTION;
    
    UPDATE country
    SET country_name = p_NuevoNombre
    WHERE id = p_ID;
    
    COMMIT;
    SET exito = 1;
    
    SELECT exito;
    
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE EliminarPais(
    IN p_ID INT
)
BEGIN
    DECLARE exito INT DEFAULT 0;
    
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
    END;
    START TRANSACTION;
    
    DELETE FROM country WHERE id = p_ID;
    
    COMMIT;
    SET exito = 1;
    
    SELECT exito;
    
END //

DELIMITER ;


-----------------------------------------------------------

DELIMITER //

CREATE PROCEDURE InsertarEstado(
    IN p_StateName VARCHAR(100)
)
BEGIN
    DECLARE exito INT DEFAULT 0;
    
    
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
    END;
    START TRANSACTION;
    
    INSERT INTO state (state_name) VALUES (p_StateName);

    COMMIT;
    SET exito = 1;
    
    SELECT exito;
    
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE ObtenerEstados()
BEGIN
    SELECT * FROM state;
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE BuscarEstado(
    IN p_ID INT
)
BEGIN
    SELECT * FROM state WHERE id = p_ID;
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE ActualizarEstado(
    IN p_ID INT,
    IN p_NuevoNombre VARCHAR(100)
)
BEGIN
    DECLARE exito INT DEFAULT 0;
    

    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
    END;
    START TRANSACTION;
    
    UPDATE state
    SET state_name = p_NuevoNombre
    WHERE id = p_ID;
 
    COMMIT;
    SET exito = 1;
    
    SELECT exito;
    
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE EliminarEstado(
    IN p_ID INT
)
BEGIN
    DECLARE exito INT DEFAULT 0;
    
    
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
    END;
    START TRANSACTION;
    
    DELETE FROM state WHERE id = p_ID;

    COMMIT;
    SET exito = 1;
    
    SELECT exito;
    
END //

DELIMITER ;

-----------------------------------------------------------

DELIMITER //

CREATE PROCEDURE InsertarCiudad(
    IN p_CityName VARCHAR(100),
    IN p_ZipCode VARCHAR(100)
)
BEGIN
    DECLARE exito INT DEFAULT 0;
    

    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
    END;
    START TRANSACTION;
    
    INSERT INTO city (city_name, zipCode) VALUES (p_CityName, p_ZipCode);
  
    COMMIT;
    SET exito = 1;
    
    SELECT exito;
    
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE ObtenerCiudades()
BEGIN
    SELECT * FROM city;
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE BuscarCiudad(
    IN p_ID INT
)
BEGIN
    SELECT * FROM city WHERE id = p_ID;
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE ActualizarCiudad(
    IN p_ID INT,
    IN p_NuevoNombre VARCHAR(100),
    IN p_NuevoZipCode VARCHAR(100)
)
BEGIN
    DECLARE exito INT DEFAULT 0;
    
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
    END;
    START TRANSACTION;
    
    UPDATE city
    SET city_name = p_NuevoNombre, zipCode = p_NuevoZipCode
    WHERE id = p_ID;

    COMMIT;
    SET exito = 1;
    
    SELECT exito;
    
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE EliminarCiudad(
    IN p_ID INT
)
BEGIN
    DECLARE exito INT DEFAULT 0;
    
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
    END;
    START TRANSACTION;
    
    DELETE FROM city WHERE id = p_ID;
  
    COMMIT;
    SET exito = 1;
    
    SELECT exito;
    
END //

DELIMITER ;

-----------------------------------------------------------

DELIMITER //

CREATE PROCEDURE InsertarPronostico(
    IN p_CityID INT,
    IN p_ZipCode VARCHAR(100),
    IN p_Temperature INT,
    IN p_DateP DATE
)
BEGIN
    DECLARE exito INT DEFAULT 0;
    
    
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
    END;
    START TRANSACTION;
    
    INSERT INTO forecast (city_id, zipCode, temperature, dateP)
    VALUES (p_CityID, p_ZipCode, p_Temperature, p_DateP);
   
    COMMIT;
    SET exito = 1;
    
    SELECT exito;
    
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE ObtenerPronosticos()
BEGIN
    SELECT * FROM forecast;
END //

DELIMITER ;

DELIMITER //
CREATE PROCEDURE BuscarPronostico(
    IN p_ID INT
)
BEGIN
    SELECT * FROM forecast WHERE id = p_ID;
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE ActualizarPronostico(
    IN p_ID INT,
    IN p_NuevoCityID INT,
    IN p_NuevoZipCode VARCHAR(100),
    IN p_NuevaTemperature INT,
    IN p_NuevaDateP DATE
)
BEGIN
    DECLARE exito INT DEFAULT 0;
    

    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
    END;
    START TRANSACTION;
    
    UPDATE forecast
    SET city_id = p_NuevoCityID,
        zipCode = p_NuevoZipCode,
        temperature = p_NuevaTemperature,
        dateP = p_NuevaDateP
    WHERE id = p_ID;
    

    COMMIT;
    SET exito = 1;
    
    SELECT exito;
    
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE EliminarPronostico(
    IN p_ID INT
)
BEGIN
    DECLARE exito INT DEFAULT 0;
    
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
    END;
    START TRANSACTION;
    
    DELETE FROM forecast WHERE id = p_ID;

    COMMIT;
    SET exito = 1;
    
    SELECT exito;
    
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE ObtenerBitacoras()
BEGIN
    SELECT * FROM forecast_log ORDER BY last_modified_on DESC;
END // 

DELIMITER ;


