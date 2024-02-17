CREATE TABLE champion(
    cnum VARCHAR(4),
    cname VARCHAR(22),
    tipo VARCHAR(26),
    precio SMALLINT,
    fecha date, /*EL FORMATO DAY FUNCIONA ASÍ: mm/dd/yyyy*/
    PRIMARY KEY (cnum),
    CONSTRAINT rulesType CHECK (tipo IN ('Asesino', 'Mago', 'Carry'))
);

INSERT INTO champion(cnum, cname, tipo, precio, fecha)
VALUES
('C1', 'Akali', 'Asesino', 790, '5-11-2019'),
('C2', 'Brand', 'Asesino', 975, '9-24-2019'),
('C3', 'Caitlyn', 'Mago', 880, '1-1-2020'),
('C4', 'Diana', 'Carry', 975, '9-24-2019'),
('C5', 'Draven', 'Carry', NULL, '5-11-2019'),
('C6', 'Elisse', 'Mago', 975, '5-11-2019'),
('C7', 'Pepe', 'Mago', 880, '2-14-2024');

/************
 * 1. COUNT *
 ************/
SELECT COUNT(*), COUNT(tipo), COUNT(precio) FROM champion;

/* 
    * COUNT(*) cuenta en global, cuantas columnas hay entre todas las filas
    * COUNT(tipo) hace lo propio, pero en referencia solo a las columnas de 'tipo', y COUNT(precio) lo mismo para precio, este al tener un NULL no te pillará una de las celdas.
*/

/***************
 * 2. DISTINCT *
 ***************/
 SELECT COUNT(DISTINCT cnum), COUNT(DISTINCT tipo), COUNT(DISTINCT precio) FROM champion;
/*DISTINCT es un parámetro que te pilla cuantos elementos de la columna seleccionada, son distintos entre si*/

/***************
 * 3. GROUP BY *
 ***************/
 SELECT tipo, COUNT(*)FROM champion GROUP BY tipo;
 /*Aquí tal cuál esta echa la sentencia, te agarra los elementos de tipo, y te cuenta cuantos hay de cada uno*/

 SELECT tipo, precio, COUNT(*) FROM champion GROUP BY tipo, precio;
 /* Si metemos dos columnos, hará lo propio en lo anterior, pero buscando que se repita 
    ! Si metes el comando, verás que "'Mago' '880'" saldrá en el count 2, esto es porque Pepe y Caitlyn son magos que cuestan 880, por ende hay 2
 */

/******************************************************************************
 * 4. ¿QUÉ CONSULTA HAS DE HACER PARA OBTENER EL PRECIO DEL CAMPEÓN MÁS CARO? *
 ******************************************************************************/
SELECT MAX(precio) FROM champion;

/*********************************************************************************************************************************
 * 6. A PARTIR DEL RESULTADO DEL EJERCICIO ANTERIOR, QUE CONSULTA HAS DE HACER PARA OBTENER EL NOMBRE Y TIPO DE CAMPEÓN MAS CARO *
 *********************************************************************************************************************************/
 SELECT cname, tipo, precio FROM champion WHERE precio = (SELECT MAX(precio) FROM champion);

/* Con este te salen de los más baratos a más caros */
 SELECT cname, tipo, MAX(precio) FROM champion GROUP BY cname, tipo;

/*******************************************************************
 * 7. HAZME UNA CONSULTA QUE TE DE EL PRECIO PROMEDIO DE CADA TIPO *
 *******************************************************************/
 SELECT tipo, AVG(precio) FROM champion GROUP BY tipo;
