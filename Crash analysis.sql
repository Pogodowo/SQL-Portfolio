-- Identifies the aircraft that has the highest frequency of crashes

SELECT [AIRCRAFT_TYPE],COUNT([AIRCRAFT_TYPE]) AS NUMBER_OF_CRASHES
  FROM [aircraftCrashRecord].[dbo].[CrashesUntil2020]
  GROUP BY [AIRCRAFT_TYPE]
  ORDER BY NUMBER_OF_CRASHES DESC

--Most deadly crashes

SELECT [DATE],[AIRCRAFT_TYPE],[LOCATION],[OPERATOR],[TOTAL_FATALITIES]
  FROM [aircraftCrashRecord].[dbo].[CrashesUntil2020]
  WHERE [TOTAL_FATALITIES] is NOT NULL
  AND TRY_CONVERT(INT, [TOTAL_FATALITIES]) IS NOT NULL
  ORDER BY CAST([TOTAL_FATALITIES] AS INT) DESC

--List of crashes caused by poor weather
SELECT [DATE],[AIRCRAFT_TYPE],[LOCATION],[OPERATOR],[TOTAL_FATALITIES],[SUMMARY_OF_EVENTS]
  FROM [aircraftCrashRecord].[dbo].[CrashesUntil2020]
   WHERE
  [SUMMARY_OF_EVENTS] LIKE '%weather%' OR [SUMMARY_OF_EVENTS] LIKE '%fog%'OR [SUMMARY_OF_EVENTS] LIKE '%wind%' OR
   [SUMMARY_OF_EVENTS] LIKE '%storm%' OR [SUMMARY_OF_EVENTS] LIKE '%snow%' OR [SUMMARY_OF_EVENTS] LIKE '%thunder%' OR
   [SUMMARY_OF_EVENTS] LIKE '%icing%' OR [SUMMARY_OF_EVENTS] LIKE '%visibility%'


-- Identifies the year with the highest frequency of crashes.
SELECT [Year of crash],COUNT([Year of crash]) AS NUMBER_OF_CRASHES_BY_YEAR
  FROM [aircraftCrashRecord].[dbo].[CrashesUntil2020]
  GROUP BY [Year of crash]
  ORDER BY NUMBER_OF_CRASHES_BY_YEAR DESC

-- Lists crashes involving Polish aircraft with registrations starting with "SP-".
SELECT * 
FROM [aircraftCrashRecord].[dbo].[CrashesUntil2020]
WHERE [AIRCRAFT_REG] Like '%SP-%'
  

  


