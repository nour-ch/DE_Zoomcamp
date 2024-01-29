
--question 3
SELECT COUNT(*)
FROM green_tripdata
WHERE lpep_pickup_datetime::DATE = '2019-09-18' 
AND  lpep_dropoff_datetime::DATE = '2019-09-18'
;

--question 4
SELECT lpep_pickup_datetime::DATE, MAX(trip_distance) AS max_trip_distance
FROM green_tripdata 
GROUP BY lpep_pickup_datetime::DATE
ORDER BY max_trip_distance desc
LIMIT 1;

--question 5
SELECT tz."Borough", SUM(gt.total_amount) AS amt_per_borough
FROM green_tripdata gt 
INNER JOIN taxi_zone_lookup tz ON gt."PULocationID" = tz."LocationID"
WHERE lpep_pickup_datetime::DATE = '2019-09-18' 
AND tz."Borough" <> 'Unknown'
GROUP BY tz."Borough"
ORDER BY amt_per_borough DESC
;

--question 6
SELECT  tzdo."Zone",MAX(gt.tip_amount) AS max_tip
FROM green_tripdata gt 
INNER JOIN taxi_zone_lookup tzpu ON gt."PULocationID" = tzpu."LocationID"
INNER JOIN taxi_zone_lookup tzdo ON gt."DOLocationID" = tzdo."LocationID"
WHERE lpep_pickup_datetime::DATE BETWEEN '2019-09-01' AND '2019-09-30'
AND tzpu."Zone" = 'Astoria'
GROUP BY tzdo."Zone"
ORDER BY max_tip DESC
;
SELECT * FROM green_tripdata limit 10