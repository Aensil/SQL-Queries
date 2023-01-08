/**
 * find the second highest colegiatura 
 * Find students with same scores
 */

-- Count by join between tables --
-- DISRINCT only selects 1
SELECT DISTINCT colegiatura
FROM platzi.alumnos a1
WHERE 2=(
	SELECT COUNT(DISTINCT colegiatura)
	FROM platzi.alumnos a2
	WHERE a1.colegiatura<=a2.colegiatura
);

-- simple limit --
SELECT DISTINCT colegiatura, tutor_id
FROM platzi.alumnos
WHERE tutor_id = 20
ORDER BY colegiatura DESC
LIMIT 1 OFFSET 1;

-- Join with subquery --

SELECT *
FROM platzi.alumnos AS datos_alumnos
INNER JOIN (
	SELECT DISTINCT colegiatura
	FROM platzi.alumnos
	WHERE tutor_id = 20
	ORDER BY colegiatura DESC
	LIMIT 1 OFFSET 1
) AS segunda_mayor_colegiatura
ON datos_alumnos.colegiatura = segunda_mayor_colegiatura.colegiatura;


-- Subquery in Where --

SELECT *
FROM platzi.alumnos AS datos_alumnos
WHERE colegiatura = (
	SELECT DISTINCT colegiatura
	FROM platzi.alumnos
	WHERE tutor_id = 20
	ORDER BY colegiatura DESC
	LIMIT 1 OFFSET 1
);