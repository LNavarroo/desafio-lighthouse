with
    dim_colaboradores as (
        select *
        from {{ ref('int_banco__prep_colaboradores') }}
    )

select *
from dim_colaboradores