with bike_cte as
(
select 
    ride_id ,
    rideable_type ,
    started_at ,
    ended_at ,
    date(ended_at) as trip_date,
    timestampdiff(seconds,started_at, ended_at) as Trip_Duration_sec,
    member_casual, 
    START_STATION_ID,
    END_STATION_ID

from {{ source('test', 'bike') }}
    
)
select * from bike_cte