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
 ROLLBACK;
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
 SAVEPOINT savestate;
 INSERT INTO usuario (nombre, email, fecha_nacimiento) VALUES
                    ('alberto', 'alberto@outlook.com', '1981-02-06'),
                    ('juan', 'juanjosetiscarmoya@outlook.com', '1990-02-06');

  SAVEPOINT savestateNames;

 DELETE FROM usuario
 WHERE nombre = 'alberto' AND nombre = 'juan';

 ROLLBACK TO savestateNames;

 ROLLBACK TO savestate;
COMMIT;

/*****************************************************************************
 * 4. ELIMINAR UNA FILA DE UNA TABLA Y DESHACER LA ELIMINACIÓN CON ROLLBACK: *
 *****************************************************************************/
BEGIN;
 SAVEPOINT savestate;

 DELETE FROM usuario
 WHERE nombre = 'ester';

 ROLLBACK TO savestate;
COMMIT;

/*************************************************************************************************
 * 5. AÑADE EL USUARIO LLET_MERENGA , INSERTAR DOS FILAS EN LA TABLA TWEETS AL USUARIO ANTERIOR, *
 * HACER UN ROLLBACK Y LUEGO INSERTA EL SIGUIENTE TWIT AL USUARIO: LLET_MERENGA , UN ANILLO PARA *
 *                                     GOBERNARLOS A TODOS.                                      *
 *************************************************************************************************/

/********************************************
 * 6. BORRAR UN SEGUIDOR AL USUARIO ANDREI. *
 ********************************************/



/* // FASE 2 //*/ 

/***************************************************************************************************
 * 1. INSERTA UN NUEVO USUARIO EN LA TABLA LLAMADO JOSEVI, CON CORREO: JOSEVICENTE@LATINMAIL.COM Y *
 *  CREA UN TUIT PARA ESE USUARIO EN LA TABLA "TWEETS" CON EL TEXTO: HOLA MUNDICO. LUEGO, HAZ UN   *
 *                        COMMIT PARA CONFIRMAR LA TRANSACCIÓN ES CORRECTA.                        *
 ***************************************************************************************************/

/********************************************************************************************
 *  2. INSERTA EL USUARIO FORO_COCHES , AÑADE DOS SEGUIDORES PEUGEOT Y RENAULT AL USUARIO   *
 * FORO_COCHES. LUEGO, ACTUALIZA EL CORREO ELECTRÓNICO DEL USUARIO A FORO_COCHES@COCHES.NET *
 *                 POR ÚLTIMO, HAZ UN COMMIT PARA CONFIRMAR LA TRANSACCIÓN.                 *
 ********************************************************************************************/

/*************************************************************************************
 *                   3. INSERTA DOS SEGUIDORES AL PROFESOR ANDREI.                   *
 *                                     ! KEMPES                                      *
 *                                    ! MENDIETA                                     *
 * HAZ UN ROLLBACK, SEGUIDAMENTE INSERTA EL SEGUIDOR VILLA Y FINALIZA CON UN COMMIT. *
 *************************************************************************************/

/***********************************************************************************************
 * 4. INSERTA UN USUARIO NUEVO LLAMADO CARLES, CON EMAIL CARLES@NETSCAPE.COM, Y FECHA 1982-03- *
 *  05. SEGUIDAMENTE CREA UN SAVEPOINT. FINALMENTE CREA DOS TWEETS A DÍA 25 DE DICIEMBRE Y 31  *
 *          DE DICIEMBRE 2022. CON EL MENSAJE: FELIZ NOCHE BUEN@ Y FELIZ NOCHEVIEJA.           *
 ***********************************************************************************************/



 /*Para confirmar la transacción utiliza commit.*/