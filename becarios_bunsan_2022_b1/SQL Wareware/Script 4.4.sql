--4.4. En base a las asignaciones vigentes, calcular la fecha en la que al menos la mitad de los usuarios ya no tienen trabajo asignado.

SELECT percentile_disc(0.5) WITHIN group (ORDER BY end_date) AS fecha
FROM (SELECT end_Date FROM assignments WHERE (DATE '2022-03-01', DATE '2022-03-31') OVERLAPS(start_date, end_date)
ORDER BY end_date) as mytab;

--lo que arrojó--

 fecha    
------------
 2022-05-07
(1 row)
