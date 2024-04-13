CREATE TABLE Caballeros (
id_caballero SERIAL PRIMARY KEY,
categoria_id INTEGER,
nombre VARCHAR(50) NOT NULL,
peso FLOAT,
fecha_nacimiento DATE,
armadura VARCHAR(50) 
);

CREATE TABLE Categorias (
id_categoria SERIAL PRIMARY KEY,
nombre VARCHAR(50) NOT NULL
);

CREATE TABLE Tecnicas (
id_tecnica SERIAL PRIMARY KEY,
nombre VARCHAR(50) NOT NULL
);

CREATE TABLE Caballero_Tecnica (
caballero_id INTEGER REFERENCES Caballeros(id_caballero),
tecnica_id INTEGER REFERENCES Tecnicas(id_tecnica),
PRIMARY KEY (caballero_id, tecnica_id)
);

INSERT INTO Categorias (nombre) VALUES
('Bronce'),
('Plata'),
('Oro');

INSERT INTO Tecnicas (nombre)
VALUES
('Meteoros de Pegaso'),
('Colera del Dragon'),
('Polvo de Diamantes'),
('Tormenta de Hielo'),
('Cadena de Andromeda'),
('Rayo de Plasma'),
('Galaxian Explosion'),
('Ondas del Infierno'),
('Flecha de Oro'),
('Gran Rayo de la Oscuridad');

INSERT INTO Caballeros (categoria_id, nombre, peso, fecha_nacimiento, armadura)
VALUES
(1, 'Seiya', 70.5, '1986-12-01', 'Pegaso'),
(1, 'Shiryu', 72.3, '1986-10-04', 'Dragon'),
(1, 'Hyoga', 68.0, '1986-01-23', 'Cisne'),
(1, 'Shun', 55.0, '1986-09-09', 'Andromeda'),
(2, 'Argol', 80.0, '1987-11-02', null),
(3, 'Aiolos', 80.0, '1960-10-30', 'Sagitario'),
(3, 'Milo', 75.0, '1974-05-09', 'Escorpio'),
(3, 'Aldebaran', 95.0, '1966-04-08', 'Tauro'),
(1, 'Ikki', 72.0, '1970-08-15', 'Fenix'),
(1, 'Geki', 90.0, '1987-05-20', null),
(2, 'Albafica', 68.0, '1988-03-05', null),
(3, 'Saga', 82.0, '1965-05-30', 'Geminis'),
(2, 'Regulus', 76.0, '1989-02-16', 'Leo'),
(1, 'Ban', 75.0, '1988-07-07', null),
(3, 'Aioria', 85.0, '1964-11-30', null);


INSERT INTO Caballero_Tecnica (caballero_id, tecnica_id)
VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 8),
(2, 2),
(2, 4),
(2, 6),
(2, 7),
(3, 4),
(3, 5),
(3, 6),
(3, 8),
(4, 3),
(4, 5),
(4, 9),
(4, 6),
(4, 7),
(4, 8),
(5, 1),
(5, 2),
(5, 4),
(5, 6),
(6, 2),
(6, 3),
(6, 4),
(6, 8),
(7, 1),
(7, 2),
(7, 3),
(7, 4),
(8, 1),
(8, 3),
(8, 4),
(8, 6),
(9, 1),
(9, 2),
(10, 2),
(10, 3),
(10, 4),
(10, 5),
(10,1);

/**********************************************************
 * 1. CONSULTA EL NOMBRE Y LA CATEGORÍA DE CADA CABALLERO *
 **********************************************************/
 SELECT Caballeros.nombre, Categorias.nombre AS "Categoria" FROM Caballeros INNER JOIN Categorias ON Caballeros.categoria_id = Categorias.id_categoria;

/*************************************************************************
 * 2. CONSULTA EL NOMBRE DE CADA CABALLERO Y TODAS LAS TÉCNICAS QUE SABE *
 *************************************************************************/
 SELECT Caballeros.nombre AS "Caballeros", Tecnicas.nombre AS "Tecnicas" FROM ((Tecnicas INNER JOIN Caballero_Tecnica ON Tecnicas.id_tecnica = Caballero_Tecnica.tecnica_id) INNER JOIN Caballeros ON Caballeros.id_caballero = Caballero_Tecnica.caballero_id);

/******************************************************************************
 * 3. CONSULTA EL NOMBRE DE CADA TÉCNICA Y EL NOMBRE DEL CABALLERO QUE LA USA *
 ******************************************************************************/
 SELECT Tecnicas.nombre AS "Tecnicas", Caballeros.nombre AS "Caballeros" FROM ((Tecnicas INNER JOIN Caballero_Tecnica ON Tecnicas.id_tecnica = Caballero_Tecnica.tecnica_id) INNER JOIN Caballeros ON Caballeros.id_caballero = Caballero_Tecnica.caballero_id);
 /*Este lo entendí como lo mismo, seré sincero XD*/

