
--Displays number of crasches in each year 
Select [Year of crash], COUNT([Year of crash]) AS [Amount of crashes]
FROM CrashesUntil2020
GROUP By [Year of crash]
ORDER BY 'Year of crash'



--Displays number of flights in each year
SELECT *
FROM FlightsByYearPivot

--Shows how many crasches occured in compare with total number of flights

WITH CTE_crashes AS(Select [Year of crash], COUNT([Year of crash]) AS [Amount of crashes]
FROM CrashesUntil2020
GROUP By [Year of crash])

SELECT C.[Year of crash],F.[Flights] AS 'Flights Total',C.[Amount of crashes],ROUND(C.[Amount of crashes]/F.[Flights]*100,6 ) AS 'Ratio %'
FROM FlightsByYearPivot F
INNER JOIN CTE_crashes C
ON CAST(F.[Year] AS int) = CAST(C.[Year of crash] AS int) 
ORDER BY  C.[Year of crash]