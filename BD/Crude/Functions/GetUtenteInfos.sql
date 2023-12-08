CREATE OR REPLACE FUNCTION get_utente_details(_utente_id BIGINT) 
RETURNS TABLE (
    utente_id INTEGER,
    identificacao_numero_sns VARCHAR,
    identificacao_nome_completo VARCHAR,
    identificacao_nomes_proprios VARCHAR,
    identificacao_apelidos VARCHAR,
    identificacao_data_nascimento DATE,
    identificacao_sexo_utente CHAR,
    identificacao_pais_nacionalidade VARCHAR,
    identificacao_phone_number VARCHAR,
    identificacao_address VARCHAR,
    identificacao_door_number BIGINT,
    identificacao_floor_number BIGINT,
    identificacao_zip_code VARCHAR,
    identificacao_obito BOOLEAN,
    identificacao_duplicado BOOLEAN,
    entidade_codigo VARCHAR,
    entidade_descricao VARCHAR,
    beneficios JSON
) AS $$
BEGIN
    RETURN QUERY 
    SELECT
        u.utente_id,
        i.numero_sns,
        i.nome_completo,
        i.nomes_proprios,
        i.apelidos,
        i.data_nascimento,
        i.sexo_utente,
        i.pais_nacionalidade,
        i.phone_number,
        i.address,
        i.door_number,
        i.floor_number,
        i.zip_code,
        i.obito,
        i.duplicado,
        er.codigo,
        er.descricao,
        json_agg(json_build_object(
            'tipo', b.tipo,
            'descricao', b.descricao,
            'data_inicio', b.data_inicio,
            'data_fim', b.data_fim
        )) AS beneficios
    FROM 
        Utente u
    JOIN Identificacao i ON u.identificacao_id = i.identificacao_id
    JOIN EntidadeResponsavel er ON u.entidade_id = er.entidade_id
    LEFT JOIN UtentesBeneficios ub ON u.utente_id = ub.utente_id
    LEFT JOIN Beneficios b ON ub.beneficio_id = b.beneficio_id
    WHERE
        u.utente_id = _utente_id
    GROUP BY u.utente_id, i.identificacao_id, er.entidade_id;
END;
$$ LANGUAGE plpgsql;

DROP FUNCTION get_utente_details(bigint)

SELECT get_utente_details(1)
