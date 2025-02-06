with
    dim_propostas as (
        select *
        from {{ ref('int_banco__prep_propostas') }}
    )

select *
from dim_propostas