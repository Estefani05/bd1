-- Estefani Valverde carné 2021554564
-- Proyecto 1
-- Caso1
drop database if exists caso_1;
create database if not exists caso_1;
use caso_1;

drop table if exists PRESIDENTE;
drop table if exists GERENTE;
drop table if exists COMPAÑIA;
drop table if exists SEGMENTO_MERCADO;
drop table if exists ARTICULO;
drop table if exists TIPO_ARTICULO;
drop table if exists PRECIO_ARTICULO;
drop table if exists PROVEEDOR;
drop table if exists TIPO_PROVEEDOR;
drop table if exists SUCURSAL;
drop table if exists PUNTO_VENTA;
drop table if exists ORDEN;
drop table if exists LINEA_ORDEN;
drop table if exists VISITAS;

 create table if not exists PRESIDENTE (
  id_presidente INT PRIMARY KEY,
  cedula_presidente INT,
  nombre_presidente VARCHAR(200)
);

create table if not exists GERENTE (
  id_gerente INT PRIMARY KEY,
  cedula_gerente INT,
  nombre_gerente VARCHAR(200)
);

create table if not exists COMPAÑIA (
  id_compañia INT PRIMARY KEY,
  nombre_compañia VARCHAR(200),
  direccion VARCHAR(200),
  numero_patronal VARCHAR(200),
  id_gerente INT,
  nombre_presidente VARCHAR(55),
  nombre_gerente VARCHAR(55),
  id_presidente INT,
  FOREIGN KEY (id_gerente) references Gerente(id_gerente),
  FOREIGN KEY (id_presidente) references Presidente(id_presidente) 
);

create table if not exists SEGMENTO_MERCADO (
  id_segmento_mercado INT PRIMARY KEY,
  descripcion VARCHAR(200),
  id_gerente INT, 
	FOREIGN KEY (id_gerente) references Gerente(id_gerente)
);

create table if not exists ARTICULO  (
  id_articulo INT PRIMARY KEY,
  descripcion_articulo VARCHAR(200),
  precio FLOAT,
  fecha_ultima_compra DATE,
  fecha_ultimo_inventario DATE,
  en_stock INT
);

create table if not exists TIPO_ARTICULO (
  tipo_articulo VARCHAR(200) PRIMARY KEY,
  descripcion_tipo_articulo VARCHAR(200)
);

create table if not exists PRECIO_ARTICULO (
  id_articulo INT,
  tipo_articulo VARCHAR(200),
  precio INT,
  PRIMARY KEY (id_articulo, tipo_articulo),
  FOREIGN KEY (id_articulo) REFERENCES Articulo(id_articulo),
  FOREIGN KEY (tipo_articulo) REFERENCES tipo_articulo(tipo_articulo)
);


create table if not exists PROVEEDOR (
  id_proveedor INT PRIMARY KEY,
  nombre_proveedor VARCHAR(200),
  cedula VARCHAR(200),
  telefono_proveedor VARCHAR(200),
  contacto VARCHAR(200),
  direccion VARCHAR(200)
);

create table if not exists TIPO_PROVEEDOR (
  id_proveedor INT PRIMARY KEY,
  tipo_proveedor VARCHAR(200),
  FOREIGN KEY (id_proveedor) REFERENCES Proveedor(id_proveedor)
);

create table if not exists SUCURSAL (
  id_sucursal INT PRIMARY KEY,
  nombre_sucursal VARCHAR(200),
  direccion VARCHAR(200),
  id_compañia INT,
  FOREIGN KEY (id_compañia) REFERENCES Compañía(id_compañia)
);

create table if not exists PUNTO_VENTA (
  id_punto_venta INT PRIMARY KEY,
  nombre_punto_venta VARCHAR(200),
  direccion VARCHAR(200),
  id_sucursal INT,
  FOREIGN KEY (id_sucursal) REFERENCES Sucursal(id_sucursal)
);


