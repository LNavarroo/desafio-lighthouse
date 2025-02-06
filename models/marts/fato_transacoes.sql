with
    fato_transacoes as (
        select *
        from {{ ref('int_banco__prep_metricas') }}
    )

select *
from fato_transacoes