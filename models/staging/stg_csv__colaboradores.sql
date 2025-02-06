with
    fonte_colaboradores as (
        select *
        from {{ ref('colaboradores') }}
    )
    
     , colaboradores_renomeado as (
        select
            cast(COD_COLABORADOR as int) as pk_colaborador
            ,cast(PRIMEIRO_NOME as string) as PRIMEIRO_NOME_colaborador
            ,cast(ULTIMO_NOME as string) as ULTIMO_NOME_colaborador
            ,cast(EMAIL as string) as EMAIL_colaborador
            ,cast(CPF as string) as cpf_colaborador
            ,cast(DATA_NASCIMENTO as string) as DATA_NASCIMENTO_colaborador
            ,cast(ENDERECO as string) as ENDERECO_colaborador
            ,cast(CEP as string) as cep_colaborador

        from  fonte_colaboradores
    )

    select * 
    from colaboradores_renomeado