

  create or replace view `astrafy-assignment`.`chicago_taxi`.`join_model`
  OPTIONS()
  as with filtered_trips as (
    select *
    from `astrafy-assignment.chicago_taxi.filtered_trips`
),

weather_prepped as (
    select
        DATE as weather_date,
        (MAX_TEMPERATURE_C + MIN_TEMPERATURE_C) / 2 as avg_temp,
        case when PRECIP_TOTAL_DAY_MM > 0 then true else false end as has_precipitation
    from `astrafy-assignment.chicago_taxi.weather`
)

select
    t.*,
    w.avg_temp,
    w.has_precipitation
from filtered_trips t
left join weather_prepped w
    on date(t.trip_start_timestamp) = w.weather_date;

