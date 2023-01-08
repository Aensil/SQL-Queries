/**
  * First row of table - Abdel
  */

SELECT *
FROM platzi.alumnos
LIMIT 1;

SELECT *
FROM platzi.alumnos
FETCH FIRST 1 ROWS ONLY;

SELECT *
FROM (
	SELECT ROW_NUMBER() OVER() AS row_id, *
	FROM platzi.alumnos
) AS alumnos_row_num
WHERE row_id = 1;

SELECT *
FROM platzi.alumnos
LIMIT 5;

SELECT *
FROM platzi.alumnos
FETCH FIRST 5 ROWS ONLY;

SELECT *
FROM (
	SELECT ROW_NUMBER() OVER() AS row_id, *
	FROM platzi.alumnos
) AS alumnos_row_num
WHERE row_id < 6;
-- row_id <= 5;