SELECT* FROM locadora.filme;

--Ex 1
select titulo, descricao, preco_da_locacao, classificacao
FROM locadora.filme;

--Ex 2
select titulo, descricao, duracao_do_filme
FROM locadora.filme
WHERE ano_de_lancamento >2009;

--Ex 3
SELECT * FROM locadora.cliente;

SELECT primeiro_nome, ultimo_nome, email
FROM locadora.cliente
WHERE data_criacao < '2006-08-20';

--Ex 4
SELECT primeiro_nome
FROM locadora.cliente
WHERE ativo = 1;

--Ex 5
SELECT cidade
FROM locadora.cidade
WHERE pais_id = 15;

--Ex 6
SELECT * FROM locadora.pagamento;

SELECT valor, data_de_pagamento
FROM locadora.pagamento
WHERE valor>2.00;

--Ex 7
SELECT * FROM locadora.funcionario;

SELECT COUNT(*) AS num_funcionarios_ativos
FROM locadora.funcionario
WHERE ativo = 1;

--Ex 8
SELECT * FROM locadora.ator;

SELECT CONCAT (primeiro_nome, ' ', ultimo_nome) AS nome_completo
FROM locadora.ator;

--Ex 9
SELECT * FROM locadora.pagamento

SELECT SUM(valor) AS soma_pagamento
FROM locadora.pagamento
WHERE data_de_pagamento BETWEEN '2005-07-24' AND '2005-10-30'

--Ex 10
SELECT MAX(data_de_pagamento) AS ultimo_pagamento
FROM locadora.pagamento;

--Ex 11
SELECT AVG(valor) AS media_pagamento
FROM locadora.pagamento;

--Ex 12
SELECT MAX(valor) AS valor_total
FROM locadora.pagamento
WHERE data_de_pagamento BETWEEN '2005-05-24' AND '2005-12-31';

--Ex 13
SELECT * 
FROM locadora.cliente
ORDER BY data_criacao;

--Ex 14
SELECT * 
FROM locadora.cliente
ORDER BY primeiro_nome, ultimo_nome;

--Ex 15
SELECT * 
FROM locadora.aluguel
WHERE cliente_id = 10;

--Ex 16
SELECT c.primeiro_nome, c.ultimo_nome, p.valor, p.data_de_pagamento
FROM locadora.pagamento p
JOIN locadora.cliente c ON p.cliente_id = c.cliente_id
ORDER BY c.primeiro_nome, c.ultimo_nome;

--Ex 17
SELECT f.titulo, CONCAT(a.primeiro_nome, ' ', a.ultimo_nome) AS ator
FROM locadora.filme f
JOIN locadora.filme_ator fa ON f.filme_id = fa.filme_id
JOIN locadora.ator a ON fa.ator_id = a.ator_id
ORDER BY f.titulo;

--Ex 18
SELECT c.primeiro_nome, c.ultimo_nome, e.endereco, e.bairro, e.cep
FROM locadora.cliente c
JOIN locadora.endereco e ON c.endereco_id = e.endereco_id
WHERE c.loja_id = 2;

--Ex 19
SELECT c.primeiro_nome, c.ultimo_nome, e.endereco, e.bairro, e.cep, ci.cidade
FROM locadora.cliente c
JOIN locadora.endereco e ON c.endereco_id = e.endereco_id
JOIN locadora.cidade ci ON e.cidade_id = ci.cidade_id
WHERE ci.cidade = 'Tangail';


--Ex 20
SELECT DISTINCT f.titulo
FROM locadora.aluguel a
JOIN locadora.inventario i ON a.inventario_id = i.inventario_id
JOIN locadora.filme f ON i.filme_id = f.filme_id
JOIN locadora.cliente c ON a.cliente_id = c.cliente_id
JOIN locadora.endereco e ON c.endereco_id = e.endereco_id
JOIN locadora.cidade ci ON e.cidade_id = ci.cidade_id
WHERE ci.cidade = 'Tieli';

--Ex 21
SELECT DISTINCT c.primeiro_nome, c.ultimo_nome, f.titulo
FROM locadora.aluguel a
JOIN locadora.inventario i ON a.inventario_id = i.inventario_id
JOIN locadora.filme f ON i.filme_id = f.filme_id
JOIN locadora.cliente c ON a.cliente_id = c.cliente_id
JOIN locadora.endereco e ON c.endereco_id = e.endereco_id
JOIN locadora.cidade ci ON e.cidade_id = ci.cidade_id
WHERE ci.cidade = 'Tangail';

