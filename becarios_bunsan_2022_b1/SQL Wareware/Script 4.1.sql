--4.1. Obtener la lista de usuarios (name,handle,email) que estan activas (enabled) y no tienen imagen de perfil, ordenados alfabeticamente por nombre--

SELECT name, handle, email FROM users WHERE enabled = 'true' AND image is NULL ORDER BY name; 

--Lo que arrojó:--

wareware_dev=# SELECT name,handle,email from users WHERE enabled = 't' AND image is NULL ORDER BY name;
             name              |     handle     |            email            
-------------------------------+----------------+-----------------------------
 Adrian Alberto Guzman Sanchez | Adrian2122     | adrian.guzman@bunsan.io
 Adrián Reyes Delgado          | adrianRD       | adrian.reyes@bunsan.io
 Alberto Tellez                | Alberto        | alberto@bunsan.io
 Aldo Flores Aparicio          | aldofa         | aldo.flores@bunsan.io
 Andrew González               | andrewGM       | andrew@bunsan.io
 David Alexis Romo Jáuregui    | David Romo     | david.romo@bunsan.io
 Gerardo Aquino                | java.daba.doo  | gerardo@bunsan.io
 Humberto Bañuelos Flores      | hbanuelos      | humberto.banuelos@bunsan.io
 Ivan Barron                   | ivandavid77    | david@bunsan.io
 Jesús Jiménez Cordero         | Jesus.JimenezC | jesus.jimenez@bunsan.io
 Josafat Rosas Ortiz           | JRO            | josafat.rosas@bunsan.io
 Juan Galicia                  | ga_c           | juan.galicia@bunsan.io
 Juan Manuel Viscencio Ramirez | mviscencio     | juan.viscencio@bunsan.io
 Lorena Mireles                | Lorena         | lorena@bunsan.io
 Noberto Ortigoza              | hiphoox        | norberto@bunsan.io
 Sergio Daniel Pucheta Yza     | logan500       | sergio.pucheta@bunsan.io
(16 rows)
