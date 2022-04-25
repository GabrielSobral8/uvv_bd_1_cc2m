
    /*    */
    
    
    CREATE DATABASE uvv
    WITH 
    OWNER = gabrielsobral
    ENCODING = 'UTF8'
    template: template0
    encoding: UTF8
    lc_collate: pt_BR.UTF-8
    lc_ctype: pt_BR.UTF-8
    allow_connections: true
    
    /*    */
    
CREATE TABLE funcionario (
                cpf CHAR(11) NOT NULL,
                primeiro_nome VARCHAR(15) NOT NULL,
                nome_meio VARCHAR(1),
                ultimo_nome VARCHAR(15) NOT NULL,
                data_nascimento DATE,
                endereco VARCHAR(30),
                sexo CHAR(1),
                salario NUMERIC(10,2),
                cpf_supervisor CHAR(11) NOT NULL,
                numero_departamento INTEGER NOT NULL,
                CONSTRAINT cpf_funcionario_pk PRIMARY KEY (cpf)
);


CREATE TABLE departamento (
                numero_departamento INTEGER NOT NULL,
                nome_departamento VARCHAR(15) NOT NULL,
                cpf_gerente CHAR(11) NOT NULL,
                data_inicio_gerente DATE,
                CONSTRAINT departamento_pk PRIMARY KEY (numero_departamento)
);


CREATE TABLE projeto (
                numero_projeto INTEGER NOT NULL,
                nome_projeto VARCHAR(15) NOT NULL,
                local_projeto VARCHAR(15),
                numero_departamento INTEGER NOT NULL,
                CONSTRAINT projeto_pk PRIMARY KEY (numero_projeto)
);


CREATE TABLE trabalha_em (
                cpf_funcionario CHAR(11) NOT NULL,
                numero_projeto INTEGER NOT NULL,
                horas NUMERIC(3,1) NOT NULL,
                CONSTRAINT trabalha_em_pk PRIMARY KEY (cpf_funcionario, numero_projeto)
);


CREATE TABLE localizacoes_departamento (
                numero_departamento INTEGER NOT NULL,
                CONSTRAINT localizacoes_departamento_pk PRIMARY KEY (numero_departamento)
);


CREATE TABLE dependente (
                cpf_funcionario CHAR(11) NOT NULL,
                nome_dependente VARCHAR(15) NOT NULL,
                sexo VARCHAR(1),
                data_nascimento DATE,
                parentesco VARCHAR(15),
                CONSTRAINT nome_dependente_pk PRIMARY KEY (cpf_funcionario, nome_dependente)
);

/*    */


ALTER TABLE funcionario ADD CONSTRAINT funcionario_funcionario_fk
FOREIGN KEY (cpf_supervisor)
REFERENCES funcionario (cpf)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE dependente ADD CONSTRAINT funcionario_dependente_fk
FOREIGN KEY (cpf_funcionario)
REFERENCES funcionario (cpf)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE departamento ADD CONSTRAINT funcionario_departamento_fk
FOREIGN KEY (cpf_gerente)
REFERENCES funcionario (cpf)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE trabalha_em ADD CONSTRAINT funcionario_trabalha_em_fk
FOREIGN KEY (cpf_funcionario)
REFERENCES funcionario (cpf)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE localizacoes_departamento ADD CONSTRAINT departamento_localizacoes_departamento_fk
FOREIGN KEY (numero_departamento)
REFERENCES departamento (numero_departamento)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE projeto ADD CONSTRAINT departamento_projeto_fk
FOREIGN KEY (numero_departamento)
REFERENCES departamento (numero_departamento)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE trabalha_em ADD CONSTRAINT projeto_trabalha_em_fk
FOREIGN KEY (numero_projeto)
REFERENCES projeto (numero_projeto)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;


/*    */



INSERT INTO funcionario (primeiro_nome, nome_meio, ultimo_nome, cpf, data_nascimento, endereco, sexo, salario, cpf_supervisor, numero_departamento)
VALUES ('Joao', 'B', 'Silva', 12345678966, '09-01-19651','Rua das Flores,751,SaoPaulo,SP', 'M', 30.000, 33344555587, 5);

