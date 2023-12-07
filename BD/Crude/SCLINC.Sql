CREATE TABLE Medicos (
    medico_id SERIAL PRIMARY KEY,
    nome VARCHAR(160),
    especialidade VARCHAR(100),
    contato VARCHAR(50)
);

CREATE TABLE Consultas (
    consulta_id SERIAL PRIMARY KEY,
    utente_id INTEGER,
    medico_id INTEGER,
    data_consulta TIMESTAMP,
    observacoes TEXT,
    FOREIGN KEY (utente_id) REFERENCES Utente(utente_id),
    FOREIGN KEY (medico_id) REFERENCES Medicos(medico_id)
);

CREATE TABLE Prescricoes (
    prescricao_id SERIAL PRIMARY KEY,
    consulta_id INTEGER,
    medico_id INTEGER,
    medicamento VARCHAR(100),
    dosagem VARCHAR(50),
    instrucoes TEXT,
    FOREIGN KEY (consulta_id) REFERENCES Consultas(consulta_id),
    FOREIGN KEY (medico_id) REFERENCES Medicos(medico_id)
);

CREATE TABLE Exames (
    exame_id SERIAL PRIMARY KEY,
    utente_id INTEGER,
    medico_id INTEGER,
    tipo_exame VARCHAR(100),
    data_exame DATE,
    resultados TEXT,
    FOREIGN KEY (utente_id) REFERENCES Utente(utente_id),
    FOREIGN KEY (medico_id) REFERENCES Medicos(medico_id)
);

CREATE TABLE RegistrosMedicos (
    registro_id SERIAL PRIMARY KEY,
    utente_id INTEGER,
    medico_id INTEGER,
    historico TEXT,
    FOREIGN KEY (utente_id) REFERENCES Utente(utente_id),
    FOREIGN KEY (medico_id) REFERENCES Medicos(medico_id)
);