create table if not exists ORDEN (
  id_orden INT PRIMARY KEY,
  fecha_orden DATE,
  id_comprador INT,
  id_aprobador INT,
  monto_total INT,
  FOREIGN KEY (id_comprador) REFERENCES GERENTE(id_gerente),
  FOREIGN KEY (id_aprobador) REFERENCES GERENTE(id_gerente)
  );

create table if not exists LINEA_ORDEN (
  id_orden INT,
  id_linea INT,
  id_articulo INT,
  cantidad INT,
  precio INT,
  total_linea INT,
  PRIMARY KEY (id_orden, id_linea),
  FOREIGN KEY (id_orden) REFERENCES ORDEN(id_orden),
  FOREIGN KEY (id_articulo) REFERENCES ARTICULO(id_articulo)
);

create table if not exists VISITAS (
  id_segmento INT PRIMARY KEY,
  ultima_visita DATE,
  FOREIGN KEY (id_segmento) REFERENCES SEGMENTO_MERCADO(id_segmento_mercado)
);

-- Datos

Insert into GERENTE (id_gerente, cedula_gerente, nombre_gerente)
VALUES(1, 1, 'Paola Bermudez');
Insert into GERENTE (id_gerente, cedula_gerente, nombre_gerente)
VALUES(2, 2, 'Yesenia Rojas');
Insert into GERENTE (id_gerente, cedula_gerente, nombre_gerente)
VALUES(3, 3, 'Fernando Vargas');
Insert into GERENTE (id_gerente, cedula_gerente, nombre_gerente)
VALUES(4, 4, 'María Valverde');
Insert into GERENTE (id_gerente, cedula_gerente, nombre_gerente)
VALUES(5, 5, 'Fabian Monge');
Insert into GERENTE (id_gerente, cedula_gerente, nombre_gerente)
VALUES(6, 6, 'Patricia Jimenez');
Insert into GERENTE (id_gerente, cedula_gerente, nombre_gerente)
VALUES(7, 7, 'Tatiana Valle');
Insert into GERENTE (id_gerente, cedula_gerente, nombre_gerente)
VALUES(8, 8, 'Melissa Fonseca');
Insert into GERENTE (id_gerente, cedula_gerente, nombre_gerente)
VALUES(9, 9, 'Gerald Solis');
Insert into GERENTE (id_gerente, cedula_gerente, nombre_gerente)
VALUES(10, 10, 'Andres Zamora');


Insert into PRESIDENTE(id_presidente, cedula_presidente, nombre_presidente)
values(1, 1, 'Sonia Vindas');
INSERT INTO PRESIDENTE(id_presidente, cedula_presidente, nombre_presidente)
VALUES (2, 2, 'Priscilla Barrientos');
INSERT INTO PRESIDENTE(id_presidente, cedula_presidente, nombre_presidente)
VALUES (3, 3, 'Carlos Rojas');
INSERT INTO PRESIDENTE(id_presidente, cedula_presidente, nombre_presidente)
VALUES (4, 4, 'Felipe Guzman');
INSERT INTO PRESIDENTE(id_presidente, cedula_presidente, nombre_presidente) 
VALUES (5, 5, 'Emmarie Perez');
INSERT INTO PRESIDENTE(id_presidente, cedula_presidente, nombre_presidente) 
VALUES (6, 6, 'Estefani Valverde');
INSERT INTO PRESIDENTE(id_presidente, cedula_presidente, nombre_presidente) 
VALUES (7, 7, 'Karla Muñoz');
INSERT INTO PRESIDENTE(id_presidente, cedula_presidente, nombre_presidente)
VALUES (8, 8, 'Hillary Smith');
INSERT INTO PRESIDENTE(id_presidente, cedula_presidente, nombre_presidente)
VALUES (9, 9, 'Victor Ocampo');
INSERT INTO PRESIDENTE(id_presidente, cedula_presidente, nombre_presidente)
VALUES (10, 10, 'Guiselle Brown');


