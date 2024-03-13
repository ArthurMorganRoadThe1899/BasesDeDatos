/*DROP DATABASE IF EXISTS empleados; 
CREATE DATABASE empleados CHARACTER SET utf8mb4; 
USE empleados;*/
 
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


/******************************************************
 * 1. LISTA EL PRIMER APELLIDO DE TODOS LOS EMPLEADOS *
 ******************************************************/
 SELECT apellido1 FROM empleado;

/*********************************************************************************************
 * 2. LISTA EL PRIMER APELLIDO DE LOS EMPLEADOS ELIMINANDO LOS APELLIDOS QUE ESTÉN REPETIDOS *
 *********************************************************************************************/
 SELECT DISTINCT(apellido1) FROM empleado;

/****************************************************
 * 3. LISTA TODAS LAS COLUMNAS DE LA TABLA EMPLEADO *
 ****************************************************/
 SELECT * FROM empleado;

/*************************************************************
 * 4. LISTA EL NOMBRE Y LOS APELLIDOS DE TODOS LOS EMPLEADOS *
 *************************************************************/
 SELECT nombre, apellido1, apellido2 FROM empleado;

/*****************************************************************************************************
 * 5. LISTA EL IDENTIFICADOR DE LOS DEPARTAMENTOS DE LOS EMPLEADOS QUE APARECEN EN LA TABLA EMPLEADO *
 *****************************************************************************************************/
 SELECT nombre, id_departamento FROM empleado WHERE id_departamento IS NOT NULL;

/************************************************************************************************************************************************************
 * 6. LISTA EL IDENTIFICADOR DE LOS DEPARTAMENTOS DE LOS EMPLEADOS QUE APARECEN EN LA TABLA EMPLEADO, ELIMINANDO LOS IDENTIFICADORES QUE APARECEN REPETIDOS *
 ************************************************************************************************************************************************************/
 SELECT DISTINCT(id_departamento) FROM empleado WHERE id_departamento IS NOT NULL;

/************************************************************************
 * 7. LISTA EL NOMBRE Y APELLIDOS DE LOS EMPLEADOS EN UNA ÚNICA COLUMNA *
 ************************************************************************/
 SELECT CONCAT(nombre,' ',apellido1, ' ',apellido2) FROM empleado;

/************************************************************************************************************************
 * 8. LISTA EL NOMBRE Y APELLIDOS DE LOS EMPLEADOS EN UNA ÚNICA COLUMNA, CONVIRTIENDO TODOS LOS CARACTERES EN MAYÚSCULA *
 ************************************************************************************************************************/
 SELECT UPPER(CONCAT(nombre,' ',apellido1, ' ',apellido2)) FROM empleado;

/************************************************************************************************************************
 * 9. LISTA EL NOMBRE Y APELLIDOS DE LOS EMPLEADOS EN UNA ÚNICA COLUMNA, CONVIRTIENDO TODOS LOS CARACTERES EN MINÚSCULA *
 ************************************************************************************************************************/
 SELECT LOWER(CONCAT(nombre,' ',apellido1, ' ',apellido2)) FROM empleado;

/***********************************************************************************************
 * 10.LISTA EL IDENTIFICADOR DE LOS EMPLEADOS JUNTO AL NIF, PERO EL NIF DEBERÁ APARECER EN DOS *
 *          COLUMNAS, UNA MOSTRARÁ ÚNICAMENTE LOS DÍGITOS DEL NIF Y LA OTRA LA LETRA           *
 ***********************************************************************************************/
 SELECT id, LEFT(nif, 8) AS digitos, RIGHT(NIF,1) AS letrita FROM empleado;

/***********************************************************************************************
 * 11. LISTA EL NOMBRE DE CADA DEPARTAMENTO Y EL VALOR DEL PRESUPUESTO ACTUAL DEL QUE DISPONE. *
 *     PARA CALCULAR ESTE DATO TENDRÁ QUE RESTAR AL VALOR DEL PRESUPUESTO INICIAL (COLUMNA     *
 *    PRESUPUESTO) LOS GASTOS QUE SE HAN GENERADO (COLUMNA GASTOS). TENGA EN CUENTA QUE EN     *
 *  ALGUNOS CASOS PUEDEN EXISTIR VALORES NEGATIVOS. UTILICE UN ALIAS APROPIADO PARA LA NUEVA   *
 *                             COLUMNA COLUMNA QUE ESTÁ CALCULANDO                             *
 ***********************************************************************************************/
 SELECT  nombre, (presupuesto-gastos) AS gastos_actuales FROM departamento;

/***********************************************************************************************************
 * 12. LISTA EL NOMBRE DE LOS DEPARTAMENTOS Y EL VALOR DEL PRESUPUESTO ACTUAL ORDENADO DE FORMA ASCENDENTE *
 ***********************************************************************************************************/
 SELECT  nombre, (presupuesto-gastos) AS gastos_actuales FROM departamento ORDER BY gastos_actuales ASC;

/********************************************************************************
 * 13. LISTA EL NOMBRE DE TODOS LOS DEPARTAMENTOS ORDENADOS DE FORMA ASCENDENTE *
 ********************************************************************************/
 SELECT nombre FROM departamento ORDER BY nombre ASC;

/*********************************************************************************
 * 14. LISTA EL NOMBRE DE TODOS LOS DEPARTAMENTOS ORDENADOS DE FORMA DESCENDENTE *
 *********************************************************************************/
 SELECT nombre FROM departamento ORDER BY nombre DESC;

