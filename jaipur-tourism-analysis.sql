 -- Viewing various Tables
SELECT * FROM farnazdb.places;
SELECT * FROM farnazdb.types;
SELECT * FROM farnazdb.hotels;

-- Selecting the Database to be used.
USE farnazdb;


 -- Number of Tourist spots in Jaipur,India.
 Select 
 COUNT(POIs) as "Number of Tourist Places"
 FROM
 places;
 
 
 -- Number of Tourist spots in each Category in Jaipur,India.
 Select 
  PRIORITY_1 AS "Categoty"
 ,COUNT(PRIORITY_1) AS "Category count"
 FROM
 Types
GROUP BY PRIORITY_1
ORDER BY PRIORITY_1;


 -- Tourist Spots in Jaipur,India.
 Select 
 POIs as "Tourist Spot"
 FROM
 places;
 
 
 -- Places that have Entry Time before 9:00 AM IST.
 SELECT 
    POIs AS 'Tourist Places', EntryTime1 AS 'Entry Time'
FROM
    places
WHERE
    EntryTime1 < 9
Order by EntryTime1;
 
 
 -- Places that have Entry time at or after 10:00 AM IST.
 Select 
 POIs as "Tourist Places"
 , EntryTime1 as "Entry Time"
 FROM
 places
 WHERE EntryTime1 > 10 OR EntryTime1 = 10 
 Order by EntryTime1 ;
 
 
 -- Places that have 2 Entry and Exit slots.
  Select 
 POIs as "Tourist Places"
 , EntryTime1 as "Entry Slot 1"
 , EntryTime1 as "Entry Slot 2"
 , ExitTime1 as "Exit Slot 1"
 , ExitTime1 as "Exit Slot 2"
 FROM
 places
 WHERE EntryTime1 > 10 OR EntryTime1 = 10 
 Order by EntryTime1 ;
 
 
   -- Tourist Spots and it's various categories.
  SELECT POIS
  ,MAX(CASE WHEN PRIORITY_1 = 'History and Culture' OR PRIORITY_2 = 'History and Culture'  OR PRIORITY_3 = 'History and Culture'  
     OR PRIORITY_4 = 'History and Culture'  OR PRIORITY_5 = 'History and Culture'  THEN POIs END) AS "History and Culture" 
  ,MAX(CASE WHEN PRIORITY_1 = 'Museum' OR PRIORITY_2 = 'Museum' OR PRIORITY_3 = 'Museum' OR PRIORITY_4 = 'Museum' 
    OR PRIORITY_5 = 'Museum' THEN POIs END) AS "Museum"
  ,MAX(CASE WHEN PRIORITY_1 = 'Religious' OR PRIORITY_2 = 'Religious' OR PRIORITY_3 = 'Religious' OR 
    PRIORITY_4 = 'Religious' OR PRIORITY_5 = 'Religious' THEN POIs END) AS "Religious"
  ,MAX(CASE WHEN PRIORITY_1 = "Adventure" OR PRIORITY_2 = "Adventure" OR PRIORITY_3 = "Adventure" OR PRIORITY_4 = "Adventure" 
   OR PRIORITY_5 = "Adventure"  THEN POIs END) AS "Adventure"
  ,MAX(CASE WHEN PRIORITY_1 = 'Food and Drinks' OR PRIORITY_2 = 'Food and Drinks' OR PRIORITY_3 = 'Food and Drinks' OR PRIORITY_4 = 'Food and Drinks' 
   OR PRIORITY_5 = 'Food and Drinks' THEN POIs END) AS "Food And Drinks"
  ,MAX(CASE WHEN PRIORITY_1 = 'Scenic' OR PRIORITY_2 = 'Scenic' OR PRIORITY_3 = 'Scenic' OR PRIORITY_4 = 'Scenic'
   OR PRIORITY_5 = 'Scenic' THEN POIs END) AS "Scenic"
  ,MAX(CASE WHEN PRIORITY_1 = 'Shopping' OR PRIORITY_2 = 'Shopping'  OR PRIORITY_3 = 'Shopping'  OR PRIORITY_4 = 'Shopping'  OR
   PRIORITY_5 = 'Shopping' THEN POIs END) AS "Shopping"
  ,MAX(CASE WHEN PRIORITY_1 = 'Shows and Concerts' OR PRIORITY_2 = 'Shows and Concerts'  OR PRIORITY_3 = 'Shows and Concerts'  
   OR PRIORITY_4 = 'Shows and Concerts'  OR PRIORITY_5 = 'Shows and Concerts' THEN POIs END) AS "Shows and Concerts"
  FROM Types
  GROUP BY POIS;


-- Religious places in Jaipur,India.  
SELECT
 POIs as " Religious Places in Jaipur"
 FROM Types
 WHERE PRIORITY_1 = 'Religious' OR PRIORITY_2 = 'Religious' OR PRIORITY_3 = 'Religious' OR PRIORITY_4 = 'Religious' OR PRIORITY_5 = 'Religious';
 
  
  -- Best Tourist Spots in Jaipur for Food and Drinks.
SELECT
 POIs as " Tourist Spots Famous for Food"
 FROM Types
 WHERE PRIORITY_1 = 'Food and Drinks' OR PRIORITY_2 = 'Food and Drinks' OR PRIORITY_3 = 'Food and Drinks' OR PRIORITY_4 = 'Food and Drinks' OR PRIORITY_5 = 'Food and Drinks';
 
 -- HOTELS BUDGET CLASSIFICATION
 SELECT Hotel
 ,(CASE WHEN PRICE_RUPEES < 2000 THEN "LOW"
  WHEN PRICE_RUPEES BETWEEN 2000 AND 4000 THEN "MODERATE"
  WHEN PRICE_RUPEES BETWEEN 4000 AND 8000 THEN "HIGH"
  WHEN PRICE_RUPEES BETWEEN 8000 AND 15000 THEN " VERY HIGH"
  WHEN PRICE_RUPEES > 15000  THEN " LUXURY"
  END) As "Hotel Budget"
 FROM Hotels
 GROUP BY PRICE_RUPEES
 ORDER BY PRICE_RUPEES
 ;
  
 
 -- 5 Luxury(Most Expensive) Hotels in Jaipur 
 SELECT * 
 FROM Hotels
 ORDER BY PRICE_RUPEES DESC
 LIMIT 5;
 
 
 -- 5 Budget(Least Expensive) Hotels in Jaipur
 SELECT * 
 FROM Hotels
 ORDER BY PRICE_RUPEES ASC
 LIMIT 5;
 
 -- 10 Most Visited hotels(Most visited Hotels have the highest number of reviews).
SELECT * 
 FROM Hotels
 ORDER BY NUMBER_OF_REVIEWS DESC
 LIMIT 10;
 
 
 -- Join Places and Types Tables to get Place of Interest,Address(Latitude and Longitude),Entry and Exit time and Priority wise categories of each Place.
 SELECT 
 P.POIs
 ,P.Latitude,P.Longitude
 ,P.EntryTime1,P.ExitTime1
 ,P.EntryTime2,P.ExitTime2
 ,T.Priority_1,T.Priority_2,T.Priority_3,T.Priority_4,T.Priority_5
 FROM Places P Inner Join Types T
 On P.POIs = T.POIs;