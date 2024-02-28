/*****************************************************************
 * 1. SELECCIONAR TODOS LOS ARTISTAS CUYO NOMBRE EMPIEZA POR "M" *
 *****************************************************************/
 SELECT nombre FROM artista WHERE nombre LIKE 'M%';

/*************************************************************************************
 * 2. SELECCIONAR TODOS LOS USUARIOS CON CORREO ELECTRÓNICO QUE CONTENGA "GMAIL.COM" *
 *************************************************************************************/
 SELECT nombre FROM usuario WHERE email LIKE '%gmail.com';

/*********************************************************************************************
 * 3. SELECCIONAR TODOS LOS USUARIOS QUE NO TENGAN UN CORREO ELECTRÓNICO DE TIPO "YAHOO.COM" *
 *********************************************************************************************/
 SELECT nombre FROM usuario WHERE email LIKE '%yahoo.com';

/********************************************************************************************
 * 4. SELECCIONAR TODAS LAS LISTAS DE REPRODUCCIÓN CUYO TÍTULO CONTENGA LA PALABRA "MÚSICA" *
 ********************************************************************************************/
 SELECT titulo FROM listaReproduccion WHERE titulo LIKE 'Música%' OR titulo LIKE '%música%';

/*****************************************************************************************************
 * 5. SELECCIONAR TODAS LAS LISTAS DE REPRODUCCIÓN QUE NO CONTENGAN LA PALABRA "MÚSICA" EN SU TÍTULO *
 *****************************************************************************************************/
 SELECT titulo FROM listaReproduccion WHERE titulo NOT LIKE 'Música%' OR titulo LIKE '%música%'; 

/******************************************************************************************************************
 * 6. SELECCIONAR TODAS LAS CANCIONES CUYO TÍTULO CONTENGA LA PALABRA "LA" O LA DURACIÓN SEA MAYOR A 240 SEGUNDOS *
 ******************************************************************************************************************/
 SELECT * FROM cancion WHERE titulo LIKE 'La %' OR titulo LIKE '% la %' OR duracion > 240;

/*****************************************************************************************************************************
 * 7. SELECCIONAR TODAS LAS CANCIONES CUYA DURACIÓN SEA MENOR O IGUAL A 180 SEGUNDOS Y SU TÍTULO NO CONTENGA LA PALABRA "DE" *
 *****************************************************************************************************************************/
 SELECT titulo, duracion FROM cancion WHERE duracion <= 180 AND titulo NOT LIKE 'De %' AND titulo NOT LIKE '% de %';

/*********************************************************************************************************************
 * 8. SELECCIONAR TODAS LAS CANCIONES CUYO TÍTULO NO CONTENGA LA PALABRA "UN" Y SU DURACIÓN SEA MAYOR A 120 SEGUNDOS *
 *********************************************************************************************************************/
 SELECT titulo, duracion FROM cancion WHERE duracion >= 120 AND titulo NOT LIKE 'Un %' AND titulo NOT LIKE '% un %';

/*******************************************************************************************************************************************
 * 9. SELECCIONAR EL NOMBRE DE LOS ARTISTAS Y EL TÍTULO DE SUS ÁLBUMES QUE TIENEN AL MENOS UNA CANCIÓN CON LA PALABRA "MIEDO" EN SU TÍTULO *
 *******************************************************************************************************************************************/
 SELECT nombre FROM artista WHERE id_Artista = (SELECT id_Artista FROM album WHERE id_Album IN (SELECT id_Album FROM cancion WHERE titulo LIKE '%miedo%' OR titulo LIKE 'Miedo%'));

/********************************************************************************************************************
 * 10. CONSULTA PARA ENCONTRAR TODAS LAS CANCIONES CUYO TÍTULO COMIENZA CON LA LETRA "S" Y TERMINA CON LA LETRA "E" *
 ********************************************************************************************************************/
 SELECT titulo FROM cancion WHERE titulo LIKE 'S%e' OR titulo LIKE 's%e';

/***************************************************************************************************************
 * 11. CONSULTA PARA ENCONTRAR TODOS LOS ARTISTAS CUYO NOMBRE CONTIENE LA LETRA "A" Y TERMINA CON LA LETRA "O” *
 ***************************************************************************************************************/
 SELECT nombre FROM artista WHERE nombre LIKE 'A%o';

/****************************************************************************************************************************
 * 12. SELECCIONAR LAS CANCIONES QUE TIENEN UNA DURACIÓN MAYOR O IGUAL A 4 MINUTOS Y CUYO TÍTULO INCLUYE LA PALABRA "HACIA” *
 ****************************************************************************************************************************/
 SELECT titulo, duracion FROM cancion WHERE duracion >= 240 AND titulo LIKE 'Hacia%' OR titulo LIKE '%hacia%';

/*******************************************************************************************
 * 13. SELECCIONAR TODOS LOS ARTISTAS CUYO NOMBRE CONTENGA LA PALABRA "MANOLO" O "ROZALÉN” *
 *******************************************************************************************/
 SELECT nombre FROM artista WHERE nombre LIKE 'Manolo%' OR nombre LIKE 'Rozalén%';

/*************************************************************************************************************************************************
 * 14. SELECCIONAR TODAS LAS LISTAS DE REPRODUCCIÓN CREADAS POR EL USUARIO CON ID_USUARIO IGUAL A 1, CUYO TÍTULO CONTENGA LA PALABRA "FAVORITAS” *
 *************************************************************************************************************************************************/
 SELECT titulo FROM listaReproduccion WHERE id_Usuario = 1 AND titulo LIKE '%favoritas%'  OR titulo LIKE'Favoritas%';

/***************************************************************************************************************
 * 15. SELECCIONAR TODOS LOS ÁLBUMES DEL ARTISTA CON ID_ARTISTA IGUAL A 2 CUYO TÍTULO CONTENGA LA PALABRA "EL" *
 ***************************************************************************************************************/
 SELECT titulo, id_Artista FROM album WHERE id_Artista = 2 AND titulo LIKE 'El %' OR titulo LIKE '% el %'; 