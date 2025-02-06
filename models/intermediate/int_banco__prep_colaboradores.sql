 with
    /* Chamada dos modelos necessários. */
    colaboradores as (
        select *
        from {{ ref('stg_csv__colaboradores') }}
    )
   

     , prep_colaboradores as (
        select
            PK_COLABORADOR
            ,PRIMEIRO_NOME_COLABORADOR
            ,ULTIMO_NOME_COLABORADOR
            ,CPF_COLABORADOR
            ,EMAIL_COLABORADOR
            ,ENDERECO_COLABORADOR
            ,CEP_COLABORADOR
            ,DATA_NASCIMENTO_COLABORADOR

        from colaboradores
        
    )

    select * from prep_colaboradores
     