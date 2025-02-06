WITH fonte_calendario AS (
    SELECT 
        DATEADD(DAY, SEQ4(), '2009-01-01') AS d
    FROM TABLE(GENERATOR(ROWCOUNT => 5479)) -- 5479 dias entre 2009-01-01 e 2024-01-01
)


, calendario_renomeado AS (
    SELECT
        CAST(d AS DATE) AS id_data,
        CAST(d AS DATE) AS data,
        EXTRACT(YEAR FROM d) AS ano,
        EXTRACT(WEEK FROM d) AS semana_ano,
        EXTRACT(DAYOFYEAR FROM d) AS dia_ano,
        EXTRACT(MONTH FROM d) AS mes_ano,
        CASE EXTRACT(MONTH FROM d)
            WHEN 1 THEN 'Janeiro'
            WHEN 2 THEN 'Fevereiro'
            WHEN 3 THEN 'Março'
            WHEN 4 THEN 'Abril'
            WHEN 5 THEN 'Maio'
            WHEN 6 THEN 'Junho'
            WHEN 7 THEN 'Julho'
            WHEN 8 THEN 'Agosto'
            WHEN 9 THEN 'Setembro'
            WHEN 10 THEN 'Outubro'
            WHEN 11 THEN 'Novembro'
            WHEN 12 THEN 'Dezembro'
        END AS nome_mes,
        EXTRACT(DAYOFWEEK FROM d) AS dia_da_semana,
        TO_CHAR(d, 'Day') AS nome_dia_da_semana,
        CASE WHEN EXTRACT(DAYOFWEEK FROM d) IN (1, 7) THEN TRUE ELSE FALSE END AS dia_util
    FROM fonte_calendario
)

    select * 
    from calendario_renomeado