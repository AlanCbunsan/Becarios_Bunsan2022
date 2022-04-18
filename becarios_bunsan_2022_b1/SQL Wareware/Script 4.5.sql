--4.5. En base a las asignaciones vigentes en marzo y considerando que cada dia laborable (lun-vie) es de 8 hrs, 
--calcular el total de horas trabajadas durante marzo por todos los usuarios.--

SELECT (count(*) * 8 * (SELECT count(*)
FROM assignments WHERE (DATE '2022-03-01', DATE '2022-03-31')
OVERLAPS (start_date, end_date))) as Worked_hours FROM (SELECT dd, extract(DOW from dd) as dw
FROM generate_series('2022-03-01'::date, '2022-03-31'::date, '1 day'::interval) dd) as month
WHERE dw not IN (6,0);

--Lo que arrojó--

worked_hours 
--------------
        10120
(1 row)
