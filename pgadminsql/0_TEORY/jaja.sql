/***********************************************
 * CREAR LAS TABLAS DENTRO DE LA BASE DE DATOS *
 ***********************************************/
CREATE TABLE ark.empleados (
   id integer PRIMARY KEY,
   nombre VARCHAR(50),
   salario integer
);


CREATE TABLE ark.departamentos (
   id integer PRIMARY KEY,
   id_empleado integer, 
	FOREIGN KEY (id_empleado)
	REFERENCES ark.empleados(id)
);



CREATE TABLE ark.proyectos (
   id integer PRIMARY KEY,
	id_empleado integer,
	FOREIGN KEY (id_empleado)
	REFERENCES ark.empleados(id)
);



CREATE TABLE ark.empleados_proyectos (
   id integer PRIMARY KEY,
	id_empleado integer,
	FOREIGN KEY (id_empleado)
	REFERENCES ark.empleados(id)
);



/************************
 * CREACIÓN DE USUARIOS *
 ************************/
CREATE ROLE analista;
GRANT SELECT ON ALL TABLES IN SCHEMA ark TO analista;

CREATE ROLE gerente;
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA ark TO gerente;

CREATE ROLE majima
WITH
CREATEDB
CREATEROLE
LOGIN
CONNECTION LIMIT 2000;

/***************************************************************************
 * REVOCAR QUE EL ROL 'GERENTE' PUEDA VER EL SALARIO EN LA TABLA EMPLEADOS *
 ***************************************************************************/
 GRANT UPDATE, DELETE, INSERT  ("id", "nombre") ON ark.empleados TO MAJIMA;


/*****************************************************
 * CREACION DE USUARIOS NUEVOS PARA LA BASE DE DATOS *
 *****************************************************/

 /* ? Analistas ? */
 CREATE USER pmartinez WITH PASSWORD 'unicornio' VALID UNTIL '2025-1-1';
 GRANT analista TO pmartinez;
 CREATE USER jsuarez WITH PASSWORD '123pescado';
 GRANT analista TO jsuarez;

 /* ! Gerentes ! */
 CREATE USER msanchez WITH PASSWORD '#67sacarino' VALID UNTIL '2026-1-7';
 GRANT gerente TO msanchez;
 CREATE USER bgonzalez WITH PASSWORD 'west33';
 GRANT gerente TO bgonzalez;

 /* GRANT CREATE ON ALL TABLES TO bgonzalez; */

 /* * admin * */
 CREATE USER acasanova WITH PASSWORD 'patito';
 GRANT majima TO acasanova;
 CREATE USER rsegura WITH PASSWORD 'mazapan';
 GRANT majima TO rsegura;
 CREATE USER smolina WITH PASSWORD 'cucudrilo';
 GRANT majima TO smolina;

