INSERT INTO Especialidade(nome) VALUES
('Pediatra'),
('Clínico Geral'),
('Gastroenterologia'),
('Dermatologia');

SELECT * FROM Especialidade;

INSERT INTO Medico (id_crm, nome, telefone, codigo_especialidade) VALUES 
('12345', 'Dr. Silva', '4002-8922',2),
('67890', 'Dra. Souza', '3333-4444', 1);

SELECT * FROM Medico;

INSERT INTO Paciente (id_cpf, nome, telefone, email, endereco) VALUES
('1112223334', 'João da Silva', '95555-6666', 'joao@gmail.com', 'Rua C, 300'),
('2233344455', 'Maria Guimarães', '98888-67896', 'maria@hotmail.com', 'Rua I, 200');

SELECT * FROM Paciente;

INSERT INTO Consulta( data_consulta, crm, cpf, diagnostico) VALUES
('2025-08-20', '12345', '1112223334', 'Virose'),
('2025-08-21', '12345', '2233344455', 'Alergia');
SELECT * FROM Consulta;

