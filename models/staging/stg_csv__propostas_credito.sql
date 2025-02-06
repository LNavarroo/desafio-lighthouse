with
    fonte_propostas_credito as (
        select *
        from {{ ref('propostas_credito') }}
    )
    
     , propostas_credito_cast as (
        select
            cast(COD_PROPOSTA as int) as pk_proposta
            ,cast(COD_CLIENTE as int) as fk_cliente
            ,cast(COD_COLABORADOR as int) as fk_colaborador
            ,cast(QUANTIDADE_PARCELAS as int) as QUANTIDADE_PARCELAS_Proposta
            ,cast(CARENCIA as int) as carencia_proposta
            ,cast(STATUS_PROPOSTA as string) as status_proposta
            ,cast(TAXA_JUROS_MENSAL as numeric(18,4)) as taxa_juros_mensal_proposta
            ,cast(VALOR_PROPOSTA as float) as valor_proposta
            ,cast(VALOR_FINANCIAMENTO as float) as VALOR_FINANCIAMENTO_proposta
            ,cast(VALOR_ENTRADA as float) as VALOR_ENTRADA_proposta
            ,cast(VALOR_PRESTACAO as float) as VALOR_PRESTACAO_proposta
            ,CASE 
                WHEN DATA_ENTRADA_PROPOSTA LIKE '%UTC' 
                THEN REPLACE(DATA_ENTRADA_PROPOSTA, 'UTC', '+00:00') 
                ELSE DATA_ENTRADA_PROPOSTA
            END AS DATA_ENTRADA_PROPOSTA

        from  fonte_propostas_credito
    )

    , propostas_credito_renomeado as (
        select
             pk_proposta
            ,fk_cliente
            ,fk_colaborador
            ,QUANTIDADE_PARCELAS_Proposta
            ,carencia_proposta
            ,status_proposta
            ,taxa_juros_mensal_proposta
            ,valor_proposta
            ,VALOR_FINANCIAMENTO_proposta
            ,VALOR_ENTRADA_proposta
            ,VALOR_PRESTACAO_proposta
            ,CASE 
                WHEN DATA_ENTRADA_PROPOSTA LIKE '%.%' 
                THEN TO_TIMESTAMP_TZ(DATA_ENTRADA_PROPOSTA, 'YYYY-MM-DD HH24:MI:SS.FF TZH:TZM')
                ELSE TO_TIMESTAMP_TZ(DATA_ENTRADA_PROPOSTA, 'YYYY-MM-DD HH24:MI:SS TZH:TZM')
            END as DATA_ENTRADA_PROPOSTA_tratada

        from propostas_credito_cast
     )

    select * 
    from propostas_credito_renomeado