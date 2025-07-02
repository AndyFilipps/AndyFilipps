with daily_cte as 
(
    select --top 10
       date(time) as daily_weather,
       description as weather,
       temp,
       pressure,
       humidity,
       clouds
    from {{ source('test', 'weather') }}



)
, daily_agg_cte as
(
    select
        daily_weather,
        weather,
        round(avg(temp), 2) temp,
        round(avg(pressure), 2) pressure,
        round(avg(humidity), 2)  humidity ,
        round(avg(clouds), 2)   clouds
      --count(weather) , 
    --row_number() over (partition by daily_weather order by count(weather) desc, weather asc) as rn
    from daily_cte
    group by daily_weather,      weather
    qualify row_number() over (partition by daily_weather order by count(weather) desc, weather asc) = 1
)


select * from daily_agg_cte