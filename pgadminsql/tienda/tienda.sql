/*https://docs.google.com/document/d/1ERF_kOHibI_6BEjGB8gtsOklzMnW2EAX/edit?usp=sharing&ouid=112152042181226450170&rtpof=true&sd=true*/
CREATE TABLE fabricante (
  id INT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL
);

CREATE TABLE producto (
  id INT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  precio double precision NOT NULL,
  id_fabricante INT NOT NULL,
  FOREIGN KEY (id_fabricante) REFERENCES fabricante(id)
);

INSERT INTO fabricante VALUES(1, 'Asus');
INSERT INTO fabricante VALUES(2, 'Lenovo');
INSERT INTO fabricante VALUES(3, 'Hewlett-Packard');
INSERT INTO fabricante VALUES(4, 'Samsung');
INSERT INTO fabricante VALUES(5, 'Seagate');
INSERT INTO fabricante VALUES(6, 'Crucial');
INSERT INTO fabricante VALUES(7, 'Gigabyte');
INSERT INTO fabricante VALUES(8, 'Huawei');
INSERT INTO fabricante VALUES(9, 'Xiaomi');

INSERT INTO producto VALUES(1, 'Disco duro SATA3 1TB', 86.99, 5);
INSERT INTO producto VALUES(2, 'Memoria RAM DDR4 8GB', 120, 6);
INSERT INTO producto VALUES(3, 'Disco SSD 1 TB', 150.99, 4);
INSERT INTO producto VALUES(4, 'GeForce GTX 1050Ti', 185, 7);
INSERT INTO producto VALUES(5, 'GeForce GTX 1080 Xtreme', 755, 6);
INSERT INTO producto VALUES(6, 'Monitor 24 LED Full HD', 202, 1);
INSERT INTO producto VALUES(7, 'Monitor 27 LED Full HD', 245.99, 1);
INSERT INTO producto VALUES(8, 'Portátil Yoga 520', 559, 2);
INSERT INTO producto VALUES(9, 'Portátil Ideapd 320', 444, 2);
INSERT INTO producto VALUES(10, 'Impresora HP Deskjet 3720', 59.99, 3);
INSERT INTO producto VALUES(11, 'Impresora HP Laserjet Pro M26nw', 180, 3);

/***************************************************************************
 * 1. LISTA EL NOMBRE DE TODOS LOS PRODUCTOS QUE HAY EN LA TABLA PRODUCTO*
 ***************************************************************************/
 SELECT nombre FROM producto;

/**********************************************************************************
 * 2. LISTA LOS NOMBRES Y LOS PRECIOS DE TODOS LOS PRODUCTOS DE LA TABLA PRODUCTO *
 **********************************************************************************/
 SELECT nombre, precio FROM producto;

/****************************************************
 * 3. LISTA TODAS LAS COLUMNAS DE LA TABLA PRODUCTO *
 ****************************************************/
 SELECT * FROM producto;

/********************************************************************************************************
 * 4. LISTA EL NOMBRE DE LOS PRODUCTOS, EL PRECIO EN EUROS Y EL PRECIO EN DÓLARES ESTADOUNIDENSES (USD) *
 ********************************************************************************************************/

/************************************************************************************************************************
 * 5. LISTA LOS NOMBRES Y LOS PRECIOS DE TODOS LOS PRODUCTOS DE LA TABLA PRODUCTO, CONVIRTIENDO LOS NOMBRES A MAYÚSCULA *
 ************************************************************************************************************************/
 SELECT UPPER(nombre), precio FROM producto;

/************************************************************************************************************************
 * 6. LISTA LOS NOMBRES Y LOS PRECIOS DE TODOS LOS PRODUCTOS DE LA TABLA PRODUCTO, CONVIRTIENDO LOS NOMBRES A MINÚSCULA *
 ************************************************************************************************************************/
 SELECT LOWER(nombre), precio FROM producto;