INSERT INTO funcionario (primeiro_nome, nome_meio, ultimo_nome, cpf, data_nascimento, endereco, sexo, salario, cpf_supervisor, numero_departamento)
VALUES ('Fernando', 'T', 'Wong', 33344555587, '08-12-1955','Rua da Lapa, 34,SaoPaulo,SP', 'M', 40.000, 88866555576, 5);

INSERT INTO funcionario (primeiro_nome, nome_meio, ultimo_nome, cpf, data_nascimento, endereco, sexo, salario, cpf_supervisor, numero_departamento)
VALUES ('Alice', 'J', 'Zelaya', 33344555587, '08-12-1955','Rua Souza Lima, 35, Curitiba, PR', 'F', 25.000, 98765432168, 4);

INSERT INTO funcionario (primeiro_nome, nome_meio, ultimo_nome, cpf, data_nascimento, endereco, sexo, salario, cpf_supervisor, numero_departamento)
VALUES ('Jenifer', 'S', 'Souza', 98765432168, '20-06-1941','Av Arthur de Lima, 54, Santo Andre ,SP', 'F', 43.000, 88866555576, 4);

INSERT INTO funcionario (primeiro_nome, nome_meio, ultimo_nome, cpf, data_nascimento, endereco, sexo, salario, cpf_supervisor, numero_departamento)
VALUES ('Ronaldo', 'K', 'Lima', 66688444476, '15-09-1962','Rua Reboucas, 65, Piracicaba ,SP', 'M', 38.000, 33344555587, 5);

INSERT INTO funcionario (primeiro_nome, nome_meio, ultimo_nome, cpf, data_nascimento, endereco, sexo, salario, cpf_supervisor, numero_departamento)
VALUES ('Joice', 'A', 'Leite', 45345345376, '31-07-1972','Av Lucas Obes, 74, SaoPaulo ,SP', 'F', 25.000, 33344555587, 5);

INSERT INTO funcionario (primeiro_nome, nome_meio, ultimo_nome, cpf, data_nascimento, endereco, sexo, salario, cpf_supervisor, numero_departamento)
VALUES ('Andre', 'V', 'Pereira', 98798798733, '29-03-1969','Rua Timbira, 35, SaoPaulo ,SP', 'M', 25.000, 98765432168, 4);

INSERT INTO funcionario (primeiro_nome, nome_meio, ultimo_nome, cpf, data_nascimento, endereco, sexo, salario, cpf_supervisor, numero_departamento)
VALUES ('Jorge', 'E', 'Brito', 88866555576, '10-11-1937','Rua do Horto, 35, SaoPaulo ,SP', 'M', 55.000, NULL, 1);



/*    */


INSERT INTO departamento (nome_departamento, numero_departamento, cpf_gerente, data_inicio_gerente)
VALUES ('Pesquisa', 5, 33344555587, '22-05-1998');

INSERT INTO departamento (nome_departamento, numero_departamento, cpf_gerente, data_inicio_gerente)
VALUES ('Admnistracao', 4, 98765432168, '01-01-1995');

INSERT INTO departamento (nome_departamento, numero_departamento, cpf_gerente, data_inicio_gerente)
VALUES ('Matriz', 1, 88866555576, '19-06-1981');



/*    */


INSERT INTO localizacoes_departamento (numero_departamento, local)
VALUES (1, 'Sao Paulo');

INSERT INTO localizacoes_departamento (numero_departamento, local)
VALUES (4, 'Maua');

INSERT INTO localizacoes_departamento (numero_departamento, local)
VALUES (5, 'Santo Andre');

INSERT INTO localizacoes_departamento (numero_departamento, local)
VALUES (5, 'Itu');

INSERT INTO localizacoes_departamento (numero_departamento, local)
VALUES (5, 'Sao Paulo');


/*    */


INSERT INTO projeto (nome_projeto, numero_projeto, local_projeto, numero_departamento)
VALUES ('ProjetoX', 1,'Santo Andre', 5);

INSERT INTO projeto (nome_projeto, numero_projeto, local_projeto, numero_departamento)
VALUES ('ProjetoY', 2,'Itu', 5);

INSERT INTO projeto (nome_projeto, numero_projeto, local_projeto, numero_departamento)
VALUES ('ProjetoZ', 3,'Sao Paulo', 5);

