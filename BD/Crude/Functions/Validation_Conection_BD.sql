--VALIDAR CONNECÇÃO COM A BASE DE DADOS
CREATE OR REPLACE FUNCTION is_connected() 
RETURNS BOOLEAN AS $$
BEGIN
  RETURN TRUE;
END;
$$ LANGUAGE plpgsql;