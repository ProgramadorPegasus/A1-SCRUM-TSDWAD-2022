CREATE DATABASE pelucaninas;
USE pelucaninas;

CREATE TABLE `pelucaninas`.`dueno` (
  `DNI` INT NOT NULL,
  `NOMBRE` VARCHAR(45) NOT NULL,
  `APELLIDO` VARCHAR(45) NOT NULL,
  `TELEFONO` INT NOT NULL,
  `DIRECCION` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`DNI`))
COMMENT = 'Registrar datos del dueño de la mascota.';

CREATE TABLE `pelucaninas`.`perro` (
  `idPERRO` INT NOT NULL,
  `NOMBRE` VARCHAR(45) NOT NULL,
  `FECHA_NAC` DATE NOT NULL,
  `SEXO` VARCHAR(20) NULL,
  `DNI_DUENO` INT NOT NULL,
  PRIMARY KEY (`idPERRO`),
  INDEX `DUENO_idx` (`DNI_DUENO` ASC) VISIBLE,
  CONSTRAINT `DUENO`
    FOREIGN KEY (`DNI_DUENO`)
    REFERENCES `pelucaninas`.`dueno` (`DNI`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
COMMENT = 'Registrar datos de la mascota';

CREATE TABLE `pelucaninas`.`historial` (
  `idHISTORIAL` INT NOT NULL,
  `FECHA` DATE NOT NULL,
  `PERRO` INT NOT NULL,
  `DESCRIPCION` VARCHAR(60) NOT NULL,
  `MONTO` INT NOT NULL,
  PRIMARY KEY (`idHISTORIAL`),
  INDEX `PERRO_idx` (`PERRO` ASC) VISIBLE,
  CONSTRAINT `PERRO`
    FOREIGN KEY (`PERRO`)
    REFERENCES `pelucaninas`.`perro` (`idPERRO`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)





insert into dueno  
values (12457809, 'celes', 'Fernandez', '1562034777', 'Piedras 2881');
insert into dueno  
values (28122001, '	Maria', 'Yamasaki', '1530024111', 'Entre Rios 2021');
insert into dueno  
values (8145001, 'Ubaldino', 'Arevalo', '47412687', 'Cascada 23');
 insert into dueno  
values (4123654, 'Marta', 'Isarraulde', '45426311', 'Margaritas 666');
insert into dueno  
values (27243589, 'Anabel', 'Bermudez', '45713265', 'posadas 2700');

insert into perro ( idPERRO, NOMBRE, FECHA_NAC, Sexo, DNI_DUENO) 
values ( 001,'Luna', '2007-02-17', 'HEMBRA', 12457809);
insert into perro ( idPERRO, NOMBRE, FECHA_NAC, Sexo, DNI_DUENO) 
values ( 002,'SAKURA', '2010-10-24', 'HEMBRA', 28122001);
insert into perro ( idPERRO, NOMBRE, FECHA_NAC, Sexo, DNI_DUENO) 
values ( 003,'CACIQUE', '2016-05-03', 'MACHO', 28122001);
insert into perro ( idPERRO, NOMBRE, FECHA_NAC, Sexo, DNI_DUENO) 
values ( 004,'CHICHO', '2020-08-01', 'MACHO', 8145001)	;
insert into perro ( idPERRO, NOMBRE, FECHA_NAC, Sexo, DNI_DUENO) 
values (005, 'PRINCESA', '2021-03-05', 'HEMBRA', 4123654);

insert into historial ( idHISTORIAL,FECHA, PERRO, DESCRIPCION, MONTO)
values (001,'2022-02-09', 002 , 'ConsultaControl', 2000);
insert into historial ( idHISTORIAL,FECHA, PERRO, DESCRIPCION, MONTO)
values (002,'2020-05-25', 003 , 'Consultaurgencia', 10000);
insert into historial ( idHISTORIAL,FECHA, PERRO, DESCRIPCION, MONTO)
values (003,'2022-03-15', 003 , 'vacunas', 5000);
insert into historial ( idHISTORIAL,FECHA, PERRO, DESCRIPCION, MONTO)
values (004,'2022-06-30', 001 , 'ConsultaRutina', 3000);
insert into historial ( idHISTORIAL,FECHA, PERRO, DESCRIPCION, MONTO)
values (004,'2022-10-15', 004 , 'ConsultaRutina', 3000);

### Inserte en la tabla correspondiente un nuevo animal (perro) como paciente y eldueño asociado a ese animal###.
insert into dueno 
values( 27021478,   'Beatriz', 'Boyra', '351460021', 'Coronel 1700');
insert into perro ( idPERRO, NOMBRE, FECHA_NAC, Sexo, DNI_DUENO) 
values (006, 'LEON', '2022-04-05', 'Macho', 27021478);
###Actualice la fecha de nacimiento de algún animal (perro)###
update Perro
set FECHA_NAC = '2016-4-20'
where idPERRO=003;

