select
    *
from {{ source('testdb', 'bike') }}

limit 10