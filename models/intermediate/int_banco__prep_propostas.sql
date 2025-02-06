 with
    /* Chamada dos modelos necessários. */
    propostas_credito as (
        select *
        from {{ ref('stg_csv__propostas_credito') }}
    )

    ,colaboradores as (
        select *
        from {{ ref('stg_csv__colaboradores') }}
    )

    ,clientes as (
        select *
        from {{ ref('stg_csv__clientes') }}
    )


     , prep_propostas as (
        select
            propostas_credito.PK_PROPOSTA
            ,colaboradores.PK_COLABORADOR
            ,clientes.PK_CLIENTE
            ,clientes.PRIMEIRO_NOME_CLIENTE
            ,clientes.ULTIMO_NOME_CLIENTE
            ,clientes.TIPO_CLIENTE 
            ,clientes.CPF_CNPJ_CLIENTE
            ,clientes.ENDERECO_CLIENTE
            ,clientes.CEP_CLIENTE
            ,colaboradores.PRIMEIRO_NOME_COLABORADOR
            ,colaboradores.ULTIMO_NOME_COLABORADOR
            ,propostas_credito.CARENCIA_PROPOSTA
            ,propostas_credito.STATUS_PROPOSTA
            ,propostas_credito.QUANTIDADE_PARCELAS_PROPOSTA
            ,propostas_credito.VALOR_PROPOSTA
            ,propostas_credito.TAXA_JUROS_MENSAL_PROPOSTA
            ,propostas_credito.VALOR_FINANCIAMENTO_PROPOSTA
            ,propostas_credito.VALOR_ENTRADA_PROPOSTA
            ,propostas_credito.VALOR_PRESTACAO_PROPOSTA
            ,propostas_credito.DATA_ENTRADA_PROPOSTA_tratada

        from propostas_credito
        left join colaboradores on propostas_credito.fk_colaborador = colaboradores.pk_colaborador
        left join clientes on propostas_credito.fk_cliente = clientes.pk_cliente
        
    )

    select * from prep_propostas
     