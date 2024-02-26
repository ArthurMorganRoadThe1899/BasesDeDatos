-- Crear tabla Artista
CREATE TABLE Artista (
    Id_Artista INT PRIMARY KEY,
    Nombre VARCHAR(50) 
);
 
-- Crear tabla Album
CREATE TABLE Album (
    Id_Album INT PRIMARY KEY,
    Id_Artista INT ,
    Titulo VARCHAR(50) ,
    Anio INT ,
    FOREIGN KEY (Id_Artista) REFERENCES Artista(Id_Artista) 
);
 
-- Crear tabla Cancion
CREATE TABLE Cancion (
    Id_Cancion INT PRIMARY KEY,
    Id_Album INT ,
    Titulo VARCHAR(50) ,
    Duracion INT ,
    FOREIGN KEY (Id_Album) REFERENCES Album(Id_Album) 
);
 
-- Crear tabla Usuario
CREATE TABLE Usuario (
    Id_Usuario INT PRIMARY KEY,
    Nombre VARCHAR(50),
    Email VARCHAR(100) 
);
 
-- Crear tabla ListaReproduccion
CREATE TABLE ListaReproduccion (
    Id_Lista INT PRIMARY KEY,
    Id_Usuario INT ,
    Titulo VARCHAR(50) ,
    FOREIGN KEY (Id_Usuario) REFERENCES Usuario(Id_Usuario) 
);
 
-- Agregar reglas de integridad a la tabla Cancion
ALTER TABLE Cancion ADD CONSTRAINT CK_Duracion CHECK (Duracion >= 0);
 

-- Insertar datos de prueba en la tabla Usuario
INSERT INTO Usuario (Id_Usuario, Nombre, Email)
VALUES
    (1, 'Juan', 'juan@gmail.com'),
    (2, 'María', 'maria@yahoo.com'),
    (3, 'Pedro', 'pedro@hotmail.com'),
    (4, 'Misterio', NULL),
    (5, 'Joan', 'joan@gmail.com'),
    (6, 'Mar', 'mar@yahoo.com');

 
-- Insertar datos de prueba en la tabla ListaReproduccion
INSERT INTO ListaReproduccion (Id_Lista, Id_Usuario, Titulo)
VALUES
    (1, 1, 'Mis favoritas'),
    (2, 2, 'Canciones para bailar'),
    (3, 3, 'Música relajante'),
    (4, 4, 'Manolo Garcia & amigos'),
     (5, 5, 'Música para hacer deporte'),
     (6, 6, 'Canciones para estudiar');


    INSERT INTO Artista (Id_Artista, Nombre)
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


INSERT INTO Album (Id_Album, Id_Artista, Titulo, Anio)
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
    (12, 6, 'Cuando el río suena...', 2017),
    (13, 6, 'Con derecho a...', 2020),
    (14, 8, 'Munay', 2016),
    (15, 9, 'Todas las mujeres que habitan en mí', 2018),
    (16, 10, 'Corazón latino', 2002),
    (17, 10, 'Bulería', 2004);


INSERT INTO Cancion (Id_Cancion, Id_Album, Titulo, Duracion)
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
    (20, 11, NULL, 190);


/************************************************************
 * 1. SELECCIONAR TODOS LOS ÁLBUMES LANZADOS EN EL AÑO 2011 *
 ************************************************************/

/****************************************************************************
 * 2. SELECCIONAR TODAS LAS CANCIONES CON UNA DURACIÓN MAYOR A 180 SEGUNDOS *
 ****************************************************************************/

/****************************************************************************************
 * 3. SELECCIONAR TODAS LAS LISTAS DE REPRODUCCIÓN CREADAS POR EL ARTISTA MANOLO GARCIA *
 ****************************************************************************************/

/***************************************************************************
 * 4. SELECCIONAR TODOS LOS ARTISTAS QUE TENGAN UN IDENTIFICADOR MAYOR A 5 *
 ***************************************************************************/

/*********************************************************************************
 * 5. SELECCIONAR TODAS LAS CANCIONES CON UNA DURACIÓN MAYOR O IGUAL A 4 MINUTOS *
 *********************************************************************************/

/******************************************************************************
 * 6. SELECCIONAR TODAS LAS CANCIONES QUE NO TENGAN UNA DURACIÓN DE 4 MINUTOS *
 ******************************************************************************/

/******************************************************************************************
 * 7. SELECCIONAR TODOS LOS ÁLBUMES QUE TENGAN UN IDENTIFICADOR MAYOR O IGUAL A 2 Y MENOR *
 *                                      O IGUAL A 5                                       *
 ******************************************************************************************/

/************************************************************************
 * 8. SELECCIONAR TODOS LOS ARTISTAS QUE NO TIENEN UN NOMBRE REGISTRADO *
 ************************************************************************/

/*****************************************************************************
 * 9. SELECCIONAR TODOS LOS ÁLBUMES QUE TIENEN UNA FECHA DE LANZAMIENTO 2018 *
 *****************************************************************************/

/*************************************************************************************
 * 10. SELECCIONAR TODOS LOS USUARIOS QUE NO TIENEN UN CORREO ELECTRÓNICO REGISTRADO *
 *************************************************************************************/
/***************************************************************************
 * 11. SELECCIONAR TODAS LAS CANCIONES QUE NO TIENEN UN ÁLBUM ESPECIFICADO *
 ***************************************************************************/

/********************************************************************
 * 12. SELECCIONAR TODOS LOS ÁLBUMES QUE TIENEN UN ARTISTA ASIGNADO *
 ********************************************************************/

/**********************************************************************
 * 13. SELECCIONAR TODOS LOS USUARIOS QUE TIENEN UN NOMBRE REGISTRADO *
 **********************************************************************/