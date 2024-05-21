/***********************************************
 * CREAR LAS TABLAS DENTRO DE LA BASE DE DATOS *
 ***********************************************/
CREATE TABLE empleados (
   id integer PRIMARY KEY,
   nombre VARCHAR(50),
   salario integer
);



CREATE TABLE departamentos (
   id integer PRIMARY KEY,
   id_empleado integer, 
	FOREIGN KEY (id_empleado)
	REFERENCES empleados(id)
);



CREATE TABLE proyectos (
   id integer PRIMARY KEY,
	id_empleado integer,
	FOREIGN KEY (id_empleado)
	REFERENCES empleados(id)
);



CREATE TABLE empleados_proyectos (
   id integer PRIMARY KEY,
	id_empleado integer,
	FOREIGN KEY (id_empleado)
	REFERENCES empleados(id)
);



/************************
 * CREACIÓN DE USUARIOS *
 ************************/
CREATE ROLE analista;
GRANT SELECT ON ALL TABLES IN SCHEMA public TO analista;

CREATE ROLE gerente;
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA public TO gerente;

CREATE ROLE MAJIMA;
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO MAJIMA;

/***************************************************************************
 * REVOCAR QUE EL ROL 'GERENTE' PUEDA VER EL SALARIO EN LA TABLA EMPLEADOS *
 ***************************************************************************/
 REVOKE SELECT ON empleados FROM gerente;
 GRANT SELECT ("id", "nombre") ON empleados TO gerente;


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

 /* * MAJIMA * */
 CREATE USER acasanova WITH PASSWORD 'patito';
 GRANT MAJIMA TO acasanova;
 CREATE USER rsegura WITH PASSWORD 'mazapan';
 GRANT MAJIMA TO rsegura;
 CREATE USER smolina WITH PASSWORD 'cucudrilo';
 GRANT MAJIMA TO smolina;