INSERT INTO COMPAÑIA (id_compañia, nombre_compañia, direccion, numero_patronal, id_gerente, id_presidente)
VALUES (1, 'Hot Tacos', 'San Jose', '6547894532', 1, 1 );
INSERT INTO COMPAÑIA (id_compañia, nombre_compañia, direccion, numero_patronal, id_gerente, id_presidente)
VALUES (2, 'Barberia JyS', 'Alajuela', '1234567788', 2, 2);
INSERT INTO COMPAÑIA (id_compañia, nombre_compañia, direccion, numero_patronal, id_gerente, id_presidente)
VALUES (3, 'Mall Oxigeno', 'Heredia', '2466544790', 3, 3);
INSERT INTO COMPAÑIA (id_compañia, nombre_compañia, direccion, numero_patronal, id_gerente, id_presidente)
VALUES (4, 'Sara', 'Cartago', '456286905', 4, 4);
INSERT INTO COMPAÑIA (id_compañia, nombre_compañia, direccion, numero_patronal, id_gerente, id_presidente)
VALUES (5, 'Zapateria Cuerina', 'Guanacaste', '6523478214', 5, 5);
INSERT INTO COMPAÑIA (id_compañia, nombre_compañia, direccion, numero_patronal, id_gerente, id_presidente)
VALUES (6, 'Forever 21', 'San Jose', '6752430012', 6, 6);
INSERT INTO COMPAÑIA (id_compañia, nombre_compañia, direccion, numero_patronal, id_gerente, id_presidente)
VALUES (7, 'Odontología Nuñez', 'Alajuela', '5647800234', 7, 7);
INSERT INTO COMPAÑIA (id_compañia, nombre_compañia, direccion, numero_patronal, id_gerente, id_presidente)
VALUES (8, 'Price Smart', 'San José', '5989632145', 8, 8);
INSERT INTO COMPAÑIA (id_compañia, nombre_compañia, direccion, numero_patronal, id_gerente, id_presidente)
VALUES (9, 'Gran Terminal Caribeños', 'Limon', '7825634444', 9, 9);
INSERT INTO COMPAÑIA (id_compañia, nombre_compañia, direccion, numero_patronal, id_gerente, id_presidente)
VALUES (10, 'Jhonny´s Place', 'Puerto Viejo', '5554444832', 10, 10);


INSERT INTO SEGMENTO_MERCADO (id_segmento, descripcion, id_gerente) VALUES
(1, 'Segmento mercado 1', 1),
(2, 'Segmento mercado 2', 2),
(3, 'Segmento mercado 3', 3),
(4, 'Segmento mercado 4', 4),
(5, 'Segmento mercado 5', 5),
(6, 'Segmento mercado 6', 6),
(7, 'Segmento mercado 7', 7),
(8, 'Segmento mercado 8', 8),
(9, 'Segmento mercado 9', 9),
(10, 'Segmento mercado 10', 10);


INSERT INTO ARTICULO (id_articulo, descripcion_articulo, precio, fecha_ultima_compra, fecha_ultimo_inventario, en_stock)
VALUES (1, 'Traje de baño', 25.000, '01-01-2023', '02-01-2023', 25);
INSERT INTO ARTICULO (id_articulo, descripcion_articulo, precio, fecha_ultima_compra, fecha_ultimo_inventario, en_stock)
VALUES (2, 'Vestido de Gala', 50.000, '01-02-2023', '02-02-2023', 30);
INSERT INTO ARTICULO (id_articulo, descripcion_articulo, precio, fecha_ultima_compra, fecha_ultimo_inventario, en_stock)
VALUES (3, 'Cortinas', 35.000, '01-03-2023', '02-03-2023', 20);
INSERT INTO ARTICULO (id_articulo, descripcion_articulo, precio, fecha_ultima_compra, fecha_ultimo_inventario, en_stock)
VALUES (4, 'Almohadas', 17.000, '01-04.2024', '02-04-2023', 50);
INSERT INTO ARTICULO (id_articulo, descripcion_articulo, precio, fecha_ultima_compra, fecha_ultimo_inventario, en_stock)
VALUES (5, 'Sueter navideño', 20.000, '01-05-2023', '02-05-2023', 14);
INSERT INTO ARTICULO (id_articulo, descripcion_articulo, precio, fecha_ultima_compra, fecha_ultimo_inventario, en_stock)
VALUES (6, 'Maletín de viaje', 90.000, '01-06-2023', '02-06-2023', 10);
INSERT INTO ARTICULO (id_articulo, descripcion_articulo, precio, fecha_ultima_compra, fecha_ultimo_inventario, en_stock)
VALUES (7, 'Botas para invierno', 35.000, '01-07-2023', '02-07-2023', 25);
INSERT INTO ARTICULO (id_articulo, descripcion_articulo, precio, fecha_ultima_compra, fecha_ultimo_inventario, en_stock)
VALUES (8, 'Sombrillas de playa', 60.000, '01-08-2023', '02-08-2023', 15);
INSERT INTO ARTICULO (id_articulo, descripcion_articulo, precio, fecha_ultima_compra, fecha_ultimo_inventario, en_stock)
VALUES (9, 'Manteles de mesa', 20.000, '01-09-2023', '02-09-2023', 5);
INSERT INTO ARTICULO (id_articulo, descripcion_articulo, precio, fecha_ultima_compra, fecha_ultimo_inventario, en_stock)
VALUES (10, 'Camisas de Barbie', 75.000, '01-10-2023', '02-10-2023', 60);


