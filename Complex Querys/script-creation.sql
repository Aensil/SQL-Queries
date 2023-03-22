CREATE DATABASE Salas;

USE Salas;

CREATE TABLE Escritorio (
	id_escritorio int,
    patas int,
    color varchar(255),
    dimensiones float,
    materiales VARCHAR(255)
);

CREATE TABLE Sillas (
	id_silla int,
    espaldar BOOLEAN,
    color VARCHAR(255),
    material VARCHAR(255)
);

CREATE TABLE computador (
	serie VARCHAR(255),
    marca VARCHAR(255),
    modelo VARCHAR(255)
    torres VARCHAR(255),
    teclado VARCHAR(255)
    mouse VARCHAR(255),
    cables VARCHAR(255)
);

CREATE TABLE escritorio_Sillas (
	id_escritorio int,
    id_silla int,
    Fecha_uso TIMESTAMP
);

CREATE internet (
	velocidad float,
    tipo_de_conexion VARCHAR(255),
    id_internet int
);


SELECT *
FROM Escritorio;
    
