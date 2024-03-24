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


/*******************************************************************************
 * 1. DEVUELVE UN LISTADO CON TODOS LOS EMPLEADOS QUE TIENE EL DEPARTAMENTO DE *
 *                     SISTEMAS. (SIN UTILIZAR INNER JOIN)                     *
 *******************************************************************************/

/**********************************************************************************
 * 2. DEVUELVE EL NOMBRE DEL DEPARTAMENTO CON MAYOR PRESUPUESTO Y LA CANTIDAD QUE *
 *                                 TIENE ASIGNADA                                 *
 **********************************************************************************/

/**********************************************************************************
 * 3. DEVUELVE EL NOMBRE DEL DEPARTAMENTO CON MENOR PRESUPUESTO Y LA CANTIDAD QUE *
 *                                 TIENE ASIGNADA                                 *
 **********************************************************************************/

/**********************************************************************************
 * 4. DEVUELVE EL NOMBRE DEL DEPARTAMENTO CON MAYOR PRESUPUESTO Y LA CANTIDAD QUE *
 *            TIENE ASIGNADA. SIN HACER USO DE MAX, ORDER BY NI LIMIT             *
 **********************************************************************************/
 SELECT nombre, presupuesto FROM departamento WHERE presupuesto IN (SELECT presupuesto FROM departamento WHERE presupuesto NOT IN (SELECT goroMajima.presupuesto FROM departamento AS kiryuKazama, departamento AS goroMajima WHERE kiryuKazama.presupuesto > goroMajima.presupuesto));
 /*Esto es una mrda random que encontre por ahí, es jodidamente ineficiente, pero funciona xd, básicamente agarro, creo en una subconsulta dos copias de presupueto, y me pongo a compararlas hasta que llegan al máximo valor o menor de una de las dos, almenos eso he entendido, por lo visto la cosa esta se le llama autojoin, selfjoin o algo así*/
 /*Seré sincero, estuve buscando un par de horas, pero acabe recurriendo a lo del chat, y aún así me ha llevado rato entender*/
 /*Siento lo de los nombres raros, estaba probando a poner cosas raras para entender el funcionamiento XD*/
 /*PD: Me imagino que no leeras esto, pero si puedo, en clase quiero mirar esto contigo, por saber si hay otra respuesta xD*/

/**********************************************************************************
 * 5. DEVUELVE EL NOMBRE DEL DEPARTAMENTO CON MENOR PRESUPUESTO Y LA CANTIDAD QUE *
 *            TIENE ASIGNADA. SIN HACER USO DE MIN, ORDER BY NI LIMIT             *
 **********************************************************************************/
 SELECT nombre, presupuesto FROM departamento WHERE presupuesto IN (SELECT presupuesto FROM departamento WHERE presupuesto NOT IN (SELECT goroMajima.presupuesto FROM departamento AS kiryuKazama, departamento AS goroMajima WHERE kiryuKazama.presupuesto < goroMajima.presupuesto));

/********************************************************************************
 * 6. DEVUELVE LOS NOMBRES DE LOS DEPARTAMENTOS QUE TIENEN EMPLEADOS ASOCIADOS. *
 *                            (UTILIZANDO ALL O ANY)                            *
 ********************************************************************************/
 SELECT nombre FROM departamento WHERE id = ANY (SELECT id_departamento FROM empleado WHERE id_departamento IS NOT NULL); 

/***********************************************************************************
 * 7. DEVUELVE LOS NOMBRES DE LOS DEPARTAMENTOS QUE NO TIENEN EMPLEADOS ASOCIADOS. *
 *                             (UTILIZANDO ALL O ANY)                              *
 ***********************************************************************************/
 SELECT nombre FROM departamento WHERE id != ALL (SELECT id_departamento FROM empleado WHERE id_departamento IS NOT NULL);

/********************************************************************************
 * 8. DEVUELVE LOS NOMBRES DE LOS DEPARTAMENTOS QUE TIENEN EMPLEADOS ASOCIADOS. *
 *                           (UTILIZANDO IN O NOT IN)                           *
 ********************************************************************************/
 SELECT nombre FROM departamento WHERE id IN (SELECT id_departamento FROM empleado WHERE id_departamento IS NOT NULL);

/***********************************************************************************
 * 9. DEVUELVE LOS NOMBRES DE LOS DEPARTAMENTOS QUE NO TIENEN EMPLEADOS ASOCIADOS. *
 *                            (UTILIZANDO IN O NOT IN)                             *
 ***********************************************************************************/
 SELECT nombre FROM departamento WHERE id NOT IN (SELECT id_departamento FROM empleado WHERE id_departamento IS NOT NULL);

/*********************************************************************************
 * 10. DEVUELVE LOS NOMBRES DE LOS DEPARTAMENTOS QUE TIENEN EMPLEADOS ASOCIADOS. *
 *                       (UTILIZANDO EXISTS O NOT EXISTS)                        *
 *********************************************************************************/

/*********************************************************************************
 * 11. DEVUELVE LOS NOMBRES DE LOS DEPARTAMENTOS QUE TIENEN EMPLEADOS ASOCIADOS. *
 *                       (UTILIZANDO EXISTS O NOT EXISTS)                        *
 *********************************************************************************/