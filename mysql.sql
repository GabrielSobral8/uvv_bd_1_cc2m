
/* Primeiramente devemos criar todas as tabelas com suas colunas*/


CREATE TABLE IF NOT EXISTS departamento (
	numero_departamento INTEGER NOT NULL,
	nome_departamento VARCHAR(15) NOT NULL,
	cpf_gerente CHAR(11) NOT NULL,
	data_inicio_gerente DATE
);
CREATE TABLE IF NOT EXISTS dependente (
	cpf_funcionario CHAR(11) NOT NULL,
	nome_dependente VARCHAR(15) NOT NULL,
sexo CHAR(1),
	data_nascimento DATE,
	parentesco VARCHAR(15)
);
CREATE TABLE IF NOT EXISTS funcionario (
cpf CHAR(11) NOT NULL,
  primeiro_nome VARCHAR(15) NOT NULL,
  nome_meio CHAR(1),
  ultimo_nome VARCHAR(15) NOT NULL,
  data_nascimento DATE,
  endereco VARCHAR(30),
  sexo CHAR(1),
  salario DECIMAL(10, 2) NOT NULL,
  cpf_supervisor CHAR(11) NOT NULL,
  numero_departamento INTEGER NOT NULL
);
CREATE TABLE IF NOT EXISTS localizacoes_departamento (
	numero_departamento INTEGER NOT NULL,
	local VARCHAR(15) NOT NULL
);
CREATE TABLE IF NOT EXISTS projeto (
  numero_projeto INTEGER NOT NULL,
  nome_projeto VARCHAR(15) NOT NULL,
  local_projeto VARCHAR(15),
  numero_departamento INTEGER NOT NULL
);
CREATE TABLE IF NOT EXISTS trabalha_em (
  cpf_funcionario CHAR(11) NOT NULL,
  numero_projeto INTEGER NOT NULL,
  horas DECIMAL(3, 1) NOT NULL
);
/* Em seguida devemos adicionar as chaves alternativas (AK)*/
CREATE UNIQUE INDEX departamento_idx
 ON departamento ( nome_departamento );

CREATE UNIQUE INDEX projeto_idx
 ON projeto ( nome_projeto );

/* Em seguida devemos adicionar as chaves primarias (PK)*/

ALTER TABLE departamento
    ADD PRIMARY KEY (numero_departamento);

ALTER TABLE dependente
    ADD PRIMARY KEY (cpf_funcionario, nome_dependente);

ALTER TABLE funcionario
    ADD PRIMARY KEY (cpf);

ALTER TABLE localizacoes_departamento
    ADD PRIMARY KEY (numero_departamento, local);

ALTER TABLE projeto
    ADD PRIMARY KEY (numero_projeto);

ALTER TABLE trabalha_em
    ADD PRIMARY KEY (cpf_funcionario, numero_projeto);
    
    
  /* Em seguida devemos adicionar as chaves estrangeiras (FK)*/  
    
    
ALTER TABLE departamento
ADD FOREIGN KEY (cpf_gerente) 
REFERENCES funcionario (cpf);


ALTER TABLE dependente
ADD FOREIGN KEY (cpf_funcionario) 
REFERENCES funcionario (cpf);


ALTER TABLE funcionario
ADD FOREIGN KEY (cpf_supervisor) 
REFERENCES funcionario (cpf);


ALTER TABLE localizacoes_departamento
ADD FOREIGN KEY (numero_departamento) 
REFERENCES departamento (numero_departamento);


ALTER TABLE projeto
ADD FOREIGN KEY (numero_departamento) 
REFERENCES departamento (numero_departamento);

ALTER TABLE trabalha_em
ADD FOREIGN KEY (cpf_funcionario) 
REFERENCES funcionario (cpf);

ALTER TABLE trabalha_em
ADD FOREIGN KEY (numero_projeto) 
REFERENCES projeto (numero_projeto);

/* Neste momento para consertar os erros, devemeos alterar a condicao de NOT NULL de ambas colunas para NULL*/

ALTER TABLE funcionario MODIFY cpf_supervisor CHAR(11) NULL;

ALTER TABLE trabalha_em MODIFY horas DECIMAL(3,1) NULL;

