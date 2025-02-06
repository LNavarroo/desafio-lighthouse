 with
    /* Chamada dos modelos necessários. */
    agencias as (
        select *
        from {{ ref('stg_csv__agencias') }}
    )
   

     , prep_agencias as (
        select
            PK_AGENCIA
            ,NOME_AGENCIA
            ,ENDERECO_AGENCIA
            ,CIDADE_AGENCIA
            ,UF_AGENCIA
            ,DATA_ABERTURA_AGENCIA
            ,TIPO_AGENCIA

        from agencias
        
    )

    select * from prep_agencias
     