INSERT INTO Identificacao (utente_id, numero_sns, nome_completo, nomes_proprios, apelidos, data_nascimento, sexo_utente, pais_nacionalidade, obito, duplicado)
VALUES
  (1, '123456789', 'Maria Silva', 'Maria', 'Silva', '1990-05-15', 'F', 'Portugal', FALSE, FALSE),
  (2, '987654321', 'João Santos', 'João', 'Santos', '1985-08-20', 'M', 'Portugal', FALSE, FALSE),
  (3, '456789123', 'Ana Pereira', 'Ana', 'Pereira', '1988-03-10', 'F', 'Portugal', FALSE, FALSE),
  (4, '789123456', 'Pedro Fernandes', 'Pedro', 'Fernandes', '1995-11-25', 'M', 'Portugal', FALSE, FALSE),
  (5, '654321987', 'Sofia Ribeiro', 'Sofia', 'Ribeiro', '1982-02-08', 'F', 'Portugal', FALSE, FALSE),
  (6, '321987654', 'Carlos Oliveira', 'Carlos', 'Oliveira', '1977-07-12', 'M', 'Portugal', FALSE, FALSE),
  (7, '234567891', 'Marta Alves', 'Marta', 'Alves', '1993-09-30', 'F', 'Portugal', FALSE, FALSE),
  (8, '876543219', 'Rui Gomes', 'Rui', 'Gomes', '1980-04-05', 'M', 'Portugal', FALSE, FALSE),
  (9, '543219876', 'Lúcia Santos', 'Lúcia', 'Santos', '1975-12-18', 'F', 'Portugal', FALSE, FALSE),
  (10, '987654312', 'Hugo Pereira', 'Hugo', 'Pereira', '1997-06-03', 'M', 'Portugal', FALSE, FALSE);

INSERT INTO EntidadeResponsavel (utente_id, codigo, descricao, numero_benef_entidade, data_validade, pais)
VALUES
  (1, 'ER001', 'Hospital São João', '123456', '2023-12-31', 'Portugal'),
  (2, 'ER002', 'Clínica Médica Central', '789012', '2024-06-30', 'Portugal'),
  (3, 'ER003', 'Hospital da Luz', '345678', '2023-09-30', 'Portugal'),
  (4, 'ER004', 'Centro de Saúde Alameda', '567890', '2023-12-31', 'Portugal'),
  (5, 'ER005', 'Hospital Santa Maria', '234567', '2024-03-31', 'Portugal'),
  (6, 'ER006', 'Clínica de Pediatria', '678901', '2024-04-30', 'Portugal'),
  (7, 'ER007', 'Hospital São Francisco', '456789', '2023-10-31', 'Portugal'),
  (8, 'ER008', 'Centro Médico Porto', '890123', '2024-01-31', 'Portugal'),
  (9, 'ER009', 'Hospital Materno-Infantil', '123789', '2023-12-31', 'Portugal'),
  (10, 'ER010', 'Clínica de Cardiologia', '987654', '2024-02-28', 'Portugal');
  
  INSERT INTO Beneficios (utente_id, tipo, descricao, data_inicio, data_fim)
VALUES
  (1, 'A', 'Seguro de Saúde', '2023-01-01', '2023-12-31'),
  (2, 'B', 'Isenção de Taxa', '2024-01-01', '2024-12-31'),
  (3, 'C', 'Reembolso de Consultas', '2023-09-01', '2023-12-31'),
  (4, 'A', 'Seguro de Saúde', '2023-03-01', '2023-12-31'),
  (5, 'B', 'Isenção de Taxa', '2024-04-01', '2024-12-31'),
  (6, 'C', 'Reembolso de Consultas', '2023-10-01', '2023-12-31'),
  (7, 'A', 'Seguro de Saúde', '2023-06-01', '2023-12-31'),
  (8, 'B', 'Isenção de Taxa', '2024-05-01', '2024-12-31'),
  (9, 'C', 'Reembolso de Consultas', '2023-11-01', '2023-12-31'),
  (10, 'A', 'Seguro de Saúde', '2023-02-01', '2023-12-31');
  
  INSERT INTO Cartao (utente_id, numero_cartao, tipo_cartao)
VALUES
  (1, '1234567890', 'Platinum'),
  (2, '9876543210', 'Gold'),
  (3, '4567890123', 'Silver'),
  (4, '7890123456', 'Bronze'),
  (5, '2345678901', 'Platinum'),
  (6, '3456789012', 'Gold'),
  (7, '4567890123', 'Silver'),
  (8, '5678901234', 'Bronze'),
  (9, '6789012345', 'Platinum'),
  (10, '7890123456', 'Gold');
  
  
  INSERT INTO Mensagem (codigo, descricao, tipo_mensagem)
