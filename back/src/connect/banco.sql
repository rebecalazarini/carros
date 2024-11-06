-- Criação do banco de dados e tabelas
DROP DATABASE IF EXISTS StockCar;
CREATE DATABASE IF NOT EXISTS StockCar;
USE StockCar;

-- Criação da tabela clientes
CREATE TABLE clientes(
    cliente_id int(10) NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome varchar(255) NOT NULL,
    cpf varchar(11) NOT NULL UNIQUE,
    email varchar(255) NOT NULL UNIQUE,
    endereco varchar(255) NOT NULL,
    data_nascimento date NOT NULL,
    data_cadastro date NOT NULL   
);

-- Criação da tabela telefone
CREATE TABLE telefone (
    telefone_id int(10) NOT NULL PRIMARY KEY AUTO_INCREMENT,
    cliente_id int(10) NOT NULL,
    numero varchar(20) NOT NULL,
    tipo('residencial', 'comercial', 'celular') NOT NULL,
    FOREIGN KEY (cliente_id) REFERENCES clientes(cliente_id)
);

-- Criação da tabela carros
CREATE TABLE carros (
    carros_id int(10) NOT NULL PRIMARY KEY AUTO_INCREMENT,
    marca_veiculo VARCHAR(252) NOT NULL,
    modelo_veiculo VARCHAR(252) NOT NULL,
    ano_veiculo date NOT NULL,
    fabricacao_veiuclo date NOT NULL,
    cliente_id int(10) NOT NULL,
    FOREIGN KEY (cliente_id) REFERENCES clientes(cliente_id)
);

-- Inserção de dados na tabela clientes
INSERT INTO clientes (nome, cpf, email, endereco, data_nascimento, data_cadastro)
VALUES
('João Silva', '12345678901', 'joao.silva@email.com', 'Rua A, 123', '1990-05-15', '2024-01-10'),
('Maria Oliveira', '23456789012', 'maria.oliveira@email.com', 'Rua B, 456', '1985-07-20', '2023-12-18'),
('Carlos Pereira', '34567890123', 'carlos.pereira@email.com', 'Rua C, 789', '1992-03-25', '2024-02-02'),
('Ana Santos', '45678901234', 'ana.santos@email.com', 'Rua D, 101', '1988-11-30', '2023-11-22'),
('Luís Costa', '56789012345', 'luis.costa@email.com', 'Rua E, 202', '1995-06-10', '2024-03-05');

-- Inserção de dados na tabela telefone
INSERT INTO telefone (cliente_id, numero, tipo)
VALUES
(1, '11987654321', 'celular'),
(1, '1132345678', 'residencial'),
(2, '21987654321', 'celular'),
(3, '31987654321', 'comercial'),
(4, '41987654321', 'residencial');

-- Inserção de dados na tabela carros
INSERT INTO carros (marca_veiculo, modelo_veiculo, ano_veiculo, fabricacao_veiuclo, cliente_id)
VALUES
('Volkswagen', 'Gol', '2020-01-15', '2020-02-20', 1),
('Toyota', 'Corolla', '2022-05-10', '2022-06-15', 2),
('Honda', 'Civic', '2019-07-25', '2019-08-10', 3),
('Ford', 'Fiesta', '2021-03-30', '2021-04-05', 4),
('Chevrolet', 'Onix', '2023-09-12', '2023-09-20', 5);
