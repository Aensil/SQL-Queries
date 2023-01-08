/**
  * RETO:  Experimenta con rpad
  * cual es la diferencia?
  */

-- Funcion lpad --
SELECT rpad('sql', 15, '*');

-- Lpad con incrementales --
SELECT rpad ('sql', id, '*')
FROM platzi.alumnos
WHERE id < 10;

-- Generar un triángulo usando Lpad --
SELECT rpad ('*', id, '*')
FROM platzi.alumnos
WHERE id < 10;

/**
  * Generar rangos en tuplas
  */

-- Genera una serie del 1 al 4 --
SELECT  *
FROM    generate_series(1,4);

-- Genera una serie decreciente de 5 a 1 de 2 en 2 --
SELECT  *
FROM generate_series(5,1,-2);

-- Genera un arreglo con 0 tuplas --
SELECT *
FROM generate_series(3,4);

SELECT *
FROM generate_series(4,3);

SELECT *
FROM generate_series(4,4);

SELECT *
FROM generate_series(3,4,-1);

-- Serie de 1.1 hasta 4 o menos paso de 1.3 --
SELECT generate_series(1.1, 4, 1.3);

-- Genera una secuencia de fechas empezando en la fecha actual
-- Con una separación de 7 días (1 semana) con el operador + de fecha
SELECT current_date + s.a AS dates
FROM generate_series(0,14,7) AS s(a);

-- Genera una secuencia de 10 en 10 horas --
--::timestamp is cast to convert to timestamp or time data
SELECT * FROM generate_series('2020-09-01 00:00'::timestamp,
                              '2020-09-04 12:00', '10 hours');

-- Join con secuencia --
SELECT 	a.id,
		a.nombre,
		a.apellido,
		a.carrera_id,
		s.a
FROM	platzi.alumnos AS a
	INNER JOIN	generate_series(0,10) AS s(a)
	ON s.a = a.carrera_id
ORDER BY a.carrera_id;

