-- tarea 5
-- Estefani Valverde carné 2021554564

-- esquema 


drop database if exists blockbuster;
create database if not exists blockbuster;
use blockbuster;

drop table if exists customer;
drop table if exists movie_category;
drop table if exists movie;
drop table if exists rental;


create table if not exists customer (
	id int primary key auto_increment, -- cedula
    first_name varchar(50) not null,
    last_name varchar(50) not null,
    cell_phone varchar(15) not null,
    address varchar(200) default 'N/A'
);

create table if not exists movie_category(
 id int primary key auto_increment,
 category_name varchar (30) not null
);

create table  if not exists movie (
	id int primary key auto_increment,
    title varchar(100) not null,
    release_date timestamp not null,
    category_id int not null,
    constraint movie_category_id_fk foreign key (category_id) references movie_category (id)
);

create table if not exists rental (
	id int not null auto_increment unique,
    customer_id int not null,
    movie_id int not null unique,
    rental_date timestamp not null,
    return_date timestamp not null,
    primary key (customer_id, movie_id),
	constraint rental_customer_id_fk foreign key (customer_id) references customer (id),
	constraint rental_movie_id_fk foreign key (movie_id) references movie(id)
);


-- Datos
insert into customer (first_name, last_name, cell_phone, address) values
('Juan', 'Perez', '0999999999', 'Quito'),
('Ana', 'Lopez', '0999999999', 'Quito'),
('Maria', 'Gomez', '0999999999', 'Quito'),
('Pedro', 'Jimenez', '0999999999', 'Quito'),
('Javier', 'Sanchez', '0999999999', 'Quito'),
('Andrea', 'Rodriguez', '0999999999', 'Quito'),
('Luis', 'Gonzalez', '0999999999', 'Quito'),
('Carlos', 'Diaz', '0999999999', 'Quito'),
('Jorge', 'Martinez', '0999999999', 'Quito'),
('Fernando', 'Perez', '0999999999', 'Quito');

insert into movie_category (category_name) values
('Accion'),
('Comedia'),
('Drama'),
('Terror'),
('Suspenso'),
('Ciencia Ficcion'),
('Musical'),
('Infantil'),
('Documental'),
('Romance');

insert into movie (title , release_date, category_id) values
('Avengers Endgame', '2019-04-26 00:00:00', 1),
('Toy Story 4', '2019-06-21 00:00:00', 8),
('Spiderman Far From Home', '2019-07-05 00:00:00', 1),
('Aladdin', '2019-05-24 00:00:00', 7),
('John Wick 3', '2019-05-17 00:00:00', 1),
('Godzilla 2', '2019-05-31 00:00:00', 6),
('El Rey Leon', '2019-07-19 00:00:00', 7),
('It 2', '2019-09-06 00:00:00', 4),
('Joker', '2019-10-04 00:00:00', 5),
('Terminator Dark Fate', '2019-11-01 00:00:00', 6);

insert into rental (customer_id, movie_id, rental_date, return_date) values
(1, 1, '2019-11-01 00:00:00', '2019-11-03 00:00:00'),
(1, 2, '2019-11-01 00:00:00', '2019-11-03 00:00:00'),
(1, 3, '2019-11-01 00:00:00', '2019-11-03 00:00:00'),
(2, 4, '2019-11-01 00:00:00', '2019-11-03 00:00:00'),
(2, 5, '2019-11-01 00:00:00', '2019-11-03 00:00:00'),
(2, 6, '2019-11-01 00:00:00', '2019-11-03 00:00:00'),
(3, 7, '2019-11-01 00:00:00', '2019-11-03 00:00:00'),
(3, 8, '2019-11-01 00:00:00', '2019-11-03 00:00:00'),
(3, 9, '2019-11-01 00:00:00', '2019-11-03 00:00:00'),
(4, 10, '2019-11-01 00:00:00', '2019-11-03 00:00:00');



-- Mostrar la Cédula, Nombre, Apellido y Teléfono Celular de los clientes que han pedido prestada una película al video, no importa si el préstamo está activo o no.

select 
c.id, c.first_name, c.last_name, c.cell_phone, r.movie_id, m.title
from 
customer c 
inner join rental r on c.id = r.customer_id
left join movie m on r.movie_id = m.id;

-- Mostrar la cantidad de préstamos activos por cédula.
select 
c.id, 
r.rental_date,
m.title,
datediff(now(), r.rental_date) as days_in_rental
from 
rental as r
inner join customer c on r.customer_id = c.id
inner join movie m on r.movie_id = m.id
where 
datediff(now(), r.rental_date) <= 3;

-- Mostrar la cantidad de préstamos inactivos existentes por cédula.
select 
c.id, 
r.rental_date,
m.title,
datediff(now(), r.rental_date) as days_in_rental
from 
rental as r
inner join customer c on r.customer_id = c.id
inner join movie m on r.movie_id = m.id
where 
datediff(now(), r.rental_date) > 3;

-- Mostrar el total de préstamos inactivos existentes .
select 
count(*)
from 
rental r 
where
datediff(now(), r.rental_date) > 3;

-- Mostrar a todos aquellos clientes que nunca han realizado un préstamo.
select 
c.id, 
c.first_name, 
c.last_name, 
c.cell_phone, 
r.id, 
r.movie_id
from 
customer c 
left join rental r on c.id = r.customer_id 
where r.id is null;

-- Actualizar el campo Dirección y poner Guanacaste, del cliente con cédula 10.
update customer set address = 'Guanacaste' where id = 10;

-- Mostrar la cédula, nombre, apellido de los clientes que tienen entre 1 y 3 préstamos activos.
select
c.id,
concat(c.first_name, ' ', c.last_name) as customer,
count(*) as number_of_rentals
from 
customer c
inner join rental r on c.id = r.customer_id
group by 
r.customer_id
having
number_of_rentals >= 0 and number_of_rentals <= 3;

-- Listar todas las películas de la categoría “Comedia”.
select
* 
from 
movie as m inner join movie_category as c on m.category_id = c.id 
where c.category_name = 'Comedy';

-- Listas todas las películas prestadas de la categoría “Comedia”.
select
* 
from 
rental as r inner join movie m on r.movie_id = m.id 
inner join movie_category as c on m.category_id = c.id 
where c.category_name = 'Comedy';
 
-- Listar cuántas películas existen por categoría, por ejemplo: 3 de Comedia, 2 de Drama, 4 de Ciencia Ficción, etc.
select
c.category_name,
count(*) as number_of_movies
from
movie as m inner join movie_category as c on m.category_id = c.id
group by
c.category_name;