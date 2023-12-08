CREATE OR REPLACE FUNCTION verify_user_credentials(_numero_sns VARCHAR, _password VARCHAR)
RETURNS INTEGER AS $$
DECLARE
  utente_id INTEGER;
BEGIN
  SELECT ut.utente_id INTO utente_id
  FROM Utente ut
  JOIN Identificacao i ON ut.identificacao_id = i.identificacao_id
  JOIN Utilizadores u ON i.identificacao_id = u.identificacao_id
  WHERE i.numero_sns = _numero_sns AND u.palavra_passe = _password;

  IF utente_id IS NULL THEN
    RETURN -99; -- Retorna -99 diretamente se não encontrar um utente_id
  END IF;

  RETURN utente_id; -- Retorna o utente_id encontrado
END;
$$ LANGUAGE plpgsql;


SELECT verify_user_credentials('123456789','admin')
