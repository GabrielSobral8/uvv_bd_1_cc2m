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
