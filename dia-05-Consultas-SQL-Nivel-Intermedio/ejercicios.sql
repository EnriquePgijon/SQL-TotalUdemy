Select * from episodios
where serie_id=( Select serie_id from series where titulo ='The Office');


select titulo, rating_imdb, if(rating_imdb>=8, 'ALTO','BAJO') AS 'Categoria de rating'
from Episodios;

select titulo, año_lanzamiento, case
when año_lanzamiento>= 2020 then 'Nueva'
when año_lanzamiento>= 2010 and año_lanzamiento <= 2019 then 'Clasica'
else 'Antigua'
end as categoria
from series;

describe episodios;

select * from episodios where cast(fecha_estreno as date)> '2010-01-01';



select fecha_estreno, year(fecha_estreno), month(fecha_estreno) from episodios;

select fecha_estreno, date_add(fecha_estreno, interval -30 day);

select *, datediff(curdate(),fecha_estreno) from episodios;


SELECT UPPER(titulo) AS Titulo_Mayusculas FROM Series;

SELECT LOWER(nombre) AS nombre_en_minusculas FROM Actores;

SELECT CONCAT(titulo, ' (', año_lanzamiento, ')') AS Titulo_Año FROM Series;

SELECT titulo, SUBSTRING(titulo, 1, 5) AS Extracto_Titulo FROM Episodios;

SELECT titulo, LENGTH(titulo) AS Longitud_Titulo FROM Series;

SELECT
    titulo,
    LEFT(titulo, 3) AS Inicio_Titulo,
    RIGHT(titulo, 3) AS Fin_Titulo
FROM Series;


SELECT 
    Series.titulo AS 'Título de la Serie', 
    Series.año_lanzamiento AS 'Año de Lanzamiento', 
    Series.genero AS 'Género', 
    AVG(Episodios.rating_imdb) AS 'Rating Promedio IMDb'
FROM 
    Series
JOIN 
    Episodios ON Series.serie_id = Episodios.serie_id
WHERE 
    Series.genero IN (SELECT genero FROM (
					  SELECT genero, COUNT(*) AS cantidad_de_series
					  FROM Series 
					  GROUP BY genero 
                      ORDER BY cantidad_de_series DESC
                      LIMIT 3) AS top3)
GROUP BY 
    Series.serie_id
ORDER BY 
    `Rating Promedio IMDb` DESC;