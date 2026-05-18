With ListaEpisodios as ( 
Select serie_id, episodio_id, titulo from Episodios
),
ListaSeries as(
select serie_id, descripcion from series
)

Select * from ListaEpisodios 
left join ListaSeries
on ListaEpisodios.serie_id = ListaSeries.serie_id;


with OrdenSeries as(

select titulo, año_lanzamiento, row_number() over (order by año_lanzamiento desc) as orden_lanzamiento
from series  )

select * from OrdenSeries where orden_lanzamiento in (1,2,3);

Select titulo, genero, año_lanzamiento, row_number() over(Partition by genero order by año_lanzamiento desc) as ranking_por_genero from series;

Select titulo, rating_imdb, rank() over(order by rating_imdb desc) as ranking_imdb from episodios;

Select titulo, rating_imdb, dense_rank() over(order by rating_imdb desc) as ranking_imdb from episodios;

Select titulo, descripcion from series where descripcion regexp '(?i)más';



WITH EpisodiosRecientes AS (
  SELECT 
    serie_id,
    COUNT(episodio_id) AS num_episodios
  FROM Episodios
  GROUP BY serie_id
),
Calificaciones AS (
  SELECT 
    serie_id,
    AVG(rating_imdb) AS promedio_imdb
  FROM Episodios
  GROUP BY serie_id
)

SELECT 
  s.titulo,
  er.num_episodios,
  c.promedio_imdb
FROM Series s
JOIN EpisodiosRecientes er ON s.serie_id = er.serie_id
JOIN Calificaciones c ON s.serie_id = c.serie_id
ORDER BY c.promedio_imdb DESC, er.num_episodios DESC;

