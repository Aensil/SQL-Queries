/**
  * RETO:   Encontrar el mínimo absoluto en nombre y
  *         el mínimo por tutor;
  */
-- Mínimo absoluto de la tabla --
SELECT	nombre
FROM	platzi.alumnos
ORDER BY nombre ASC
LIMIT 1;

-- Funcion MIN --
SELECT	tutor_id, MIN(nombre)
FROM	platzi.alumnos
GROUP BY tutor_id
ORDER BY tutor_id;

/**
  * Operaciones con la misma tabla
  */

-- Relacion alumno / tutor --
SELECT	a.nombre,
		a.apellido,
		t.nombre,
		t.apellido
FROM	platzi.alumnos AS a
	INNER JOIN platzi.alumnos AS t ON a.tutor_id = t.id;

-- Operaciones de texto concat --
SELECT	CONCAT(a.nombre, ' ', a.apellido) AS alumno,
		CONCAT(t.nombre, ' ', t.apellido) AS tutor
FROM	platzi.alumnos AS a
	INNER JOIN platzi.alumnos AS t ON a.tutor_id = t.id;

-- Contando alumnos por tutor --
SELECT	CONCAT(t.nombre, ' ', t.apellido) AS tutor,
		COUNT(*) AS alumnos_por_tutor
FROM	platzi.alumnos AS a
	INNER JOIN platzi.alumnos AS t ON a.tutor_id = t.id
GROUP BY tutor
ORDER BY alumnos_por_tutor DESC
LIMIT 5;

--CHALLANGE
SELECT	CONCAT(t.nombre, ' ', t.apellido) AS tutor,
		COUNT(*) AS alumnos_por_tutor
FROM	platzi.alumnos AS a
	INNER JOIN platzi.alumnos AS t ON a.tutor_id = t.id
GROUP BY tutor
ORDER BY alumnos_por_tutor DESC;