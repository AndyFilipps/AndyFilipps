with cte as 
(
    select 
        STARTED_AT,
        date(STARTED_AT) as date_started,
        hour(STARTED_AT) as hour_started,
        week(STARTED_AT) as week_started,
        monthname(started_at) MonthOfYear,
        case when month(started_at) in (12,1,2) then 'Winter'
            When month(started_at) in (3,4,5) then 'Spring'
            When month(started_at) in (6,7,8) then 'Summer'
            else 'Autumn'
        end as StationOfYear,
        case when dayofweek(started_at) in (1,6) then 'Weekend'
        else 'Businessday'
        end as Day_Type

    from {{ source('test', 'bike') }}
)
select 
    * 
from cte