/*1)*/  SELECT d.numero_departamento, d.nome_departamento, AVG(salario) as media_salario FROM elmasri.departamento as d
JOIN elmasri.funcionario as f ON d.numero_departamento = f.numero_departamento GROUP BY d.numero_departamento;  /* d = departamento && f = funcionario*/

/*2)*/SELECT sexo, AVG(salario) as media_salario FROM elmasri.funcionario GROUP BY sexo;

/*3)*/SELECT d.nome_departamento, CONCAT(f.primeiro_nome, ' ', f.nome_meio, '. ', f.ultimo_nome) AS nome_completo,
DATE_PART('year', AGE(f.data_nascimento)) AS idade_em_anos, f.salario
FROM elmasri.departamento AS d JOIN elmasri.funcionario AS f ON d.numero_departamento = f.numero_departamento ORDER BY nome_departamento ASC;

/*4)*/SELECT CONCAT(primeiro_nome, ' ', nome_meio, '. ', ultimo_nome) AS nome_completo,
 DATE_PART('year', AGE(data_nascimento)) AS idade_em_anos,
 salario,
 CASE
  WHEN salario < 35000 THEN salario * 1.2
  ELSE salario * 1.15
  END AS salario_final
FROM elmasri.funcionario;

/*5)*/SELECT d.nome_departamento, CONCAT(f.primeiro_nome, ' ', f.nome_meio, '. ', f.ultimo_nome) AS nome_funcionario, f.salario,
CASE
 WHEN f.cpf = d.cpf_gerente THEN 'Gerente'
 ELSE 'Funcionario'
 END AS posicao
FROM elmasri.departamento AS d JOIN elmasri.funcionario AS f ON d.numero_departamento = f.numero_departamento
ORDER BY d.nome_departamento ASC, f.salario ASC;

/*6)*/SELECT CONCAT(f.primeiro_nome, ' ', f.nome_meio, '. ', f.ultimo_nome) AS nome_funcionario,
 depart.nome_departamento,
 depend.nome_dependente,
 DATE_PART('year', AGE(depend.data_nascimento)) AS idade_dependente,
 CASE (depend.sexo)
  WHEN 'M' THEN 'Masculino'
  ELSE 'Feminino'
  END AS sexo_dependente
FROM elmasri.funcionario AS f
JOIN elmasri.dependente AS depend ON f.cpf = depend.cpf_funcionario
JOIN elmasri.departamento AS depart ON depart.numero_departamento = f.numero_departamento;

/*7)*/SELECT CONCAT(f.primeiro_nome, ' ', f.nome_meio, '. ', f.ultimo_nome) AS nome_completo,
 f.salario,
 d.nome_departamento,
 d.numero_departamento
FROM elmasri.funcionario AS f
JOIN elmasri.departamento AS d
ON f.numero_departamento = d.numero_departamento
WHERE cpf NOT IN (SELECT cpf_funcionario FROM elmasri.dependente);

/*8)*/SELECT d.nome_departamento,
 p.nome_projeto,
 CONCAT(f.primeiro_nome, ' ', f.nome_meio, '. ', f.ultimo_nome) AS nome_funcionario,
 t.horas
FROM elmasri.funcionario AS f
JOIN elmasri.trabalha_em AS t
ON t.cpf_funcionario = f.cpf
JOIN elmasri.projeto AS p
ON t.numero_projeto = p.numero_projeto
JOIN elmasri.departamento AS d
ON d.numero_departamento = p.numero_departamento
ORDER BY d.nome_departamento ASC;

/*9)*/SELECT d.nome_departamento,
 p.nome_projeto,
 SUM(t.horas) AS horas_totais
FROM elmasri.departamento AS d
JOIN elmasri.projeto AS p
ON d.numero_departamento = p.numero_departamento
JOIN elmasri.trabalha_em AS t
ON t.numero_projeto = p.numero_projeto
GROUP BY d.nome_departamento, p.nome_projeto
ORDER BY d.nome_departamento ASC;

/*10)*/SELECT d.numero_departamento,
 d.nome_departamento,
 AVG(f.salario) AS media_salarial_depart
FROM elmasri.funcionario AS f
JOIN elmasri.departamento AS d
ON f.numero_departamento = d.numero_departamento
GROUP BY d.numero_departamento;

/*11)*/SELECT CONCAT(f.primeiro_nome, ' ', f.nome_meio, '. ', f.ultimo_nome) AS nome_completo,
 SUM(t.horas) AS horas_totais,
 SUM(t.horas) * 50 AS valor_total
FROM elmasri.funcionario AS f
JOIN elmasri.trabalha_em AS t
ON t.cpf_funcionario = f.cpf
GROUP BY f.cpf;

/*12)*/SELECT CONCAT(f.primeiro_nome, ' ', f.nome_meio, '. ', f.ultimo_nome) AS nome_funcionario,
 d.nome_departamento,
 p.nome_projeto
FROM elmasri.funcionario AS f
JOIN elmasri.trabalha_em AS t
ON t.cpf_funcionario = f.cpf
JOIN elmasri.projeto AS p
ON p.numero_projeto = t.numero_projeto
JOIN elmasri.departamento AS d
ON p.numero_departamento = d.numero_departamento;

/*13)*/SELECT CONCAT(primeiro_nome, ' ', nome_meio, '. ', ultimo_nome) AS nome_completo,
 sexo,
 DATE_PART('year', AGE(data_nascimento)) AS idade
FROM elmasri.funcionario UNION
SELECT nome_dependente,
 sexo,
 DATE_PART('year', AGE(data_nascimento)) AS idade
FROM elmasri.dependente
ORDER BY idade DESC;

/*14)*/SELECT d.nome_departamento,
COUNT(f.cpf) AS numero_funcionarios
FROM elmasri.funcionario AS f
JOIN elmasri.departamento AS d
ON d.numero_departamento = f.numero_departamento
GROUP BY d.nome_departamento;

/*15)*/SELECT CONCAT(f.primeiro_nome, ' ', f.nome_meio, '. ', f.ultimo_nome) AS nome_completo,
 d.nome_departamento,
 p.nome_projeto
FROM elmasri.funcionario AS f
JOIN elmasri.departamento AS d
ON f.numero_departamento = d.numero_departamento
JOIN elmasri.trabalha_em AS t
ON t.cpf_funcionario = f.cpf
JOIN elmasri.projeto AS p
ON t.numero_projeto = p.numero_projeto;

