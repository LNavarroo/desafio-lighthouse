 with
    /* Chamada dos modelos necessários. */
    contas as (
        select *
        from {{ ref('stg_csv__contas') }}
    )

    ,transacoes as (
        select *
        from {{ ref('stg_csv_transacoes') }}
    )

   

     , prep_fact as (
        select
            CONCAT(contas.pk_conta , '-', transacoes.pk_transacao) AS pk_fact
            ,contas.PK_CONTA
            ,transacoes.PK_TRANSACAO
            ,contas.FK_CLIENTE
            ,contas.FK_AGENCIA
            ,contas.FK_COLABORADOR
            ,contas.TIPO_CONTA
            ,contas.SALDO_TOTAL_CONTA
            ,contas.SALDO_DISPONIVEL_CONTA
            ,transacoes.NOME_TRANSACAO
            ,transacoes.VALOR_TRANSACAO
            ,transacoes.DATA_TRANSACAO_TRATADA
            ,contas.DATA_ABERTURA_CONTA_TRATADA
            ,contas.DATA_ULTIMO_LANCAMENTO_CONTA_tratada

        from transacoes
        left join contas on transacoes.fk_conta = contas.pk_conta
        
    )

    select * from prep_fact
     