INSERT INTO PROVEEDOR (id_proveedor, nombre_proveedor, cedula, telefono_proveedor, contacto, direccion)
VALUES (1, 'PROV 1', '234768943', '1111-1111', 'Sofia', 'San Jose');
INSERT INTO PROVEEDOR (id_proveedor, nombre_proveedor, cedula, telefono_proveedor, contacto, direccion)
VALUES (2, 'PROV 2', '674903267', '2222-2222', 'Rubí', 'Alajuela');
INSERT INTO PROVEEDOR (id_proveedor, nombre_proveedor, cedula, telefono_proveedor, contacto, direccion)
VALUES (3, 'PROV 3', '745219674', '3333-3333', 'Sharon', 'Heredia');
INSERT INTO PROVEEDOR (id_proveedor, nombre_proveedor, cedula, telefono_proveedor, contacto, direccion)
VALUES (4, 'PROV 4', '860452345', '4444-4444', 'David', 'Limon');
INSERT INTO PROVEEDOR (id_proveedor, nombre_proveedor, cedula, telefono_proveedor, contacto, direccion)
VALUES (5, 'PROV 5', '123456789', '5555-5555', 'Raul', 'Puntarenas');
INSERT INTO PROVEEDOR (id_proveedor, nombre_proveedor, cedula, telefono_proveedor, contacto, direccion)
VALUES (6, 'PROV 6', '674537856', '6666-6666', 'Patricia', 'Heredia');
INSERT INTO PROVEEDOR (id_proveedor, nombre_proveedor, cedula, telefono_proveedor, contacto, direccion)
VALUES (7, 'PROV 7', '978456378', '7777-7777', 'Andres', 'Guanacaste');
INSERT INTO PROVEEDOR (id_proveedor, nombre_proveedor, cedula, telefono_proveedor, contacto, direccion)
VALUES (8, 'PROV 8', '453678219', '8888-8888', 'Estefani', 'Guapiles');
INSERT INTO PROVEEDOR (id_proveedor, nombre_proveedor, cedula, telefono_proveedor, contacto, direccion)
VALUES (9, 'PROV 9', '784537845', '9999-9999', 'Sara', 'Turrialba');
INSERT INTO PROVEEDOR (id_proveedor, nombre_proveedor, cedula, telefono_proveedor, contacto, direccion)
VALUES (10, 'PROV 10', '956745321', '0000-0000', 'Andrea', 'Paraiso');


INSERT INTO TIPO_PROVEEDOR (id_proveedor, tipo_proveedor) VALUES
(1, 'Pantalones'),
(2, 'Camisas'),
(3, 'Calzado'),
(4, 'Calcetines'),
(5, 'Ropa interior'),
(6, 'Perfumes'),
(7, 'Mueblería'),
(8, 'Electronica'),
(9, 'Articulos de playa'),
(10, 'Joyeria');


