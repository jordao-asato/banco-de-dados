CREATE TABLE Hotel (
  id_hotel SERIAL PRIMARY KEY,
  nome VARCHAR(100) NOT NULL,
  endereco VARCHAR(255) NOT NULL,
  telefone VARCHAR(20) NOT NULL,
  categoria VARCHAR(20) NOT NULL
);

CREATE TABLE Quarto (
  id_quarto SERIAL PRIMARY KEY,
  id_hotel INT NOT NULL,
  numero INT NOT NULL,
  tipo VARCHAR(50) NOT NULL,
  preco_diaria DECIMAL(10,2) NOT NULL,
  status VARCHAR(20) CHECK (status IN ('Disponível', 'Ocupado', 'Manutenção')) NOT NULL,
  FOREIGN KEY (id_hotel) REFERENCES Hotel(id_hotel) ON DELETE CASCADE
);

CREATE TABLE Cliente (
  id_cliente SERIAL PRIMARY KEY,
  nome VARCHAR(100) NOT NULL,
  cpf VARCHAR(14) UNIQUE NOT NULL,
  telefone VARCHAR(20) NOT NULL,
  email VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE Reserva (
  id_reserva SERIAL PRIMARY KEY,
  id_cliente INT NOT NULL,
  id_quarto INT NOT NULL,
  data_checkin DATE NOT NULL,
  data_checkout DATE NOT NULL,
  status VARCHAR(20) CHECK (status IN ('Ativa', 'Cancelada', 'Finalizada')) NOT NULL,
  FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente) ON DELETE CASCADE,
  FOREIGN KEY (id_quarto) REFERENCES Quarto(id_quarto) ON DELETE CASCADE
);

CREATE TABLE Pagamento (
  id_pagamento SERIAL PRIMARY KEY,
  id_reserva INT NOT NULL,
  valor_total DECIMAL(10,2) NOT NULL,
  metodo_pagamento VARCHAR(50) CHECK (metodo_pagamento IN ('Cartão', 'PIX', 'Dinheiro')) NOT NULL,
  status_pagamento VARCHAR(20) CHECK (status_pagamento IN ('Pendente', 'Pago', 'Reembolsado')) NOT NULL,
  FOREIGN KEY (id_reserva) REFERENCES Reserva(id_reserva) ON DELETE CASCADE
);


-- Inserindo Hotéis
INSERT INTO Hotel (nome, endereco, telefone, categoria) VALUES
('Hotel Central', 'Rua A, 123 - Centro', '1122334455', '4 Estrelas'),
('Resort Paraíso', 'Av. B, 456 - Praia', '2233445566', '5 Estrelas');

-- Inserindo Quartos
INSERT INTO Quarto (id_hotel, numero, tipo, preco_diaria, status) VALUES
(1, 101, 'Standard', 150.00, 'Disponível'),
(1, 102, 'Luxo', 300.00, 'Ocupado'),
(2, 201, 'Suite', 500.00, 'Disponível');

-- Inserindo Clientes
INSERT INTO Cliente (nome, cpf, telefone, email) VALUES
('Carlos Silva', '123.456.789-00', '99998888', 'carlos@email.com'),
('Ana Souza', '987.654.321-00', '99997777', 'ana@email.com');

-- Inserindo Reservas
INSERT INTO Reserva (id_cliente, id_quarto, data_checkin, data_checkout, status) VALUES
(1, 1, '2025-03-01', '2025-03-05', 'Ativa'),
(2, 3, '2025-03-10', '2025-03-15', 'Ativa');

-- Inserindo Pagamentos
INSERT INTO Pagamento (id_reserva, valor_total, metodo_pagamento, status_pagamento) VALUES
(1, 600.00, 'Cartão', 'Pago'),
(2, 2500.00, 'PIX', 'Pendente');

SELECT * FROM hotel;
SELECT * FROM cliente;
SELECT * FROM quarto;
SELECT * FROM reserva;
SELECT * FROM pagamento;

TRUNCATE TABLE reserva RESTART IDENTITY CASCADE;
TRUNCATE TABLE pagamento RESTART IDENTITY CASCADE;
TRUNCATE TABLE cliente RESTART IDENTITY CASCADE;
TRUNCATE TABLE quarto RESTART IDENTITY CASCADE;
TRUNCATE TABLE hotel RESTART IDENTITY CASCADE;

SELECT 
    r.id_reserva, c.nome AS cliente, h.nome AS hotel, q.numero AS quarto,
    r.data_checkin, r.data_checkout, r.status
FROM reserva r
JOIN cliente c ON r.id_cliente = c.id_cliente
JOIN quarto q ON r.id_quarto = q.id_quarto
JOIN hotel h ON q.id_hotel = h.id_hotel
ORDER BY r.data_checkin;

SELECT id_quarto, numero, tipo, preco_diaria 
FROM quarto
WHERE id_hotel = %s AND status = 'Disponível'
ORDER BY preco_diaria;

SELECT h.nome AS hotel, SUM(p.valor_total) AS total_faturado
FROM pagamento p
JOIN reserva r ON p.id_reserva = r.id_reserva
JOIN quarto q ON r.id_quarto = q.id_quarto
JOIN hotel h ON q.id_hotel = h.id_hotel
WHERE p.status_pagamento = 'Pago'
GROUP BY h.nome
ORDER BY total_faturado DESC;

SELECT c.nome, COUNT(r.id_reserva) AS total_reservas
FROM cliente c
JOIN reserva r ON c.id_cliente = r.id_cliente
GROUP BY c.nome
HAVING COUNT(r.id_reserva) >= %s
ORDER BY total_reservas DESC;

SELECT 
    h.nome AS hotel, 
    COUNT(r.id_reserva) AS total_reservas, 
    ROUND((COUNT(r.id_reserva) * 100.0 / COUNT(q.id_quarto)), 2) AS taxa_ocupacao
FROM hotel h
JOIN quarto q ON h.id_hotel = q.id_hotel
LEFT JOIN reserva r ON q.id_quarto = r.id_quarto
WHERE h.id_hotel = %s
GROUP BY h.nome;

-- As consultas acima constam no documento oficial do projeto


