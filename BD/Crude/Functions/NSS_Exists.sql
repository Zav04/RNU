--Validar se existe email na base de dados
CREATE OR REPLACE FUNCTION NSS_exists(input_nss VARCHAR)
RETURNS BOOLEAN AS $$
DECLARE
    exists BOOLEAN;
BEGIN
    SELECT EXISTS(SELECT 1 FROM Identificacao WHERE numero_sns = input_nss) INTO exists;
    RETURN exists;
END;
$$ LANGUAGE plpgsql;