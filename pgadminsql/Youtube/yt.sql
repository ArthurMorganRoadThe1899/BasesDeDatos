CREATE TABLE usuario(
    id SERIAL PRIMARY KEY,
    username VARCHAR(50),
    email VARCHAR(100),
    password TEXT
);

CREATE TABLE video(
	id SERIAL PRIMARY KEY,
    title VARCHAR(100),
    description VARCHAR(5000),
    url TEXT,
    usr_id INTEGER,
    FOREIGN KEY(usr_id) REFERENCES usuario(id)

);

CREATE TABLE comentario(
  id SERIAL PRIMARY KEY,
    contenido VARCHAR(10000),
    id_vid integer,
    usr_id integer,
        FOREIGN KEY(id_vid) REFERENCES video(id),
        FOREIGN KEY(usr_id) REFERENCES usuario(id)
);

INSERT INTO usuario(username, email, password) VALUES
                 ('RanguGamer',  'fernandocamino@gmail.com', 'peeroniiiick'),
                 ('Leyendas y Videojuegos', 'lyv@hotmail.com', 'L9g36BzM}£E*'),
                 ('Keykal67', 'keycal67official@outlook.com', 'dkPride'),
                 ('GinGonYoken', 'gingonyoken@gmail.com', 'mrSquezze128_'),
                 ('Max_Casetera', 'maxcasetera@gmail.com', 'regegeSiNoFresa'),
                 ('Mihaumary', 'mihu@gmail,com', 'DameDaNeKa'),
                 ('VoidGarzelm ', 'garzelm@outlook.com', 'itsAonlyAsimpleWork!!1'),
                 ('ReddyTalP', 'reddy@gmail.com', 'JIUGFDXghJKGFDFgIUHGFGjhgJ__!');

