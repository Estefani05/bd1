-- tarea 6
-- Estefani Valverde carné 2021554564

drop database if exists bookstore;
create database if not exists bookstore;
use bookstore;

drop table if exists Libros;
drop table if exists Clientes;
drop table if exists Pedidos;

create table if not exists Libros (
	id int primary key auto_increment, -- autor
    title varchar(100) not null,
    genre varchar(100) not null,
    price int not null,
    stock int not null,
    INDEX titleLibro(title)
);
create table if not exists Clientes (
	nameClient varchar(100) not null,
    adress  varchar(200) not null,
    id int primary key auto_increment,
    INDEX adressClient(adress)
    
);
    
create table if not exists Pedidos (
	id int primary key auto_increment,
    clientPed int not null,
    idLibro int not null,
    dateP date not null,
    INDEX ClientPedido(clientPed)    
);

DELIMITER $$
Create Procedure AgregarLibros (in p_nombre varchar (100)  , in  p_genero varchar (100), in p_precio int, in p_stock int)
	Begin
    insert into Libros (title, genre, price, stock) values ( p_nombre, p_genero, p_precio, p_stock);
    END $$
    
DELIMITER ;

DELIMITER $$
Create Procedure RealizarPedidos (in p_idCliente int, in p_idLibro int)
	Begin
    DECLARE v_stock INT DEFAULT 0;
    select stock into v_stock from Libros where id = p_idLibros;
    if v_stock > 0 then 
    insert into Pedidos (clientPed, idLibro, dateP) values ( p_idCliente, p_idLibro, current_date());
    END if;
    END $$
    
DELIMITER ;

DELIMITER $$

CREATE FUNCTION funcion (p_idPedido int)
RETURNS int 
DETERMINISTIC
BEGIN
declare v_precio int default 0;
select price into v_precio from Pedidos inner join Libros on Pedidos.idLibro = Libros.id;
return price;
END $$

DELIMITER ;

DELIMITER $$
CREATE TRIGGER Disparador BEFORE INSERT ON Pedidos FOR EACH ROW 
BEGIN
 DECLARE v_stock INT DEFAULT 0;
    select stock into v_stock from Libros where id = new.idLibro;
    if v_stock > 0 then 
    set v_stock = v_stock -1;
    update Libros set stock = v_stock where id = new.idLibro;
    END if; 
  
END $$

DELIMITER ;
    