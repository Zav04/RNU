CREATE OR REPLACE FUNCTION get_exames_utente(_utente_id BIGINT) 
RETURNS TABLE (
    exame_id INTEGER,
    data_exame DATE,
    tipo_exame VARCHAR,
    resultados TEXT,
    nome_medico VARCHAR,
    especialidade VARCHAR
) AS $$
BEGIN
    RETURN QUERY 
    SELECT
        ex.exame_id,
        ex.data_exame,
        ex.tipo_exame,
        ex.resultados,
        m.nome AS nome_medico,
        e.nome AS especialidade
    FROM 
        Exames ex
        JOIN Medicos m ON ex.medico_id = m.medico_id
        JOIN Especialidade e ON m.especialidade_id = e.especialidade_id
    WHERE
        ex.utente_id = _utente_id;
END;
$$ LANGUAGE plpgsql;

DROP FUNCTION get_exames_utente(bigint)

SELECT get_exames_utente(1)
