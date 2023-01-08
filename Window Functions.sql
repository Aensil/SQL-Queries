-- Obtener la colegiatura promedio por carrera --
SELECT 	*,
		AVG(colegiatura) OVER (PARTITION BY carrera_id)
FROM	platzi.alumnos;

-- Si no se especifica una partición se toma toda la info de la tabla --
SELECT 	*,
		AVG(colegiatura) OVER ()
FROM	platzi.alumnos;

-- Obtener la suma de las colegiaturas incrementales de menor a mayor --
-- Con order by se toamen todos los valores ordenados antes o iguales a la tupla actual --
SELECT 	*,
		SUM(colegiatura) OVER (ORDER BY colegiatura)
FROM	platzi.alumnos;

-- Obtener la suma de colegiaturas por carrera ordenadas por colegiatura de menor a mayor --
SELECT 	*,
		SUM(colegiatura) OVER (PARTITION BY carrera_id ORDER BY colegiatura)
FROM	platzi.alumnos;

-- Obtener el lugar que ocupa la tupla actual en el frame de carrera con orden por colegiatura de mayor a menor --
SELECT 	*,
		RANK() OVER (PARTITION BY carrera_id ORDER BY colegiatura DESC)
FROM	platzi.alumnos;

-- Obtener el lugar que ocupa la tupla actual en el frame de carrera con orden por colegiatura de mayor a menor --
-- Con orden posterior --
SELECT 	*,
		RANK() OVER (PARTITION BY carrera_id ORDER BY colegiatura DESC) AS brand_rank
FROM	platzi.alumnos
ORDER BY carrera_id, brand_rank;

-- Intento de wherer en el mismo query --
SELECT 	*,
		RANK() OVER (PARTITION BY carrera_id ORDER BY colegiatura DESC) AS brand_rank
FROM	platzi.alumnos
WHERE	brand_rank < 3
ORDER BY carrera_id, brand_rank;

-- Filtrado where en subquery --
--Rank - Ranking
SELECT	*
FROM	(
	SELECT 	*,
			RANK() OVER (PARTITION BY carrera_id ORDER BY colegiatura DESC) AS brand_rank
	FROM	platzi.alumnos
) AS	ranked_colegiaturas_por_carrerra
WHERE 	brand_rank < 3
ORDER BY brand_rank;