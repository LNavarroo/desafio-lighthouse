 with
    /* Chamada dos modelos necessários. */
    clientes as (
        select *
        from {{ ref('stg_csv__clientes') }}
    )
   

     , prep_clientes as (
        select
            PK_CLIENTE
            ,PRIMEIRO_NOME_CLIENTE
            ,ULTIMO_NOME_CLIENTE
            ,nome_completo_cliente
            ,CPF_CNPJ_CLIENTE
            ,EMAIL_CLIENTE
            ,TIPO_CLIENTE
            ,ENDERECO_CLIENTE
            ,CEP_CLIENTE
            ,DATA_INCLUSAO_CLIENTE
            ,DATA_NASCIMENTO_CLIENTE

        from clientes
        
    )

    select * from prep_clientes
     