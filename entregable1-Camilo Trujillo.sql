create database blog_db;

-- ============= USERS ==================

create table users (
	id serial primary key,
	first_name varchar(50),
	last_name varchar(50),
	email varchar(50)
);

insert into users (first_name, last_name, email) values
('Rick', 'Sanchez', 'carloss@mail.com'),
('Carlos', 'Martinez', 'cmartinez@mail.com'),
('Andrea', 'Vasquez', 'andreav@mail.com');

select * from users;

-- ============== POSTS ===================

create table posts (
	id serial primary key,
	creator_id int references users(id),
	title varchar(50),
	text text
);

insert into posts (creator_id, title, text) values
(1, '¿Qué es Lorem Ipsum?', 'es simplemente el texto de relleno de las imprentas y archivos de texto. Lorem Ipsum ha sido el texto de relleno estándar de las industrias desde el año 1500'),
(2, '¿Por qué lo usamos?', 'Es un hecho establecido hace demasiado tiempo que un lector se distraerá con el contenido del texto de un sitio mientras que mira su diseño.'),
(2, '¿De dónde viene?', 'Al contrario del pensamiento popular, el texto de Lorem Ipsum no es simplemente texto aleatorio'),
(3, '¿Dónde puedo conseguirlo?', 'Hay muchas variaciones de los pasajes de Lorem Ipsum disponibles.'),
(3, 'El pasaje estándar usado desde el año 1500.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.');

select * from posts;

-- ============== LIKES ======================
create table likes (
	id serial primary key,
	user_id int references users(id),
	post_id int references posts(id)
);

insert into likes (user_id, post_id) values
(2, 1),
(3, 2),
(1, 4),
(1, 3),
(1, 5);

select * from likes;

-- Trae todos los posts y la información del usuario del campo creator_id
-- users - posts
select * from users inner join posts
on posts.creator_id = users.id;

 -- o --
 
select U.first_name, U.last_name, P.title, P.text 
from users U inner join posts P
on P.creator_id = U.id;

-- Trae todos los posts, con la información de los usuarios que les dieron like.
-- posts - likes - users
select * from posts inner join likes
on likes.post_id = posts.id inner join users
on users.id = likes.user_id; 

 -- o --
select P.title, P.text, U.first_name, U.last_name, U.email 
from posts P inner join likes L
on L.post_id = P.id inner join users U
on U.id = L.user_id; 


