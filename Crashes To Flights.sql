Select [Year of crash], COUNT([Year of crash]) AS [Amount of crashes]
FROM CrashesUntil2020
GROUP By [Year of crash]

SELECT *
FROM CrashByYear

SELECT *
FROM FlightsByYearPivot

SELECT * 
FROM FlightsByYearPivot F
INNER JOIN CrashByYear C
ON CAST(F.[Year] AS int) = CAST(C.[Year of crash] AS int) 

UPDATE FlightsByYearPivot
SET Flights=1
WHERE Flights=0

WITH CTE_crashes AS(Select [Year of crash], COUNT([Year of crash]) AS [Amount of crashes]
FROM CrashesUntil2020
GROUP By [Year of crash])

SELECT C.[Year of crash],F.[Flights],C.[Amount of crashes],ROUND(C.[Amount of crashes]/F.[Flights]*100,6 ) AS 'Ratio %'
FROM FlightsByYearPivot F
INNER JOIN CTE_crashes C
ON CAST(F.[Year] AS int) = CAST(C.[Year of crash] AS int) 
ORDER BY  C.[Year of crash]