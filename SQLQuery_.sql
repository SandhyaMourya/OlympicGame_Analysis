SELECT [ID]
      ,[Name] AS 'Competitior_Name' -- Renamed Column 
      , CASE WHEN SEX='M' THEN 'MALE' ELSE 'FEMALE' END AS SEX -- Grounping the age 
      , CASE 
            WHEN [Age] <18 THEN 'Under 18'
            WHEN [Age] BETWEEN 18 AND 25 THEN '18-25'
            WHEN [Age] BETWEEN 25 AND 30 THEN '25-30'
            WHEN [Age] >30 THEN 'oVER 30'
        END AS [AGE_GROUPING]
      ,[Height]
      ,[Weight]
      ,[NOC] AS 'Nation Code'
      --,CHARINDEX(' ',Games)-1 AS YEAR_INDEX
     -- ,CHARINDEX(' ',REVERSE(Games))-1 AS SEASON_INDEX
      ,LEFT(Games,CHARINDEX(' ',Games)-1 ) AS Year
      ,RIGHT(Games,CHARINDEX(' ',REVERSE(Games))-1) AS SEASON
      ,[City]
      ,[Sport]
      ,[Event]
      ,CASE WHEN Medal ='NA' THEN 'Not Registered' ELSE Medal END AS Medal
  FROM [olympic_games].[dbo].[athletes_event_results]
  WHERE RIGHT(Games,CHARINDEX(' ',REVERSE(Games))-1)='Summer'