CREATE TABLE artista (
    id_Artista INT PRIMARY KEY,
    nombre VARCHAR(50) 
);

CREATE TABLE album (
    id_Album INT PRIMARY KEY,
    id_Artista INT ,
    titulo VARCHAR(50) ,
    Anio INT ,
    FOREIGN KEY (id_Artista) REFERENCES artista(id_Artista) 
);
 
CREATE TABLE cancion (
    id_Cancion INT PRIMARY KEY,
    id_Album INT ,
    titulo VARCHAR(50) ,
    duracion INT ,
    FOREIGN KEY (id_Album) REFERENCES album(id_Album) 
);
 
CREATE TABLE usuario (
    Id_Usuario INT PRIMARY KEY,
    nombre VARCHAR(50),
    email VARCHAR(100) 
);
 
CREATE TABLE listaReproduccion (
    id_Lista INT PRIMARY KEY,
    id_Usuario INT ,
    titulo VARCHAR(50) ,
    FOREIGN KEY (id_Usuario) REFERENCES usuario(id_Usuario) 
);
 
ALTER TABLE cancion ADD CONSTRAINT CK_Duracion CHECK (duracion >= 0);
 

INSERT INTO usuario (id_Usuario, nombre, email)
VALUES
    (1, 'Juan', 'juan@gmail.com'),
    (2, 'María', 'maria@yahoo.com'),
    (3, 'Pedro', 'pedro@hotmail.com'),
    (4, 'Misterio', NULL),
    (5, 'Joan', 'joan@gmail.com'),
    (6, 'Mar', 'mar@yahoo.com'),
    (7, 'Carles', 'g.gonzalezmontes@edu.gva.es');

 
INSERT INTO listaReproduccion (id_Lista, id_Usuario, titulo)
VALUES
    (1, 1, 'Mis favoritas'),
    (2, 2, 'Canciones para bailar'),
    (3, 3, 'Música relajante'),
    (4, 4, 'Manolo Garcia & amigos'),
     (5, 5, 'Música para hacer deporte'),
     (6, 6, 'Canciones para estudiar');


    INSERT INTO artista (id_Artista, nombre)
VALUES
    (1, 'Pablo Alborán'),
    (2, 'Rosalía'),
    (3, 'Manolo García'),
    (4, 'Amaral'),
    (5, 'Antonio Orozco'),
    (6, NULL),
    (7, 'Miguel Bose'),
    (8, 'Rozalén'),
(9, 'Vanesa Martín'),
(10, 'David Bisbal');


INSERT INTO album (id_Album, id_Artista, titulo, anio)
VALUES
    (1, 1, 'Pablo Alborán', 2011),
    (2, 1, 'En Acústico', 2011),
    (3, 2, 'El Mal Querer', 2018),
    (4, 2, 'Los Ángeles', 2017),
    (5, 3, 'Geometría del Rayo', 2018),
    (6, 3, 'Los Días Intactos', 2011),
    (7, 4, 'Hacia lo Salvaje', 2011),
    (8, 4, 'Pájaros en la Cabeza', 2005),
    (9, 5, 'Diez', 2008),
    (10, 5, 'Renovatio', 2011),
    (11, 6, 'Sin album 2.0', 2011),
    (12, 6, 'Sin Álbum', NULL),
    (13, 6, 'Cuando el río suena...', 2017),
    (14, 6, 'Con derecho a...', 2020),
    (15, 8, 'Munay', 2016),
    (16, 9, 'Todas las mujeres que habitan en mí', 2018),
    (17, 10, 'Corazón latino', 2002),
    (18, 10, 'Bulería', 2004);


INSERT INTO cancion (id_Cancion, id_Album, titulo, duracion)
VALUES
    (1, 1, 'Solamente Tú', 220),
    (2, 1, 'Miedo', 227),
    (3, 2, 'Te He Echado De Menos', 258),
    (4, 2, 'Perdóname', 250),
    (5, 3, 'Malamente', 182),
    (6, 3, 'Pienso En Tu Mirá', 240),
    (7, 4, 'Catalina', 256),
    (8, 4, 'De Plata', 258),
    (9, 5, 'Devuélveme La Vida', 244),
    (10, 5, 'Dime Por Qué', 229),
    (11, 6, 'Sombra de la Sombra de Tu Sombrero', 266),
    (12, 6, 'Un Giro Teatral', 301),
    (13, 7, 'Hacia lo Salvaje', 307),
    (14, 7, 'Esperando un Resplandor', 245),
    (15, 8, 'El Universo Sobre Mí', 273),
    (16, 9 , 'Esperando un Resplandor', 245),
    (17, 10 , NULL, 200),
    (18, 11, NULL, 180),
    (19, 11, NULL, 240),
    (20, 11, NULL, 190),
    (21, NULL, 'La marimorena de Pepe', 14);


/***************************************************************
 * 1. MOSTRAR EL NÚMERO DE ÁLBUMES PUBLICADOS POR CADA ARTISTA *
 ***************************************************************/
 SELECT nombre, COUNT(titulo) as albumes
 FROM artista art
 LEFT JOIN album alb
 ON art.id_Artista = alb.id_Artista
 GROUP BY nombre;

