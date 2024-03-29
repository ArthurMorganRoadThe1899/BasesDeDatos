CREATE TABLE pizzas ( 
  id_pizza SERIAL PRIMARY KEY, 
  nombre VARCHAR(50), 
  numero_ingredientes INTEGER, 
 Ingrediente_extra varchar (20), 
  tamaño VARCHAR(10) 
); 

  
CREATE TABLE tortugas_ninja ( 
  id_tortuga SERIAL PRIMARY KEY, 
  nombre VARCHAR(50), 
  arma VARCHAR(50), 
  color VARCHAR(50) 
); 

  
CREATE TABLE pedidos ( 
  id_pedido SERIAL PRIMARY KEY, 
  id_tortuga INTEGER REFERENCES tortugas_ninja(id_tortuga), 
  id_pizza INTEGER REFERENCES pizzas(id_pizza), 
  fecha DATE 
); 


INSERT INTO tortugas_ninja (nombre, arma, color) VALUES 
  ('Leonardo', 'Katanas', 'Azul'), 
  ('Raphael', 'Sai', 'Rojo'), 
  ('Donatello', 'Bastón', 'Morado'), 
  ('Michelangelo', 'Nunchakus', 'Naranja'); 


INSERT INTO pizzas (nombre, numero_ingredientes, ingrediente_extra, tamaño) VALUES 
  ('Margarita', 3, NULL, 'Mediana'), 
  ('Pepperoni', 5, 'Champiñones', 'Grande'), 
  ('Hawaiana', 4, 'Jamón', 'Mediana'), 
  ('Vegetariana', 6, 'Pimiento', 'Grande'), 
  ('Cuatro Quesos', 4, 'Gorgonzola', 'Mediana'), 
  ('Barbacoa', 7, 'Cebolla', 'Grande'), 
  ('Mexicana', 5, 'Jalapeños', 'Mediana'), 
  ('Carbonara', 6, 'Bacon', 'Grande'), 
  ('Marinera', 7, 'Atún', 'Mediana'), 
  ('Napolitana', 4, 'Anchoas', 'Grande'), 
  ('Capricciosa', 5, 'Aceitunas', 'Grande'), 
  ('Prosciutto', 4, 'Champiñones', 'Mediana'), 
  ('Diavola', 6, 'Salami', 'Grande'), 
  ('Quattro Stagioni', 7, 'Alcachofas', 'Mediana'), 
  ('Tonno', 5, 'Cebolla', 'Grande'), 
  ('Frutti di Mare', 8, 'Calamares', 'Mediana'), 
  ('Calzone', 4, 'Queso ricotta', 'Grande'), 
  ('Margarita.', 3, 'Chucherias', 'Grande'), 
  ('Napoletana', 4, 'Anchoas', 'Grande'), 
  ('Romana', 5, 'Pancetta', 'Mediana'); 



INSERT INTO pedidos (id_tortuga, id_pizza, fecha) VALUES 
  (1, 3, '2023-01-01'), 
  (2, 5, '2023-01-02'), 
  (3, 2, '2023-01-01'), 
  (4, 1, '2023-01-03'), 
  (1, 4, '2023-01-02'), 
  (2, 6, '2023-03-06'), 
  (3, 8, '2023-03-04'), 
  (4, 9, '2023-03-09'), 
  (1, 10, '2023-03-28'), 
  (2, 7, '2023-03-28'); 


/************************************************************************************
 * 1. CONSULTA PARA CALCULAR EL PROMEDIO DE INGREDIENTES POR PIZZA PARA CADA TAMAÑO *
 ************************************************************************************/
 SELECT tamaño, AVG(numero_ingredientes) FROM pizzas GROUP BY tamaño;

/***************************************************************************************************
 * 2. CONSULTA PARA CALCULAR EL NÚMERO TOTAL DE INGREDIENTES EN PIZZAS PARA CADA INGREDIENTE EXTRA *
 ***************************************************************************************************/
 SELECT ingrediente_extra, MAX(numero_ingredientes) FROM pizzas GROUP BY ingrediente_extra; /* ? */


/**********************************************************************************
 * 3. CONSULTA PARA CALCULAR EL NÚMERO TOTAL DE PEDIDOS REALIZADOS POR CADA NINJA *
 **********************************************************************************/
 SELECT id_tortuga, COUNT(id_pizza) AS pedidos_totales FROM pedidos GROUP BY id_tortuga; 

/***********************************************************************************************
 * 4. CONSULTA PARA CALCULAR LA CANTIDAD TOTAL DE PIZZAS PEDIDAS POR CADA TAMAÑO, ORDENADAS DE *
 *                                        MAYOR A MENOR                                        *
 ***********************************************************************************************/
 SELECT COUNT(id_pizza), tamaño FROM pizzas WHERE id_pizza IN(SELECT id_pizza FROM pedidos) GROUP BY tamaño ORDER BY tamaño DESC;

/*********************************************************************************
 * 5. CONSULTA PARA CALCULAR EL NÚMERO PROMEDIO DE PIZZAS PEDIDAS POR CADA NINJA *
 *********************************************************************************/
 SELECT id_tortuga, AVG(id_pedido) FROM pedidos GROUP BY id_tortuga; 
 