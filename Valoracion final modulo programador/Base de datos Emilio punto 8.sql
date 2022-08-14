/*Punto 1. Crear base de datos y tablas*/
DROP DATABASE IF EXISTS peluqueriacanina;

CREATE DATABASE peluqueriacanina;
USE peluqueriacanina;

CREATE TABLE dueno (
DNI int PRIMARY KEY NOT NULL,
Nombre varchar(30) NOT NULL, 
Apellido varchar(25) NOT NULL, 
Telefono int NOT NULL, 
Direccion varchar(50)
);

CREATE TABLE perro (
ID_Perro int PRIMARY KEY NOT NULL auto_increment, 
Nombre varchar(30) NOT NULL, 
Fecha_nacimiento date NULL, 
Sexo varchar(15) NOT NULL,
DNI_Dueno int,
constraint fk_DNI_Dueno FOREIGN KEY(DNI_Dueno) REFERENCES Dueno(DNI)
);

CREATE TABLE historial (
ID_Historial int PRIMARY KEY  NOT NULL auto_increment,
Fecha DATETIME NOT NULL,
Descripcion varchar(200) NULL, 
Monto DOUBLE NOT NULL,
Perro int,
constraint fk_Perro FOREIGN KEY(Perro) REFERENCES Perro(ID_Perro) 
);

/*Punto 2. Agregar nuevo animal y dueño asociado*/
INSERT INTO peluqueriacanina.Dueno (
DNI, Nombre, Apellido, Telefono, Direccion)
VALUES(36525227, "Carla", "Fernandez", 35165141, "Brasil 455");

INSERT INTO peluqueriacanina.Perro (
Nombre, Fecha_nacimiento, Sexo, DNI_dueno)
VALUES("Colita", "2012-10-12", "Femenino", 36525227);

/*Punto 9. Actualizar la dirección del dueño*/
SELECT*FROM peluqueriacanina.Dueno; #Consulto los datos de los dueños

UPDATE peluqueriacanina.Dueno
SET Direccion = "Libertad 123"
WHERE DNI =36525227;

SELECT*FROM peluqueriacanina.Dueno; #Consulto los datos del dueño para verificar que cambió la dirección

/*Punto 4 Actualizar fecha nacimiento perro 
/*Punto 8 Insertar un nuevo registro en la tabla historial de un perro cuyo ID Perro es igual a 10, Emilio vera

UPDATE `peluqueriacanina`.`perro` SET `Fecha_nacimiento` = '2015-05-08' WHERE (`ID_Perro` = '1');
INSERT INTO `peluqueriacanina`.`historial` (`ID_Historial`, `Fecha`, `Descripcion`, `Monto`, `Perro`) VALUES ('10', '2022-08-13', 'CortePelo', '2000', '1');

