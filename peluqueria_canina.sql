



CREATE DATABASE veterinariaCanina DEFAULT CHARSET utf8;


USE veterinariaCanina;


CREATE TABLE Dueno (
DNI INT (10) NOT NULL  ,
Nombre VARCHAR (30) NOT NULL ,
Apellido VARCHAR (30) NOT NULL ,
Telefono VARCHAR (30) NOT NULL,
Direccion VARCHAR (50) NOT NULL ,
PRIMARY KEY (DNI)) CHARSET utf8;


CREATE TABLE Perro (
ID_Perro INT (10) NOT NULL AUTO_INCREMENT  ,
Nombre VARCHAR (30) NOT NULL ,
Fecha_nac DATE NOT NULL,
Sexo CHAR  NOT NULL,
DNI_dueno INT(10) NOT NULL,
PRIMARY KEY (ID_Perro) ,
CONSTRAINT DNI_dueno_fk
FOREIGN KEY (DNI_dueno) REFERENCES Dueno(DNI)
) CHARSET utf8;




CREATE TABLE Historial (
ID_Historial INT (10) NOT NULL AUTO_INCREMENT  ,
Fecha DATE NOT NULL,
Perro INT(10)  NOT NULL,
Descripcion VARCHAR(50) NOT NULL,
Monto DOUBLE NOT NULL,
PRIMARY KEY (ID_Historial) ,
CONSTRAINT  Perro_fk
FOREIGN KEY (Perro) REFERENCES Perro(ID_Perro)
) CHARSET utf8;




insert into dueno  
values (30419759, 'Dani', 'Lopez', '3512457897', 'Patria 700');


insert into dueno  
values (34769125, 'Lean', 'Salguero', '353459789', ' Sucre 350');


insert into dueno  
values (36138957, 'Pedro', 'Gonzalez', '3516987827', ' Tucuman 650');


insert into dueno  
values (33916789, 'Ivan', 'Alvarez', '351897462', ' Estrada  45');


insert into perro ( Nombre, Fecha_nac, Sexo, Dni_dueno)
values ( 'Gri', '2017-12-15', 'H', 34769125);


insert into perro ( Nombre, Fecha_nac, Sexo, Dni_dueno)
values ( 'Pipi', '2014-10-11', 'H', 30419759);


insert into perro ( Nombre, Fecha_nac, Sexo, Dni_dueno)
values ( 'Negro', '2020-03-12', 'H', 30419759);


insert into perro ( Nombre, Fecha_nac, Sexo, Dni_dueno)
values ( 'Trucha', '2021-05-05', 'M', 33916789);


insert into perro ( Nombre, Fecha_nac, Sexo, Dni_dueno)
values ( 'Savora', '2022-09-08', 'M', 36138957);


insert into perro ( Nombre, Fecha_nac, Sexo, Dni_dueno)
values ( 'Pinnot', '2018-12-09', 'M', 36138957);


insert into perro ( Nombre, Fecha_nac, Sexo, Dni_dueno)
values ( 'Igyy', '2010-11-05', 'M', 34769125);




insert into historial ( Fecha, Perro, Descripcion, Monto)
values ('2022-07-09', 6 , 'ConsultaBasica', 2000);


insert into historial ( Fecha, Perro, Descripcion, Monto)
values ('2022-07-06', 2 , 'ConsultaUrgencia', 4000);


insert into historial ( Fecha, Perro, Descripcion, Monto)
values ('2022-01-09', 1 , 'Peluqueria', 3000);


insert into historial ( Fecha, Perro, Descripcion, Monto)
values ('2020-03-15', 3 , 'Inyectable', 5000);


insert into historial ( Fecha, Perro, Descripcion, Monto)
values ('2018-12-09', 5 , 'Castracion', 7000);


insert into historial ( Fecha, Perro, Descripcion, Monto)
values ('2018-12-09', 4 , 'Internacion', 20000);


insert into historial ( Fecha, Perro, Descripcion, Monto)
values ('2006-05-04', 7 , 'Inyectable', 100);


## Resolucion de ejercicios

###  Realice la consulta correspondiente para crear la tabla Perro, teniendo en cuenta sus claves foráneas y primarias.

Ya realizado arriba

###  Inserte en la tabla correspondiente un nuevo animal (perro) como paciente y el dueño asociado a ese animal.
Ya realizado arriba

### Borre un animal que ya no va a ser atendido. Para ello consulte antes en el historial, algún animal que ya no sea atendido desde hace mucho tiempo.


select * 
from historial
order by Fecha;
delete from historial
where Perro=7;
delete from perro
where ID_Perro=7;

### Actualice la fecha de nacimiento de algún animal (perro) que usted considere.


update perro
set Fecha_nac = '2018-12-31'
where ID_Perro=6;

### Realice una consulta multitabla que arroje el nombre de todos los perros cuyos dueños se llaman Pedro

select p.Nombre
 from perro p
 inner join dueno d
 on d.DNI = p.DNI_dueno
 where d.Nombre = 'Pedro';
 

### Obtener todos los perros que asistieron a la peluquería en 2022


select p.Nombre 
 from perro  p
 inner join historial h
 on h.perro = p.ID_Perro 
 where year(Fecha) = 2022;

### Obtener los ingresos percibidos en Julio del 2022


select sum(Monto)
 from historial
 where year(fecha)=2022 AND month(fecha)=07;


### Insertar un nuevo registro en la tabla historial de un perro cuyo ID Perro es igual a 10.

insert into perro (ID_Perro ,Nombre, Fecha_nac, Sexo, Dni_dueno)
values ( 10,'Manchita', '2015-12-15', 'M', 34769125);


###  Escriba una consulta que permita actualizar la dirección de un dueño. Su nueva dirección es Libertad 123


update dueno
 set Direccion = "Dumesnil 248"
 where DNI= 34769125;


### Vaciar la tabla historial y resetear el contador del campo ID.

truncate historial;
 
### Obtener todos los dueños que tengan perros de menos de 5 años de edad que no hayan visitado la peluquería en el año 2022.


SELECT Nombre,  TIMESTAMPDIFF(YEAR,Fecha_nac,CURDATE()) AS edad
     FROM perro
     where Sexo = 'M'
     AND TIMESTAMPDIFF(YEAR,Fecha_nac,CURDATE()) <5;


### Obtener todos los perros de sexo “Macho” nacidos entre 2020 y 2022


SELECT * 
     from perro
     WHERE Sexo ='M'
     AND Fecha_nac BETWEEN '2020-01-01' AND '2022-12-31';















