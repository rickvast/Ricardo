DROP DATABASE IF EXISTS bd_hospital;
CREATE DATABASE bd_hospital CHARACTER SET utf8mb4;

USE bd_hospital;

CREATE TABLE hospitales (
  cod_hospital INTEGER,
  nombre       VARCHAR(50),
  direccion    VARCHAR(50),
  num_plazas   INTEGER
);

CREATE TABLE personas (
  cod_hospital INTEGER,
  dni          INTEGER PRIMARY KEY,
  apellidos    VARCHAR(50),
  funcion      VARCHAR(30),
  salario      INTEGER,
  FOREIGN KEY (cod_hospital) REFERENCES hospitales(cod_hospital)
);

CREATE TABLE medicos (
  cod_hospital  INTEGER,
  dni           INTEGER PRIMARY KEY,
  apellidos     VARCHAR(50),
  especialidad  VARCHAR(50),
  FOREIGN KEY (cod_hospital) REFERENCES hospitales(cod_hospital)
);

INSERT INTO hospitales VALUES (1, 'Rafael Méndez', 'Gran Vía,  7', 250);
INSERT INTO hospitales VALUES (2, 'Reina Sofía', 'Junterones,  5', 225);
INSERT INTO hospitales VALUES (3, 'Príncipe Asturias', 'Avenida Colón', 150);
INSERT INTO hospitales VALUES (4, 'Virgen de la Arrixaca', 'Avenida Juan Carlos I', 250);

INSERT INTO personas VALUES (1, 12345678, 'García Hernández,  Eladio', 'CONSERJE', 1200);
INSERT INTO personas VALUES (1, 87654321, 'Fuentes Bermejo,  Carlos', 'DIRECTOR', 2000);
INSERT INTO personas VALUES (2, 55544433, 'González Marín,  Alicia', 'CONSERJE', 1200);
INSERT INTO personas VALUES (1, 66655544, 'Castillo Montes,  Pedro', 'MEDICO', 1700);
INSERT INTO personas VALUES (2, 22233322, 'Tristán García,  Ana', 'MEDICO', 1900);
INSERT INTO personas VALUES (3, 55544411, 'Ruiz Hernández,  Caridad', 'MEDICO', 1900);
INSERT INTO personas VALUES (3, 99988333, 'Serrano Díaz,  Alejandro', 'DIRECTOR', 2400);
INSERT INTO personas VALUES (4, 33222111, 'Mesa del Castillo,  Juan', 'MEDICO', 2200);
INSERT INTO personas VALUES (2, 22233333, 'Martínez Molina,  Andrés', 'MEDICO', 1600);
INSERT INTO personas VALUES (4, 55544412, 'Jiménez Jiménez,  Dolores', 'CONSERJE', 1200);
INSERT INTO personas VALUES (4, 22233311, 'Martínez Molina,  Gloria', 'MEDICO', 1600);

INSERT INTO medicos VALUES (1, 66655544, 'Castillo Montes,  Pedro', 'PSIQUIATRA');
INSERT INTO medicos VALUES (2, 22233322, 'Tristán García,  Ana', 'CIRUJANO');
INSERT INTO medicos VALUES (4, 33222111, 'Mesa del Castillo,  Juan', 'DERMATOLOGO');
INSERT INTO medicos VALUES (2, 22233333, 'Martínez Molina,  Andrés', 'CIRUJANO');
INSERT INTO medicos VALUES (4, 22233311, 'Martínez Molina,  Gloria', 'PSIQUIATRA');