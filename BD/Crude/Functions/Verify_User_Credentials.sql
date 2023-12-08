CREATE OR REPLACE FUNCTION verify_user_credentials(_numero_sns VARCHAR, _passowrd VARCHAR)
RETURNS INTEGER AS $$
DECLARE
  user_id INTEGER;
BEGIN
  SELECT u.utilizador_id INTO user_id
  FROM Utilizadores u
  JOIN Identificacao i ON u.identificacao_id = i.identificacao_id
  WHERE i.numero_sns = _numero_sns AND u.palavra_passe = _passowrd;

  IF user_id IS NULL THEN
    RETURN NULL;
  ELSE
    RETURN user_id;
  END IF;
END;
$$ LANGUAGE plpgsql;