INSERT INTO projeto (nome_projeto, numero_projeto, local_projeto, numero_departamento)
VALUES ('Informatizacao', 10,'Maua', 4);

INSERT INTO projeto (nome_projeto, numero_projeto, local_projeto, numero_departamento)
VALUES ('Reorganizacao', 20,'Sao Paulo', 1);

INSERT INTO projeto (nome_projeto, numero_projeto, local_projeto, numero_departamento)
VALUES ('Novosbeneficios', 30,'Maua', 4);



/*   */
 


INSERT INTO dependente (cpf_funcionario, nome_dependente, sexo, data_nascimento, parentesco)
VALUES (33344555587, 'Alicia', 'F', 05-04-1986, 'Filha');

INSERT INTO dependente (cpf_funcionario, nome_dependente, sexo, data_nascimento, parentesco)
VALUES (33344555587, 'Thiago', 'M', 25-10-1983, 'Filho');

INSERT INTO dependente (cpf_funcionario, nome_dependente, sexo, data_nascimento, parentesco)
VALUES (33344555587, 'Janaina', 'F', 03-05-1958, 'Esposa');

INSERT INTO dependente (cpf_funcionario, nome_dependente, sexo, data_nascimento, parentesco)
VALUES (98765432168, 'Antonio', 'M', 28-02-1942, 'Marido');

INSERT INTO dependente (cpf_funcionario, nome_dependente, sexo, data_nascimento, parentesco)
VALUES (12345678968, 'Michael', 'M', 04-01-1988, 'Filho');

INSERT INTO dependente (cpf_funcionario, nome_dependente, sexo, data_nascimento, parentesco)
VALUES (12345678968, 'Alicia', 'F', 30-12-1988, 'Filha');

INSERT INTO dependente (cpf_funcionario, nome_dependente, sexo, data_nascimento, parentesco)
VALUES (12345678968, 'Elizabeth', 'F', 05-05-1967, 'Esposa');


/*   */


INSERT INTO trabalha_em (cpf_funcionario, numero_projeto, horas)
VALUES (12345678966, 1, 32.5);

INSERT INTO trabalha_em (cpf_funcionario, numero_projeto, horas)
VALUES (12345678966, 2, 7.5);

INSERT INTO trabalha_em (cpf_funcionario, numero_projeto, horas)
VALUES (66688444476, 3, 40);

INSERT INTO trabalha_em (cpf_funcionario, numero_projeto, horas)
VALUES (45345345376, 1, 20);

INSERT INTO trabalha_em (cpf_funcionario, numero_projeto, horas)
VALUES (45345345376, 2, 20);

INSERT INTO trabalha_em (cpf_funcionario, numero_projeto, horas)
VALUES (45345345376, 1, 20);

INSERT INTO trabalha_em (cpf_funcionario, numero_projeto, horas)
VALUES (33344555587, 2, 10);

INSERT INTO trabalha_em (cpf_funcionario, numero_projeto, horas)
VALUES (33344555587, 3, 10);

INSERT INTO trabalha_em (cpf_funcionario, numero_projeto, horas)
VALUES (33344555587, 10, 10);

INSERT INTO trabalha_em (cpf_funcionario, numero_projeto, horas)
VALUES (33344555587, 20, 10);

INSERT INTO trabalha_em (cpf_funcionario, numero_projeto, horas)
VALUES (99988777767, 30, 30);

INSERT INTO trabalha_em (cpf_funcionario, numero_projeto, horas)
VALUES (99988777767, 10, 10);

INSERT INTO trabalha_em (cpf_funcionario, numero_projeto, horas)
VALUES (98798798733, 10, 35);

INSERT INTO trabalha_em (cpf_funcionario, numero_projeto, horas)
VALUES (98798798733, 30, 5);

INSERT INTO trabalha_em (cpf_funcionario, numero_projeto, horas)
VALUES (98765432168, 30, 20);

INSERT INTO trabalha_em (cpf_funcionario, numero_projeto, horas)
VALUES (98765432168, 20, 15);

INSERT INTO trabalha_em (cpf_funcionario, numero_projeto, horas)
VALUES (88866555576, 20, NULL);