/*************************************************************************************************************************************************************
 * 7. LISTA EL NOMBRE DE TODOS LOS FABRICANTES EN UNA COLUMNA, Y EN OTRA COLUMNA OBTENGA EN MAYÚSCULAS LOS DOS PRIMEROS CARACTERES DEL NOMBRE DEL FABRICANTE *
 *************************************************************************************************************************************************************/
 SELECT COUNT(nombre) AS conteo_fabricantes FROM fabricante;

/*******************************************************************************************************************
 * 8. LISTA LOS NOMBRES Y LOS PRECIOS DE TODOS LOS PRODUCTOS DE LA TABLA PRODUCTO, REDONDEANDO EL VALOR DEL PRECIO *
 *******************************************************************************************************************/
 SELECT nombre, ROUND(precio) FROM producto;

/**********************************************************************************************************************************************************
 * 9. LISTA LOS NOMBRES Y LOS PRECIOS DE TODOS LOS PRODUCTOS DE LA TABLA PRODUCTO, TRUNCANDO EL VALOR DEL PRECIO PARA MOSTRARLO SIN NINGUNA CIFRA DECIMAL *
 **********************************************************************************************************************************************************/
 SELECT nombre, TRUNC(precio) FROM producto;

/*****************************************************************************************************************************************************************
 * 10. LISTA EL IDENTIFICADOR DE LOS FABRICANTES QUE TIENEN PRODUCTOS EN LA TABLA PRODUCTO + HAZLO TAMBIÉN ELIMINANDO LOS IDENTIFICADORES QUE APARECEN REPETIDOS *
 *****************************************************************************************************************************************************************/
 SELECT DISTINCT(id_fabricante)  FROM producto ORDER BY id_fabricante ASC;

/**************************************************************************
 * 11. LISTA LOS NOMBRES DE LOS FABRICANTES ORDENADOS DE FORMA ASCENDENTE *
 **************************************************************************/
 SELECT nombre FROM fabricante ORDER BY nombre ASC;

/***************************************************************************
 * 12. LISTA LOS NOMBRES DE LOS FABRICANTES ORDENADOS DE FORMA DESCENDENTE *
 ***************************************************************************/
 SELECT nombre FROM fabricante ORDER BY nombre DESC;

/************************************************************************************************************************************************************
 * 13. LISTA LOS NOMBRES DE LOS PRODUCTOS ORDENADOS EN PRIMER LUGAR POR EL NOMBRE DE FORMA ASCENDENTE Y EN SEGUNDO LUGAR POR EL PRECIO DE FORMA DESCENDENTE *
 ************************************************************************************************************************************************************/
 SELECT nombre, precio FROM producto ORDER BY nombre ASC;
 SELECT nombre, precio FROM producto ORDER BY precio DESC;

/**************************************************************************
 * 14. DEVUELVE UNA LISTA CON LAS 5 PRIMERAS FILAS DE LA TABLA FABRICANTE *
 **************************************************************************/
 SELECT id, nombre FROM fabricante LIMIT 5;

/************************************************************************************************************************************************
 * 15. DEVUELVE UNA LISTA CON 2 FILAS A PARTIR DE LA CUARTA FILA DE LA TABLA FABRICANTE. LA CUARTA FILA TAMBIÉN SE DEBE INCLUIR EN LA RESPUESTA *
 ************************************************************************************************************************************************/
 SELECT id, nombre FROM fabricante LIMIT 2 OFFSET 3;

/*******************************************************************************************************
 * 16. LISTA EL NOMBRE Y EL PRECIO DEL PRODUCTO MÁS BARATO. (UTILIZA LAS CLÁUSULAS [ORDER BY Y LIMIT]) *
 *******************************************************************************************************/
 SELECT nombre, precio FROM producto ORDER BY precio ASC LIMIT 1;

