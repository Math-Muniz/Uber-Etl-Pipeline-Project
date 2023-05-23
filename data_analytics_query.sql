CREATE OR REPLACE TABLE `healthy-area-387319.uber_data_engineering.tbl_analytics` AS (
SELECT
f.VendorID,
d.tpep_pickup_datetime,
d.tpep_dropoff_datetime,
p.passenger_count,
t.trip_distance,
r.rate_code_name,
pl.pickup_latitude,
pl.pickup_longitude,
dl.dropoff_latitude,
dl.dropoff_longitude,
pt.payment_type_name,
f.fare_amount,
f.extra,
f.mta_tax,
f.tip_amount,
f.tolls_amount,
f.improvement_surcharge,
f.total_amount
FROM 

`healthy-area-387319.uber_data_engineering.fact_table` f 
JOIN `healthy-area-387319.uber_data_engineering.datetime_dim` d ON d.datetime_id = f.datetime_id
JOIN `healthy-area-387319.uber_data_engineering.passenger_count_dim` p ON p.passenger_count_id = f.passenger_count_id
JOIN `healthy-area-387319.uber_data_engineering.trip_distance_dim` t ON t.trip_distance_id = f.trip_distance_id
JOIN `healthy-area-387319.uber_data_engineering.rate_code_dim` r ON r.rate_code_id = f.rate_code_id
JOIN `healthy-area-387319.uber_data_engineering.pickup_location_dim` pl ON pl.pickup_location_id= f.pickup_location_id
JOIN `healthy-area-387319.uber_data_engineering.dropoff_location_dim` dl ON dl.dropoff_location_id = f.dropoff_location_id
JOIN `healthy-area-387319.uber_data_engineering.payment_type_dim` pt ON pt.payment_type_id = pt.payment_type_id);