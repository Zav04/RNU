--Validar se o NSS é valido para a base de dados
CREATE OR REPLACE FUNCTION is_nss_valid(nss VARCHAR)
RETURNS BOOLEAN AS $$
BEGIN
  RETURN (LENGTH(nss) = 9) AND (nss !~ '^(\d)\1{8}$');
END;
$$ LANGUAGE plpgsql;
