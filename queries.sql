                                                            -- MY SQL KNOWLEDGE (UNDER CONSTRUCTION)
                                                            -- MEU CONHECIMENTO EM SQL (EM CONSTRUÇÃO)

                                                            -- #1 database creation			-- #1 criação da base de dados

CREATE DATABASE MOVIES_DB

                                                            -- #2 The database tables were input through csv files, you can download the files in order to know its content
                                                            -- #2 As tabelas foram inseridas na base de dados por meio de arquivos no formato csv, você pode fazer o download desses arquivos para conhecer o conteúdo

                                                            -- #3 Specifies the database being used		-- #3 Especifica a base de dados que está sendo usada

USE MOVIES_DB

                                                            -- #4 gets full content from the tables		-- #4 seleciona o conteúdo total das tabelas

SELECT * FROM movies;

SELECT * FROM ratings;

                                                            -- #5 Through the query bellow we are able to see the movie title along with its rating, two tables are joined
                                                            -- #6 A query abaixo nos apresenta o título do filme e a sua nota, duas tabelas são conectadas

SELECT movies.title, ratings.rating
FROM movies
INNER JOIN ratings ON movies.movieId = ratings.movieId;

                                                            -- #7 SELECT DISTINCT - Used to select only different values.
                                                            -- #7 SELECT DISTINCT - Usado para selecionar apenas valores diferentes.
                                                            
SELECT DISTINCT movies.title, ratings.rating
FROM movies
INNER JOIN ratings ON movies.movieId = ratings.movieId
WHERE rating = 10

                                                            -- #8 AND/OR - Used to filter records based on more than one condition, the AND operator displays a record if all conditions are true, the OR operator displays a record if any of the conditions separated by OR are true.  
                                                            -- #8 AND/OR - São usados para filtrar dados baseados em mais de uma condição. AND apresenta os dados se todas as condições forem verdadeiras. OR apresenta dos dados se pelo menos uma das condições separadas por OR forem verdadeiras.
                                                            
SELECT DISTINCT movies.title, ratings.rating
FROM movies
INNER JOIN ratings ON movies.movieId = ratings.movieId
WHERE rating = 10 AND title = 'Fair Game (1995)'
                                                            
SELECT DISTINCT movies.title, ratings.rating
FROM movies
INNER JOIN ratings ON movies.movieId = ratings.movieId
WHERE rating = 10 OR rating = 30

                                                            -- #9 ORDER BY - Used to sort the result-set in ascending or descending order.
                                                            -- #9 ORDER BY - Usado para apresentar os dados em ordem crescente ou decrescente.

SELECT DISTINCT movies.title, ratings.rating
FROM movies
INNER JOIN ratings ON movies.movieId = ratings.movieId
WHERE rating = 10
ORDER BY title ASC;

SELECT DISTINCT movies.title, ratings.rating
FROM movies
INNER JOIN ratings ON movies.movieId = ratings.movieId
WHERE rating = 10
ORDER BY title DESC;

                                                            -- #10 SELECT TOP - Used to specify the number of records to return
                                                            -- #10 SELECT TOP - Usado para especificar o número de registros que a query retornará
                                                          
SELECT TOP 10 movies.title, ratings.rating
FROM movies
INNER JOIN ratings ON movies.movieId = ratings.movieId
WHERE rating = 10
ORDER BY title ASC;

                                                            -- #11 MIN() - Returns the smallest value of the selected column
                                                            -- #11 MIN() - Retorna o menor valor da coluna selecionada
                                                            
SELECT MIN(rating) AS ratings, movies.title
FROM ratings
INNER JOIN movies ON ratings.movieId = ratings.movieId
GROUP BY title;

                                                            -- #12 MAX() - Returns the largest value of the selected column
                                                            -- #12 MAX() - Retorna o maior valor da coluna selecionada
                                                            
SELECT MAX(rating) AS ratings, movies.title
FROM ratings
INNER JOIN movies ON ratings.movieId = ratings.movieId
GROUP BY title;

                                                            -- #13 COUNT() - Returns the number of rows that matches a specified criterion. Through this method we were able to know the total amount of movies in the database, 9742.
                                                            -- #13 COUNT() - Retorna o número de linhas que combina com um critério específico. Através deste método foi possível saber o total de filmes na base de dados, 9742.
                                                            
SELECT DISTINCT COUNT(TITLE)                                
FROM movies;

                                                            -- #14 AVG() - Returns the average value of a numeric column. In the example below it was returned the avarage rating from the toy story movie.
                                                            -- #14 AVG() - Retorna o valor médio de uma coluna numérica. No exemplo abaixo foi retornado a nota média do filme toy story.
                                                            
SELECT AVG(rating)
FROM ratings
WHERE movieId = 1

                                                            -- #15 SUM() - Returns the total sum of a numeric column. 
                                                            -- #15 SUM() - Retorna a soma total de uma coluna numérica.
                                                            
SELECT SUM(rating)
FROM ratings
WHERE movieId = 1

                                                            -- #16 LIKE - Used in a WHERE clause to search for a specified pattern in a column.
                                                            -- #16 LIKE - Usado no filtro WHERE para procurar um padrão específico na coluna.
                                                            
SELECT *
FROM movies
WHERE TITLE LIKE '%top%'

                                                            -- #17 IN - Allows to specify multiple values in a WHERE clause. The query below, for instance, returns all ratings given to the top gun movie.
                                                            -- #17 IN - Permite especificar multiplos valores in um filtro WHERE. A query abaixo, por exemplo, retorna todas as notas dadas para o filme top gun.
                                                            
SELECT ratings.rating, movies.title
FROM movies
INNER JOIN ratings ON movies.movieId = ratings.movieId
WHERE title IN ('Top Gun (1986)')
ORDER BY title ASC;

                                                            -- #18 BETWEEN - Selects values within a given range. The values can be numbers, text, or dates.
                                                            -- #18 BETWEEN - Seleciona valores dentro de uma série de valores. Os valores podem ser números, texto ou datas.
                                                            
SELECT *
FROM MOVIES
WHERE movieId BETWEEN 542 AND 552
