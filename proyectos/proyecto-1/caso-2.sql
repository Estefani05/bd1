-- Estefani Valverde carné 2021554564
-- Proyecto 1
-- Caso2

drop database if exists caso_2;
create database if not exists caso_2;
use caso_2;

drop table if exists PERSONA;
drop table if exists PERSONA_FISICA;
drop table if exists PERSONA_JURIDICA;
drop table if exists CUENTA_POR_COBRAR;
drop table if exists FORMA_DE_PAGO;
drop table if exists ABONO;

create table if not exists PERSONA(
cedula INT PRIMARY KEY,
tipo VARCHAR(200),
nombre VARCHAR(200)
);

create table if not exists PERSONA_FISICA(
fecha_Nacimiento DATE,
cedula_persona_fisica INT,
foreign key (cedula_persona_fisica) references PERSONA(cedula)
);

create table if not exists PERSONA_JURIDICA(
nombre_comercial VARCHAR(200),
cedula_persona_juridica INT,
foreign key (cedula_persona_juridica) references PERSONA(cedula)
);

create table if not exists CUENTA_POR_COBRAR(
id_cuenta INT PRIMARY KEY,
monto INT,
fecha_de_vencimiento DATE,
cedula_cliente INT,
foreign key(cedula_cliente) references PERSONA(cedula)
);

create table if not exists FORMA_DE_PAGO(
id_forma_pago INT PRIMARY KEY,
forma_pago VARCHAR(200)
);

create table if not exists  ABONO(
idCuenta INT,
numero_de_cuota INT,
fecha DATE,
monto INT,
codigoPago INT,
foreign key(idCuenta) references  CUENTA_POR_COBRAR(id_cuenta),
foreign key(codigoPago) references FORMA_DE_PAGO(id_forma_pago),
Primary key(numero_de_cuota,idCuenta)
);


INSERT INTO PERSONA (cedula, tipo, nombre) 
VALUES (111111111, 'Fisica', 'Monica Solis');
INSERT INTO PERSONA (cedula, tipo, nombre) 
VALUES (222222222, 'Fisica', 'Sofia Ramirez');
INSERT INTO PERSONA (cedula, tipo, nombre) 
VALUES (333333333, 'Fisica', 'Martin Zarate');
INSERT INTO PERSONA (cedula, tipo, nombre) 
VALUES (444444444, 'Fisica', 'Carolina Fonseca');
INSERT INTO PERSONA (cedula, tipo, nombre) 
VALUES (555555555, 'Fisica', 'Oscar Montes');
INSERT INTO PERSONA (cedula, tipo, nombre) 
VALUES (666666666, 'Juridica', 'MEPE S.A.');
INSERT INTO PERSONA (cedula, tipo, nombre) 
VALUES (777777777, 'Juridica', 'DULCES MYN S.A');
INSERT INTO PERSONA (cedula, tipo, nombre) 
VALUES (888888888, 'Juridica', 'Distribuidora FABER CASTELL S.A.');
INSERT INTO PERSONA (cedula, tipo, nombre) 
VALUES (999999999, 'Juridica', 'TRACASA S.A');
INSERT INTO PERSONA (cedula, tipo, nombre) 
VALUES (100000000, 'Juridica', 'CUADERNOS S.A.');


INSERT INTO PERSONA_FISICA (fecha_Nacimiento, cedula_persona_fisica)
VALUES ('10-08-1995', 111111111);
INSERT INTO PERSONA_FISICA (fecha_Nacimiento, cedula_persona_fisica) 
VALUES ('23-05-1991', 222222222);
INSERT INTO PERSONA_FISICA (fecha_Nacimiento, cedula_persona_fisica) 
VALUES ('05-03-2000', 333333333);
INSERT INTO PERSONA_FISICA (fecha_Nacimiento, cedula_persona_fisica) 
VALUES ('23-04-2023', 444444444);
INSERT INTO PERSONA_FISICA (fecha_Nacimiento, cedula_persona_fisica) 
VALUES ('30-09-1999', 555555555);
INSERT INTO PERSONA_FISICA (fecha_Nacimiento, cedula_persona_fisica) 
VALUES ('11-01-1990', 666666666);
INSERT INTO PERSONA_FISICA (fecha_Nacimiento, cedula_persona_fisica) 
VALUES ('29-01-1992', 777777777);
INSERT INTO PERSONA_FISICA (fecha_Nacimiento, cedula_persona_fisica) 
VALUES ('26-06-2001', 888888888);
INSERT INTO PERSONA_FISICA (fecha_Nacimiento, cedula_persona_fisica) 
VALUES ('10-10-1997', 999999999);
INSERT INTO PERSONA_FISICA (fecha_Nacimiento, cedula_persona_fisica) 
VALUES ('13-03-1999', 100000000);


INSERT INTO PERSONA_JURIDICA (nombre_comercial, cedula_persona_juridica) 
VALUES ('MEPE S.A.', 1);
INSERT INTO PERSONA_JURIDICA (nombre_comercial, cedula_persona_juridica) 
VALUES ('DULCES MYN S.A', 2);
INSERT INTO PERSONA_JURIDICA (nombre_comercial, cedula_persona_juridica) 
VALUES ('Distribuidora FABER CASTELL S.A.', 3);
INSERT INTO PERSONA_JURIDICA (nombre_comercial, cedula_persona_juridica) 
VALUES ('TRACASA S.A', 4);
INSERT INTO PERSONA_JURIDICA (nombre_comercial, cedula_persona_juridica) 
VALUES ('CUADERNOS S.A.', 5);
INSERT INTO PERSONA_JURIDICA (nombre_comercial, cedula_persona_juridica) 
VALUES ('EMBUTIDOS S.A.', 6);
INSERT INTO PERSONA_JURIDICA (nombre_comercial, cedula_persona_juridica) 
VALUES ('AIRES ACONDICIONADOS', 7);
INSERT INTO PERSONA_JURIDICA (nombre_comercial, cedula_persona_juridica) 
VALUES ('Distribuidora JYS S.A.', 8);
INSERT INTO PERSONA_JURIDICA (nombre_comercial, cedula_persona_juridica) 
VALUES ('FUNDACION HUELLITAS GUARDERIA', 9);
INSERT INTO PERSONA_JURIDICA (nombre_comercial, cedula_persona_juridica) 
VALUES ('SUPERMERCADO SAM S.A.', 10);


