-- Database: db_conductor_designado

-- DROP DATABASE IF EXISTS db_conductor_designado;

CREATE DATABASE db_conductor_designado
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'Spanish_Spain.1252'
    LC_CTYPE = 'Spanish_Spain.1252'
    LOCALE_PROVIDER = 'libc'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;

CREATE TABLE usuario (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
	correo VARCHAR(50) NOT NULL,
    password VARCHAR(50) NOT NULL,
    celular VARCHAR(50) NOT NULL,
    fecha_de_nacimiento DATE NOT NULL,
	genero VARCHAR(20) NOT NULL
);

CREATE TABLE conductor (
	numero_de_licencia_de_conducir VARCHAR(50) NOT NULL,
	fecha_de_vencimiento_de_la_licencia DATE NOT NULL,

	FOREIGN KEY (id) REFERENCES usuario(id)
) INHERITS (usuario);

CREATE TABLE vehiculo (
	id SERIAL PRIMARY KEY,
	modelo VARCHAR(50) NOT NULL,
	marca VARCHAR(50) NOT NULL,
	placa VARCHAR(30) NOT NULL,
	numero_de_seguro INT NOT NULL,
	id_conductor INT NOT NULL REFERENCES usuario(id)
		ON DELETE RESTRICT ON UPDATE RESTRICT
);

CREATE TABLE cliente (
	FOREIGN KEY (id) REFERENCES usuario(id)
) INHERITS (usuario);

CREATE TABLE servicio (
	id SERIAL PRIMARY KEY,
	nombre VARCHAR(50) NOT NULL,
	descripcion VARCHAR(100) NOT NULL
);

CREATE TABLE promocion (
	id SERIAL PRIMARY KEY,
	nombre VARCHAR(50) NOT NULL,
	descripcion VARCHAR(100) NOT NULL,
	descuento FLOAT NOT NULL,
	id_servicio INT NOT NULL REFERENCES servicio(id)
		ON DELETE RESTRICT ON UPDATE RESTRICT
);

CREATE TABLE solicitar_servicio (
	id SERIAL PRIMARY KEY,
	id_cliente INT NOT NULL REFERENCES usuario(id)
		ON DELETE RESTRICT ON UPDATE RESTRICT,
	id_servicio INT NOT NULL REFERENCES servicio(id)
		ON DELETE RESTRICT ON UPDATE RESTRICT
);

CREATE TABLE viajes (
	id SERIAL PRIMARY KEY,
	id_conductor INT NOT NULL REFERENCES usuario(id)
		ON DELETE RESTRICT ON UPDATE RESTRICT,
	id_solicitud INT NOT NULL REFERENCES solicitar_servicio(id)
		ON DELETE RESTRICT ON UPDATE RESTRICT,
	fecha DATE NOT NULL,
	origen VARCHAR(100) NOT NULL,
	destinos VARCHAR(150) NOT NULL,
	costo FLOAT NOT NULL,
	estado VARCHAR(30) NOT NULL
);

CREATE TABLE metodo_de_pago (
	id SERIAL PRIMARY KEY,
	tipo_de_metodo_de_pago VARCHAR(30) NOT NULL,
	numero_tarjeta INT NOT NULL,
	nombre_en_la_tarjeta VARCHAR(50) NOT NULL,
	fecha_vencimiento DATE NOT NULL,
	cvv_cvc INT NOT NULL,
	id_cliente INT NOT NULL REFERENCES usuario(id)
		ON DELETE RESTRICT ON UPDATE RESTRICT
);

CREATE TABLE transacciones (
	id SERIAL PRIMARY KEY,
	id_viaje INT NOT NULL REFERENCES viajes(id)
		ON DELETE RESTRICT ON UPDATE RESTRICT,
	fecha DATE NOT NULL,
	monto FLOAT NOT NULL,
	estado VARCHAR(30) NOT NULL,
	id_metodo INT NOT NULL REFERENCES metodo_de_pago(id)
		ON DELETE RESTRICT ON UPDATE RESTRICT
);