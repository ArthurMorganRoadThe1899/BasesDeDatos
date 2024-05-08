CREATE TABLE usuario(
  id SERIAL PRIMARY KEY,
    nombre VARCHAR(50),
    email VARCHAR(100),
    fecha_nacimiento date /* yyyy-mm-dd  */
);

CREATE TABLE tweet(
  id SERIAL PRIMARY KEY,
    contenido VARCHAR(280),
    id_usr integer,
    fecha_creacion date, /* yyyy-mm-dd  */
        FOREIGN KEY(id_usr) REFERENCES usuario(id)
);

CREATE TABLE seguidor(
	id_usr integer,
	id_follower integer,
		FOREIGN KEY(id_usr) REFERENCES usuario(id),
    	CONSTRAINT followedR FOREIGN KEY(id_follower) REFERENCES usuario(id) ON DELETE CASCADE
);

INSERT INTO usuario (nombre, email, fecha_nacimiento) VALUES
    ('juan', 'juan@hotmail.com', '1980-02-01'),
    ('andrei', 'andrei@mixmail.com', '1982-02-02'),
    ('gerard', 'gerard@wanadoo.es', '1981-03-03'),
    ('carles', 'g.gonzalezmontes@edu.gva.es', '1981-03-04');


INSERT INTO tweet (contenido, fecha_creacion, id_usr) VALUES
    ('mi primer tweet : hola mundo de juan', '2022-02-01', 1),
    ('mi primer tweet : hola mundo de andrei', '2022-02-01', 2),
    ('mi primer tweet : hola mundo de gerard', '2022-02-01', 3);



INSERT INTO seguidor (id_usr, id_follower) VALUES
    (1,2),
    (1,3),
    (2,1),
    (2,3),
    (3,1),
    (3,2);



/* // FASE 1 // */

/*********************************************************************************************
 * 1. ACTUALIZA EL CORREO ELECTRÓNICO DEL USUARIO CON JUAN A JUAN@YA.COM. SI LOS DATOS ESTÁN *
 *                           CORRECTOS, CONFIRMAR LA TRANSACCIÓN.                            *
 *********************************************************************************************/
BEGIN;
 UPDATE usuario SET email = 'juan@ya.com'
 WHERE nombre = 'juan';
COMMIT;

/************************************************************************************************
 * 2. CREAR DOS USUARIOS NUEVOS , AÑADE PUNTO DE SALVADO, BORRAR UNA DE LAS FILAS CREADAS Y HAZ *
 *                          ROLLBACK PARA VOLVER AL PUNTO DE SALVADO.                           *
 ************************************************************************************************/
BEGIN;
 INSERT INTO usuario (nombre, email, fecha_nacimiento) VALUES
                    ('ester', 'ester@drive.com', '1981-02-04'),
                    ('jaume', 'jaume@arago.valls', '1981-02-05');
 SAVEPOINT savestate;

 DELETE FROM usuario
 WHERE nombre = 'ester';

 ROLLBACK TO savestate;
COMMIT;

/*****************************************************************************************
 * 3. INSERTAR VARIAS FILAS EN UNA TABLA Y DESHACER LA TRANSACCIÓN COMPLETA CON ROLLBACK *
 *****************************************************************************************/
BEGIN;

 INSERT INTO usuario (nombre, email, fecha_nacimiento) VALUES
                    ('alberto', 'alberto@outlook.com', '1981-02-06'),
                    ('juan', 'juanjosetiscarmoya@outlook.com', '1990-02-06');

  SAVEPOINT savestateNames;

 DELETE FROM usuario
 WHERE nombre = 'alberto' AND nombre = 'juan';

 ROLLBACK TO savestateNames;

 ROLLBACK;

/*****************************************************************************
 * 4. ELIMINAR UNA FILA DE UNA TABLA Y DESHACER LA ELIMINACIÓN CON ROLLBACK: *
 *****************************************************************************/
BEGIN;

 DELETE FROM usuario
 WHERE nombre = 'ester';

ROLLBACK-;

/*************************************************************************************************
 * 5. AÑADE EL USUARIO LLET_MERENGA , INSERTAR DOS FILAS EN LA TABLA TWEETS AL USUARIO ANTERIOR, *
 * HACER UN ROLLBACK Y LUEGO INSERTA EL SIGUIENTE TWIT AL USUARIO: LLET_MERENGA , UN ANILLO PARA *
 *                                     GOBERNARLOS A TODOS.                                      *
 *************************************************************************************************/
BEGIN;

 SAVEPOINT noTweets;
 INSERT INTO usuario (id, nombre, email, fecha_nacimiento) VALUES
                    (11 ,'LLET_MERENGA', 'batileche@outlook.com', '1981-02-06');


 INSERT INTO tweet (contenido, fecha_creacion, id_usr) VALUES
    ('no te preocupes shaggy, en la batcueva tomaremos batileche', '2022-02-01', 11),
    ('¿batique?', '2022-02-01', 11);

 ROLLBACK TO noTweets; /* Acá ya daría error pq no existe el usuario xd */

 INSERT INTO tweet (contenido, fecha_creacion, id_usr) VALUES
    ('UN ANILLO PARA GOBERNARLOS A TOODOS, GOLLUM, GOLLUM', '2022-02-01', 11);
	