/*****************************************************************************************************
 * 17. LISTA EL NOMBRE Y EL PRECIO DEL PRODUCTO MÁS CARO. (UTILIZA LAS CLÁUSULAS [ORDER BY Y LIMIT]) *
 *****************************************************************************************************/
 SELECT nombre, precio FROM producto ORDER BY precio DESC LIMIT 1;

/***********************************************************************************************************
 * 18. LISTA EL NOMBRE DE TODOS LOS PRODUCTOS DEL FABRICANTE CUYO IDENTIFICADOR DE FABRICANTE ES IGUAL A 2 *
 ***********************************************************************************************************/
 SELECT nombre, id_fabricante FROM producto WHERE id_fabricante = 2;

/**********************************************************************************
 * 19. LISTA EL NOMBRE DE LOS PRODUCTOS QUE TIENEN UN PRECIO MENOR O IGUAL A 120€ *
 **********************************************************************************/
 SELECT nombre, precio FROM producto WHERE precio <= 120;

/**********************************************************************************
 * 20. LISTA EL NOMBRE DE LOS PRODUCTOS QUE TIENEN UN PRECIO MAYOR O IGUAL A 400€ *
 **********************************************************************************/
 SELECT nombre, precio FROM producto WHERE precio <= 120;

/***************************************************************************************
 * 21. LISTA EL NOMBRE DE LOS PRODUCTOS QUE [NO TIENEN] UN PRECIO MAYOR O IGUAL A 400€ *
 ***************************************************************************************/
 SELECT nombre, precio FROM producto WHERE precio >= 400;

/*********************************************************************************************************
 * 22. LISTA TODOS LOS PRODUCTOS QUE TENGAN UN PRECIO ENTRE 80€ Y 300€. Sin utilizar el operador BETWEEN *
 *********************************************************************************************************/
 SELECT nombre, precio FROM producto WHERE precio >= 80 AND precio <= 200;

/*******************************************************************************************************
 * 23. LISTA TODOS LOS PRODUCTOS QUE TENGAN UN PRECIO ENTRE 60€ Y 200€. Utilizando el operador BETWEEN *
 *******************************************************************************************************/
 SELECT nombre, precio FROM producto WHERE precio >= 60 AND precio <= 200;

/************************************************************************************************************************
 * 24. LISTA TODOS LOS PRODUCTOS QUE TENGAN UN PRECIO MAYOR QUE 200€ Y QUE EL IDENTIFICADOR DE FABRICANTE SEA IGUAL A 6 *
 ************************************************************************************************************************/
 SELECT nombre, precio, id_fabricante FROM producto WHERE precio > 200 AND id_fabricante = 6;

/****************************************************************************************************************
 * 25. LISTA TODOS LOS PRODUCTOS DONDE EL IDENTIFICADOR DE FABRICANTE SEA 1, 3 O 5. Sin utilizar el operador IN *
 ****************************************************************************************************************/
 SELECT nombre, id_fabricante FROM producto WHERE id_fabricante = 1 OR id_fabricante = 3 OR id_fabricante = 5 ORDER BY id_fabricante ASC;

/**************************************************************************************************************
 * 26. LISTA TODOS LOS PRODUCTOS DONDE EL IDENTIFICADOR DE FABRICANTE SEA 1, 3 O 5. Utilizando el operador IN *
 **************************************************************************************************************/
 SELECT nombre, id_fabricante FROM producto WHERE id_fabricante IN (1, 3, 5) ORDER BY id_fabricante ASC;

/************************************************************************************************************************************************************************************************
 * 27. LISTA EL NOMBRE Y EL PRECIO DE LOS PRODUCTOS EN CÉNTIMOS (HABRÁ QUE MULTIPLICAR POR 100 EL VALOR DEL PRECIO). Crea un alias para la columna que contiene el precio que se llame céntimos *
 ************************************************************************************************************************************************************************************************/
 SELECT nombre, precio*100 AS precio_centimos FROM producto;

