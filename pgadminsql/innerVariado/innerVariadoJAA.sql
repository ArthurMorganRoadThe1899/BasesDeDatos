CREATE TABLE departamento ( 
  id INT PRIMARY KEY, 
  nombre VARCHAR(100) NOT NULL, 
  presupuesto DECIMAL NOT NULL, 
  gastos DECIMAL NOT NULL 
); 
 
CREATE TABLE empleado ( 
  id INT PRIMARY KEY, 
  nif VARCHAR(9) NOT NULL UNIQUE, 
  nombre VARCHAR(100) NOT NULL, 
  apellido1 VARCHAR(100) NOT NULL, 
  apellido2 VARCHAR(100), 
  id_departamento INT, 
  FOREIGN KEY (id_departamento) REFERENCES departamento(id) 
); 
 
INSERT INTO departamento VALUES(1, 'Desarrollo', 120000, 6000); 
INSERT INTO departamento VALUES(2, 'Sistemas', 150000, 21000); 
INSERT INTO departamento VALUES(3, 'Recursos Humanos', 280000, 25000); 
INSERT INTO departamento VALUES(4, 'Contabilidad', 110000, 3000); 
INSERT INTO departamento VALUES(5, 'I+D', 375000, 380000); 
INSERT INTO departamento VALUES(6, 'Proyectos', 0, 0); 
INSERT INTO departamento VALUES(7, 'Publicidad', 0, 1000); 
 
INSERT INTO empleado VALUES(1, '32481596F', 'Aarón', 'Rivero', 'Gómez', 1); 
INSERT INTO empleado VALUES(2, 'Y5575632D', 'Adela', 'Salas', 'Díaz', 2); 
INSERT INTO empleado VALUES(3, 'R6970642B', 'Adolfo', 'Rubio', 'Flores', 3); 
INSERT INTO empleado VALUES(4, '77705545E', 'Adrián', 'Suárez', NULL, 4); 
INSERT INTO empleado VALUES(5, '17087203C', 'Marcos', 'Loyola', 'Méndez', 5); 
INSERT INTO empleado VALUES(6, '38382980M', 'María', 'Santana', 'Moreno', 1); 
INSERT INTO empleado VALUES(7, '80576669X', 'Pilar', 'Ruiz', NULL, 2); 
INSERT INTO empleado VALUES(8, '71651431Z', 'Pepe', 'Ruiz', 'Santana', 3); 
INSERT INTO empleado VALUES(9, '56399183D', 'Juan', 'Gómez', 'López', 2); 
INSERT INTO empleado VALUES(10, '46384486H', 'Diego','Flores', 'Salas', 5); 
INSERT INTO empleado VALUES(11, '67389283A', 'Marta','Herrera', 'Gil', 1); 
INSERT INTO empleado VALUES(12, '41234836R', 'Irene','Salas', 'Flores', NULL); 
INSERT INTO empleado VALUES(13, '82635162B', 'Juan Antonio','Sáez', 'Guerrero', NULL);

/***********************************************************************************
 * 1. DEVUELVE UN LISTADO CON LOS EMPLEADOS Y LOS DATOS DE LOS DEPARTAMENTOS DONDE *
 *                                TRABAJA CADA UNO                                 *
 ***********************************************************************************/

/***************************************************************************************
 *  2.  DEVUELVE UN LISTADO CON LOS EMPLEADOS Y LOS DATOS DE LOS DEPARTAMENTOS DONDE   *
 *      TRABAJA CADA UNO. ORDENA EL RESULTADO, EN PRIMER LUGAR, POR EL NOMBRE DEL      *
 * DEPARTAMENTO (EN ORDEN ALFABÉTICO) Y EN SEGUNDO LUGAR POR LOS APELLIDOS Y EL NOMBRE *
 *                                  DE LOS EMPLEADOS                                   *
 ***************************************************************************************/

/******************************************************************************************
 * 3. DEVUELVE UN LISTADO CON EL IDENTIFICADOR Y EL NOMBRE DEL DEPARTAMENTO, SOLAMENTE DE *
 *                      AQUELLOS DEPARTAMENTOS QUE TIENEN EMPLEADOS                       *
 ******************************************************************************************/

/******************************************************************************************
 * 4. DEVUELVE UN LISTADO CON EL IDENTIFICADOR, EL NOMBRE DEL DEPARTAMENTO Y EL VALOR DEL *
 *      PRESUPUESTO ACTUAL DEL QUE DISPONE, SOLAMENTE DE AQUELLOS DEPARTAMENTOS QUE       *
 * TIENEN EMPLEADOS. EL VALOR DEL PRESUPUESTO ACTUAL LO PUEDE CALCULAR RESTANDO AL VALOR  *
 *  DEL PRESUPUESTO INICIAL (COLUMNA PRESUPUESTO) EL VALOR DE LOS GASTOS QUE HA GENERADO  *
 *                                    (COLUMNA GASTOS)                                    *
 ******************************************************************************************/

/*************************************************************************************
 * 5. DEVUELVE EL NOMBRE DEL DEPARTAMENTO DONDE TRABAJA EL EMPLEADO QUE TIENE EL NIF *
 *                                     38382980M                                     *
 *************************************************************************************/

/**************************************************************************************
 * 6. DEVUELVE EL NOMBRE DEL DEPARTAMENTO DONDE TRABAJA EL EMPLEADO PEPE RUIZ SANTANA *
 **************************************************************************************/

/*****************************************************************************************
 * 7. DEVUELVE UN LISTADO CON LOS DATOS DE LOS EMPLEADOS QUE TRABAJAN EN EL DEPARTAMENTO *
 *                      DE I+D. ORDENA EL RESULTADO ALFABÉTICAMENTE                      *
 *****************************************************************************************/

/*****************************************************************************************
 * 8. DEVUELVE UN LISTADO CON LOS DATOS DE LOS EMPLEADOS QUE TRABAJAN EN EL DEPARTAMENTO *
 *         DE SISTEMAS, CONTABILIDAD O I+D. ORDENA EL RESULTADO ALFABÉTICAMENTE          *
 *****************************************************************************************/

/*****************************************************************************************
 * 9. DEVUELVE UNA LISTA CON EL NOMBRE DE LOS EMPLEADOS QUE TIENEN LOS DEPARTAMENTOS QUE *
 *                 NO TIENEN UN PRESUPUESTO ENTRE 100000 Y 200000 EUROS                  *
 *****************************************************************************************/

/*********************************************************************************
 * 10. DEVUELVE UN LISTADO CON EL NOMBRE DE LOS DEPARTAMENTOS DONDE EXISTE ALGÚN *
 * EMPLEADO CUYO SEGUNDO APELLIDO SEA NULL. TENGA EN CUENTA QUE NO DEBE MOSTRAR  *
 *                 NOMBRES DE DEPARTAMENTOS QUE ESTÉN REPETIDOS                  *
 *********************************************************************************/