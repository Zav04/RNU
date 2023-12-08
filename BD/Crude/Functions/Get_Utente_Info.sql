CREATE OR REPLACE FUNCTION get_utente_info(_utente_id INT) 
RETURNS TABLE (
    utente_id INTEGER,
    numero_sns VARCHAR,
    nome_completo VARCHAR,
    data_nascimento DATE,
    sexo_utente CHAR,
    pais_nacionalidade VARCHAR,
    phone_number VARCHAR,
    address VARCHAR,
    door_number BIGINT,
    floor_number BIGINT,
    zip_code VARCHAR,
    beneficio_tipo CHAR,
    beneficio_descricao VARCHAR,
    beneficio_data_inicio DATE,
    beneficio_data_fim DATE,
    consulta_data TIMESTAMP,
    consulta_observacoes TEXT,
    medico_nome VARCHAR,
    medico_especialidade VARCHAR,
    medicamento_nome VARCHAR,
    prescricao_dosagem VARCHAR,
    prescricao_instrucoes TEXT,
    exame_tipo VARCHAR,
    exame_data DATE,
    exame_resultados TEXT,
    exame_medico_nome VARCHAR,
    exame_medico_especialidade VARCHAR,
    registro_historico TEXT,
	entidade_codigo VARCHAR,
    entidade_descricao VARCHAR,
    entidade_numero_benef_entidade VARCHAR,
    entidade_data_validade DATE,
    entidade_pais VARCHAR
) AS $$
BEGIN
    RETURN QUERY 
    SELECT
        u.utente_id,
        i.numero_sns,
        i.nome_completo,
        i.data_nascimento,
        i.sexo_utente,
        i.pais_nacionalidade,
        i.phone_number,
        i.address,
        i.door_number,
        i.floor_number,
        i.zip_code,
        b.tipo,
        b.descricao,
        b.data_inicio,
        b.data_fim,
        c.data_consulta,
        c.observacoes,
        med.nome AS medico_nome,
        esp.nome AS medico_especialidade,
        m.nome AS medicamento_nome,
        p.dosagem,
        p.instrucoes,
        ex.tipo_exame,
        ex.data_exame,
        ex.resultados,
        med_ex.nome AS exame_medico_nome,
        esp_ex.nome AS exame_medico_especialidade,
        rm.historico,
 		er.codigo AS entidade_codigo,
        er.descricao AS entidade_descricao,
        er.numero_benef_entidade AS entidade_numero_benef_entidade,
        er.data_validade AS entidade_data_validade,
        er.pais AS entidade_pais
    FROM 
        Utente u
    LEFT JOIN Identificacao i ON u.identificacao_id = i.identificacao_id
    LEFT JOIN UtentesBeneficios ub ON u.utente_id = ub.utente_id
    LEFT JOIN Beneficios b ON ub.beneficio_id = b.beneficio_id
    LEFT JOIN Consultas c ON u.utente_id = c.utente_id
    LEFT JOIN Medicos med ON c.medico_id = med.medico_id
    LEFT JOIN Especialidade esp ON med.especialidade_id = esp.especialidade_id
    LEFT JOIN Prescricoes p ON c.consulta_id = p.consulta_id
    LEFT JOIN Medicamento m ON p.medicamento_id = m.medicamento_id
    LEFT JOIN Exames ex ON u.utente_id = ex.utente_id
    LEFT JOIN Medicos med_ex ON ex.medico_id = med_ex.medico_id
    LEFT JOIN Especialidade esp_ex ON med_ex.especialidade_id = esp_ex.especialidade_id
    LEFT JOIN RegistrosMedicos rm ON u.utente_id = rm.utente_id
	LEFT JOIN EntidadeResponsavel er ON u.entidade_id = er.entidade_id
	
    WHERE
        u.utente_id = _utente_id;
END;
$$ LANGUAGE plpgsql;