/*******************************************************************************
 * 28. LISTA LOS NOMBRES DE LOS FABRICANTES CUYO NOMBRE EMPIECE POR LA LETRA S *
 *******************************************************************************/
 SELECT nombre FROM fabricante WHERE nombre LIKE 'S%';

/*******************************************************************************
 * 29. LISTA LOS NOMBRES DE LOS FABRICANTES CUYO NOMBRE TERMINE POR LA VOCAL E *
 *******************************************************************************/
 SELECT nombre FROM fabricante WHERE nombre LIKE '%e';

/*******************************************************************************
 * 30. LISTA LOS NOMBRES DE LOS FABRICANTES CUYO NOMBRE CONTENGA EL CARÁCTER W *
 *******************************************************************************/
 SELECT nombre FROM fabricante WHERE nombre LIKE '%w%' OR nombre LIKE 'W%';

/****************************************************************************
 * 31. LISTA LOS NOMBRES DE LOS FABRICANTES CUYO NOMBRE SEA DE 4 CARACTERES *
 ****************************************************************************/
 SELECT nombre FROM fabricante WHERE LENGTH(nombre) = 4;

/*************************************************************************************************************
 * 32. DEVUELVE UNA LISTA CON EL NOMBRE DE TODOS LOS PRODUCTOS QUE CONTIENEN LA CADENA PORTÁTIL EN EL NOMBRE *
 *************************************************************************************************************/
 SELECT nombre FROM producto sdfgk;

/***********************************************************************************************************************************************
 * 33. DEVUELVE UNA LISTA CON EL NOMBRE DE TODOS LOS PRODUCTOS QUE CONTIENEN LA CADENA MONITOR EN EL NOMBRE Y TIENEN UN PRECIO INFERIOR A 215€ *
 ***********************************************************************************************************************************************/

/*************************************************************************************************************************************************************************************************************************************
 * 34. LISTA EL NOMBRE Y EL PRECIO DE TODOS LOS PRODUCTOS QUE TENGAN UN PRECIO MAYOR O IGUAL A 180€. ORDENE EL RESULTADO EN PRIMER LUGAR POR EL PRECIO (EN ORDEN DESCENDENTE) Y EN SEGUNDO LUGAR POR EL NOMBRE (EN ORDEN ASCENDENTE) *
 *************************************************************************************************************************************************************************************************************************************/



/*=============================================
  ==== SUBCONSULTAS (En la cláusula WHERE) ====
  =============================================*/

/************************************************************************************
 * 1. DEVUELVE TODOS LOS PRODUCTOS DEL FABRICANTE LENOVO. (Sin utilizar INNER JOIN) *
 ************************************************************************************/

/*****************************************************************************************************************************************************
 * 2. DEVUELVE TODOS LOS DATOS DE LOS PRODUCTOS QUE TIENEN EL MISMO PRECIO QUE EL PRODUCTO MÁS CARO DEL FABRICANTE LENOVO. (Sin utilizar INNER JOIN) *
 *****************************************************************************************************************************************************/

/******************************************************************
 * 3. LISTA EL NOMBRE DEL PRODUCTO MÁS CARO DEL FABRICANTE LENOVO *
 ******************************************************************/

/*****************************************************************************
 * 4. LISTA EL NOMBRE DEL PRODUCTO MÁS BARATO DEL FABRICANTE HEWLETT-PACKARD *
 *****************************************************************************/

/*************************************************************************************************************************************
 * 5. DEVUELVE TODOS LOS PRODUCTOS DE LA BASE DE DATOS QUE TIENEN UN PRECIO MAYOR O IGUAL AL PRODUCTO MÁS CARO DEL FABRICANTE LENOVO *
 *************************************************************************************************************************************/

/*************************************************************************************************************************
 * 6. LISTA TODOS LOS PRODUCTOS DEL FABRICANTE ASUS QUE TIENEN UN PRECIO SUPERIOR AL PRECIO MEDIO DE TODOS SUS PRODUCTOS *
 *************************************************************************************************************************/