VALUES
  ('MSG001', 'Mensagem de Aviso', 'Aviso'),
  ('MSG002', 'Mensagem Informativa', 'Informativa'),
  ('MSG003', 'Mensagem de Alerta', 'Alerta'),
  ('MSG004', 'Mensagem de Erro', 'Erro'),
  ('MSG005', 'Mensagem Importante', 'Importante'),
  ('MSG006', 'Mensagem de Aviso', 'Aviso'),
  ('MSG007', 'Mensagem Informativa', 'Informativa'),
  ('MSG008', 'Mensagem de Alerta', 'Alerta'),
  ('MSG009', 'Mensagem de Erro', 'Erro'),
  ('MSG010', 'Mensagem Importante', 'Importante');


INSERT INTO RECM (beneficio_id, codigo, descricao, data_inicio, data_fim)
VALUES
  (1, 'R001', 'Recibo Médico', '2023-01-15', '2023-01-31'),
  (2, 'R002', 'Recibo Médico', '2024-02-10', '2024-02-28'),
  (3, 'R003', 'Recibo Médico', '2023-09-05', '2023-09-30'),
  (4, 'R004', 'Recibo Médico', '2023-03-20', '2023-03-31'),
  (5, 'R005', 'Recibo Médico', '2024-04-12', '2024-04-30'),
  (6, 'R006', 'Recibo Médico', '2023-10-08', '2023-10-31'),
  (7, 'R007', 'Recibo Médico', '2023-06-25', '2023-06-30'),
  (8, 'R008', 'Recibo Médico', '2024-05-14', '2024-05-31'),
  (9, 'R009', 'Recibo Médico', '2023-11-02', '2023-11-30'),
  (10, 'R010', 'Recibo Médico', '2023-02-18', '2023-02-28');
  
  
  INSERT INTO IsencaoTaxa (beneficio_id, motivo_codigo, descricao, data_inicio, data_fim)
VALUES
  (1, 'M001', 'Isenção de Taxa', '2023-01-01', '2023-12-31'),
  (2, 'M002', 'Isenção de Taxa', '2024-01-01', '2024-12-31'),
  (3, 'M003', 'Isenção de Taxa', '2023-09-01', '2023-12-31'),
  (4, 'M004', 'Isenção de Taxa', '2023-03-01', '2023-12-31'),
  (5, 'M005', 'Isenção de Taxa', '2024-04-01', '2024-12-31'),
  (6, 'M006', 'Isenção de Taxa', '2023-10-01', '2023-12-31'),
  (7, 'M007', 'Isenção de Taxa', '2023-06-01', '2023-12-31'),
  (8, 'M008', 'Isenção de Taxa', '2024-05-01', '2024-12-31'),
  (9, 'M009', 'Isenção de Taxa', '2023-11-01', '2023-12-31'),
  (10, 'M010', 'Isenção de Taxa', '2023-02-01', '2023-12-31');


INSERT INTO OutrosBeneficios (beneficio_id, codigo, descricao, data_inicio, data_fim)
VALUES
  (1, 'O001', 'Benefício Adicional', '2023-01-01', '2023-12-31'),
  (2, 'O002', 'Benefício Adicional', '2024-01-01', '2024-12-31'),
  (3, 'O003', 'Benefício Adicional', '2023-09-01', '2023-12-31'),
  (4, 'O004', 'Benefício Adicional', '2023-03-01', '2023-12-31'),
  (5, 'O005', 'Benefício Adicional', '2024-04-01', '2024-12-31'),
  (6, 'O006', 'Benefício Adicional', '2023-10-01', '2023-12-31'),
  (7, 'O007', 'Benefício Adicional', '2023-06-01', '2023-12-31'),
  (8, 'O008', 'Benefício Adicional', '2024-05-01', '2024-12-31'),
  (9, 'O009', 'Benefício Adicional', '2023-11-01', '2023-12-31'),
  (10, 'O010', 'Benefício Adicional', '2023-02-01', '2023-12-31');



INSERT INTO Utente (identificacao_id, entidade_id, beneficio_id)
VALUES
  (1, 1, 1),
  (2, 2, 2),
  (3, 3, 3),
  (4, 4, 4),
  (5, 5, 5),
  (6, 6, 6),
  (7, 7, 7),
  (8, 8, 8),
  (9, 9, 9),
  (10, 10, 10);
