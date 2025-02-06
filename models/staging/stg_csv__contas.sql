with
    fonte_contas as (
        select *
        from {{ ref('contas') }}
    )
    
     , contas_renomeado as (
        select
            cast(NUM_CONTA as int) as pk_conta
            ,cast(COD_CLIENTE as int) as fk_cliente
            ,cast(COD_AGENCIA as int) as fk_agencia
            ,cast(COD_COLABORADOR as int) as fk_colaborador
            ,cast(TIPO_CONTA as string) as tipo_conta
            ,cast(SALDO_TOTAL as numeric(18,2)) as saldo_total_conta
            ,cast(SALDO_DISPONIVEL as numeric(18,2)) as saldo_disponivel_conta
            ,CASE 
                WHEN DATA_ABERTURA LIKE '%UTC' 
                THEN REPLACE(DATA_ABERTURA, 'UTC', '+00:00') 
                ELSE DATA_ABERTURA 
            END AS data_abertura_conta
            ,CASE 
                WHEN DATA_ULTIMO_LANCAMENTO LIKE '%UTC' 
                THEN REPLACE(DATA_ULTIMO_LANCAMENTO, 'UTC', '+00:00') 
                ELSE DATA_ULTIMO_LANCAMENTO 
            END AS DATA_ULTIMO_LANCAMENTO_CONTA



        from  fonte_contas
    )

    ,cast_datas as(
        select
            pk_conta
            ,fk_cliente
            ,fk_agencia
            ,fk_colaborador
            ,tipo_conta
            ,saldo_total_conta
            ,saldo_disponivel_conta
            ,CASE 
                WHEN data_abertura_conta LIKE '%.%' 
                THEN TO_TIMESTAMP_TZ(data_abertura_conta, 'YYYY-MM-DD HH24:MI:SS.FF TZH:TZM')
                ELSE TO_TIMESTAMP_TZ(data_abertura_conta, 'YYYY-MM-DD HH24:MI:SS TZH:TZM')
            END as data_abertura_conta_tratada
            ,CASE 
                WHEN DATA_ULTIMO_LANCAMENTO_CONTA LIKE '%.%' 
                THEN TO_TIMESTAMP_TZ(DATA_ULTIMO_LANCAMENTO_CONTA, 'YYYY-MM-DD HH24:MI:SS.FF TZH:TZM')
                ELSE TO_TIMESTAMP_TZ(DATA_ULTIMO_LANCAMENTO_CONTA, 'YYYY-MM-DD HH24:MI:SS TZH:TZM')
            END as DATA_ULTIMO_LANCAMENTO_CONTA_tratada

        from contas_renomeado    
    )

    select * 
    from cast_datas