COMMIT;

/********************************************
 * 6. BORRAR UN SEGUIDOR AL USUARIO ANDREI. *
 ********************************************/
BEGIN; 
 DELETE FROM seguidor
 WHERE id_usr IN (SELECT id_usr
				FROM seguidor
				JOIN usuario
				ON id = id_usr
				WHERE nombre = 'andrei')
				
 AND id_follower IN (SELECT id_follower
				FROM seguidor
				JOIN usuario
				ON id = id_follower
				WHERE nombre = 'juan');
COMMIT;




/* // FASE 2 //*/ 

/***************************************************************************************************
 * 1. INSERTA UN NUEVO USUARIO EN LA TABLA LLAMADO JOSEVI, CON CORREO: JOSEVICENTE@LATINMAIL.COM Y *
 *  CREA UN TUIT PARA ESE USUARIO EN LA TABLA "TWEETS" CON EL TEXTO: HOLA MUNDICO. LUEGO, HAZ UN   *
 *                        COMMIT PARA CONFIRMAR LA TRANSACCIÓN ES CORRECTA.                        *
 ***************************************************************************************************/
BEGIN;
 INSERT INTO usuario(id, nombre, email, fecha_nacimiento) VALUES
                    (12, 'josevi', 'josevicente@latinmail.com', '1988-12-23');

 INSERT INTO tweet (contenido, fecha_creacion, id_usr) VALUES
                   ('Hola mundico, i am a true alpha gamer :eduardo:', '2022-02-05', 12);
COMMIT;

/********************************************************************************************
 *  2. INSERTA EL USUARIO FORO_COCHES, AÑADE DOS SEGUIDORES PEUGEOT Y RENAULT AL USUARIO    *
 * FORO_COCHES. LUEGO, ACTUALIZA EL CORREO ELECTRÓNICO DEL USUARIO A FORO_COCHES@COCHES.NET *
 *                 POR ÚLTIMO, HAZ UN COMMIT PARA CONFIRMAR LA TRANSACCIÓN.                 *
 ********************************************************************************************/
BEGIN;
/*Ya se, es incremental, por pereza de mirar la db y que ids hay, les asigno un id para que la transacción vaya bien xD*/
 INSERT INTO usuario(id, nombre, email, fecha_nacimiento) VALUES
                    (33, 'foro_coches', NULL, '2003-08-13'),
                    (200, 'Renault', NULL, NULL),
                    (50, 'Pueugeot', NULL, NULL);

 INSERT INTO seguidor(id_usr, id_follower) VALUES
                     (33,200),
                     (33,50);   
 
 UPDATE usuario SET email = 'foro_coches@coches.net'
 WHERE nombre = 'foro_coches';
COMMIT;

/*************************************************************************************
 *                   3. INSERTA DOS SEGUIDORES AL PROFESOR ANDREI.                   *
 *                                     ! KEMPES                                      *
 *                                    ! MENDIETA                                     *
 * HAZ UN ROLLBACK, SEGUIDAMENTE INSERTA EL SEGUIDOR VILLA Y FINALIZA CON UN COMMIT. *
 *************************************************************************************/
BEGIN;
 
 INSERT INTO usuario(id, nombre, email, fecha_nacimiento) VALUES
                    (22, 'Kempes', NULL, NULL),
                    (23, 'Mendieta', NULL, NULL),
                    (24, 'Villa', NULL, NULL);
					
 SAVEPOINT savestate;
 INSERT INTO seguidor(id_usr, id_follower) VALUES
                     (2,22),
                     (2,23);   

 ROLLBACK TO savestate;
 INSERT INTO seguidor(id_usr, id_follower) VALUES
                     (2,24);
COMMIT;

/***********************************************************************************************
 * 4. INSERTA UN USUARIO NUEVO LLAMADO CARLES, CON EMAIL CARLES@NETSCAPE.COM, Y FECHA 1982-03- *
 *  05. SEGUIDAMENTE CREA UN SAVEPOINT. FINALMENTE CREA DOS TWEETS A DÍA 25 DE DICIEMBRE Y 31  *
 *          DE DICIEMBRE 2022. CON EL MENSAJE: FELIZ NOCHE BUEN@ Y FELIZ NOCHEVIEJA.           *
 ***********************************************************************************************/
BEGIN;
 INSERT INTO usuario(id, nombre, email, fecha_nacimiento) VALUES
                    (999, 'Carles', 'carles@netscape.com', '1982-03-05');

 SAVEPOINT savestate;
 
 INSERT INTO tweet (contenido, fecha_creacion, id_usr) VALUES
                   ('Feliz navidad y nochebuena, os sea leve ^^', '2022-12-31', 999),
                   ('saddfsaaffgsASADfdsaA tw', '2023-01-01', 999);
COMMIT;