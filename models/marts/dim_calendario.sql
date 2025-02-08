with
    dim_calendario as (
        select *
        from {{ ref('stg_csv__calendario') }}
    )

select *
from dim_calendario