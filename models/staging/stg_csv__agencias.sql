with
    fonte_agencias as (
        select *
        from {{ ref('agencias') }}
    )
    
     , agencias_renomeado as (
        select
            cast(COD_AGENCIA as int) as pk_agencia
            ,cast(NOME as string) as nome_agencia
            ,cast(ENDERECO as string) as endereco_agencia
            ,cast(CIDADE as string) as cidade_agencia
            ,cast(UF as string) as uf_agencia
            ,cast(DATA_ABERTURA as date) as data_abertura_agencia
            ,cast(TIPO_AGENCIA as string) as tipo_agencia

        from  fonte_agencias
    )

    select * 
    from agencias_renomeado