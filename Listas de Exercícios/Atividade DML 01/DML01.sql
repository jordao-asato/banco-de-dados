-- Criação da tabela Cliente
CREATE TABLE Cliente (
    CD SERIAL PRIMARY KEY,
    NOME VARCHAR(100) NOT NULL,
    ENDERECO VARCHAR(150),
    BAIRRO VARCHAR(100),
    CIDADE VARCHAR(100),
    SALARIO DECIMAL(10,2),
    DATA_NASCIMENTO DATE,
    STATUS VARCHAR(20),
    QTDE_BONUS INT,
    SEXO CHAR(1) CHECK (SEXO IN ('M', 'F'))
);

-- Inserção de 15 clientes
INSERT INTO Cliente (NOME, ENDERECO, BAIRRO, CIDADE, SALARIO, DATA_NASCIMENTO, STATUS, QTDE_BONUS, SEXO)
VALUES
    ('João Silva', 'Rua A, 123', 'Centro', 'São Paulo', 3500.00, '1990-05-20', 'Ativo', 10, 'M'),
    ('Maria Oliveira', 'Av. B, 456', 'Jardins', 'Rio de Janeiro', 4200.00, '1985-11-10', 'Ativo', 15, 'F'),
    ('Carlos Souza', 'Rua C, 789', 'Copacabana', 'Rio de Janeiro', 3100.00, '2000-03-25', 'Inativo', 5, 'M'),
    ('Fernanda Lima', 'Rua D, 321', 'Centro', 'São Paulo', 5000.00, '1992-08-14', 'Ativo', 20, 'F'),
    ('Roberto Almeida', 'Av. E, 654', 'Moema', 'São Paulo', 2800.00, '1988-07-07', 'Ativo', 8, 'M'),
    ('Ana Clara', 'Rua F, 987', 'Tijuca', 'Rio de Janeiro', 3700.00, '1995-12-05', 'Inativo', 12, 'F'),
    ('Paulo Henrique', 'Av. G, 246', 'Vila Madalena', 'São Paulo', 4500.00, '1991-04-18', 'Ativo', 18, 'M'),
    ('Juliana Martins', 'Rua H, 135', 'Barra', 'Salvador', 3300.00, '1996-09-30', 'Ativo', 7, 'F'),
    ('Ricardo Santos', 'Av. I, 579', 'Boa Viagem', 'Recife', 2900.00, '1983-06-22', 'Inativo', 4, 'M'),
    ('Tatiane Lopes', 'Rua J, 852', 'Centro', 'Belo Horizonte', 5200.00, '1994-11-15', 'Ativo', 22, 'F'),
    ('Eduardo Nascimento', 'Av. K, 951', 'Flamengo', 'Rio de Janeiro', 3400.00, '1999-01-10', 'Ativo', 9, 'M'),
    ('Carla Mendes', 'Rua L, 753', 'Pampulha', 'Belo Horizonte', 3100.00, '1997-02-28', 'Ativo', 6, 'F'),
    ('André Costa', 'Av. M, 369', 'Pinheiros', 'São Paulo', 4000.00, '1993-07-20', 'Inativo', 14, 'M'),
    ('Sabrina Rocha', 'Rua N, 147', 'Boa Vista', 'Porto Alegre', 3900.00, '1986-10-12', 'Ativo', 11, 'F'),
    ('Gustavo Ferreira', 'Av. O, 258', 'Centro', 'Curitiba', 4600.00, '1998-05-06', 'Ativo', 17, 'M');


SELECT CD, NOME, ENDERECO, BAIRRO, CIDADE FROM Cliente;
SELECT * FROM Cliente ORDER BY NOME ASC;
SELECT * FROM Cliente ORDER BY NOME DESC;
SELECT * FROM Cliente WHERE EXTRACT(YEAR FROM DATA_NASCIMENTO) = 1980;
SELECT * FROM Cliente WHERE EXTRACT(MONTH FROM DATA_NASCIMENTO) = 2;
SELECT * FROM Cliente WHERE SALARIO < 1000;
SELECT * FROM Cliente WHERE SALARIO BETWEEN 500 AND 1000;
SELECT * FROM Cliente WHERE STATUS = 'Inativo';
SELECT * FROM Cliente WHERE STATUS = 'Ativo';
SELECT CD, NOME, QTDE_BONUS FROM Cliente ORDER BY QTDE_BONUS DESC;
SELECT * FROM Cliente WHERE NOME LIKE 'M%';

SELECT ENDERECO, COUNT(*) AS total_clientes 
FROM Cliente 
GROUP BY ENDERECO;

SELECT BAIRRO, COUNT(*) AS total_clientes 
FROM Cliente 
GROUP BY BAIRRO;

SELECT CIDADE, COUNT(*) AS total_clientes 
FROM Cliente 
GROUP BY CIDADE;

SELECT COUNT(*) AS total_clientes 
FROM Cliente 
WHERE EXTRACT(YEAR FROM DATA_NASCIMENTO) = 1990;

SELECT COUNT(*) AS total_clientes 
FROM Cliente 
WHERE DATA_NASCIMENTO BETWEEN '1980-01-01' AND '1990-12-31';

SELECT AVG(SALARIO) AS media_salarios
FROM Cliente
WHERE STATUS = 'Ativo';

SELECT BAIRRO, AVG(QTDE_BONUS) AS media_bonus
FROM Cliente
GROUP BY BAIRRO;

SELECT SUM(SALARIO) AS total_salarios
FROM Cliente
WHERE STATUS = 'Ativo';

SELECT SUM(QTDE_BONUS) AS total_bonus
FROM Cliente
WHERE SALARIO > 3000;

SELECT CD, NOME, 
       CASE 
           WHEN QTDE_BONUS > 0 THEN SALARIO / QTDE_BONUS 
           ELSE NULL 
       END AS salario_por_bonus
FROM Cliente;

SELECT NOME, CONCAT(ENDERECO, ', ', BAIRRO, ', ', CIDADE) AS endereco_completo
FROM Cliente;

SELECT CIDADE, COUNT(*) AS total_clientes
FROM Cliente
GROUP BY CIDADE;

SELECT BAIRRO, COUNT(*) AS total_clientes
FROM Cliente
GROUP BY BAIRRO;

SELECT ENDERECO, COUNT(*) AS total_clientes
FROM Cliente
GROUP BY ENDERECO;

SELECT STATUS, COUNT(*) AS total_clientes
FROM Cliente
GROUP BY STATUS;








