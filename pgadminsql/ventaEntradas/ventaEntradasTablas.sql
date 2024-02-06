/*============================*/
/*== CREAR TODAS LAS TABLAS ==*/
/*============================*/
CREATE TABLE espectaculo (
    id_espectaculo integer PRIMARY KEY,
    nombre VARCHAR(66),
    tipo VARCHAR(31),
    fecha_inicial date,
    fecha_final date,
    interprete VARCHAR(26)
);

CREATE TABLE precio_espectaculo (
    id_precio integer PRIMARY KEY,
    zona VARCHAR(36), 
    precio DECIMAL(11)
);

CREATE TABLE recinto (
    id_recinto integer PRIMARY KEY,
    nombre VARCHAR(26),
    ciudad VARCHAR(47),
    telefono integer,
    horario date
);

CREATE TABLE zonas_recinto (
    id_zonaR integer PRIMARY KEY,
    zona VARCHAR(36),
    capacidad integer
);

CREATE TABLE asiento (
    id_asiento integer PRIMARY KEY,
    zona VARCHAR(36),
    fila VARCHAR(4),
    numero integer
);

CREATE TABLE representacion (
    id_representacion integer,
    fecha date,
    hora time
);

CREATE TABLE entrada (
    id_entrada integer,
    fecha date,
    hora time,
    fila VARCHAR(4),
    numero integer,
    zona VARCHAR(36),
    DNI_cliente VARCHAR(10)
);

CREATE TABLE espectador (
    DNI_cliente VARCHAR(10) PRIMARY KEY,
    nombre VARCHAR(28),
    direccion VARCHAR(50),
    telefono integer,
    ciudad VARCHAR(46),
    num_tarjeta integer
);


/*=====================================*/
/*== PONER TODAS LAS CLAVES FORANEAS ==*/
/*=====================================*/

    /*ESPECTACULO*/
    ALTER TABLE espectaculo ADD COLUMN recinto integer;
	ALTER TABLE espectaculo ADD CONSTRAINT recinto FOREIGN KEY (recinto) REFERENCES recinto(id_recinto);  

    /*PRECIO_ESPECTACULO*/
    ALTER TABLE precio_espectaculo ADD COLUMN recinto integer;
    ALTER TABLE precio_espectaculo ADD COLUMN espectaculo integer;
	ALTER TABLE precio_espectaculo ADD CONSTRAINT recinto FOREIGN KEY (recinto) REFERENCES recinto(id_recinto);  
    ALTER TABLE precio_espectaculo ADD CONSTRAINT espectaculo FOREIGN KEY (espectaculo) REFERENCES espectaculo(id_espectaculo);

    /*ZONAS_RECINTO*/
    ALTER TABLE zonas_recinto ADD COLUMN recinto integer;
	ALTER TABLE zonas_recinto ADD CONSTRAINT recinto FOREIGN KEY (recinto) REFERENCES recinto(id_recinto);

    /*ASIENTO*/
    ALTER TABLE asiento ADD COLUMN recinto integer;
	ALTER TABLE asiento ADD CONSTRAINT recinto FOREIGN KEY (recinto) REFERENCES recinto(id_recinto);

    /*REPRESENTACION*/
    ALTER TABLE representacion ADD COLUMN espectaculo integer;
    ALTER TABLE representacion ADD CONSTRAINT espectaculo FOREIGN KEY (espectaculo) REFERENCES espectaculo(id_espectaculo);

    /*ENTRADADA*/
    ALTER TABLE entrada ADD COLUMN recinto integer;
    ALTER TABLE entrada ADD COLUMN espectaculo integer;
	ALTER TABLE entrada ADD CONSTRAINT recinto FOREIGN KEY (recinto) REFERENCES recinto(id_recinto);  
    ALTER TABLE entrada ADD CONSTRAINT espectaculo FOREIGN KEY (espectaculo) REFERENCES espectaculo(id_espectaculo);