/***************************************************************************************
 * 4. CONSULTA EL NOMBRE DE CADA CABALLERO, EL NOMBRE DE SU CATEGORÍA Y LA CANTIDAD DE *
 *                                  TÉCNICAS QUE SABE                                  *
 ***************************************************************************************/
 SELECT DISTINCT Caballeros.nombre, Categorias.nombre AS "Categoria", COUNT(Tecnicas.nombre) FROM (((Caballeros INNER JOIN Categorias ON Caballeros.categoria_id = Categorias.id_categoria) INNER JOIN Caballero_Tecnica ON Caballeros.id_caballero = Caballero_Tecnica.caballero_id) INNER JOIN Tecnicas ON Caballero_Tecnica.tecnica_id = Tecnicas.id_tecnica) GROUP BY Caballeros.nombre, Categorias.nombre ORDER BY Caballeros.nombre ASC;
 /*Acá no salen los caballeros del 11 al 15 porq no tienen técnica, nota para acordarme de arreglar eso y que se vean también del 11 al 15*/

/*********************************************************************************************
 * 5. CONSULTA EL NOMBRE Y LA CATEGORÍA DE LOS CABALLEROS QUE HAN REALIZADO LA TÉCNICA POLVO *
 *                                       DE DIAMANTES                                        *
 *********************************************************************************************/
 SELECT DISTINCT Caballeros.nombre, Categorias.nombre AS "Categoria" FROM (((Caballeros INNER JOIN Categorias ON Caballeros.categoria_id = Categorias.id_categoria) INNER JOIN Caballero_Tecnica ON Caballeros.id_caballero = Caballero_Tecnica.caballero_id) INNER JOIN Tecnicas ON Caballero_Tecnica.tecnica_id = Tecnicas.id_tecnica) WHERE Tecnicas.nombre LIKE 'Polvo de Diamantes';

/*********************************************************************************
 * 6. CONSULTA EL NOMBRE Y LA ARMADURA DE LOS CABALLEROS NACIDOS DESPUÉS DE 1980 *
 *********************************************************************************/
 SELECT nombre, armadura FROM Caballeros WHERE fecha_nacimiento > '1980-1-1';

/************************************************************************
 * 7. CONSULTA EL NOMBRE DE TODOS LOS CABALLEROS JUNTO CON SU CATEGORÍA *
 ************************************************************************/
 SELECT Caballeros.nombre, Categorias.nombre AS "Categoria" FROM Caballeros INNER JOIN Categorias ON Caballeros.categoria_id = Categorias.id_categoria;
 /*Esto es lo mismo del ejercicio 1...?*/

/*******************************************************************************
 * 8. CONSULTA EL NOMBRE DE TODAS LAS TÉCNICAS QUE CONOCE EL CABALLERO "SEIYA" *
 *******************************************************************************/
 SELECT Tecnicas.nombre AS "Tecnicas" FROM ((Tecnicas INNER JOIN Caballero_Tecnica ON Tecnicas.id_tecnica = Caballero_Tecnica.tecnica_id) INNER JOIN Caballeros ON Caballeros.id_caballero = Caballero_Tecnica.caballero_id) WHERE Caballeros.nombre LIKE 'Seiya';

/******************************************************************************
 * 9. CONSULTA EL NOMBRE DE TODAS LAS TÉCNICAS QUE CONOCE EL CABALLERO "SHUN" *
 ******************************************************************************/
 SELECT Tecnicas.nombre AS "Tecnicas" FROM ((Tecnicas INNER JOIN Caballero_Tecnica ON Tecnicas.id_tecnica = Caballero_Tecnica.tecnica_id) INNER JOIN Caballeros ON Caballeros.id_caballero = Caballero_Tecnica.caballero_id) WHERE Caballeros.nombre LIKE 'Shun';

/*************************************************************************************
 * 10. CONSULTA EL NOMBRE DE TODOS LOS CABALLEROS QUE CONOCEN LA TÉCNICA METEOROS DE *
 *                                      PEGASO                                       *
 *************************************************************************************/
 SELECT Caballeros.nombre AS "Caballeros" FROM ((Tecnicas INNER JOIN Caballero_Tecnica ON Tecnicas.id_tecnica = Caballero_Tecnica.tecnica_id) INNER JOIN Caballeros ON Caballeros.id_caballero = Caballero_Tecnica.caballero_id) WHERE Tecnicas.nombre LIKE 'Meteoros de Pegaso';

/**************************************************************************************
 * 11. CONSULTA EL NOMBRE DE TODOS LOS CABALLEROS JUNTO CON EL NOMBRE DE SUS TÉCNICAS *
 **************************************************************************************/
 SELECT Caballeros.nombre AS "Caballeros", Tecnicas.nombre AS "Tecnicas" FROM ((Tecnicas INNER JOIN Caballero_Tecnica ON Tecnicas.id_tecnica = Caballero_Tecnica.tecnica_id) INNER JOIN Caballeros ON Caballeros.id_caballero = Caballero_Tecnica.caballero_id);
 /*Seré sincero, este lo entendí como lo mismo que el ejercicio 2 XD*/

