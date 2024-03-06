
/*********************************************
 * 1. CREAR TABLAS Y INSERTAR COSAS EN ELLAS *
 *********************************************/

CREATE TABLE prueba(
	id integer,
	nombre VARCHAR(45),
	apellido VARCHAR(45),
	PRIMARY KEY(id)
);

CREATE TABLE prueba2(
	id integer,
	informe VARCHAR(24),
	id_prueba integer,
	PRIMARY KEY(id),
	CONSTRAINT reglasIdForeign FOREIGN KEY (id_prueba) REFERENCES prueba(id)
);

INSERT INTO prueba(id, nombre, apellido)
VALUES
(1, 'Pepe', 'García'),
(2, 'Primo', 'Manolo');

INSERT INTO prueba2(id, informe, id_prueba)
VALUES
(1, 'Drogadicto profesional', 1),
(2, 'FFVII', 2);

/***********************************************************************************
 * 2. AÑADIR COLUMNAS EN TABLAS YA CREADAS, RENOMBRARLAS, MODIFICARLAS Y BORRARLAS *
 ***********************************************************************************/

CREATE TABLE volatil(
	id integer
);

/*CREA UNA NUEVA COLUMNA*/
ALTER TABLE volatil
ADD columna_volail VARCHAR(1);

/*RENOMBRAR COLUMNA*/
ALTER TABLE volatil
RENAME COLUMN columna_volail TO columna_volail_;

/*MODIFICAR FORMATO DE LA COLUMNA*/
ALTER TABLE volatil
MODIFY COLUMN columna_volail_ VARCHAR(11);

ALTER TABLE volatil
ALTER COLUMN columna_volail_ TYPE integer USING (columna_volail_::integer);
/*AQUÍ USO EL USING PARA TRANSFORMAR A UN VARCHAR A UN FORMATO NUMERICO COMO ES INTEGER
SI AHORA LO QUISIESE CAMBIAR A UN tinyint o numeric funcionaría porque es un formato numerico*/
ALTER TABLE volatil
ALTER COLUMN columna_volail_ TYPE numeric;
/*CUANDO ERA VARCHAR, SE PODRÍA PASAR A FORMATOS de TEXTO SIN TENER QUE USAR EL USING*/

/*BORRAR COLUMNA*/
ALTER TABLE volatil
DROP columna_volail_;