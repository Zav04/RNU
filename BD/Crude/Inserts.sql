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

INSERT INTO EntidadeResponsavel (codigo, descricao, numero_benef_entidade, data_validade, pais)
VALUES
  ('ER001', 'Hospital São João', '123456', '2023-12-31', 'Portugal'),
  ('ER002', 'Clínica Médica Central', '789012', '2024-06-30', 'Portugal'),
  ('ER003', 'Hospital da Luz', '345678', '2023-09-30', 'Portugal'),
  ('ER004', 'Centro de Saúde Alameda', '567890', '2023-12-31', 'Portugal'),
  ('ER005', 'Hospital Santa Maria', '234567', '2024-03-31', 'Portugal'),
  ('ER006', 'Clínica de Pediatria', '678901', '2024-04-30', 'Portugal'),
  ('ER007', 'Hospital São Francisco', '456789', '2023-10-31', 'Portugal'),
  ('ER008', 'Centro Médico Porto', '890123', '2024-01-31', 'Portugal'),
  ('ER009', 'Hospital Materno-Infantil', '123789', '2023-12-31', 'Portugal'),
  ('ER010', 'Clínica de Cardiologia', '987654', '2024-02-28', 'Portugal');
  
  INSERT INTO Beneficios (tipo, descricao, data_inicio, data_fim)
VALUES
  ('A', 'Seguro de Saúde', '2023-01-01', '2023-12-31'),
  ('B', 'Isenção de Taxa', '2024-01-01', '2024-12-31'),
  ('C', 'Reembolso de Consultas', '2023-09-01', '2023-12-31'),
  ('A', 'Seguro de Saúde', '2023-03-01', '2023-12-31'),
  ('B', 'Isenção de Taxa', '2024-04-01', '2024-12-31'),
  ('C', 'Reembolso de Consultas', '2023-10-01', '2023-12-31'),
  ('A', 'Seguro de Saúde', '2023-06-01', '2023-12-31'),
  ('B', 'Isenção de Taxa', '2024-05-01', '2024-12-31'),
  ('C', 'Reembolso de Consultas', '2023-11-01', '2023-12-31'),
  ('A', 'Seguro de Saúde', '2023-02-01', '2023-12-31');
  
  INSERT INTO Cartao (numero_cartao, tipo_cartao)
VALUES
  ('1234567890', 'Platinum'),
  ('9876543210', 'Gold'),
  ('4567890123', 'Silver'),
  ('7890123456', 'Bronze'),
  ('2345678901', 'Platinum'),
  ('3456789012', 'Gold'),
  ('4567890123', 'Silver'),
  ('5678901234', 'Bronze'),
  ('6789012345', 'Platinum'),
  ('7890123456', 'Gold');
  
  
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


INSERT INTO RECM (codigo, descricao, data_inicio, data_fim)
VALUES
  ('R001', 'Recibo Médico', '2023-01-15', '2023-01-31'),
  ('R002', 'Recibo Médico', '2024-02-10', '2024-02-28'),
  ('R003', 'Recibo Médico', '2023-09-05', '2023-09-30'),
  ('R004', 'Recibo Médico', '2023-03-20', '2023-03-31'),
  ('R005', 'Recibo Médico', '2024-04-12', '2024-04-30'),
  ('R006', 'Recibo Médico', '2023-10-08', '2023-10-31'),
  ('R007', 'Recibo Médico', '2023-06-25', '2023-06-30'),
  ('R008', 'Recibo Médico', '2024-05-14', '2024-05-31'),
  ('R009', 'Recibo Médico', '2023-11-02', '2023-11-30'),
  ('R010', 'Recibo Médico', '2023-02-18', '2023-02-28');
  
  
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


INSERT INTO Especialidade (nome) VALUES ('Cardiologia');
INSERT INTO Especialidade (nome) VALUES ('Dermatologia');
INSERT INTO Especialidade (nome) VALUES ('Endocrinologia');
INSERT INTO Especialidade (nome) VALUES ('Gastroenterologia');
INSERT INTO Especialidade (nome) VALUES ('Geriatra');
INSERT INTO Especialidade (nome) VALUES ('Ginecologia');
INSERT INTO Especialidade (nome) VALUES ('Hematologia');
INSERT INTO Especialidade (nome) VALUES ('Infectologia');
INSERT INTO Especialidade (nome) VALUES ('Nefrologia');
INSERT INTO Especialidade (nome) VALUES ('Neurologia');