/***************************************************************************************
 * 12. SELECCIONA LOS NOMBRES DE LOS CABALLEROS QUE HAN UTILIZADO AL MENOS UNA TÉCNICA *
 ***************************************************************************************/
 SELECT DISTINCT Caballeros.nombre AS "Caballeros" FROM ((Tecnicas INNER JOIN Caballero_Tecnica ON Tecnicas.id_tecnica = Caballero_Tecnica.tecnica_id) INNER JOIN Caballeros ON Caballeros.id_caballero = Caballero_Tecnica.caballero_id);

/*****************************************************************************************
 * 13. SELECCIONA LOS NOMBRES DE LOS CABALLEROS QUE HAN UTILIZADO AL MENOS UNA TÉCNICA Y *
 *                               QUE PESAN MÁS DE 70 KILOS                               *
 *****************************************************************************************/
 SELECT DISTINCT Caballeros.nombre AS "Caballeros", Caballeros.peso FROM ((Tecnicas INNER JOIN Caballero_Tecnica ON Tecnicas.id_tecnica = Caballero_Tecnica.tecnica_id) INNER JOIN Caballeros ON Caballeros.id_caballero = Caballero_Tecnica.caballero_id) WHERE peso > 70;


/*************************************************************************
 * 14. CONSULTA EL NOMBRE DE LA TÉCNICA MÁS UTILIZADA POR LOS CABALLEROS *
 *************************************************************************/
 SELECT DISTINCT Tecnicas.nombre AS "Tecnicas", COUNT(Tecnicas.nombre) AS "Gente que conoce la tecnica" FROM ((Tecnicas INNER JOIN Caballero_Tecnica ON Tecnicas.id_tecnica = Caballero_Tecnica.tecnica_id) INNER JOIN Caballeros ON Caballeros.id_caballero = Caballero_Tecnica.caballero_id) GROUP BY Tecnicas.nombre ORDER BY "Gente que conoce la tecnica" DESC;
 /*Gente que conoce la técnica? xD*/

/**********************************************************************************
 * 15. SELECCIONA LOS NOMBRES DE LOS CABALLEROS QUE HAN UTILIZADO EXACTAMENTE DOS *
 *                                    TÉCNICAS                                    *
 **********************************************************************************/
 SELECT DISTINCT nombre 
 FROM Caballeros 
 INNER JOIN Caballero_Tecnica 
 ON Caballeros.id_caballero = Caballero_Tecnica.caballero_id 
 WHERE Caballero_Tecnica.caballero_id = 
 (SELECT Caballero_Tecnica.caballero_id 
 FROM Caballero_Tecnica 
 GROUP BY Caballero_Tecnica.caballero_id 
 HAVING COUNT(Caballero_Tecnica.tecnica_id) = 2 
 ORDER BY Caballero_Tecnica.caballero_id);

/***************************************************************************************
 * 16. SELECCIONA LOS NOMBRES DE LAS TÉCNICAS QUE HAN SIDO UTILIZADAS POR AL MENOS DOS *
 *                                     CABALLEROS                                      *
 ***************************************************************************************/
 SELECT tecnica_id FROM Caballero_Tecnica GROUP BY tecnica_id HAVING COUNT(caballero_id) >= 2 ORDER BY tecnica_id;
 SELECT DISTINCT Tecnicas.nombre 
 FROM Tecnicas 
 INNER JOIN Caballero_Tecnica 
 ON Caballero_Tecnica.tecnica_id = Tecnicas.id_tecnica 
 WHERE Caballero_Tecnica.tecnica_id 
 IN (SELECT tecnica_id 
	FROM Caballero_Tecnica 
	GROUP BY tecnica_id 
	HAVING COUNT(caballero_id) >= 2 
	ORDER BY tecnica_id);

/**********************************************************************************
 * 17. SELECCIONAR LOS CABALLEROS DE CATEGORÍA ORO QUE TENGAN AL MENOS 3 TÉCNICAS *
 **********************************************************************************/
 SELECT DISTINCT Caballeros.nombre 
 FROM Caballeros 
 INNER JOIN Caballero_Tecnica 
 ON Caballeros.id_caballero = Caballero_Tecnica.caballero_id
 WHERE Caballero_Tecnica.caballero_id 
 IN (SELECT caballero_id 
	FROM Caballero_Tecnica 
	GROUP BY caballero_id 
	HAVING COUNT(tecnica_id) >= 3);

/*************************************************************************
 * 18. SELECCIONAR LAS CATEGORÍAS QUE TIENEN UN PESO PROMEDIO MAYOR A 80 *
 *************************************************************************/
 SELECT DISTINCT Categorias.nombre AS "Categoria", AVG(Caballeros.peso) AS "Peso promedio"
 FROM Caballeros
 INNER JOIN Categorias
 ON Caballeros.categoria_id = Categorias.id_categoria
 GROUP BY Categorias.nombre
 HAVING AVG(Caballeros.peso) > 80;