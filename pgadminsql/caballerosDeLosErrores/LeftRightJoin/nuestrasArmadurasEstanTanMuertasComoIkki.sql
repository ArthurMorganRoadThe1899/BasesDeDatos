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

/***************************************************************************************************
 * 1. MOSTRAR EL NOMBRE Y LA CATEGORÍA DE TODOS LOS CABALLEROS, INCLUSO AQUELLOS QUE NO TIENEN UNA *
 *                                       CATEGORÍA ASIGNADA                                        *
 ***************************************************************************************************/
 SELECT Caballeros.nombre, Categorias.nombre AS "categoria"
 FROM Caballeros 
 INNER JOIN Categorias 
 ON Caballeros.categoria_id = Categorias.id_categoria;

/***********************************************************************************************
 * 2. MOSTRAR EL NOMBRE Y LAS TÉCNICAS DE TODOS LOS CABALLEROS, INCLUSO AQUELLOS QUE NO TIENEN *
 *                                     TÉCNICAS ASIGNADAS                                      *
 ***********************************************************************************************/
 SELECT DISTINCT cab.nombre, tec.nombre AS "tecnica"
 FROM Caballeros cab
 LEFT JOIN Caballero_tecnica CT
 ON cab.id_caballero = CT.caballero_id 
 LEFT JOIN Tecnicas tec
 ON CT.tecnica_id = tec.id_tecnica;

 /*Esta solución me gusta un pelin más, se ve más bonita, pero no muestra las técnicas XD*/
 SELECT DISTINCT cab.nombre, COUNT(tec.nombre) AS "tecnica"
 FROM Caballeros cab
 LEFT JOIN Caballero_tecnica CT
 ON cab.id_caballero = CT.caballero_id 
 LEFT JOIN Tecnicas tec
 ON CT.tecnica_id = tec.id_tecnica
 GROUP BY cab.nombre;

/***********************************************************************************************
 * 3. MOSTRAR EL NOMBRE Y LA CATEGORÍA DE TODAS LAS CATEGORÍAS, INCLUSO AQUELLAS QUE NO TIENEN *
 *                                    CABALLEROS ASIGNADOS                                     *
 ***********************************************************************************************/

/***************************************************************************
 * 4. MOSTAR TODOS LOS CABALLEROS QUE NO TIENEN TÉCNICAS ASOCIADAS A ELLOS *
 ***************************************************************************/

/*************************************************************************************************
 * 5. MOSTAR TODAS LAS TÉCNICAS QUE TIENEN LA PALABRA "DE" EN SU NOMBRE Y LAS CABALLEROS QUE LAS *
 *                                            TIENEN                                             *
 *************************************************************************************************/

/*************************************************************************************************
 * 6. MOSTAR TODAS LAS TÉCNICAS Y TODOS LOS CABALLEROS QUE NACIERON DESPUÉS DE 1980 O CUYA FECHA *
 *  DE NACIMIENTO ES DESCONOCIDA. SI UN CABALLERO NO TIENE TÉCNICAS ASOCIADAS, SE MOSTRARÁ NULL  *
 *                                 EN LUGAR DEL ID DE LA TÉCNICA                                 *
 *************************************************************************************************/

/*************************************************************************************************
 * 7. MOSTAR TODOS LOS CABALLEROS, INCLUSO AQUELLOS QUE NO TIENEN TÉCNICAS, JUNTO CON EL ID Y EL *
 *      NOMBRE DE LAS TÉCNICAS, INCLUSO AQUELLAS QUE NO ESTÁN ASOCIADAS A NINGÚN CABALLERO       *
 *************************************************************************************************/

/************************************************************************************
 * 8. MOSTRAR TODOS LOS CABALLEROS QUE NO TIENEN UNA FECHA DE NACIMIENTO REGISTRADA *
 ************************************************************************************/

/****************************************************************
 * 9. MOSTRAR TODAS LAS TÉCNICAS QUE NO CONOCE NINGÚN CABALLERO *
 ****************************************************************/

/**************************************************************************
 * 10. MOSTRAR TODOS LOS CABALLEROS QUE NO TIENEN UNA ARMADURA REGISTRADA *
 **************************************************************************/

/***********************************************************************************************
 * 11. MOSTAR EL NOMBRE DE CADA CABALLERO Y SU ARMADURA, INCLUSO SI NO TIENE ARMADURA ASIGNADA *
 ***********************************************************************************************/

/*****************************************************************************************************
 * 12. MOSTAR EL NOMBRE DE CADA TÉCNICA Y EL NOMBRE DE LOS CABALLEROS QUE LA UTILIZAN, INCLUSO SI NO *
 *                              HAY CABALLEROS QUE UTILICEN ESA TÉCNICA                              *
 *****************************************************************************************************/

/*******************************************************************************************
 * 13. CONSULTA QUE MUESTRA EL NOMBRE DE CADA CABALLERO Y SU CATEGORÍA ASOCIADA, INCLUIDOS *
 *                AQUELLOS CABALLEROS QUE NO TIENEN UNA CATEGORÍA ASIGNADA                 *
 *******************************************************************************************/

/**********************************************************************************
 * 14. MOSTRAR EL NOMBRE DE LAS TÉCNICAS QUE NO HA APRENDIDO EL CABALLERO "SEIYA" *
 **********************************************************************************/

/*************************************************************************************************
 * 15. MOSTRAR EL NÚMERO DE TÉCNICAS QUE HA APRENDIDO CADA CABALLERO, INCLUYENDO AQUELLOS QUE NO *
 *                                 HAN APRENDIDO NINGUNA TÉCNICA                                 *
 *************************************************************************************************/

/*************************************************************************
 * 16. MOSTRAR LA CANTIDAD DE CABALLEROS QUE PERTENECEN A CADA CATEGORÍA *
 *************************************************************************/

/***************************************************************************************************
 * 17. SELECCIONAR EL NOMBRE Y LA CANTIDAD DE TÉCNICAS DE LOS CABALLEROS ORDENADOS POR CANTIDAD DE *
 *                                   TÉCNICAS DE MAYOR A MENOR.                                    *
 *                                   PISTA. UTILIZA EL GROUP BY                                    *
 ***************************************************************************************************/

/*********************************************************************************************
 * 18. SELECCIONAR EL NOMBRE Y LA CANTIDAD DE TÉCNICAS DE LOS CABALLEROS QUE TIENEN MÁS DE 3 *
 *                                         TÉCNICAS.                                         *
 *                                   PISTA. UTILIZA HAVING                                   *
 *********************************************************************************************/