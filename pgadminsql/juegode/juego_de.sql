/*=============================
  = MADE BY JOSE ALBA ARRUFAT =
  =============================*/

/********************
 * CREAR LAS TABLAS *
 ********************/

CREATE TABLE casa(
	id integer,
	nombre VARCHAR(12),
	region VARCHAR(27),
	lema VARCHAR(38),
	PRIMARY KEY (id),
	CONSTRAINT startName CHECK (nombre NOT LIKE ' %'),
	CONSTRAINT endName CHECK (nombre NOT LIKE '% '),
	CONSTRAINT lemaNoN CHECK (lema NOT LIKE '%[0-9]%') /* <-- TENGO QUE ARREGLAR ESTO, NO ME LO PILLA */
);

CREATE TABLE lugar(
	id integer,
	nombre VARCHAR(31),
	tipo VARCHAR(18),
	PRIMARY KEY (id),
	CONSTRAINT rulesType CHECK (tipo IN ('Ciudad', 'Fortaleza'))
);

CREATE TABLE temporada(
	id integer,
	temporada VARCHAR(10) DEFAULT 'ESPECIAL',
	realse_date integer,
	PRIMARY KEY (id)
);

CREATE TABLE episodio(
	id integer,
	titulo VARCHAR(31),
	temporada integer,
	PRIMARY KEY (id),
	CONSTRAINT rulesSeason FOREIGN KEY (temporada) REFERENCES temporada(id)
);

CREATE TABLE personaje(
	id integer,
	nombre VARCHAR(31),
	casa integer,
	lugar integer,
	episodio integer,
	PRIMARY KEY (id),
	CONSTRAINT rulesHouse FOREIGN KEY (casa) REFERENCES casa(id),
	CONSTRAINT rulesPlace FOREIGN KEY (lugar) REFERENCES lugar(id),
	CONSTRAINT rulesEpisode FOREIGN KEY (episodio) REFERENCES episodio(id)
);

/*****************************
 * METER DATOS EN LAS TABLAS *
 *****************************/

INSERT INTO casa(id, nombre, region, lema)
VALUES
(1, 'Stark', 'Norte ', 'Se acerca el invierno'),
(2, 'Lannister', ' Oeste', 'los Lannister siempre pagan sus deudas'),
(3, 'Targarye', 'Este', 'Fuego y sangre'),
(4, 'Greyjoy', 'Islas del Hierro', 'Lo que está muerto nunca muere'),
(5, 'Tyrel', 'El Dominio,', 'Crece fuerte');

INSERT INTO lugar(id, nombre, tipo)
VALUES
(1, 'Invernalia', 'Ciudad'),
(2, 'Rocadragón', 'Fortaleza'),
(3, 'Desembarco del Rey', 'Ciudad'),
(4, 'Braavos', 'Ciudad'),
(5, 'Más allá del Muro', 'Ciudad');

INSERT INTO temporada(id, temporada, realse_date)
VALUES
(1, 1, 2011),
(2, 2, 2012),
(3, 3, 2013),
(4, 4, 2014),
(5, 5, 2015);

INSERT INTO episodio(id, titulo, temporada)
VALUES
(1, 'Se acerca el invierno', 1),
(2, 'El camino real', 2),
(3, 'Lord Nieve', 3),
(4, 'Invernalia', 4),
(5, 'El lobo y el león', 5);

INSERT INTO personaje(id, nombre, casa, lugar, episodio)
VALUES
(1, 'Jon Nieve', '1', '1', '1'),
(2, 'Daenerys Targaryen', '3', '2', '5'),
(3, 'Tyrion Lannister', '2', '3', '5'),
(4, 'Arya Stark', '1', '1', '5'),
(5, 'Euron Greyjoy', '4', '4', '5');