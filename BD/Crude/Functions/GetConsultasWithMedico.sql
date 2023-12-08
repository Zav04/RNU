CREATE OR REPLACE FUNCTION get_consultas_with_medico(_utente_id BIGINT) 
RETURNS TABLE (
    consulta_id INTEGER,
    data_consulta TIMESTAMP,
    observacoes TEXT,
    nome_medico VARCHAR,
    especialidade VARCHAR
) AS $$
BEGIN
    RETURN QUERY 
    SELECT
        c.consulta_id,
        c.data_consulta,
        c.observacoes,
        m.nome AS nome_medico,
        e.nome AS especialidade
    FROM 
        Consultas c
    JOIN Medicos m ON c.medico_id = m.medico_id
    JOIN Especialidade e ON m.especialidade_id = e.especialidade_id
    WHERE
        c.utente_id = _utente_id;
END;
$$ LANGUAGE plpgsql;

SELECT get_consultas_with_medico(1)