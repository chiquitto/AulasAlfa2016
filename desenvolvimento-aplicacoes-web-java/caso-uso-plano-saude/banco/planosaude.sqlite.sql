/*
Tipos
1=Funcionario
2=Cliente
3=Medico
*/
CREATE TABLE `pessoa` (
	`idpessoa`		INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	`tipo`			INTEGER NOT NULL,
	`nome`			TEXT NOT NULL,
	`email`			TEXT NULL,
	`senha`			TEXT NULL,
	`crm`			TEXT NULL,
	`idclinica`		INTEGER NULL
);

CREATE TABLE `clinica` (
	`idclinica`		INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	`nome`			TEXT NOT NULL,
	`endereco`		TEXT NOT NULL
);

CREATE TABLE `consulta` (
	`idconsulta`	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	`idfuncionario`	INTEGER NOT NULL,
	`idcliente`		INTEGER NOT NULL,
	`idmedico`		INTEGER NOT NULL,
	`data`			TEXT NOT NULL,
	`hora`			TEXT NOT NULL
);

Insert Into clinica (nome, endereco) Values
('Clinica de Dermatologia', 'Rua da Pele, s/n, Londrina/PR'),
('Clinica de Cardiologia', 'Praça do Coração, 128, Curitiba/PR'),
('Clinica de Rins', 'Avenida das Pedras, 12345, Rio de Janeiro/RJ')
;

Insert Into pessoa (tipo, nome, email, senha, crm, idclinica)
Values
(1, 'Funcionario 0001', 'func1@empresa.com.br', '123456', null, null),
(1, 'Funcionario 0002', 'func2@empresa.com.br', '999999', null, null),
(2, 'Cliente 0001', null, null, null, null),
(2, 'Cliente 0002', null, null, null, null),
(2, 'Cliente 0003', null, null, null, null),
(2, 'Cliente 0004', null, null, null, null),
(3, 'Médico 0001', null, null, 'CRM-PR 1.111', 1),
(3, 'Médico 0002', null, null, 'CRM-PR 2.222', 2),
(3, 'Médico 0003', null, null, 'CRM-PR 3.333', 2),
(3, 'Médico 0004', null, null, 'CRM-PR 4.444', 3)
;