CREATE TABLE "users"
(
	"code_user" integer,
	"naame" character varying(26),
	"surname" character varying(46),
    "email" character varying(41),
	"password" character varying(100),
	PRIMARY KEY (code_user)
);

INSERT INTO users (code_user, naame, surname, email, password)
VALUES 
(1, 'Pepe', 'Manito', 'pepemrbeast@hotmail.com', '123456789A'),
(2, 'Robotnik', 'Ivo', 'robotnik@egg.com', 'dMv!d5b0Ns8K:w^6m9M_Vg62~RwG)l,nuP5;g!J5d>5Z<9bnFlRDyF>bz"poN3X80Zh_6s1XLxE/{9r_=t6^q;nJ$u[#*T:8-Rz7'),
(3, 'Benito', 'Camela', 'benitocamelaxd@gmail.com', 'jaja_MiContraseÑAesSegurisimaaA!!_'),
(4, 'Alberto', 'Wellington', 'amnesiacshin@gmail.com', 'MiPadreEsRakiDub');


CREATE TABLE "movie"
(
	"title" character varying(46) UNIQUE,
	"director" character varying(36),
	"realse_date" date,
	"duration" smallint,
	"descrip" text,
	PRIMARY KEY (title, realse_date)
);

CREATE TABLE "series"
(
	"title" character varying(46) UNIQUE,
	"creator" character varying(26),
	"realse_date" date,
	"actual_season" integer,
	"descrip" text,
	PRIMARY KEY (title, realse_date)
);

INSERT INTO movie (title, director, realse_date, duration, descrip)
VALUES 
('Manolo ataca de nuevo', 'Pepe', '11-1-2011', 150, 'descripcion ingeniosa'),
('Emrl', 'Ivo', '11-1-2011', 145, 'descripcion ingeniosa'),
('Wahoo', 'Luiwi', '11-1-2011', 275, 'descripcion ingeniosa'),
('Autodestruccion', 'Sawasiro', '11-1-2011', 150, 'descripcion ingeniosa');

INSERT INTO series (title, creator, realse_date, actual_season, descrip)
VALUES 
('Sonic X', 'for kids', '11-1-2011', 9, 'descripcion ingeniosa'),
('Ricardo y Mortero', 'idk', '11-1-2011', 11, 'descripcion ingeniosa'),
('Aventura de hora', 'Pedro', '11-1-2011', 14, 'descripcion ingeniosa'),
('la Única Pieza', 'Miyazaki', '11-1-2011', 1034, 'descripcion ingeniosa');

CREATE TABLE "type"
(
	"idn" character varying(5),
	PRIMARY KEY (idn),
	"movie" character varying(46),
	"serie" character varying(46),
    CONSTRAINT rulesMovie FOREIGN KEY (movie) REFERENCES movie(title),
    CONSTRAINT rulesSerie FOREIGN KEY (serie) REFERENCES series(title),
	"genero" character varying(16) DEFAULT 'definir'
); 

INSERT INTO type (idn, movie, serie, genero)
VALUES
('ABCD1', 'Manolo ataca de nuevo', NULL, 'Accion'),
('ABCD2', 'Emrl', NULL, 'Aventuras'),
('ABCD3', 'Wahoo', NULL, 'Comedia'),
('ABCD4', 'Autodestruccion', NULL, 'Accion'),
('BACD1', NULL, 'Sonic X', 'Aventuras'),
('BACD2', NULL, 'Ricardo y Mortero', 'Comedia'),
('BACD3', NULL, 'Aventura de hora', 'Aventuras'),
('BACD4', NULL, 'la Única Pieza', 'Aventuras');

