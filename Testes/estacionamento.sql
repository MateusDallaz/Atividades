CREATE TABLE cliente (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    documento VARCHAR(20) NOT NULL UNIQUE, -- CPF ou CNPJ
    inscricao_estadual VARCHAR(20),
    telefone1 VARCHAR(20),
    telefone2 VARCHAR(20),
    email VARCHAR(100)
);

CREATE TABLE cliente_endereco (
    id_endereco INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT NOT NULL,
    rua VARCHAR(100) NOT NULL,
    bairro VARCHAR(50) NOT NULL,
    numero VARCHAR(10),
    complemento VARCHAR(50),
    cidade VARCHAR(50) NOT NULL,
    uf CHAR(2) NOT NULL,
    FOREIGN KEY (cliente_id) REFERENCES cliente(id_cliente) 
);

CREATE TABLE usuario (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    endereco VARCHAR(200),
    login VARCHAR(50) NOT NULL UNIQUE,
    telefone VARCHAR(20),
    senha VARCHAR(255) NOT NULL 
);


CREATE TABLE veiculo (
    id_veiculo INT AUTO_INCREMENT PRIMARY KEY,
    placa VARCHAR(10) NOT NULL UNIQUE,
    modelo VARCHAR(50) NOT NULL,
    cor VARCHAR(30),
    cliente_id INT NOT NULL,
    numero_vaga VARCHAR(10), -- número da vaga de estacionamento
    tipo_contrato VARCHAR(50), -- ex: "Mensalista", "Avulso", "Trimestral"
    FOREIGN KEY (cliente_id) REFERENCES cliente(id_cliente)
);