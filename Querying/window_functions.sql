/*
*  Show the population per continent
*  Database: World
*  Table: Country
*/

SELECT continent, sum(population) AS "continent population"
FROM country
GROUP BY continent
ORDER BY "continent population" DESC;

SELECT 
    DISTINCT continent, 
    SUM(population)
    OVER (
        PARTITION BY continent
    ) AS "continent population"
FROM country
ORDER BY "continent population" DESC;

/*
*  To the previous query add on the ability to calculate the percentage of the world population
*  What that means is that you will divide the population of that continent by the total 
   population and multiply by 100 to get a percentage.
*  Make sure you convert the population numbers to float using `population::float` otherwise you 
   may see zero pop up
*  Try to use CONCAT AND ROUND to make the data look pretty
*
*  Database: World
*  Table: Country
*/

SELECT 
    DISTINCT continent, 
    SUM(population) OVER w AS "continent population",
    CONCAT(
        ROUND(
            SUM(population::float4) OVER w /
            SUM(population::float4) OVER() * 100
            )
        , '%') AS "population %"
FROM country
WINDOW w AS (PARTITION BY continent)
ORDER BY "continent population" DESC;


/*
*  Count the number of towns per region
*
*  Database: France
*  Table: Regions (Join + Window function)
*/

SELECT 
    r.id,
    COUNT(t.id) AS "# of towns"
FROM regions AS r
JOIN departments AS d ON r.code = d.region 
JOIN towns AS t ON d.code = t.department
GROUP BY r.id
ORDER BY r.id;

SELECT 
    DISTINCT r.id,
    r.name,
    COUNT(t.id) OVER (
        PARTITION BY r.id
    ) AS "# of towns"
FROM regions AS r
JOIN departments AS d ON r.code = d.region 
JOIN towns AS t ON d.code = t.department
ORDER BY r.id;