/***************************************************************
 * 2. MOSTRAR LA DURACIÓN TOTAL DE LAS CANCIONES DE CADA ÁLBUM *
 ***************************************************************/
 SELECT alb.titulo, SUM(duracion) as "duración"
 FROM album alb
 JOIN cancion can
 ON alb.id_Album = can.id_Album
 GROUP BY alb.titulo;

/*****************************************************************************
 * 3. MOSTRAR LA CANTIDAD DE LISTAS DE REPRODUCCIÓN CREADAS POR CADA USUARIO *
 *****************************************************************************/
 SELECT nombre, COUNT(lr.id_Usuario) as "Listas creadas"
 FROM usuario use
 LEFT JOIN listaReproduccion lr
 ON use.id_Usuario = lr.id_Usuario
 GROUP BY nombre;

/****************************************************
 * 4. OBTENER EL NÚMERO DE CANCIONES POR CADA ÁLBUM *
 *                 (CON UNA VISTA)                  *
 ****************************************************/
 CREATE VIEW cancionesXalbum AS
 SELECT alb.titulo, COUNT(id_Cancion) as "Número de canciones"
 FROM album alb
 LEFT JOIN cancion can
 ON alb.id_Album = can.id_Album
 GROUP BY alb.titulo;
 
 SELECT * FROM cancionesxalbum;


/******************************************************
 * 5. OBTENER EL NÚMERO DE CANCIONES POR CADA ARTISTA *
 ******************************************************/
 SELECT DISTINCT nombre, COUNT(can.id_Cancion) as "número de canciones"
 FROM artista art
 LEFT JOIN album alb
 ON art.id_Artista = alb.id_Artista
 JOIN cancion can
 ON alb.id_Album = can.id_Album
 GROUP BY nombre;

/****************************************************
 * 6. OBTENER EL NÚMERO DE ÁLBUMES POR CADA ARTISTA *
 ****************************************************/
  SELECT DISTINCT nombre, COUNT(alb.id_Album) as "número de albumes"
  FROM artista art
  LEFT JOIN album alb
  ON art.id_Artista = alb.id_Artista
  GROUP BY nombre;

/*******************************************************
 * 7. OBTENER LA DURACIÓN TOTAL DE CANCIONES POR ÁLBUM *
 *******************************************************/
  SELECT can.titulo as "nombre cancion", alb.titulo as "nombre album", duracion
  FROM album alb
  JOIN cancion can
  ON alb.id_Album = can.id_Album
  GROUP BY can.titulo, alb.titulo, duracion
  ORDER BY can.titulo ASC;

/*************************************************
 * 8. OBTENER LA CANTIDAD DE ÁLBUMES POR ARTISTA *
 *************************************************/
  SELECT nombre, COUNT(titulo) as albumes
  FROM artista art
  LEFT JOIN album alb
  ON art.id_Artista = alb.id_Artista
  GROUP BY nombre;

/*************************************************************
 * 9. OBTENER EL PROMEDIO DE DURACIÓN DE CANCIONES POR ÁLBUM *
 *************************************************************/
  SELECT alb.titulo, AVG(duracion) as "duración"
  FROM album alb
  JOIN cancion can
  ON alb.id_Album = can.id_Album
  GROUP BY alb.titulo;

/***********************************************************************
 * 10. OBTENER EL NÚMERO DE USUARIOS QUE TIENEN LISTAS DE REPRODUCCIÓN *
 ***********************************************************************/
 SELECT COUNT(DISTINCT lr.id_Usuario) as "usuarios con lista"
 FROM listaReproduccion lr
 JOIN usuario use
 ON use.id_Usuario = lr.id_Usuario;

/********************************************************************
 * 11. OBTENER EL NÚMERO DE CANCIONES EN CADA LISTA DE REPRODUCCIÓN *
 ********************************************************************/
 SELECT COUNT(nombre)
 FROM listaReproduccion lr
 JOIN usuario use
 ON use.id_Usuario = lr.id_Usuario;

/***************************************************************
 * 12. OBTENER EL NÚMERO DE LISTAS DE REPRODUCCIÓN POR USUARIO *
 *                       (CON UNA VISTA)                       *
 ***************************************************************/
 /* Aquí dejo de usar use para para abreviar usuario y lo hago con usr, me di cuenta
 como a mitad y me estaba poniendo nerviso XD*/
 CREATE VIEW numeroListasXuser AS
 SELECT nombre, COUNT(id_Lista)
 FROM usuario usr
 LEFT JOIN listaReproduccion lr
 ON usr.id_Usuario = lr.id_Usuario
 GROUP BY nombre;

 SELECT * FROM numeroListasXuser;

/*********************************************************************
 * 13. CONSULTA QUE MUESTRA LA DURACIÓN TOTAL DE CANCIONES POR ÁLBUM *
 *                          (CON UNA VISTA)                          *
 *********************************************************************/
 CREATE VIEW duracionCancionesXalbum AS
 SELECT alb.titulo, SUM(duracion) as "duración"
 FROM album alb
 JOIN cancion can
 ON alb.id_Album = can.id_Album
 GROUP BY alb.titulo;

 SELECT * FROM duracionCancionesXalbum;