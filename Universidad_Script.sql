
CREATE DATABASE Universidad 
USE universidad;

CREATE TABLE departamento (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL
);

CREATE TABLE persona (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nif VARCHAR(9) UNIQUE,
    nombre VARCHAR(25) NOT NULL,
    apellido1 VARCHAR(50) NOT NULL,
    apellido2 VARCHAR(50),
    ciudad VARCHAR(25) NOT NULL,
    direccion VARCHAR(50) NOT NULL,
    telefono VARCHAR(9),
    fecha_nacimiento DATE NOT NULL,
    sexo ENUM('H', 'M') NOT NULL,
    tipo ENUM('profesor', 'alumno') NOT NULL
);

CREATE TABLE profesor (
    id_profesor INT UNSIGNED PRIMARY KEY,
    id_departamento INT UNSIGNED NOT NULL,
    FOREIGN KEY (id_profesor) REFERENCES persona(id),
    FOREIGN KEY (id_departamento) REFERENCES departamento(id)
);

 CREATE TABLE grado (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

CREATE TABLE asignatura (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    creditos FLOAT UNSIGNED NOT NULL,
    tipo ENUM('b�sica', 'obligatoria', 'optativa') NOT NULL,
    curso TINYINT UNSIGNED NOT NULL,
    cuatrimestre TINYINT UNSIGNED NOT NULL,
    id_profesor INT UNSIGNED,
    id_grado INT UNSIGNED NOT NULL,
    FOREIGN KEY(id_profesor) REFERENCES profesor(id_profesor),
    FOREIGN KEY(id_grado) REFERENCES grado(id)
);

CREATE TABLE curso_escolar (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    anyo_inicio YEAR NOT NULL,
    anyo_fin YEAR NOT NULL
);

CREATE TABLE alumno_se_matricula_asignatura (
    id_alumno INT UNSIGNED NOT NULL,
    id_asignatura INT UNSIGNED NOT NULL,
    id_curso_escolar INT UNSIGNED NOT NULL,
    PRIMARY KEY (id_alumno, id_asignatura, id_curso_escolar),
    FOREIGN KEY (id_alumno) REFERENCES persona(id),
    FOREIGN KEY (id_asignatura) REFERENCES asignatura(id),
    FOREIGN KEY (id_curso_escolar) REFERENCES curso_escolar(id)
);

INSERT INTO departamento VALUES (1, 'Inform�tica');
INSERT INTO departamento VALUES (2, 'Matem�ticas');
INSERT INTO departamento VALUES (3, 'Econom�a y Empresa');
INSERT INTO departamento VALUES (4, 'Educaci�n');
INSERT INTO departamento VALUES (5, 'Agronom�a');
INSERT INTO departamento VALUES (6, 'Qu�mica y F�sica');
INSERT INTO departamento VALUES (7, 'Filolog�a');
INSERT INTO departamento VALUES (8, 'Derecho');
INSERT INTO departamento VALUES (9, 'Biolog�a y Geolog�a');
 
 INSERT INTO persona VALUES (8, '79503962T', 'Cristina', 'Lemke', 'Rutherford', 'Almer�a', 'C/ Saturno', '669162534', '1977/08/21', 'M', 'profesor');
INSERT INTO persona VALUES (9, '82842571K', 'Ram�n', 'Herzog', 'Tremblay', 'Almer�a', 'C/ Urano', '626351429', '1996/11/21', 'H', 'alumno');
INSERT INTO persona VALUES (10, '61142000L', 'Esther', 'Spencer', 'Lakin', 'Almer�a', 'C/ Plut�n', NULL, '1977/05/19', 'M', 'profesor');
INSERT INTO persona VALUES (11, '46900725E', 'Daniel', 'Herman', 'Pacocha', 'Almer�a', 'C/ Andarax', '679837625', '1997/04/26', 'H', 'alumno');
INSERT INTO persona VALUES (12, '85366986W', 'Carmen', 'Streich', 'Hirthe', 'Almer�a', 'C/ Almanzora', NULL, '1971-04-29', 'M', 'profesor');
INSERT INTO persona VALUES (13, '73571384L', 'Alfredo', 'Stiedemann', 'Morissette', 'Almer�a', 'C/ Guadalquivir', '950896725', '1980/02/01', 'H', 'profesor');
INSERT INTO persona VALUES (14, '82937751G', 'Manolo', 'Hamill', 'Kozey', 'Almer�a', 'C/ Duero', '950263514', '1977/01/02', 'H', 'profesor');
INSERT INTO persona VALUES (15, '80502866Z', 'Alejandro', 'Kohler', 'Schoen', 'Almer�a', 'C/ Tajo', '668726354', '1980/03/14', 'H', 'profesor');
INSERT INTO persona VALUES (16, '10485008K', 'Antonio', 'Fahey', 'Considine', 'Almer�a', 'C/ Sierra de los Filabres', NULL, '1982/03/18', 'H', 'profesor');
INSERT INTO persona VALUES (17, '85869555K', 'Guillermo', 'Ruecker', 'Upton', 'Almer�a', 'C/ Sierra de G�dor', NULL, '1973/05/05', 'H', 'profesor');
INSERT INTO persona VALUES (18, '04326833G', 'Micaela', 'Monahan', 'Murray', 'Almer�a', 'C/ Veleta', '662765413', '1976/02/25', 'H', 'profesor');
INSERT INTO persona VALUES (19, '11578526G', 'Inma', 'Lakin', 'Yundt', 'Almer�a', 'C/ Picos de Europa', '678652431', '1998/09/01', 'M', 'alumno');
INSERT INTO persona VALUES (20, '79221403L', 'Francesca', 'Schowalter', 'Muller', 'Almer�a', 'C/ Quinto pino', NULL, '1980/10/31', 'H', 'profesor');
INSERT INTO persona VALUES (21, '79089577Y', 'Juan', 'Guti�rrez', 'L�pez', 'Almer�a', 'C/ Los pinos', '678652431', '1998/01/01', 'H', 'alumno');
INSERT INTO persona VALUES (22, '41491230N', 'Antonio', 'Dom�nguez', 'Guerrero', 'Almer�a', 'C/ Cabo de Gata', '626652498', '1999/02/11', 'H', 'alumno');
INSERT INTO persona VALUES (23, '64753215G', 'Irene', 'Hern�ndez', 'Mart�nez', 'Almer�a', 'C/ Zapillo', '628452384', '1996/03/12', 'M', 'alumno');
INSERT INTO persona VALUES (24, '85135690V', 'Sonia', 'Gea', 'Ruiz', 'Almer�a', 'C/ Mercurio', '678812017', '1995/04/13', 'M', 'alumno');
 
 INSERT INTO profesor VALUES (8, 3);
INSERT INTO profesor VALUES (10, 4);
INSERT INTO profesor VALUES (12, 4);
INSERT INTO profesor VALUES (13, 6);
INSERT INTO profesor VALUES (14, 1);
INSERT INTO profesor VALUES (15, 2);
INSERT INTO profesor VALUES (16, 3);
INSERT INTO profesor VALUES (17, 4);
INSERT INTO profesor VALUES (18, 5);
INSERT INTO profesor VALUES (20, 6);
 
 INSERT INTO grado VALUES (5, 'Grado en Ingenier�a Mec�nica (Plan 2010)');
INSERT INTO grado VALUES (6, 'Grado en Ingenier�a Qu�mica Industrial (Plan 2010)');
INSERT INTO grado VALUES (7, 'Grado en Biotecnolog�a (Plan 2015)');
INSERT INTO grado VALUES (8, 'Grado en Ciencias Ambientales (Plan 2009)');
INSERT INTO grado VALUES (9, 'Grado en Matem�ticas (Plan 2010)');
INSERT INTO grado VALUES (10, 'Grado en Qu�mica (Plan 2009)');
INSERT INTO grado VALUES (2, 'Grado en Ingenier�a El�ctrica (Plan 2014)');
INSERT INTO grado VALUES (3, 'Grado en Ingenier�a Electr�nica Industrial (Plan 2010)');

INSERT INTO asignatura VALUES (8, 'Fundamentos de electr�nica', 6, 'b�sica', 1, 2, 14, 4);
INSERT INTO asignatura VALUES (9, 'L�gica y algor�tmica', 6, 'b�sica', 1, 2, 3, 4);
INSERT INTO asignatura VALUES (10, 'Metodolog�a de la programaci�n', 6, 'b�sica', 1, 2, 14, 4);
INSERT INTO asignatura VALUES (11, 'Arquitectura de Computadores', 6, 'b�sica', 2, 1, 3, 4);
INSERT INTO asignatura VALUES (12, 'Estructura de Datos y Algoritmos I', 6, 'obligatoria', 2, 1, 3, 4);
INSERT INTO asignatura VALUES (13, 'Ingenier�a del Software', 6, 'obligatoria', 2, 1, 14, 4);
INSERT INTO asignatura VALUES (14, 'Sistemas Inteligentes', 6, 'obligatoria', 2, 1, 3, 4);
INSERT INTO asignatura VALUES (15, 'Sistemas Operativos', 6, 'obligatoria', 2, 1, 14, 4);
INSERT INTO asignatura VALUES (16, 'Bases de Datos', 6, 'b�sica', 2, 2, 14, 4);
INSERT INTO asignatura VALUES (17, 'Estructura de Datos y Algoritmos II', 6, 'obligatoria', 2, 2, 14, 4);
INSERT INTO asignatura VALUES (18, 'Fundamentos de Redes de Computadores', 6 ,'obligatoria', 2, 2, 3, 4);
INSERT INTO asignatura VALUES (19, 'Planificaci�n y Gesti�n de Proyectos Inform�ticos', 6, 'obligatoria', 2, 2, 3, 4);
INSERT INTO asignatura VALUES (20, 'Programaci�n de Servicios Software', 6, 'obligatoria', 2, 2, 14, 4);
INSERT INTO asignatura VALUES (21, 'Desarrollo de interfaces de usuario', 6, 'obligatoria', 3, 1, 14, 4);
INSERT INTO asignatura VALUES (22, 'Ingenier�a de Requisitos', 6, 'optativa', 3, 1, NULL, 4);
INSERT INTO asignatura VALUES (23, 'Integraci�n de las Tecnolog�as de la Informaci�n en las Organizaciones', 6, 'optativa', 3, 1, NULL, 4);
INSERT INTO asignatura VALUES (24, 'Modelado y Dise�o del Software 1', 6, 'optativa', 3, 1, NULL, 4);
INSERT INTO asignatura VALUES (25, 'Multiprocesadores', 6, 'optativa', 3, 1, NULL, 4);
INSERT INTO asignatura VALUES (26, 'Seguridad y cumplimiento normativo', 6, 'optativa', 3, 1, NULL, 4);
INSERT INTO asignatura VALUES (27, 'Sistema de Informaci�n para las Organizaciones', 6, 'optativa', 3, 1, NULL, 4); 
INSERT INTO asignatura VALUES (28, 'Tecnolog�as web', 6, 'optativa', 3, 1, NULL, 4);
INSERT INTO asignatura VALUES (29, 'Teor�a de c�digos y criptograf�a', 6, 'optativa', 3, 1, NULL, 4);
INSERT INTO asignatura VALUES (30, 'Administraci�n de bases de datos', 6, 'optativa', 3, 2, NULL, 4);
INSERT INTO asignatura VALUES (31, 'Herramientas y M�todos de Ingenier�a del Software', 6, 'optativa', 3, 2, NULL, 4);
INSERT INTO asignatura VALUES (32, 'Inform�tica industrial y rob�tica', 6, 'optativa', 3, 2, NULL, 4);
INSERT INTO asignatura VALUES (33, 'Ingenier�a de Sistemas de Informaci�n', 6, 'optativa', 3, 2, NULL, 4);
INSERT INTO asignatura VALUES (34, 'Modelado y Dise�o del Software 2', 6, 'optativa', 3, 2, NULL, 4);
INSERT INTO asignatura VALUES (35, 'Negocio Electr�nico', 6, 'optativa', 3, 2, NULL, 4);
INSERT INTO asignatura VALUES (36, 'Perif�ricos e interfaces', 6, 'optativa', 3, 2, NULL, 4);
INSERT INTO asignatura VALUES (37, 'Sistemas de tiempo real', 6, 'optativa', 3, 2, NULL, 4);
INSERT INTO asignatura VALUES (38, 'Tecnolog�as de acceso a red', 6, 'optativa', 3, 2, NULL, 4);
INSERT INTO asignatura VALUES (39, 'Tratamiento digital de im�genes', 6, 'optativa', 3, 2, NULL, 4);
INSERT INTO asignatura VALUES (40, 'Administraci�n de redes y sistemas operativos', 6, 'optativa', 4, 1, NULL, 4);
INSERT INTO asignatura VALUES (41, 'Almacenes de Datos', 6, 'optativa', 4, 1, NULL, 4);
INSERT INTO asignatura VALUES (42, 'Fiabilidad y Gesti�n de Riesgos', 6, 'optativa', 4, 1, NULL, 4);
INSERT INTO asignatura VALUES (43, 'L�neas de Productos Software', 6, 'optativa', 4, 1, NULL, 4);
INSERT INTO asignatura VALUES (44, 'Procesos de Ingenier�a del Software 1', 6, 'optativa', 4, 1, NULL, 4);
INSERT INTO asignatura VALUES (45, 'Tecnolog�as multimedia', 6, 'optativa', 4, 1, NULL, 4);
INSERT INTO asignatura VALUES (46, 'An�lisis y planificaci�n de las TI', 6, 'optativa', 4, 2, NULL, 4);
INSERT INTO asignatura VALUES (47, 'Desarrollo R�pido de Aplicaciones', 6, 'optativa', 4, 2, NULL, 4);
INSERT INTO asignatura VALUES (48, 'Gesti�n de la Calidad y de la Innovaci�n Tecnol�gica', 6, 'optativa', 4, 2, NULL, 4);
INSERT INTO asignatura VALUES (49, 'Inteligencia del Negocio', 6, 'optativa', 4, 2, NULL, 4);
INSERT INTO asignatura VALUES (50, 'Procesos de Ingenier�a del Software 2', 6, 'optativa', 4, 2, NULL, 4);
INSERT INTO asignatura VALUES (51, 'Seguridad Inform�tica', 6, 'optativa', 4, 2, NULL, 4);
INSERT INTO asignatura VALUES (52, 'Biologia celular', 6, 'b�sica', 1, 1, NULL, 7);
INSERT INTO asignatura VALUES (53, 'F�sica', 6, 'b�sica', 1, 1, NULL, 7);
INSERT INTO asignatura VALUES (54, 'Matem�ticas I', 6, 'b�sica', 1, 1, NULL, 7);
INSERT INTO asignatura VALUES (55, 'Qu�mica general', 6, 'b�sica', 1, 1, NULL, 7);
INSERT INTO asignatura VALUES (56, 'Qu�mica org�nica', 6, 'b�sica', 1, 1, NULL, 7);
INSERT INTO asignatura VALUES (57, 'Biolog�a vegetal y animal', 6, 'b�sica', 1, 2, NULL, 7);

INSERT INTO curso_escolar VALUES (2, 2015, 2016);
INSERT INTO curso_escolar VALUES (3, 2016, 2017);
INSERT INTO curso_escolar VALUES (4, 2017, 2018);

INSERT INTO alumno_se_matricula_asignatura VALUES (1, 3, 1);
INSERT INTO alumno_se_matricula_asignatura VALUES (2, 1, 1);
INSERT INTO alumno_se_matricula_asignatura VALUES (2, 2, 1);
INSERT INTO alumno_se_matricula_asignatura VALUES (2, 3, 1);
INSERT INTO alumno_se_matricula_asignatura VALUES (4, 1, 1);
INSERT INTO alumno_se_matricula_asignatura VALUES (4, 2, 1);
INSERT INTO alumno_se_matricula_asignatura VALUES (4, 3, 1);
INSERT INTO alumno_se_matricula_asignatura VALUES (24, 1, 5);
INSERT INTO alumno_se_matricula_asignatura VALUES (24, 2, 5);
INSERT INTO alumno_se_matricula_asignatura VALUES (24, 3, 5);
INSERT INTO alumno_se_matricula_asignatura VALUES (24, 4, 5);
INSERT INTO alumno_se_matricula_asignatura VALUES (24, 5, 5);
INSERT INTO alumno_se_matricula_asignatura VALUES (24, 6, 5);
INSERT INTO alumno_se_matricula_asignatura VALUES (24, 7, 5);
INSERT INTO alumno_se_matricula_asignatura VALUES (24, 8, 5);
INSERT INTO alumno_se_matricula_asignatura VALUES (24, 9, 5);
INSERT INTO alumno_se_matricula_asignatura VALUES (24, 10, 5);
INSERT INTO alumno_se_matricula_asignatura VALUES (23, 1, 5);
INSERT INTO alumno_se_matricula_asignatura VALUES (23, 2, 5);
INSERT INTO alumno_se_matricula_asignatura VALUES (23, 3, 5);
INSERT INTO alumno_se_matricula_asignatura VALUES (23, 4, 5);
INSERT INTO alumno_se_matricula_asignatura VALUES (23, 5, 5);
INSERT INTO alumno_se_matricula_asignatura VALUES (23, 6, 5);
INSERT INTO alumno_se_matricula_asignatura VALUES (23, 7, 5);
INSERT INTO alumno_se_matricula_asignatura VALUES (23, 8, 5);
INSERT INTO alumno_se_matricula_asignatura VALUES (23, 9, 5);
INSERT INTO alumno_se_matricula_asignatura VALUES (23, 10, 5);
INSERT INTO alumno_se_matricula_asignatura VALUES (19, 1, 5);
INSERT INTO alumno_se_matricula_asignatura VALUES (19, 2, 5);
INSERT INTO alumno_se_matricula_asignatura VALUES (19, 3, 5);
INSERT INTO alumno_se_matricula_asignatura VALUES (19, 4, 5);
INSERT INTO alumno_se_matricula_asignatura VALUES (19, 5, 5);