INSERT INTO SUCURSAL (id_sucursal, nombre_sucursal, direccion, id_compañia)
VALUES (1, 'Sucursal San Jose', 'San Jose, Costa Rica', 1),
(2, 'Sucursal Alajuela', 'Alajuela, Costa Rica', 2),
(3, 'Sucursal Cartago', 'Cartago, Costa Rica', 3),
(4, 'Sucursal Heredia', 'Heredia, Costa Rica', 4),
(5, 'Sucursal Guanacaste', 'Guanacaste, Costa Rica', 5),
(6, 'Sucursal Guapiles', 'Guapiles, Costa Rica', 6),
(7, 'Sucursal Limon', 'Limon, Costa Rica', 7),
(8, 'Sucursal Puerto Viejo', 'Talamanca, Costa Rica', 8),
(9, 'Sucursal Puntarenas', 'Puntarenas, Costa Rica', 9),
(10, 'Sucursal Nicoya', 'Nicoya, Costa Rica', 10);


INSERT INTO PUNTO_VENTA (id_punto_venta, nombre_punto_venta, direccion, id_sucursal) 
VALUES (1, 'Tienda 1', 'Centro, San José', 1);
INSERT INTO PUNTO_VENTA (id_punto_venta, nombre_punto_venta, direccion, id_sucursal)
 VALUES (2, 'Tienda 2', 'Avenida 12, Alajuela', 2);
INSERT INTO PUNTO_VENTA (id_punto_venta, nombre_punto_venta, direccion, id_sucursal) 
VALUES (3, 'Tienda 3', 'Avenida 7, Cartago', 3);
INSERT INTO PUNTO_VENTA (id_punto_venta, nombre_punto_venta, direccion, id_sucursal) 
VALUES (4, 'Tienda 4', 'Calle los Lagos, Heredia', 4);
INSERT INTO PUNTO_VENTA (id_punto_venta, nombre_punto_venta, direccion, id_sucursal) 
VALUES (5, 'Tienda 5', 'Avenida 79A, San jose', 5);
INSERT INTO PUNTO_VENTA (id_punto_venta, nombre_punto_venta, direccion, id_sucursal) 
VALUES (6, 'Tienda 6', 'Calle los Tiburones, Puntarenas', 6);
INSERT INTO PUNTO_VENTA (id_punto_venta, nombre_punto_venta, direccion, id_sucursal) 
VALUES (7, 'Tienda 7', 'Ruta 32, Limon', 7);
INSERT INTO PUNTO_VENTA (id_punto_venta, nombre_punto_venta, direccion, id_sucursal) 
VALUES (8, 'Tienda 8', 'Avenida el Costal, Nicoya', 8);
INSERT INTO PUNTO_VENTA (id_punto_venta, nombre_punto_venta, direccion, id_sucursal) 
VALUES (9, 'Tienda 9', 'Avenida 38, Moravia', 9);
INSERT INTO PUNTO_VENTA (id_punto_venta, nombre_punto_venta, direccion, id_sucursal) 
VALUES (10, 'Tienda 10', 'Calle los baños, Limon', 10);


