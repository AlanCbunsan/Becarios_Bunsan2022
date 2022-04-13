-- SCRIPT DE VENTAS --

--Consulta para ver si el producto esta disponible--

SELECT * FROM product WHERE id = 35 AND stock > 1500;

-- lo que arrojo --

id |            product             | stock | available_for_selling 
----+--------------------------------+-------+-----------------------
 35 | Pastry - Plain Baked Croissant | 88177 | false
(1 row)--

--Consulta para ver si se puede vender--

SELECT * FROM product WHERE id = 35 AND available_for_selling = 'true';

-- lo que arrojo --

 id |            product             | stock | available_for_selling 
----+--------------------------------+-------+-----------------------
 35 | Pastry - Plain Baked Croissant | 88177 | false
(1 row)

--Consulta para actualizar el stock--

UPDATE product 
SET stock = stock - 1500
WHERE id = 35;

-- lo que arrojo --
UPDATE 1


--Registro de venta--

INSERT INTO sales(id_product, name_product, id_costumer, amount, status) VALUES (35, (SELECT product FROM product WHERE id = 35), 
(SELECT id FROM "user" WHERE first_name = 'Erik' AND last_name = 'Jaffa'), 1500, (SELECT available_for_selling FROM product WHERE id = 35));



