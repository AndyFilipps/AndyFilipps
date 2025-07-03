{{ config(materialized='table') }}

with cte as
(
select 
    t.* exclude (START_STATION_ID),
    w.* exclude (daily_weather),
    st1.*
from {{ ref('fact_trip') }} t
left join {{ ref('Daily_weather') }} w on w.daily_weather =  t.trip_date
left join {{ ref('dim_station') }} st1 on st1.STATION_ID =  t.START_STATION_ID
)
select * from cte