with
    dim_agencias as (
        select *
        from {{ ref('int_banco__prep_agencias') }}
    )

select *
from dim_agencias