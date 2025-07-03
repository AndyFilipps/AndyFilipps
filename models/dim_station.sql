with bike_cte as
(
select 
    START_STATION_ID,
    START_STATION_NAME,
    END_STATION_ID,
    END_STATION_NAME,
    START_LAT,
    START_LNG,
    END_LAT,
    END_LNG

from {{ source('test', 'bike') }}
    
)
, start_cte as
(
    select 
    START_STATION_ID as STATION_ID,
    START_STATION_NAME as STATION_NAME,
    START_LAT as LAT,
    START_LNG as LNG
    from bike_cte
    where START_STATION_ID is not null
)
, end_cte as
(
    select 
    END_STATION_ID as STATION_ID,
    END_STATION_NAME as STATION_NAME,
    END_LAT as LAT,
    END_LNG as LNG
    from bike_cte
    where END_STATION_ID is not null
)
, union_cte as 
(
    select * 
    from start_cte
    union
    select * 
    from end_cte
)
select distinct
* 
from union_cte