/*********************************************************************************************
 * 15. LISTA LOS APELLIDOS Y EL NOMBRE DE TODOS LOS EMPLEADOS, ORDENADOS DE FORMA ALFABÉTICA *
 *            TENDIENDO EN CUENTA EN PRIMER LUGAR SUS APELLIDOS Y LUEGO SU NOMBRE            *
 *********************************************************************************************/
 SELECT apellido1 AS apellido, nombre FROM empleado ORDER BY apellido ASC;

/********************************************************************************************
 * 16. DEVUELVE UNA LISTA CON EL NOMBRE Y EL PRESUPUESTO, DE LOS 3 DEPARTAMENTOS QUE TIENEN *
 *                                    MAYOR PRESUPUESTO                                     *
 ********************************************************************************************/
 SELECT nombre, presupuesto FROM departamento ORDER BY presupuesto DESC LIMIT 3;

/********************************************************************************************
 * 17. DEVUELVE UNA LISTA CON EL NOMBRE Y EL PRESUPUESTO, DE LOS 3 DEPARTAMENTOS QUE TIENEN *
 *                                    MENOR PRESUPUESTO                                     *
 ********************************************************************************************/
 SELECT nombre, presupuesto FROM departamento ORDER BY presupuesto ASC LIMIT 3;

/********************************************************************************************
 * 18. DEVUELVE UNA LISTA CON EL NOMBRE Y EL GASTO, DE LOS 2 DEPARTAMENTOS QUE TIENEN MAYOR *
 *                                          GASTO                                           *
 ********************************************************************************************/
 SELECT nombre, gastos FROM departamento ORDER BY presupuesto DESC LIMIT 2;

/********************************************************************************************
 * 19. DEVUELVE UNA LISTA CON EL NOMBRE Y EL GASTO, DE LOS 2 DEPARTAMENTOS QUE TIENEN MENOR *
 *                                          GASTO                                           *
 ********************************************************************************************/
 SELECT nombre, gastos FROM departamento ORDER BY presupuesto ASC LIMIT 2;

/********************************************************************************************************
 * 20. DEVUELVE UNA LISTA CON 5 FILAS A PARTIR DE LA TERCERA FILA DE LA TABLA EMPLEADO. LA TERCERA FILA *
 *      SE DEBE INCLUIR EN LA RESPUESTA. LA RESPUESTA DEBE INCLUIR TODAS LAS COLUMNAS DE LA TABLA       *
 *                                               EMPLEADO                                               *
 ********************************************************************************************************/
 SELECT * FROM empleado LIMIT 5 OFFSET 2;

/***********************************************************************************************
 * 21. DEVUELVE UNA LISTA CON EL NOMBRE DE LOS DEPARTAMENTOS Y EL PRESUPUESTO, DE AQUELLOS QUE *
 *                     TIENEN UN PRESUPUESTO MAYOR O IGUAL A 150000 EUROS                      *
 ***********************************************************************************************/
 SELECT nombre, presupuesto FROM departamento WHERE presupuesto >= 15000;

/************************************************************************************************
 * 22. DEVUELVE UNA LISTA CON EL NOMBRE DE LOS DEPARTAMENTOS Y EL GASTO, DE AQUELLOS QUE TIENEN *
 *                                MENOS DE 5000 EUROS DE GASTOS                                 *
 ************************************************************************************************/
 SELECT nombre, gastos FROM departamento WHERE gastos < 5000 ORDER BY gastos DESC;

/***********************************************************************************************
 * 23. DEVUELVE UNA LISTA CON EL NOMBRE DE LOS DEPARTAMENTOS Y EL PRESUPUESTO, DE AQUELLOS QUE *
 *     TIENEN UN PRESUPUESTO ENTRE 100000 Y 200000 EUROS. SIN UTILIZAR EL OPERADOR BETWEEN     *
 ***********************************************************************************************/
 SELECT nombre, presupuesto FROM departamento WHERE presupuesto >= 100000 AND presupuesto <= 200000;

/******************************************************************************************
 * 24. DEVUELVE UNA LISTA CON EL NOMBRE DE LOS DEPARTAMENTOS QUE NO TIENEN UN PRESUPUESTO *
 *             ENTRE 100000 Y 200000 EUROS. SIN UTILIZAR EL OPERADOR BETWEEN              *
 ******************************************************************************************/
 SELECT nombre, presupuesto FROM departamento WHERE NOT (presupuesto >= 100000 AND presupuesto <= 200000);

/*********************************************************************************************
 * 25. DEVUELVE UNA LISTA CON EL NOMBRE DE LOS DEPARTAMENTOS QUE TIENEN UN PRESUPUESTO ENTRE *
 *                   100000 Y 200000 EUROS. UTILIZANDO EL OPERADOR BETWEEN                   *
 *********************************************************************************************/
 SELECT nombre, presupuesto FROM departamento WHERE presupuesto BETWEEN 100000 AND 200000;

/******************************************************************************************
 * 26. DEVUELVE UNA LISTA CON EL NOMBRE DE LOS DEPARTAMENTOS QUE NO TIENEN UN PRESUPUESTO *
 *              ENTRE 100000 Y 200000 EUROS. UTILIZANDO EL OPERADOR BETWEEN               *
 ******************************************************************************************/
 SELECT nombre, presupuesto FROM departamento WHERE NOT presupuesto BETWEEN 100000 AND 200000;

/************************************************************************************************
 * 27. DEVUELVE UNA LISTA CON EL NOMBRE DE LOS DEPARTAMENTOS, GASTOS Y PRESUPUESTO, DE AQUELLOS *
 *       DEPARTAMENTOS DONDE LOS GASTOS SEAN MAYORES QUE EL PRESUPUESTO DEL QUE DISPONEN        *
 ************************************************************************************************/
 SELECT nombre, presupuesto, gastos FROM departamento;


