with
    fonte_transacoes as (
        select *
        from {{ ref('transacoes') }}
    )
    
     , transacoes_cast as (
        select

            cast(COD_TRANSACAO as int) as pk_transacao
            ,cast(NUM_CONTA as int) as fk_conta
            ,left(DATA_TRANSACAO,10) as DATA_TRANSACAO
            ,cast(NOME_TRANSACAO as string) as nome_transacao
            ,cast(VALOR_TRANSACAO as float) as VALOR_TRANSACAO

        from  fonte_transacoes
    )

    
    select * 
    from transacoes_cast