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
                   ('Keykal67', 'keycal67official@gmail.com');

INSERT INTO video(title, description, url, usr_id) VALUES
                 ('Cómo DISEÑAR el Equipo Pokémon Perfecto [Tutorial-Diseño]', 'La primera parte del completo tutorial sobre la creación de equipos pokémon competitivos', 'https://www.youtube.com/watch?v=jnDsu3Ot7e0&ab_channel=RanguGamer', 1),
                 ('Comienzo a desarrollar MI PROPIO videojuego de granja', 'Página de Steam: https://store.steampowered.com/app/22...', 'https://www.youtube.com/watch?v=TO5_aLqZ6gI&list=PLB_3CyEiP5FvJcLrms9sDsojfl8JxOOHw&ab_channel=Leyendas%26Videojuegos', 2),
                 (),
                 (),
                 ();