INSERT INTO ORDEN (id_orden, fecha_orden, id_comprador, id_aprobador, monto_total)
VALUES (1, '01-01-2023', 1, 2, 10.000);
INSERT INTO ORDEN (id_orden, fecha_orden, id_comprador, id_aprobador, monto_total) 
VALUES (2, '02-02', 2, 3, 20.000);
INSERT INTO ORDEN (id_orden, fecha_orden, id_comprador, id_aprobador, monto_total) 
VALUES (3, '03-03-2023', 3, 4, 30.000);
INSERT INTO ORDEN (id_orden, fecha_orden, id_comprador, id_aprobador, monto_total) 
VALUES (4, '04-04-2023', 4, 5, 40.000);
INSERT INTO ORDEN (id_orden, fecha_orden, id_comprador, id_aprobador, monto_total) 
VALUES (5, '05-05-2023', 5, 6, 50.000);
INSERT INTO ORDEN (id_orden, fecha_orden, id_comprador, id_aprobador, monto_total) 
VALUES (6, '06-06-2023', 6, 7, 60.000);
INSERT INTO ORDEN (id_orden, fecha_orden, id_comprador, id_aprobador, monto_total) 
VALUES (7, '07-07-2023', 7, 8, 70.000);
INSERT INTO ORDEN (id_orden, fecha_orden, id_comprador, id_aprobador, monto_total) 
VALUES (8, '08-08-2023', 8, 9, 80.000);
INSERT INTO ORDEN (id_orden, fecha_orden, id_comprador, id_aprobador, monto_total) 
VALUES (9, '09-09-2023', 9, 10, 90.000);
INSERT INTO ORDEN (id_orden, fecha_orden, id_comprador, id_aprobador, monto_total) 
VALUES (10, '10-10-2023', 10, 11, 100.000);


INSERT INTO LINEA_ORDEN(id_orden, id_linea, id_articulo, cantidad, precio, total_linea) 
VALUES (1, 1, 1, 1, 10.00, 100.000);
INSERT INTO LINEA_ORDEN(id_orden, id_linea, id_articulo, cantidad, precio, total_linea) 
VALUES (2, 2, 2, 2, 20.00, 200.000);
INSERT INTO LINEA_ORDEN(id_orden, id_linea, id_articulo, cantidad, precio, total_linea) 
VALUES (3, 3, 3, 3, 30.00, 300.000);
INSERT INTO LINEA_ORDEN(id_orden, id_linea, id_articulo, cantidad, precio, total_linea) 
VALUES (4, 4, 4, 4, 40.00, 400.000);
INSERT INTO LINEA_ORDEN(id_orden, id_linea, id_articulo, cantidad, precio, total_linea) 
VALUES (5, 5, 5, 5, 50.00, 500.000);
INSERT INTO LINEA_ORDEN(id_orden, id_linea, id_articulo, cantidad, precio, total_linea) 
VALUES (6, 6, 6, 6, 60.00, 600.000);
INSERT INTO LINEA_ORDEN(id_orden, id_linea, id_articulo, cantidad, precio, total_linea) 
VALUES (7, 7, 7, 7, 70.00, 700.000);
INSERT INTO LINEA_ORDEN(id_orden, id_linea, id_articulo, cantidad, precio, total_linea) 
VALUES (8, 8, 8, 8, 80.00, 800.000);
INSERT INTO LINEA_ORDEN(id_orden, id_linea, id_articulo, cantidad, precio, total_linea) 
VALUES (9, 9, 9, 9, 90.00, 900.000);
INSERT INTO LINEA_ORDEN(id_orden, id_linea, id_articulo, cantidad, precio, total_linea) 
VALUES (10, 10, 10, 10, 11.00, 110.000);


INSERT INTO VISITAS (id_segmento, ultima_visita)
 VALUES (1, '01-01-2023');
INSERT INTO VISITAS (id_segmento, ultima_visita) 
VALUES (2, '02-02-2023');
INSERT INTO VISITAS (id_segmento, ultima_visita) 
VALUES (3, '03-03-2023');
INSERT INTO VISITAS (id_segmento, ultima_visita) 
VALUES (4, '04-04-2023');
INSERT INTO VISITAS (id_segmento, ultima_visita) 
VALUES (5, '05-05-2023');
INSERT INTO VISITAS (id_segmento, ultima_visita) 
VALUES (6, '06-06-2023');
INSERT INTO VISITAS (id_segmento, ultima_visita) 
VALUES (7, '07-07-2023');
INSERT INTO VISITAS (id_segmento, ultima_visita) 
VALUES (8, '08-08-2023');
INSERT INTO VISITAS (id_segmento, ultima_visita) 
VALUES (9, '09-09-2023');
INSERT INTO VISITAS (id_segmento, ultima_visita) 
VALUES (10, '10-10-2023');

select * from ARTICULO;