INSERT INTO Medicos (nome, especialidade_id, contato) VALUES ('Dr. Carlos Pereira', 3, '934567890');
INSERT INTO Medicos (nome, especialidade_id, contato) VALUES ('Dra. Sofia Costa', 4, '945678901');
INSERT INTO Medicos (nome, especialidade_id, contato) VALUES ('Dr. Ricardo Soares', 5, '956789012');
INSERT INTO Medicos (nome, especialidade_id, contato) VALUES ('Dra. Beatriz Gomes', 6, '967890123');
INSERT INTO Medicos (nome, especialidade_id, contato) VALUES ('Dr. António Rocha', 7, '978901234');
INSERT INTO Medicos (nome, especialidade_id, contato) VALUES ('Dra. Margarida Nogueira', 8, '989012345');
INSERT INTO Medicos (nome, especialidade_id, contato) VALUES ('Dr. Joaquim Barbosa', 9, '990123456');
INSERT INTO Medicos (nome, especialidade_id, contato) VALUES ('Dra. Clara Ferreira', 10, '901234567');


INSERT INTO Consultas (utente_id, medico_id, data_consulta, observacoes) VALUES (2, 2, '2023-12-03 14:00', 'Consulta de acompanhamento');
INSERT INTO Consultas (utente_id, medico_id, data_consulta, observacoes) VALUES (3, 3, '2023-12-05 09:00', 'Consulta de urgência');
INSERT INTO Consultas (utente_id, medico_id, data_consulta, observacoes) VALUES (7, 1, '2023-12-04 16:00', 'Consulta de acompanhamento');
INSERT INTO Consultas (utente_id, medico_id, data_consulta, observacoes) VALUES (6, 6, '2023-12-06 12:22', 'Consulta de Diabetes');
INSERT INTO Consultas (utente_id, medico_id, data_consulta, observacoes) VALUES (1, 7, '2023-12-04 18:00', 'Consulta de acompanhamento');
INSERT INTO Consultas (utente_id, medico_id, data_consulta, observacoes) VALUES (5, 6, '2023-12-06 12:22', 'Consulta de Diabetes');
INSERT INTO Consultas (utente_id, medico_id, data_consulta, observacoes) VALUES (1, 7, '2023-12-22 18:00', 'Consulta de acompanhamento');
INSERT INTO Consultas (utente_id, medico_id, data_consulta, observacoes) VALUES (4, 6, '2023-11-20 12:22', 'Consulta de Diabetes');
INSERT INTO Consultas (utente_id, medico_id, data_consulta, observacoes) VALUES (1, 7, '2023-10-10 13:00', 'Consulta de acompanhamento');


INSERT INTO Medicamento (nome) VALUES
('Paracetamol'),
('Ibuprofeno'),
('Cetamol'),
('Ibruvix'),
('Amoxilin'),
('Rinotad'),
('Gastrotex'),
('Metmorfina'),
('Lisoprin'),
('Fluoxetina'),
('Simvastol'),
('Loratamed');




INSERT INTO Prescricoes (consulta_id, medico_id, medicamento_id, dosagem, instrucoes) VALUES (1, 1, 1, '200mg', 'Tomar duas vezes ao dia');
INSERT INTO Prescricoes (consulta_id, medico_id, medicamento_id, dosagem, instrucoes) VALUES (2, 2, 2, '500mg', 'Tomar três vezes ao dia');
INSERT INTO Prescricoes (consulta_id, medico_id, medicamento_id, dosagem, instrucoes) VALUES (3, 3, 3, '200mg', 'Tomar duas vezes ao dia');
INSERT INTO Prescricoes (consulta_id, medico_id, medicamento_id, dosagem, instrucoes) VALUES (4, 4, 4, '500mg', 'Tomar quatro vezes ao dia');
INSERT INTO Prescricoes (consulta_id, medico_id, medicamento_id, dosagem, instrucoes) VALUES (5, 5, 5, '200mg', 'Tomar duas vezes ao dia');
INSERT INTO Prescricoes (consulta_id, medico_id, medicamento_id, dosagem, instrucoes) VALUES (6, 6, 6, '500mg', 'Tomar três vezes ao dia');
INSERT INTO Prescricoes (consulta_id, medico_id, medicamento_id, dosagem, instrucoes) VALUES (7, 7, 7, '200mg', 'Tomar duas vezes ao dia');
INSERT INTO Prescricoes (consulta_id, medico_id, medicamento_id, dosagem, instrucoes) VALUES (8, 8, 8, '500mg', 'Tomar uma vezes ao dia');


