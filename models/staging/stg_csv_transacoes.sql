with
    fonte_transacoes as (
        select *
        from {{ ref('transacoes') }}
    )
    
     , transacoes_cast as (
        select

            cast(COD_TRANSACAO as int) as pk_transacao
            ,cast(NUM_CONTA as int) as fk_conta
           ,CASE 
                WHEN DATA_TRANSACAO LIKE '%UTC' 
                THEN REPLACE(DATA_TRANSACAO, 'UTC', '+00:00') 
                ELSE DATA_TRANSACAO 
            END AS DATA_TRANSACAO
            ,cast(NOME_TRANSACAO as string) as nome_transacao
            ,cast(VALOR_TRANSACAO as float) as VALOR_TRANSACAO

        from  fonte_transacoes
    )

     , transacoes_renomeado as (
        select

             pk_transacao
             ,fk_conta
            ,CASE 
                WHEN DATA_TRANSACAO LIKE '%.%' 
                THEN TO_TIMESTAMP_TZ(DATA_TRANSACAO, 'YYYY-MM-DD HH24:MI:SS.FF TZH:TZM')
                ELSE TO_TIMESTAMP_TZ(DATA_TRANSACAO, 'YYYY-MM-DD HH24:MI:SS TZH:TZM')
            END as DATA_TRANSACAO_tratada
            ,nome_transacao
            ,VALOR_TRANSACAO

        from transacoes_cast
     )

    select * 
    from transacoes_renomeado order by DATA_TRANSACAO_tratada desc