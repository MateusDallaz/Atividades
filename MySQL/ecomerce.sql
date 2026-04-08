-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 08/04/2026 às 02:16
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `ecomerce`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `cliente`
--

CREATE TABLE `cliente` (
  `cpf` bigint(11) NOT NULL,
  `nome` varchar(45) NOT NULL,
  `telefone` bigint(15) NOT NULL,
  `endereco` varchar(300) NOT NULL,
  `email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `cliente`
--

INSERT INTO `cliente` (`cpf`, `nome`, `telefone`, `endereco`, `email`) VALUES
(1234567890, 'Camila Alves', 91987654321, 'Av. Nazaré, 852 - Belém/PA', 'camila.alves@email.com'),
(12345678901, 'João Silva', 11987654321, 'Rua das Flores, 123 - São Paulo/SP', 'joao.silva@email.com'),
(23456789012, 'Maria Oliveira', 21987654321, 'Av. Atlântica, 456 - Rio de Janeiro/RJ', 'maria.oliveira@email.com'),
(34567890123, 'Carlos Souza', 31987654321, 'Rua Afonso Pena, 789 - Belo Horizonte/MG', 'carlos.souza@email.com'),
(45678901234, 'Ana Costa', 41987654321, 'Rua XV de Novembro, 321 - Curitiba/PR', 'ana.costa@email.com'),
(56789012345, 'Pedro Santos', 51987654321, 'Av. Ipiranga, 654 - Porto Alegre/RS', 'pedro.santos@email.com'),
(67890123456, 'Juliana Lima', 61987654321, 'SQN 210 Bloco B - Brasília/DF', 'juliana.lima@email.com'),
(78901234567, 'Rafael Pereira', 71987654321, 'Rua Chile, 987 - Salvador/BA', 'rafael.pereira@email.com'),
(89012345678, 'Fernanda Rocha', 81987654321, 'Av. Boa Viagem, 159 - Recife/PE', 'fernanda.rocha@email.com'),
(90123456789, 'Lucas Martins', 85987654321, 'Rua Barão do Rio Branco, 753 - Fortaleza/CE', 'lucas.martins@email.com');

-- --------------------------------------------------------

--
-- Estrutura para tabela `estoque`
--

CREATE TABLE `estoque` (
  `id_produto` int(11) NOT NULL,
  `tipo_produto` varchar(45) NOT NULL,
  `quantidade` int(11) NOT NULL,
  `data_entrada` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `estoque`
--

INSERT INTO `estoque` (`id_produto`, `tipo_produto`, `quantidade`, `data_entrada`) VALUES
(1, 'Camiseta', 50, '2026-04-01'),
(2, 'Calça Jeans', 30, '2026-04-02'),
(3, 'Jaqueta', 20, '2026-04-03'),
(4, 'Vestido', 25, '2026-04-01'),
(5, 'Bermuda', 40, '2026-04-04'),
(6, 'Blusa', 35, '2026-04-02'),
(7, 'Moletom', 15, '2026-04-05'),
(8, 'Saia', 18, '2026-04-03'),
(9, 'Regata', 45, '2026-04-06'),
(10, 'Casaco', 12, '2026-04-07');

-- --------------------------------------------------------

--
-- Estrutura para tabela `fornecedor`
--

CREATE TABLE `fornecedor` (
  `cnpj` int(11) NOT NULL,
  `nome` varchar(70) NOT NULL,
  `endereco` varchar(300) NOT NULL,
  `contato` varchar(150) NOT NULL,
  `tipo_produto` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `fornecedor`
--

INSERT INTO `fornecedor` (`cnpj`, `nome`, `endereco`, `contato`, `tipo_produto`) VALUES
(1234, 'Winter Collection', 'Rua do Comércio, 67 - Porto Alegre/RS', '(51) 99123-4567', 'Casacos'),
(12345, 'Moda Style Ltda', 'Rua das Flores, 123 - São Paulo/SP', '(11) 91234-5678', 'Camisetas'),
(23456, 'Jeans Brasil', 'Av. Paulista, 1000 - São Paulo/SP', '(11) 92345-6789', 'Calças Jeans'),
(34567, 'Fashion Mix', 'Rua Central, 45 - Rio de Janeiro/RJ', '(21) 93456-7890', 'Vestidos'),
(45678, 'Top Moda', 'Av. Brasil, 789 - Curitiba/PR', '(41) 94567-8901', 'Blusas'),
(56789, 'Urban Wear', 'Rua XV de Novembro, 456 - Curitiba/PR', '(41) 95678-9012', 'Moletons'),
(67890, 'Elegance Fashion', 'Av. Atlântica, 1500 - Rio de Janeiro/RJ', '(21) 96789-0123', 'Vestidos'),
(78901, 'Street Style', 'Rua Augusta, 321 - São Paulo/SP', '(11) 97890-1234', 'Camisetas'),
(89012, 'Clássica Moda', 'Rua das Palmeiras, 88 - Belo Horizonte/MG', '(31) 98901-2345', 'Saias'),
(90123, 'Mega Roupas', 'Av. Afonso Pena, 200 - Belo Horizonte/MG', '(31) 99012-3456', 'Bermudas');

-- --------------------------------------------------------

--
-- Estrutura para tabela `logistica`
--

CREATE TABLE `logistica` (
  `nf` int(11) NOT NULL,
  `transportadora` varchar(45) NOT NULL,
  `valor_frete` double NOT NULL,
  `data_envio` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `logistica`
--

INSERT INTO `logistica` (`nf`, `transportadora`, `valor_frete`, `data_envio`) VALUES
(1001, 'Correios', 25.9, '2026-04-01'),
(1002, 'Jadlog', 32.5, '2026-04-02'),
(1003, 'Loggi', 18.75, '2026-04-02'),
(1004, 'Correios', 27.3, '2026-04-03'),
(1005, 'Total Express', 35, '2026-04-03'),
(1006, 'Jadlog', 29.9, '2026-04-04'),
(1007, 'Loggi', 22.4, '2026-04-05'),
(1008, 'Correios', 26.8, '2026-04-05'),
(1009, 'Total Express', 38.6, '2026-04-06'),
(1010, 'Jadlog', 31.2, '2026-04-07');

-- --------------------------------------------------------

--
-- Estrutura para tabela `vendas`
--

CREATE TABLE `vendas` (
  `id_vendas` int(11) NOT NULL,
  `data_venda` date NOT NULL,
  `regiao` varchar(50) NOT NULL,
  `preco` double NOT NULL,
  `tipo_pagamento` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `vendas`
--

INSERT INTO `vendas` (`id_vendas`, `data_venda`, `regiao`, `preco`, `tipo_pagamento`) VALUES
(1, '2026-04-01', 'Sul', 129.9, 'Cartão de Crédito'),
(2, '2026-04-01', 'Sudeste', 89.5, 'Pix'),
(3, '2026-04-02', 'Nordeste', 159.9, 'Boleto'),
(4, '2026-04-02', 'Sul', 79.9, 'Pix'),
(5, '2026-04-03', 'Centro-Oeste', 199.9, 'Cartão de Crédito'),
(6, '2026-04-03', 'Sudeste', 149.9, 'Cartão de Débito'),
(7, '2026-04-04', 'Norte', 99.9, 'Pix'),
(8, '2026-04-05', 'Nordeste', 59.9, 'Boleto'),
(9, '2026-04-06', 'Sul', 179.9, 'Cartão de Crédito'),
(10, '2026-04-07', 'Sudeste', 139.9, 'Pix');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`cpf`);

--
-- Índices de tabela `estoque`
--
ALTER TABLE `estoque`
  ADD PRIMARY KEY (`id_produto`);

--
-- Índices de tabela `fornecedor`
--
ALTER TABLE `fornecedor`
  ADD PRIMARY KEY (`cnpj`);

--
-- Índices de tabela `logistica`
--
ALTER TABLE `logistica`
  ADD PRIMARY KEY (`nf`);

--
-- Índices de tabela `vendas`
--
ALTER TABLE `vendas`
  ADD PRIMARY KEY (`id_vendas`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `estoque`
--
ALTER TABLE `estoque`
  MODIFY `id_produto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `vendas`
--
ALTER TABLE `vendas`
  MODIFY `id_vendas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
