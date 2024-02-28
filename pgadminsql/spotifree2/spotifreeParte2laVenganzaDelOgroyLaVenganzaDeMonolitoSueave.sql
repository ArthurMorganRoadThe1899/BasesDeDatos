/***********************************************************
 * 1. SELECCIONAR TODOS LOS ARTISTAS CUYO ID SEA MAYOR A 3 *
 ***********************************************************/
 SELECT * FROM artista WHERE id_Artista > 3;

/**********************************************************************
 * 2. SELECCIONAR TODOS LOS ÁLBUMES CUYO AÑO SEA MAYOR O IGUAL A 2011 *
 **********************************************************************/
 SELECT * FROM album WHERE anio >= 2011;

/***********************************************************************************
 * 3. SELECCIONAR TODAS LAS CANCIONES QUE TENGAN UNA DURACIÓN MENOR A 240 SEGUNDOS *
 ***********************************************************************************/
 SELECT titulo FROM cancion WHERE duracion <= 240;

/*****************************************************************************
 * 4. SELECCIONAR TODOS LOS USUARIOS QUE TENGAN UN CORREO ELECTRÓNICO VÁLIDO *
 *****************************************************************************/
 SELECT * FROM usuario WHERE email IS NOT NULL;

/********************************************************************************************
 * 5. MUESTRA LOS ÁLBUMES CUYO AÑO ES MAYOR A 2010 Y LAS CANCIONES CUYA DURACIÓN ES MAYOR A *
 *                                        200 SEGUNDO                                       *
 ********************************************************************************************/
 SELECT * FROM cancion WHERE duracion >= 200 AND id_Album IN (SELECT id_Album FROM album WHERE anio != 2011);

/************************************************************************************
 * 6. SELECCIONAR TODAS LAS CANCIONES DEL ARTISTA PABLO ALBORÁN Y SU DURACIÓN TOTAL *
 ************************************************************************************/
 SELECT * FROM cancion WHERE id_Album IN (SELECT id_Album FROM album WHERE id_Artista = (SELECT id_Artista FROM artista WHERE nombre = 'Pablo Alborán'));

/******************************************************************************************
 * 7. SELECCIONAR TODOS LOS ARTISTAS QUE TENGAN ÁLBUMES PUBLICADOS EN EL AÑO 2011 O 2017 *
 ******************************************************************************************/
 SELECT nombre FROM artista WHERE id_Artista IN (SELECT id_Artista FROM album WHERE anio = 2011 OR anio = 2017); 

/****************************************************************************
 * 8. CONSULTAR TODAS LAS CANCIONES DE UN ÁLBUM HACIA LO SALVAJE DE AMARAL *
 ****************************************************************************/
 SELECT * FROM cancion WHERE id_Album = (SELECT id_Album FROM album WHERE titulo = 'Hacia lo Salvaje');

/**************************************************************************************************
 * 11. CONSULTAR EL NOMBRE DE TODOS LOS ARTISTAS QUE TIENEN AL MENOS UN ÁLBUM PUBLICADO EN EL AÑO *
 *                                              2011                                              *
 **************************************************************************************************/
 SELECT nombre FROM artista WHERE id_Artista IN (SELECT id_Artista FROM album WHERE anio = 2011);  

/**********************************************************************************
 * 12. CONSULTAR TODOS LOS ÁLBUMES PUBLICADOS POR UN ARTISTA QUE NO TIENEN NOMBRE *
 **********************************************************************************/
 SELECT * FROM album WHERE id_Artista IN (SELECT id_Artista FROM artista WHERE nombre IS NOT NULL);





 /*DESCATADOS TEMPORALMENTE*/

 /****************************************************************************************************
 * 5. SELECCIONAR EL NOMBRE DEL ARTISTA, EL TÍTULO DEL ÁLBUM Y EL TÍTULO DE LA CANCIÓN DE TODAS LAS *
 *     CANCIONES QUE DURAN MÁS DE 300 SEGUNDOS Y QUE SE ENCUENTRAN EN LA LISTA DE REPRODUCCIÓN      *
 *                                      CON ID_LISTA IGUAL A 2                                      *
 ****************************************************************************************************/

 /**************************************************************************************************
 * 6. SELECCIONAR EL TÍTULO DE LAS CANCIONES Y EL NOMBRE DE LOS ARTISTAS QUE LAS INTERPRETAN, CUYA *
 *                            DURACIÓN ES MAYOR A 3 MIN Y 30 SEGUNDOS                              *
 ***************************************************************************************************/


/**************************************************************************************************
 * 7. SELECCIONAR EL NOMBRE Y CORREO ELECTRÓNICO DE LOS USUARIOS QUE TIENEN AL MENOS UNA LISTA DE *
 *                          REPRODUCCIÓN CON CANCIONES DE PABLO ALBORÁN                           *
 **************************************************************************************************/