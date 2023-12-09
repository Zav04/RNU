CREATE OR REPLACE FUNCTION get_prescricoes_utente(_utente_id BIGINT) 
RETURNS TABLE (
    prescricao_id INTEGER,
    data_consulta TIMESTAMP,
    dosagem VARCHAR,
    instrucoes TEXT,
    nome_medico VARCHAR,
    especialidade VARCHAR,
    nome_medicamento VARCHAR
) AS $$
BEGIN
    RETURN QUERY 
    SELECT
        p.prescricao_id,
        c.data_consulta,
        p.dosagem,
        p.instrucoes,
        m.nome AS nome_medico,
        e.nome AS especialidade,
        med.nome AS nome_medicamento
    FROM 
        Prescricoes p
        JOIN Consultas c ON p.consulta_id = c.consulta_id
        JOIN Medicos m ON c.medico_id = m.medico_id
        JOIN Especialidade e ON m.especialidade_id = e.especialidade_id
        JOIN Medicamento med ON p.medicamento_id = med.medicamento_id
    WHERE
        c.utente_id = _utente_id;
END;
$$ LANGUAGE plpgsql;

DROP FUNCTION get_prescricoes_utente(bigint)

SELECT get_prescricoes_utente(1)