INSERT INTO Exames (utente_id, medico_id, tipo_exame, data_exame, resultados) VALUES (1, 1, 'Ultrassonografia', '2023-12-05', 'Resultados normais');
INSERT INTO Exames (utente_id, medico_id, tipo_exame, data_exame, resultados) VALUES (2, 2, 'Eletrocardiograma', '2023-12-06', 'Leves alterações');
INSERT INTO Exames (utente_id, medico_id, tipo_exame, data_exame, resultados) VALUES (3, 3, 'Ressonacia', '2023-12-06', 'Tudo OK');
INSERT INTO Exames (utente_id, medico_id, tipo_exame, data_exame, resultados) VALUES (4, 4, 'Raio-X', '2023-12-06', 'Tudo OK');
INSERT INTO Exames (utente_id, medico_id, tipo_exame, data_exame, resultados) VALUES (5, 5, 'TAC', '2023-12-06', 'Derrame Cerebral');
INSERT INTO Exames (utente_id, medico_id, tipo_exame, data_exame, resultados) VALUES (6, 6, 'Raio-X', '2023-12-06', 'Braço Partido');
INSERT INTO Exames (utente_id, medico_id, tipo_exame, data_exame, resultados) VALUES (7, 7, 'Raio-X', '2023-12-06', 'Perna Partida');


