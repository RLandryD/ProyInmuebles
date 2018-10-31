DROP DATABASE proyectoFinal;
CREATE DATABASE proyectoFinal;
USE proyectoFinal;

/*RESIDENCIA, CAMPESTRE, ETC.*/
CREATE TABLE area_experiencia (
id int(11) unsigned NOT NULL AUTO_INCREMENT PRIMARY KEY,
nombre varchar(20) NOT NULL
);

/*USUARIOS*/
CREATE TABLE Usuario (
id int(11) unsigned NOT NULL AUTO_INCREMENT PRIMARY KEY,
correo varchar(50) NOT NULL UNIQUE,
password text,
tipo char(2) NOT NULL,
nombre varchar(30),
apellido_paterno varchar(30),
apellido_materno varchar(30),
calle varchar(20),
colonia varchar(20),
num_ext varchar(10),
num_int varchar(10),
telefono_fijo varchar(10),
telefono_celular varchar(10),
foto text, /*Almacena la ruta*/
estatus char(10)
);

/*REGISTRO DE CASAS EN VENTA*/
CREATE TABLE casa (
id int(11) unsigned NOT NULL AUTO_INCREMENT PRIMARY KEY,
costo DECIMAL(10,2),
calle varchar(50),
colonia varchar(50),
num_ext varchar(10),
num_int varchar(10),
habitaciones int,
medidas varchar(20)
);

CREATE TABLE foto (
id int(11) unsigned NOT NULL AUTO_INCREMENT PRIMARY KEY,
id_casa int(11) unsigned NOT NULL,
ruta text,
FOREIGN KEY (id_casa) REFERENCES casa(id)
);

/*PUBLICACIONES DE CASAS EN VENTA REALIZADAS POR UN
USUARIO CLIENTE*/
CREATE TABLE publicacion (
id int(11) unsigned NOT NULL AUTO_INCREMENT PRIMARY KEY,
id_usuario int(11) unsigned NOT NULL,
descripcion text,
fecha_publicacion timestamp NOT NULL DEFAULT now(),
estatus char(10),
id_casa int(11) unsigned NOT NULL,
FOREIGN KEY (id_usuario) REFERENCES usuario(id),
FOREIGN KEY (id_casa) REFERENCES casa(id)
);

/*TABLA QUE REGISTRA LAS PETICIONES DE COMPRA DE CASA
DE UN USUARIO CLIENTE QUE INDICA QUE LE INTERESA LA CASA,
PERO AÚN NO LA COMPRA.*/
CREATE TABLE peticion (
id int(11) unsigned NOT NULL AUTO_INCREMENT PRIMARY KEY,
id_usuario int(11) unsigned NOT NULL,
id_publicacion int(11) unsigned NOT NULL,
mensaje text,
estatus char(10),
FOREIGN KEY (id_usuario) REFERENCES usuario(id),
FOREIGN KEY (id_publicacion) REFERENCES publicacion(id)
);

/*SE REGISTRA LA VENTA UNA VEZ QUE LA PETICIÓN FUE ACEPTADA
POR EL ADMINISTRADOR Y SE REALIZA LA COMPRA/VENTA*/
CREATE TABLE venta (
id int(11) unsigned NOT NULL AUTO_INCREMENT PRIMARY KEY,
fecha timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
id_usuario int(11) unsigned NOT NULL,
id_casa int(11) unsigned NOT NULL,
total decimal(10, 2) NOT NULL,
FOREIGN KEY (id_usuario) REFERENCES usuario(id),
FOREIGN KEY (id_casa) REFERENCES casa(id)
);

/*TABLA QUE ALMACENA LAS CITAS DE UN PUBLICISTA
CON UN POSIBLE COMPRADOR*/
CREATE TABLE cita (
id int(10) unsigned NOT NULL AUTO_INCREMENT PRIMARY KEY,
id_contacto int(10) unsigned NULL, /*ES EL ID DEL USUARIO QUE REGISTRÓ LA CITA*/
fecha timestamp NULL, /*FECHA DE PROGRAMADA LA VISITA*/
motivo text,
estatus varchar(10),
id_publicacion int(11) unsigned NOT NULL,
id_usuario int(11) unsigned NOT NULL, /*RELACIONAR LA CITA CON UN USUARIO*/
FOREIGN KEY (id_publicacion) REFERENCES publicacion(id),
FOREIGN KEY (id_usuario) REFERENCES usuario(id)
);
