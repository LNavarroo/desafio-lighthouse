with
    fonte_clientes as (
        select *
        from {{ ref('clientes') }}
    )
    
     , clientes_renomeado as (
        select
            cast(COD_CLIENTE as int) as pk_cliente
            ,cast(PRIMEIRO_NOME as string) as PRIMEIRO_NOME_cliente
            ,cast(ULTIMO_NOME as string) as ULTIMO_NOME_cliente
            ,cast(EMAIL as string) as EMAIL_cliente
            ,cast(TIPO_CLIENTE as string) as tipo_cliente
            ,cast(DATA_INCLUSAO as string) as DATA_INCLUSAO_cliente
            ,cast(CPFCNPJ as string) as cpf_cnpj_cliente
            ,cast(DATA_NASCIMENTO as date) as DATA_NASCIMENTO_cliente
            ,cast(ENDERECO as string) as endereco_cliente
            ,cast(CEP as string) cep_cliente

        from  fonte_clientes
    )

    select * 
    from clientes_renomeado