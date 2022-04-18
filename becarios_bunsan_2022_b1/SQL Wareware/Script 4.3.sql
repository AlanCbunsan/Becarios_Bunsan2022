--4.3. Obtener la lista de los 10 usuarios activos(name, handle) que son los que tienen menos skills registrados, ordenados de menos a mayor;

SELECT users.name, users.handle, users.email, count as count_skills FROM (
SELECT user_id, count(user_id)FROM user_skills GROUP BY user_id HAVING count(*)>0) AS mytable INNER JOIN users 
ON users.id = mytable.user_id AND users.enabled = 'true' 
ORDER BY count, id 
LIMIT 10;

--Lo que me arrojó--

             name              |         handle          |           email            | count_skills 
--------------------------------+-------------------------+----------------------------+--------------
 Marduk Perez de Lara           | Marduk                  | marduk@bunsan.io           |            1
 Daniela González               | Daniela.                | daniela.gonzalez@bunsan.io |            1
 Roberto Javier Sánchez Urrutia | RobSanUrr               | roberto.sanchez@bunsan.io  |            1
 Sergio Acosta                  | sergio.acosta           | sergio.acosta@bunsan.io    |            1
 Karla Emma Loya Alvarado       | KarlaL                  | karla.loya@bunsan.io       |            1
 Juan Alexis Mora Angulo        | Alexis M A              | juan.mora@bunsan.io        |            1
 Ivan Sanchez Cervantes         | ISCervant               | ivan.sanchez@bunsan.io     |            1
 Uriel Alberto Gembe Campanur   | Uriel Gembe             | uriel.gembe@bunsan.io      |            1
 Jose Antonio Serrano Peña      | Antonio.serrano.bunsan1 | jose.serrano@bunsan.io     |            1
 Adrian Alberto Guzman Sanchez  | Adrian2122              | adrian.guzman@bunsan.io    |            1
(10 rows)