--Ex 22
SELECT f.titulo
FROM locadora.filme f
JOIN locadora.idioma i ON f.idioma_id = i.idioma_id
WHERE i.nome = 'English';

--Ex 23
SELECT COUNT(*) AS quantidade_filmes
FROM locadora.filme f
JOIN locadora.idioma i ON f.idioma_id = i.idioma_id
WHERE i.nome = 'English';

-- Ex 24
SELECT c.nome AS categoria, COUNT(f.filme_id) AS quantidade_filmes
FROM locadora.filme f
JOIN locadora.filme_categoria fc ON f.filme_id = fc.filme_id
JOIN locadora.categoria c ON fc.categoria_id = c.categoria_id
GROUP BY c.nome
ORDER BY quantidade_filmes DESC;

--Ex 25
SELECT ci.cidade, COUNT(c.cliente_id) AS quantidade_clientes
FROM locadora.cliente c
JOIN locadora.endereco e ON c.endereco_id = e.endereco_id
JOIN locadora.cidade ci ON e.cidade_id = ci.cidade_id
GROUP BY ci.cidade
ORDER BY quantidade_clientes DESC;

--Ex 26
SELECT DISTINCT a.primeiro_nome, a.ultimo_nome
FROM locadora.ator a
JOIN locadora.filme_ator fa ON a.ator_id = fa.ator_id
JOIN locadora.filme f ON fa.filme_id = f.filme_id
JOIN locadora.filme_categoria fc ON f.filme_id = fc.filme_id
JOIN locadora.categoria c ON fc.categoria_id = c.categoria_id
WHERE c.nome = 'Action';

--Ex 27
SELECT c.nome AS categoria, COUNT(DISTINCT fa.ator_id) AS quantidade_atores
FROM locadora.ator a
JOIN locadora.filme_ator fa ON a.ator_id = fa.ator_id
JOIN locadora.filme f ON fa.filme_id = f.filme_id
JOIN locadora.filme_categoria fc ON f.filme_id = fc.filme_id
JOIN locadora.categoria c ON fc.categoria_id = c.categoria_id
GROUP BY c.nome
ORDER BY quantidade_atores DESC;

--Ex 28
SELECT f.funcionario_id, f.primeiro_nome, f.ultimo_nome, COUNT(p.pagamento_id) AS total_pagamentos
FROM locadora.funcionario f
JOIN locadora.pagamento p ON f.funcionario_id = p.funcionario_id
GROUP BY f.funcionario_id, f.primeiro_nome, f.ultimo_nome
HAVING COUNT(p.pagamento_id) > 23;

--Ex 29
SELECT p.pagamento_id, p.valor, p.data_de_pagamento, 
       a.aluguel_id, a.data_do_aluguel, a.data_retorno
FROM locadora.pagamento p
LEFT JOIN locadora.aluguel a ON p.aluguel_id = a.aluguel_id
ORDER BY p.data_de_pagamento;

--Ex 30
SELECT f.titulo
FROM locadora.filme f
JOIN locadora.idioma i ON f.idioma_id = i.idioma_id
WHERE i.nome = 'English';

--Ex 31
SELECT e.endereco, e.bairro, ci.cidade, p.pais
FROM locadora.endereco e
JOIN locadora.cidade ci ON e.cidade_id = ci.cidade_id
JOIN locadora.pais p ON ci.pais_id = p.pais_id
ORDER BY p.pais;

--Ex 32
SELECT DISTINCT a.primeiro_nome, a.ultimo_nome
FROM locadora.ator a
JOIN locadora.filme_ator fa ON a.ator_id = fa.ator_id
JOIN locadora.filme f ON fa.filme_id = f.filme_id
JOIN locadora.idioma i ON f.idioma_id = i.idioma_id
WHERE i.nome = 'English';

--Ex 33
SELECT l.loja_id, e.endereco, ci.cidade, p.pais
FROM locadora.loja l
JOIN locadora.endereco e ON l.endereco_id = e.endereco_id
JOIN locadora.cidade ci ON e.cidade_id = ci.cidade_id
JOIN locadora.pais p ON ci.pais_id = p.pais_id
WHERE p.pais = 'Brazil'
ORDER BY e.endereco;

--Ex 34
SELECT c.nome AS categoria, COUNT(f.filme_id) AS quantidade_filmes
FROM locadora.filme f
JOIN locadora.filme_categoria fc ON f.filme_id = fc.filme_id
JOIN locadora.categoria c ON fc.categoria_id = c.categoria_id
GROUP BY c.nome
HAVING COUNT(f.filme_id) > 20
ORDER BY quantidade_filmes DESC;

