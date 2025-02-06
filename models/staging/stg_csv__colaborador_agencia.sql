with
    fonte_colaborador_agencia as (
        select *
        from {{ ref('colaborador_agencia') }}
    )
    
     , colaborador_agencia_renomeado as (
        select

            cast(COD_COLABORADOR as int) as pk_colaborador
            ,cast(COD_AGENCIA as int) as fk_agencia

        from  fonte_colaborador_agencia
    )

    select * 
    from colaborador_agencia_renomeado