/* Agora devemos fazer a insercao dos valores*/
/* Infelizmente descobri que nao preciso de fazer varios INSERT INTO apenas no MySQL, perdi muito tempo no postgre*/


INSERT INTO funcionario (primeiro_nome, nome_meio, ultimo_nome, cpf, data_nascimento, endereco, sexo, salario, cpf_supervisor, numero_departamento) 
VALUES ('Jorge', 'E', 'Brito', '88866555576', '1937-11-10', 'Rua do Horto, 35, São Paulo, SP', 'M', 55000, NULL, 1),
('Fernando', 'T', 'Wong', '33344555587', '1955-12-08', 'Rua da Lapa, 34, São Paulo, SP', 'M', 40000, '88866555576', 5),
('João', 'B', 'Silva', '12345678966', '1965-01-09', 'Rua das Flores, 751, São Paulo, SP', 'M', 30000, '33344555587', 5),
('Jennifer', 'S', 'Souza', '98765432168', '1941-06-20', 'Av. Arthur de Lima, 54, Santo André, SP', 'F', 43000, '88866555576', 4),
('Alice', 'J', 'Zelaya', '99988777767', '1968-01-19', 'Rua Souza Lima, 35, Curitiba, PR', 'F', 25000, '98765432168', 4),
('Ronaldo', 'K', 'Lima', '66688444476', '1962-09-15', 'Rua Rebouças, 65, Piracicaba, SP', 'M', 38000, '33344555587', 5),
('Joice', 'A', 'Leite', '45345345376', '1972-07-31', 'Av. Lucas Obes, 74, São Paulo, SP', 'F', 25000, '33344555587', 5),
('André', 'V', 'Pereira', '98798798733', '1969-03-29', 'Rua Timbira, 35, São Paulo, SP', 'M', 25000, '98765432168', 4);


INSERT INTO departamento (nome_departamento, numero_departamento, cpf_gerente, data_inicio_gerente)
VALUES ('Pesquisa', 5, '33344555587', '1988-05-22'),
('Administração', 4, '98765432168', '1995-01-01'),
('Matriz', 1, '88866555576', '1981-06-16');



INSERT INTO localizacoes_departamento (numero_departamento, local) 
VALUES (1, 'São Paulo'),
(4, 'Mauá'),
(5, 'Santo André'),
(5, 'Itu'),
(5, 'São Paulo');


INSERT INTO projeto (nome_projeto, numero_projeto, local_projeto, numero_departamento)
VALUES ('ProdutoX', 1, 'Santo André', 5),
('ProdutoY', 2, 'Itu', 5),
('ProdutoZ', 3, 'São Paulo', 5),
('Informatização', 10, 'Mauá', 4),
('Reorganização', 20, 'São Paulo', 1),
('Novosbenefícios', 30, 'Mauá', 4);


INSERT INTO dependente (cpf_funcionario, nome_dependente, sexo, data_nascimento, parentesco)
VALUES ('33344555587', 'Alicia', 'F', '1986-04-05', 'Filha'),
('33344555587', 'Tiago', 'M', '1983-10-25', 'Filho'),
('33344555587', 'Janaína', 'F', '1958-05-03', 'Filha'),
('98765432168', 'Antonio', 'M', '1942-02-28', 'Marido'),
('12345678966', 'Michael', 'M', '1988-01-04', 'Filho'),
('12345678966', 'Alicia', 'F', '1988-12-30', 'Filha'),
('12345678966', 'Elizabeth', 'F', '1967-05-05', 'Esposa');


INSERT INTO trabalha_em (cpf_funcionario, numero_projeto, horas) 
VALUES ('12345678966', 1, 32.5),
('12345678966', 2, 7.5),
('66688444476', 3, 40),
('45345345376', 1, 20),
('45345345376', 2, 20),
('33344555587', 2, 10),
('33344555587', 3, 10),
('33344555587', 10, 10),
('33344555587', 20, 10),
('99988777767', 30, 30),
('99988777767', 10, 10),
('98798798733', 10, 35),
('98798798733', 30, 5),
('98765432168', 30, 20),
('98765432168', 20, 15),
('88866555576', 20, NULL);