INSERT INTO video(title, description, url, usr_id) VALUES
                 ('Cómo DISEÑAR el Equipo Pokémon Perfecto [Tutorial-Diseño]', 'La primera parte del completo tutorial sobre la creación de equipos pokémon competitivos', 'https://www.youtube.com/watch?v=jnDsu3Ot7e0&ab_channel=RanguGamer', 1),
                 ('Comienzo a desarrollar MI PROPIO videojuego de granja', 'Página de Steam: https://store.steampowered.com/app/2252680/Farlands/', 'https://www.youtube.com/watch?v=TO5_aLqZ6gI&list=PLB_3CyEiP5FvJcLrms9sDsojfl8JxOOHw&ab_channel=Leyendas%26Videojuegos', 2),
                 ('Me quito el SOMBRERO ante A HAT IN TIME', 'A Hat in Time, es uno de esos casos de éxito de kickstarter, un juego que nació para homenajear y suplir la escasez de este subgénero,  y aun con todos esos defectos llega a ser una experiencia que todos deben de probar.', 'https://youtu.be/KZVEqkL5H4M', 3),
                 ('Cuando el GAMEPLAY y la HISTORIA no van de la mano || Kingdom Hearts 358/2 Days [ANÁLISIS/RESUMEN]', 'Kingdom Hearts 358/2 Days es uno de los títulos que suele pasar más desapercibidos debido al particular trato que le ha dado Square Enix, pero en lo personal, considero que su historia es de las mejores que pudo contar la franquicia, pero... ¿el juego completo logró estar a la altura?
El día de hoy hablaremos de ello👀', 'https://youtu.be/drRMQvz4TEg', 3),
                 ('El Destino del Guerrero', 'Solo será terrible... si te rindes', 'https://youtu.be/UOH-xw-piKs', 1);


INSERT INTO comentario(contenido, id_vid, usr_id) VALUES
                 ('Justo hoy he tenido un día horrible. Y justo hoy, me has dado ganas de seguir luchando. Gracias, Rangu.', 5, 4),
                 ('La presentación del equipo al mas puro estilo de pelicula de robo fue buenisima jskjsks', 2, 5),
                 ('Este es el único juego de KH que solo lo jugué una vez por allá en el 2010, nunca lo repetí, pero tiene una historia muy buena y emotiva :(', 4, 6),
                 ('Me siento orgulloso de ser Traductor oficial del juego! :`3
Si, soy uno de los integrantes del equipo de traducción al español de este jueguito :3', 3, 7),
                 ('Uno de los primeros vídeos que vi del canal de Rangu xd que bien que aún siga existiendo jajajajaja', 1, 8),
                 ('No puedo esperar a ver el vídeo de crianza de pokemon, son los primeros pasos que estoy dando en el mundo competitivo de pokemon :D', 1, 8),
                 ('whoa, se me ha ocurrido una idea para un equipo mío rangu, muchas gracias ^^', 1, 8);


/****************************************************************************************************
 * 1. CREA UN NUEVO USUARIO CON PERMISOS DE LECTURA PARA LA TABLA "VIDEOS". LUEGO, INTENTA REALIZAR *
 *  UNA INSERCIÓN EN LA TABLA "VIDEOS" Y VERIFICA SI EL USUARIO TIENE PERMISOS PARA REALIZAR ESTA   *
 *                                             ACCIÓN.                                              *
 ****************************************************************************************************/
 CREATE USER majima WITH PASSWORD 'admin123';
 GRANT SELECT ON video TO majima;

/**************************************************************************************************
 *   2. CREA UN NUEVO USUARIO CON PERMISOS DE ESCRITURA PARA LA TABLA "VIDEOS". LUEGO, INTENTA    *
 * REALIZAR UNA CONSULTA SELECT EN LA TABLA "VIDEOS" Y VERIFICA SI EL USUARIO TIENE PERMISOS PARA *
 *                                     REALIZAR ESTA ACCIÓN.                                      *
 **************************************************************************************************/
 CREATE USER kiryu WITH PASSWORD 'admin123';
 GRANT SELECT, INSERT, UPDATE, DELETE ON video TO kiryu;

/*Me deja hacer cosicas, pero delete no porque se me olvido poner delete cascade para los comentarios y me dice 'nao nao, no puedes cargarte esto pq en comentarios se referencía al vídeo y eso no 'ta bien'*/

/*Un insert y un update me deja sin problemas */
 INSERT INTO video(id, title, description, url, usr_id) VALUES
(11, 'Alejese señor!!!', 'ahhhhh', 'https://????????????????.com', 1);

 UPDATE video
 SET title = 'Let´s Play Inside ¡ALÉJATE DE MÍ!', description = 'Este sí que me ha acojonado... X´D', url = 'https://youtu.be/cQ3J2K_Xhlc'
 WHERE id = 11; 


/*************************************************************************************
 * 3. CONCEDE PERMISO DE LECTURA Y ESCRITURA EN LA TABLA VIDEOS DE TU USUARIO CREADO *
 *  ANTERIORMENTE. VERIFICA SI EL USUARIO TIENE PERMISOS PARA REALIZAR ESTA ACCIÓN.  *
 *************************************************************************************/

/***************************************************************************************************
 *    4. REVOCA LOS PERMISOS DE ESCRITURA DEL USUARIO QUE HAS CREADO EN EL EJERCICIO ANTERIOR Y    *
 * OTÓRGALE PERMISOS DE LECTURA EN SU LUGAR. INTENTA REALIZAR UNA INSERCIÓN EN LA TABLA "VIDEOS" Y *
 *                VERIFICA SI EL USUARIO TIENE PERMISOS PARA REALIZAR ESTA ACCIÓN.                 *
 ***************************************************************************************************/

/*************************************************************************************************
 * 5. CREA UN NUEVO USUARIO LLAMADO "PRACTICAS" CON LA CONTRASEÑA "BECARIO" Y OTORGARLE PERMISOS *
 *   DE LECTURA EN LAS TABLAS VIDEOS Y COMENTARIOS. VERIFICA SI EL USUARIO TIENE PERMISOS PARA   *
 *                                     REALIZAR ESTA ACCIÓN.                                     *
 *************************************************************************************************/

/**************************************************************************************************
 * 6. OTORGA PERMISOS DE LECTURA EN LA TABLA "VIDEOS" A UN USUARIO Y LUEGO REVOCA LOS PERMISOS DE *
 *   LECTURA DE UN CAMPO ESPECÍFICO, POR EJEMPLO, "DESCRIPCIÓN". INTENTA REALIZAR UNA CONSULTA    *
 *     SELECT EN LA TABLA "VIDEOS" Y VERIFICA SI EL USUARIO TIENE PERMISOS PARA VER EL CAMPO      *
 *                                         "DESCRIPCIÓN".                                         *
 **************************************************************************************************/

/***********************************************************************************************
 * 7. PERMISOS DE LECTURA SOLO PARA EL CAMPO TITULO DE LA TABLA VIDEOS AL USUARIO "PRACTICAS Y *
 *              VERIFICA SI EL USUARIO TIENE PERMISOS PARA REALIZAR ESTA ACCIÓN.               *
 ***********************************************************************************************/


/******************
 * * CONSULTAS  * *
 ******************/

/*************************************************************
 * 1. CONSULTA EL NÚMERO DE VIDEOS SUBIDOS POR CADA USUARIO. *
 *************************************************************/
 SELECT username, COUNT(vid.id) as "videos subidos"
 FROM usuario usr
 JOIN video vid
 ON usr_id = usr.id
 GROUP BY username;

/***********************************************************************************************
 * 2. CONSULTA LA CANTIDAD DE COMENTARIOS REALIZADOS POR CADA USUARIO EN LA TABLA COMENTARIOS. *
 ***********************************************************************************************/
 SELECT username, COUNT(com.id) as comentarios
 FROM usuario usr
 JOIN comentario com
 ON usr_id = usr.id
 GROUP BY username;
 /*Podría haberlo hecho plenamente en la tabla comentario utilizando el id_usr en lugar del username, pero así es más bonico xd*/
 
/***************************************************************************************
 * 3. CONSULTA LOS COMENTARIOS REALIZADOS POR EL USUARIO JUAN QUE CONTENGAN LA PALABRA *
 *                                    "ENCANTADOR".                                    *
 ***************************************************************************************/
 /*Aquí me tome un poco de libertad, sobretodo porque me invente yo toda esta cosa y no metí a Juan, y mucho menos un comentario el diciendo 'encantados XD'*/
 SELECT username, contenido
 FROM usuario usr
 JOIN comentario com
 ON usr.id = usr_id
 WHERE username LIKE 'ReddyTalP' AND contenido LIKE '%primeros%';

 /*Si quitamos el where del contenido debería devolvernos un tercer comentario: */
  SELECT username, contenido
  FROM usuario usr
  JOIN comentario com
  ON usr.id = usr_id
  WHERE username LIKE 'ReddyTalP';
 