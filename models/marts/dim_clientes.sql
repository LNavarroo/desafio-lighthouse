with
    dim_clientes as (
        select *
        from {{ ref('int_banco__prep_clientes') }}
    )

select *
from dim_clientes