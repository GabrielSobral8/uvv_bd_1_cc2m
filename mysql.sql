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
CREATE UNIQUE INDEX departamento_idx
 ON departamento ( nome_departamento );

CREATE UNIQUE INDEX projeto_idx
 ON projeto ( nome_projeto );

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
