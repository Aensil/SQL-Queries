/**
  * RETO:  Seleccionar los registros de ambas tablas
  * sin importar si tienen contraparte en la otra
  * Unión
  */

SELECT 	a.nombre,
		a.apellido,
		a.carrera_id,
		c.id,
		c.carrera
FROM	platzi.alumnos AS a
	FULL OUTER JOIN platzi.carreras AS c
	ON a.carrera_id = c.id
ORDER BY a.carrera_id DESC, c.id DESC;

/**
  * Tipos de JOIN
  */
-- Left Join Exclusivo: Intersección --
SELECT 	a.nombre,
		a.apellido,
		a.carrera_id,
		c.id,
		c.carrera
FROM	platzi.alumnos AS a
	LEFT JOIN platzi.carreras AS c
	ON a.carrera_id = c.id
WHERE c.id IS NULL;

-- Left Join --
SELECT 	a.nombre,
		a.apellido,
		a.carrera_id,
		c.id,
		c.carrera
FROM	platzi.alumnos AS a
	LEFT JOIN platzi.carreras AS c
	ON a.carrera_id = c.id
ORDER BY c.id DESC;

-- Right Join Exclusivo: Intersección --
SELECT 	a.nombre,
		a.apellido,
		a.carrera_id,
		c.id,
		c.carrera
FROM	platzi.alumnos AS a
	RIGHT JOIN platzi.carreras AS c
	ON a.carrera_id = c.id
WHERE a.id IS NULL
ORDER BY c.id;

-- Right Join --
SELECT 	a.nombre,
		a.apellido,
		a.carrera_id,
		c.id,
		c.carrera
FROM	platzi.alumnos AS a
	RIGHT JOIN platzi.carreras AS c
	ON a.carrera_id = c.id
ORDER BY c.id DESC;

-- Inner Join: Producto cartesiano --
SELECT 	a.nombre,
		a.apellido,
		a.carrera_id,
		c.id,
		c.carrera
FROM	platzi.alumnos AS a
	INNER JOIN platzi.carreras AS c
	ON a.carrera_id = c.id
ORDER BY c.id DESC;

-- Diferencia simétrica --
SELECT 	a.nombre,
		a.apellido,
		a.carrera_id,
		c.id,
		c.carrera
FROM	platzi.alumnos AS a
	FULL OUTER JOIN platzi.carreras AS c
	ON a.carrera_id = c.id
ORDER BY a.carrera_id DESC, c.id DESC;

-- Or

SELECT 	a.nombre,
		a.apellido,
		a.carrera_id,
		c.id,
		c.carrera
FROM	platzi.alumnos AS a
	FULL OUTER JOIN platzi.carreras AS c
	ON a.carrera_id = c.id
WHERE a.id IS NULL
		OR c.id IS NULL
ORDER BY a.carrera_id DESC, c.id DESC;
