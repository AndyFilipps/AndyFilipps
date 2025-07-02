

{%macro FuturePast(x)%}

case when to_timestamp({{x}}) < CURRENT_DATE THEN 'PAST'
ELSE 'FUTURE' END

{%endmacro%}

{%macro Get_Season(x)%}

        case when month({{x}}) in (12,1,2) then 'Winter'
            When month({{x}}) in (3,4,5) then 'Spring'
            When month({{x}}) in (6,7,8) then 'Summer'
            else 'Autumn'
        end

{%endmacro%}