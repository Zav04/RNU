CREATE OR REPLACE FUNCTION create_user(
    _numero_sns VARCHAR,
    _password VARCHAR,
    _nome_completo VARCHAR,
    _data_nascimento VARCHAR,
    _sexo_utente VARCHAR,
    _pais_nacionalidade VARCHAR,
    _phone_number VARCHAR,
    _address VARCHAR,
    _door_number BIGINT,
    _floor_number BIGINT,
    _zip_code VARCHAR
)
RETURNS BOOLEAN AS $$
DECLARE
    _identificacao_id BIGINT;
	_nomes_proprios VARCHAR;
    _apelidos VARCHAR;
	_data_nasc DATE; 
	_utente_id BIGINT;
BEGIN
IF _nome_completo IS NULL OR _nome_completo = '' THEN
        RAISE EXCEPTION 'Nome Completo é um campo obrigatorio.';
    END IF;
	
	IF _numero_sns IS NULL OR _numero_sns = '' THEN
        RAISE EXCEPTION 'O Número de Saúde é um campo obrigatorio.';
    END IF;

    IF LENGTH(_numero_sns) <> 9 THEN
        RAISE EXCEPTION 'O número de utente deve conter exatamente 9 dígitos.';
    END IF;
	
	    -- Verifica se o número SNS já existe
    IF EXISTS (SELECT 1 FROM Identificacao WHERE numero_sns = _numero_sns) THEN
        RAISE EXCEPTION 'Número de utente já existe.';
    END IF;

	IF _data_nascimento IS NULL or _data_nascimento='' THEN
        RAISE EXCEPTION 'Data de Nascimento é um campo obrigatorio.';
	ELSE 
		_data_nasc:=TO_DATE(_data_nascimento, 'YYYY-MM-DD');
    END IF;
	
    IF _password IS NULL OR _password = '' THEN
        RAISE EXCEPTION 'Password é um campo obrigatorio.';
    END IF;
	
	IF _sexo_utente IS NULL THEN
        RAISE EXCEPTION 'Genero é um campo obrigatorio.';
    END IF;
	
	IF _sexo_utente ='Masculino' THEN
        _sexo_utente :='M';
    END IF;
	
	IF _sexo_utente = 'Feminino' THEN
        _sexo_utente:='F';
    END IF;
	
	IF _phone_number IS NULL or _phone_number='' THEN
        RAISE EXCEPTION 'Número de telemovel é um campo obrigatorio.';
    END IF;
	
	IF LENGTH(_phone_number) <> 9 THEN
    RAISE EXCEPTION 'O Número de Telemovel deve conter exatamente 9 dígitos.';
	END IF;
	
	IF _address IS NULL or _address='' THEN
        RAISE EXCEPTION 'Morada é um campo obrigatorio.';
    END IF;
	
	IF _door_number IS NULL THEN
        RAISE EXCEPTION 'Número da porta é um campo obrigatorio.';
    END IF;
	
	IF _door_number=0 THEN
        RAISE EXCEPTION 'Número da porta incorreto.';
    END IF;
	
	IF _floor_number IS NULL THEN
        _floor_number=NULL;
    END IF;
	
	IF _floor_number <> NULL AND _floor_number=0 THEN
        RAISE EXCEPTION 'Número da piso invalido.';
    END IF;
	
	IF _zip_code IS NULL or _zip_code='-' THEN
        RAISE EXCEPTION 'Codigo de Postal é um campo obrigatorio.';
    END IF;
	
	IF _zip_code='0000-000' or _zip_code NOT SIMILAR TO '[0-9]{4}-[0-9]{3}' THEN
        RAISE EXCEPTION 'Codigo de Postal Invalido.';
    END IF;
	
	SELECT split_part(_nome_completo, ' ', 1) INTO _nomes_proprios;
    SELECT split_part(reverse(_nome_completo), ' ', 1) INTO _apelidos;
    SELECT reverse(_apelidos) INTO _apelidos;
	
    -- Inserir na tabela Identificacao
    INSERT INTO Identificacao (numero_sns, nome_completo,nomes_proprios, 
        apelidos, data_nascimento, sexo_utente, pais_nacionalidade, obito,duplicado,phone_number, address, door_number, floor_number, zip_code)
    VALUES (_numero_sns, _nome_completo,_nomes_proprios, 
        _apelidos, _data_nasc, _sexo_utente, _pais_nacionalidade,FALSE,FALSE, _phone_number, _address, _door_number, _floor_number, _zip_code)
    RETURNING identificacao_id INTO _identificacao_id;

    -- Inserir na tabela Utilizadores
    INSERT INTO Utilizadores (identificacao_id, palavra_passe)
    VALUES (_identificacao_id, crypt(_password, gen_salt('bf', 10)));
	
    -- Inserir na tabela Utente com a identificacao_id e deixar os outros campos como NULL
    INSERT INTO Utente (identificacao_id, entidade_id)
    VALUES (_identificacao_id, NULL)
    RETURNING utente_id INTO _utente_id;
	
	
	UPDATE Identificacao
    SET utente_id = _utente_id
    WHERE identificacao_id = _identificacao_id;

    RETURN TRUE;
END;
$$ LANGUAGE plpgsql;


--SELECT create_user('bruno.bx04@gmail.com', 'admin', 123456789, 'Bruno', 'Oliveira', '2001-11-10', 'Masculino', '915226207', 'Rua', 537, Null, '4085-631','Admin');

