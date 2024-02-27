-- Crear tabla Artista
CREATE TABLE artista (
    id_Artista INT PRIMARY KEY,
    nombre VARCHAR(50) 
);
 
-- Crear tabla Album
CREATE TABLE album (
    id_Album INT PRIMARY KEY,
    id_Artista INT ,
    titulo VARCHAR(50) ,
    Anio INT ,
    FOREIGN KEY (id_Artista) REFERENCES artista(id_Artista) 
);
 
-- Crear tabla Cancion
CREATE TABLE cancion (
    id_Cancion INT PRIMARY KEY,
    id_Album INT ,
    titulo VARCHAR(50) ,
    duracion INT ,
    FOREIGN KEY (id_Album) REFERENCES album(id_Album) 
);
 
-- Crear tabla Usuario
CREATE TABLE usuario (
    Id_Usuario INT PRIMARY KEY,
    nombre VARCHAR(50),
    email VARCHAR(100) 
);
 
-- Crear tabla ListaReproduccion
CREATE TABLE listaReproduccion (
    id_Lista INT PRIMARY KEY,
    id_Usuario INT ,
    titulo VARCHAR(50) ,
    FOREIGN KEY (id_Usuario) REFERENCES usuario(id_Usuario) 
);
 
-- Agregar reglas de integridad a la tabla Cancion
ALTER TABLE cancion ADD CONSTRAINT CK_Duracion CHECK (duracion >= 0);
 

-- Insertar datos de prueba en la tabla Usuario
INSERT INTO usuario (id_Usuario, nombre, email)
VALUES
    (1, 'Juan', 'juan@gmail.com'),
    (2, 'María', 'maria@yahoo.com'),
    (3, 'Pedro', 'pedro@hotmail.com'),
    (4, 'Misterio', NULL),
    (5, 'Joan', 'joan@gmail.com'),
    (6, 'Mar', 'mar@yahoo.com');

 
-- Insertar datos de prueba en la tabla ListaReproduccion
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