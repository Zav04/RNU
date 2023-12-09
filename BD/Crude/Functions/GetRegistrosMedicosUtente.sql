CREATE OR REPLACE FUNCTION get_registros_medicos_utente(_utente_id BIGINT) 
RETURNS TABLE (
    registro_id INTEGER,
    historico TEXT,
    nome_medico VARCHAR,
    especialidade VARCHAR
) AS $$
BEGIN
    RETURN QUERY 
    SELECT
        rm.registro_id,
        rm.historico,
        m.nome AS nome_medico,
        e.nome AS especialidade
    FROM 
        RegistrosMedicos rm
        JOIN Medicos m ON rm.medico_id = m.medico_id
        JOIN Especialidade e ON m.especialidade_id = e.especialidade_id
    WHERE
        rm.utente_id = _utente_id;
END;
$$ LANGUAGE plpgsql;