INSERT INTO CUENTA_POR_COBRAR(id_cuenta, monto, fecha_de_vencimiento, cedula_cliente) 
VALUES (1, 100, '01-01-2024', 1);
INSERT INTO CUENTA_POR_COBRAR(id_cuenta, monto, fecha_de_vencimiento, cedula_cliente) 
VALUES (2, 200, '02-02-2024', 2);
INSERT INTO CUENTA_POR_COBRAR(id_cuenta, monto, fecha_de_vencimiento, cedula_cliente) 
VALUES (3, 300, '03-03-2024', 3);
INSERT INTO CUENTA_POR_COBRAR(id_cuenta, monto, fecha_de_vencimiento, cedula_cliente) 
VALUES (4, 400, '04-04-2024', 4);
INSERT INTO CUENTA_POR_COBRAR(id_cuenta, monto, fecha_de_vencimiento, cedula_cliente) 
VALUES (5, 500, '05-05-2024', 5);
INSERT INTO CUENTA_POR_COBRAR(id_cuenta, monto, fecha_de_vencimiento, cedula_cliente) 
VALUES (6, 600, '06-06-2024', 6);
INSERT INTO CUENTA_POR_COBRAR(id_cuenta, monto, fecha_de_vencimiento, cedula_cliente) 
VALUES (7, 700, '07-07-2024', 7);
INSERT INTO CUENTA_POR_COBRAR(id_cuenta, monto, fecha_de_vencimiento, cedula_cliente) 
VALUES (8, 800, '08-08-2024', 8);
INSERT INTO CUENTA_POR_COBRAR(id_cuenta, monto, fecha_de_vencimiento, cedula_cliente) 
VALUES (9, 900, '09-09-2024', 9);
INSERT INTO CUENTA_POR_COBRAR(id_cuenta, monto, fecha_de_vencimiento, cedula_cliente) 
VALUES (10, 1000, '10-10-2024', 10);



INSERT INTO FORMA_DE_PAGO(id_forma_pago, forma_pago) 
VALUES (1, 'Tarjeta debito');
INSERT INTO FORMA_DE_PAGO(id_forma_pago, forma_pago) 
VALUES (2, 'Tarjeta de crédito');
INSERT INTO FORMA_DE_PAGO(id_forma_pago, forma_pago) 
VALUES (3, 'Sinpe móvil');
INSERT INTO FORMA_DE_PAGO(id_forma_pago, forma_pago) 
VALUES (4, 'Transferencia bancaria');
INSERT INTO FORMA_DE_PAGO(id_forma_pago, forma_pago) 
VALUES (5, 'Sinpe móvil');
INSERT INTO FORMA_DE_PAGO(id_forma_pago, forma_pago) 
VALUES (6, 'Cuenta virtual');
INSERT INTO FORMA_DE_PAGO(id_forma_pago, forma_pago) 
VALUES (7, 'Criptomoneda');
INSERT INTO FORMA_DE_PAGO(id_forma_pago, forma_pago) 
VALUES (8, 'Efectivo');
INSERT INTO FORMA_DE_PAGO(id_forma_pago, forma_pago) 
VALUES (9, 'Vale');
INSERT INTO FORMA_DE_PAGO(id_forma_pago, forma_pago) 
VALUES (10, 'Cheque');


INSERT INTO ABONO (idCuenta, numero_de_cuota, fecha, monto, codigoPago)
VALUES (1, 1, '01-01-2023', 10.00, 1111);
INSERT INTO ABONO (idCuenta, numero_de_cuota, fecha, monto, codigoPago)
VALUES (2, 2, '02-02-2023', 20.00, 2222);
INSERT INTO ABONO (idCuenta, numero_de_cuota, fecha, monto, codigoPago)
VALUES (3, 3, '03-03-2023', 30.00, 3333);
INSERT INTO ABONO (idCuenta, numero_de_cuota, fecha, monto, codigoPago)
VALUES (4, 4, '04-04-2023', 40.00, 4444);
INSERT INTO ABONO (idCuenta, numero_de_cuota, fecha, monto, codigoPago)
VALUES (5, 5, '05-05-2023', 50.00, 5555);
INSERT INTO ABONO (idCuenta, numero_de_cuota, fecha, monto, codigoPago)
VALUES (6, 6, '06-06-2023', 60.00, 6666);
INSERT INTO ABONO (idCuenta, numero_de_cuota, fecha, monto, codigoPago)
VALUES (7, 7, '07-07-2023', 70.00, 7777);
INSERT INTO ABONO (idCuenta, numero_de_cuota, fecha, monto, codigoPago)
VALUES (8, 8, '08-08-2023', 80.00, 8888);
INSERT INTO ABONO (idCuenta, numero_de_cuota, fecha, monto, codigoPago)
VALUES (9, 9, '09-09-2023', 90.00, 9999);
INSERT INTO ABONO (idCuenta, numero_de_cuota, fecha, monto, codigoPago)
VALUES (10, 10, '10-10', 11.00, 0000);



