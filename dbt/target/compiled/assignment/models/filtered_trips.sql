-- models/filtered_trips.sql

select *
from `astrafy-assignment.chicago_taxi.taxi_trips`
where trip_start_timestamp between '2023-06-01' and '2023-12-31'