INSERT INTO RegistrosMedicos (utente_id, medico_id, historico) VALUES (1, 1, 'Histórico de hipertensão controlada');
INSERT INTO RegistrosMedicos (utente_id, medico_id, historico) VALUES (2, 2, 'Acompanhamento de diabetes tipo 2');
INSERT INTO RegistrosMedicos (utente_id, medico_id, historico) VALUES (3, 3, 'Histórico de asma crônica');
INSERT INTO RegistrosMedicos (utente_id, medico_id, historico) VALUES (4, 1, 'Controle de colesterol alto');
INSERT INTO RegistrosMedicos (utente_id, medico_id, historico) VALUES (5, 2, 'Tratamento para osteoporose');
INSERT INTO RegistrosMedicos (utente_id, medico_id, historico) VALUES (1, 4, 'Alergias sazonais frequentes');
INSERT INTO RegistrosMedicos (utente_id, medico_id, historico) VALUES (2, 5, 'Histórico de problemas cardíacos');
INSERT INTO RegistrosMedicos (utente_id, medico_id, historico) VALUES (3, 6, 'Acompanhamento pós-operatório de cirurgia de joelho');
INSERT INTO RegistrosMedicos (utente_id, medico_id, historico) VALUES (6, 3, 'Consulta para dor crônica nas costas');
INSERT INTO RegistrosMedicos (utente_id, medico_id, historico) VALUES (7, 2, 'Tratamento de ansiedade e depressão');
INSERT INTO RegistrosMedicos (utente_id, medico_id, historico) VALUES (8, 4, 'Consulta para enxaquecas regulares');
INSERT INTO RegistrosMedicos (utente_id, medico_id, historico) VALUES (9, 5, 'Acompanhamento de artrite reumatoide');
INSERT INTO RegistrosMedicos (utente_id, medico_id, historico) VALUES (10, 6, 'Histórico de problemas gastrointestinais');
INSERT INTO RegistrosMedicos (utente_id, medico_id, historico) VALUES (1, 7, 'Monitoramento de saúde mental');
INSERT INTO RegistrosMedicos (utente_id, medico_id, historico) VALUES (2, 8, 'Tratamento para insônia crônica');
INSERT INTO RegistrosMedicos (utente_id, medico_id, historico) VALUES (3, 1, 'Acompanhamento regular de saúde geral');
INSERT INTO RegistrosMedicos (utente_id, medico_id, historico) VALUES (4, 2, 'Histórico familiar de doenças cardíacas');
INSERT INTO RegistrosMedicos (utente_id, medico_id, historico) VALUES (5, 3, 'Consultas para controle de peso');
INSERT INTO RegistrosMedicos (utente_id, medico_id, historico) VALUES (6, 4, 'Avaliação periódica de saúde ocular');
INSERT INTO RegistrosMedicos (utente_id, medico_id, historico) VALUES (7, 5, 'Check-up anual de rotina');
INSERT INTO RegistrosMedicos (utente_id, medico_id, historico) VALUES (8, 6, 'Tratamento de alergias alimentares');
INSERT INTO RegistrosMedicos (utente_id, medico_id, historico) VALUES (9, 7, 'Acompanhamento de saúde da mulher');
INSERT INTO RegistrosMedicos (utente_id, medico_id, historico) VALUES (10, 8, 'Exames de rotina para saúde do homem');
INSERT INTO RegistrosMedicos (utente_id, medico_id, historico) VALUES (1, 1, 'Consulta para dores articulares');
INSERT INTO RegistrosMedicos (utente_id, medico_id, historico) VALUES (2, 2, 'Acompanhamento para hipotiroidismo');
INSERT INTO RegistrosMedicos (utente_id, medico_id, historico) VALUES (3, 3, 'Consulta dermatológica para acne');
INSERT INTO RegistrosMedicos (utente_id, medico_id, historico) VALUES (4, 4, 'Monitoramento de sinais vitais');
INSERT INTO RegistrosMedicos (utente_id, medico_id, historico) VALUES (5, 5, 'Histórico de intervenções cirúrgicas');
INSERT INTO RegistrosMedicos (utente_id, medico_id, historico) VALUES (6, 6, 'Controle de pressão arterial elevada');
INSERT INTO RegistrosMedicos (utente_id, medico_id, historico) VALUES (7, 7, 'Acompanhamento de lesões desportivas');
INSERT INTO RegistrosMedicos (utente_id, medico_id, historico) VALUES (8, 8, 'Consulta para gestão de stress');
INSERT INTO RegistrosMedicos (utente_id, medico_id, historico) VALUES (9, 1, 'Avaliação para fadiga crônica');
INSERT INTO RegistrosMedicos (utente_id, medico_id, historico) VALUES (10, 2, 'Monitoramento de saúde cardiovascular');


INSERT INTO Utente (identificacao_id, entidade_id, beneficio_id) VALUES (1, 1, 1);
INSERT INTO Utente (identificacao_id, entidade_id, beneficio_id) VALUES (2, 2, NULL);
INSERT INTO Utente (identificacao_id, entidade_id, beneficio_id) VALUES (3, 3, 3);
INSERT INTO Utente (identificacao_id, entidade_id, beneficio_id) VALUES (4, 4, NULL);
INSERT INTO Utente (identificacao_id, entidade_id, beneficio_id) VALUES (5, 5, 5);
INSERT INTO Utente (identificacao_id, entidade_id, beneficio_id) VALUES (6, 6, NULL);
INSERT INTO Utente (identificacao_id, entidade_id, beneficio_id) VALUES (7, 7, 7);
INSERT INTO Utente (identificacao_id, entidade_id, beneficio_id) VALUES (8, 8, NULL);
INSERT INTO Utente (identificacao_id, entidade_id, beneficio_id) VALUES (9, 9, 9);
INSERT INTO Utente (identificacao_id, entidade_id, beneficio_id) VALUES (10, 10, NULL);


INSERT INTO Utilizadores (identificacao_id, palavra_passe) VALUES (1, 'admin');
INSERT INTO Utilizadores (identificacao_id, palavra_passe) VALUES (2, 'senha2');
INSERT INTO Utilizadores (identificacao_id, palavra_passe) VALUES (3, 'senha3');
INSERT INTO Utilizadores (identificacao_id, palavra_passe) VALUES (4, 'senha4');
INSERT INTO Utilizadores (identificacao_id, palavra_passe) VALUES (5, 'senha5');
