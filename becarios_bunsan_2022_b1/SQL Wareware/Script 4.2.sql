--4.2. Obtener la lista de usuarios (name, handle) que estan activos, saben elixir al menos en un nivel competent y ademas saben aws en cualquier nivel. 
--(los niveles de competencia son, en orden: novice, advanced_beginner, competent, proficient, expert)

SELECT users.name, users.handle
FROM (SELECT user_id FROM user_skills
WHERE skill_id = (SELECT id FROM skills WHERE name = 'Elixir') AND level = 'competent' 
OR skill_id = (SELECT id FROM skills WHERE name = 'AWS') 
GROUP BY user_id 
HAVING COUNT(*)>1) AS mytable 
INNER JOIN users 
ON users.id = mytable.user_id;

--lo que arrojó--

        name         |    handle     
----------------------+---------------
 Misael Ramirez Lopez | MisaelRaLo
 Julio Sánchez        | thegeekinside
 Paola Reyes          | d5lment
(3 rows)
