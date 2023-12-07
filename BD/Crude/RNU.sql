CREATE TABLE Utente (
	utente_id SERIAL PRIMARY KEY,
	identificacao_id BIGINT,
	entidade_id BIGINT,
	beneficio_id BIGINT
);
	

CREATE TABLE Identificacao (
    identificacao_id SERIAL PRIMARY KEY,
	utente_id BIGINT,
    numero_sns VARCHAR(9),
    nome_completo VARCHAR(160),
    nomes_proprios VARCHAR(110),
    apelidos VARCHAR(50),
    data_nascimento DATE,
    sexo_utente CHAR(1),
    pais_nacionalidade VARCHAR(10),
    obito BOOLEAN,
    duplicado BOOLEAN
);

CREATE TABLE EntidadeResponsavel (
    entidade_id SERIAL PRIMARY KEY,
    utente_id INTEGER,
    codigo VARCHAR(20),
    descricao VARCHAR(100),
    numero_benef_entidade VARCHAR(20),
    data_validade DATE,
    pais VARCHAR(10)
);

CREATE TABLE Beneficios (
    beneficio_id SERIAL PRIMARY KEY,
    utente_id INTEGER,
    tipo CHAR(1),
    descricao VARCHAR(40),
    data_inicio DATE,
    data_fim DATE
);

CREATE TABLE Cartao (
    cartao_id SERIAL PRIMARY KEY,
    utente_id INTEGER,
    numero_cartao VARCHAR(20),
    tipo_cartao VARCHAR(10)
);

CREATE TABLE Mensagem (
    mensagem_id SERIAL PRIMARY KEY,
    codigo VARCHAR(20),
    descricao VARCHAR(100),
    tipo_mensagem VARCHAR(50)
);

CREATE TABLE RECM (
    recm_id SERIAL PRIMARY KEY,
    beneficio_id INTEGER,
    codigo VARCHAR(5),
    descricao VARCHAR(40),
    data_inicio DATE,
    data_fim DATE
);

CREATE TABLE IsencaoTaxa (
    isencao_id SERIAL PRIMARY KEY,
    beneficio_id INTEGER,
    motivo_codigo VARCHAR(5),
    descricao VARCHAR(40),
    data_inicio DATE,
    data_fim DATE
);

CREATE TABLE OutrosBeneficios (
    outros_id SERIAL PRIMARY KEY,
    beneficio_id INTEGER,
    codigo VARCHAR(5),
    descricao VARCHAR(40),
    data_inicio DATE,
    data_fim DATE
);


CREATE TABLE Utilizadores (
    utilizador_id SERIAL PRIMARY KEY,
    identificacao_id BIGINT UNIQUE NOT NULL,
    palavra_passe VARCHAR(255) NOT NULL,
    ativo BOOLEAN DEFAULT TRUE
);


ALTER TABLE Utilizadores
ADD CONSTRAINT fk_identificacao
FOREIGN KEY (identificacao_id) REFERENCES Identificacao(identificacao_id);


ALTER TABLE Utente
ADD FOREIGN KEY (identificacao_id) REFERENCES Identificacao(identificacao_id),
ADD FOREIGN KEY (entidade_id) REFERENCES EntidadeResponsavel(entidade_id),
ADD FOREIGN KEY (beneficio_id) REFERENCES Beneficios(beneficio_id);

ALTER TABLE EntidadeResponsavel
ADD FOREIGN KEY (utente_id) REFERENCES Utente(utente_id);

ALTER TABLE Beneficios
ADD FOREIGN KEY (utente_id) REFERENCES Utente(utente_id);

ALTER TABLE Cartao
ADD FOREIGN KEY (utente_id) REFERENCES Utente(utente_id);

ALTER TABLE Identificacao
ADD FOREIGN KEY (utente_id) REFERENCES Utente(utente_id);

ALTER TABLE RECM
ADD FOREIGN KEY (beneficio_id) REFERENCES Beneficios(beneficio_id);

ALTER TABLE IsencaoTaxa
ADD FOREIGN KEY (beneficio_id) REFERENCES Beneficios(beneficio_id);

ALTER TABLE OutrosBeneficios
ADD FOREIGN KEY (beneficio_id) REFERENCES Beneficios(beneficio_id);
