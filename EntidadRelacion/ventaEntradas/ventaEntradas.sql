/*====================*/
/*== CREAR DATABASE ==*/
/*====================*/
CREATE DATABASE "ventaEntradas_JAA"{
    WITH
    OWNER = joselito
    ENCODING = 'UTF8'
    LC_COLLATE = 'C.UTF-8'
    LC_CTYPE = 'C.UTF-8'
    TABLESPACE = pg_default
    CONNECTION LIMIT  = -1;
}

/*============================*/
/*== CREAR TODAS LAS TABLAS ==*/
/*============================*/
CREATE TABLE ESPECTACULO{
    id_espectaculo integer(4) PRIMARY KEY,
    nombre VARCHAR(66),
    tipo VARCHAR(31),
    fecha_inicial date,
    fecha_final date,
    interprete VARCHAR(26)
} /*claves foraneas: recinto*/

CREATE TABLE PRECIO_ESPECTACULO{
    id_precio integer(4) PRIMARY KEY,
    zona VARCHAR(36), 
    precio DECIMAL(11)
} /*claves foraneas: espectaculo | recinto*/

CREATE TABLE RECINTOS{
    id_recinto integer(4) PRIMARY KEY,
    nombre VARCHAR(26),
    ciudad VARCHAR(47),
    telefono integer(16),
    horario datetime2
}

CREATE TABLE ZONAS_RECINTOS{
    id_zonaR integer() PRIMARY KEY,
    zona VARCHAR(36),
    capacidad integer(5)
}/*claves foraneas: recinto*/

CREATE TABLE ASIENTO{
    id_asiento integer() PRIMARY KEY,
    zona VARCHAR(36),
    fila VARCHAR(4),
    numero integer(4)
}/*claves foraneas: recinto*/

CREATE TABLE REPRESENTACION{
    id_representacion integer(4),
    fecha date,
    hora time
}/*claves foraneas: espectaculo*/

CREATE TABLE ENTRADA{
    id_entrada integer(4),
    fecha date,
    hora time,
    fila VARCHAR(4),
    numero integer(3),
    zona VARCHAR(36),
    DNI_cliente VARCHAR(10),
}/*claves foraneas: espectaculo | recinto*/

CREATE TABLE ESPECTADOR{
    DNI_cliente VARCHAR(10), PRIMARY KEY,
    nombre VARCHAR(28),
    direccion VARCHAR(50),
    telefono integer(12),
    ciudad VARCHAR(46),
    num_tarjeta integer
}

/*=====================================*/
/*== PONER TODAS LAS CLAVES FORANEAS ==*/
/*=====================================*/
