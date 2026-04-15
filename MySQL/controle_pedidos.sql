-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 15/04/2026 às 02:21
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
-- Banco de dados: `controle_pedidos`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `cliente`
--

CREATE TABLE `cliente` (
  `cpf` bigint(12) NOT NULL,
  `nome` varchar(45) NOT NULL,
  `idade` bigint(3) DEFAULT NULL,
  `endereco` varchar(300) DEFAULT NULL,
  `contato` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `cliente`
--

INSERT INTO `cliente` (`cpf`, `nome`, `idade`, `endereco`, `contato`) VALUES
(12345678901, 'João Silva', 25, 'Rua A, 123', '49999990001'),
(23456789012, 'Maria Oliveira', 30, 'Rua B, 456', '49999990002'),
(34567890123, 'Carlos Souza', 22, 'Rua C, 789', '49999990003'),
(45678901234, 'Ana Costa', 28, 'Rua D, 321', '49999990004'),
(56789012345, 'Lucas Pereira', 35, 'Rua E, 654', '49999990005');

-- --------------------------------------------------------

--
-- Estrutura para tabela `entregas`
--

CREATE TABLE `entregas` (
  `id` int(11) NOT NULL,
  `endereco` varchar(300) DEFAULT NULL,
  `entrega_balcao` int(11) DEFAULT NULL,
  `entrega_deliveri` int(11) DEFAULT NULL,
  `id_pedido` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `entregas`
--

INSERT INTO `entregas` (`id`, `endereco`, `entrega_balcao`, `entrega_deliveri`, `id_pedido`) VALUES
(1, 'Rua A, 123', 0, 1, 1),
(2, 'Rua B, 456', 1, 0, 2),
(3, 'Rua C, 789', 0, 1, 3),
(4, 'Rua D, 321', 1, 0, 4),
(5, 'Rua E, 654', 0, 1, 5);

-- --------------------------------------------------------

--
-- Estrutura para tabela `estoque`
--

CREATE TABLE `estoque` (
  `id` int(11) NOT NULL,
  `categoria_estoque` varchar(150) DEFAULT NULL,
  `qantidade` decimal(10,2) DEFAULT NULL,
  `data_validade` date DEFAULT NULL,
  `matricula_func` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `estoque`
--

INSERT INTO `estoque` (`id`, `categoria_estoque`, `qantidade`, `data_validade`, `matricula_func`) VALUES
(1, 'Camisetas', 50.00, '2026-12-31', 1001),
(2, 'Calças', 30.00, '2026-11-30', 1002),
(3, 'Tênis', 20.00, '2027-01-15', 1003),
(4, 'Jaquetas', 15.00, '2026-10-20', 1004),
(5, 'Acessórios', 80.00, '2027-03-10', 1005);

-- --------------------------------------------------------

--
-- Estrutura para tabela `funcionarios`
--

CREATE TABLE `funcionarios` (
  `matricula` int(11) NOT NULL,
  `nome` varchar(45) NOT NULL,
  `funcao` varchar(45) DEFAULT NULL,
  `contato` varchar(150) DEFAULT NULL,
  `id_pedido` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `funcionarios`
--

INSERT INTO `funcionarios` (`matricula`, `nome`, `funcao`, `contato`, `id_pedido`) VALUES
(1001, 'Carlos Mendes', 'Vendedor', '49999990010', 1),
(1002, 'Fernanda Alves', 'Caixa', '49999990011', 2),
(1003, 'Juliano Rocha', 'Estoquista', '49999990012', 3),
(1004, 'Patricia Lima', 'Atendente', '49999990013', 4),
(1005, 'Ricardo Souza', 'Gerente', '49999990014', 5);

-- --------------------------------------------------------

--
-- Estrutura para tabela `pedidos`
--

CREATE TABLE `pedidos` (
  `id` int(11) NOT NULL,
  `produto` varchar(45) NOT NULL,
  `data_pedido` datetime DEFAULT current_timestamp(),
  `forma_pagamento` varchar(45) DEFAULT NULL,
  `cliente_cpf` bigint(12) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `pedidos`
--

INSERT INTO `pedidos` (`id`, `produto`, `data_pedido`, `forma_pagamento`, `cliente_cpf`) VALUES
(1, 'Peixe', '2026-04-14 21:02:32', 'Cartão de Crédito', 12345678901),
(2, 'Calzone', '2026-04-14 21:02:32', 'Boleto', 23456789012),
(3, 'Sushi', '2026-04-14 21:02:32', 'Pix', 34567890123),
(4, 'Hamburguer', '2026-04-14 21:02:32', 'Cartão de Débito', 45678901234),
(5, 'Pizza', '2026-04-14 21:02:32', 'Pix', 56789012345);

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`cpf`);

--
-- Índices de tabela `entregas`
--
ALTER TABLE `entregas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_pedido` (`id_pedido`);

--
-- Índices de tabela `estoque`
--
ALTER TABLE `estoque`
  ADD PRIMARY KEY (`id`),
  ADD KEY `matricula_func` (`matricula_func`);

--
-- Índices de tabela `funcionarios`
--
ALTER TABLE `funcionarios`
  ADD PRIMARY KEY (`matricula`),
  ADD KEY `id_pedido` (`id_pedido`);

--
-- Índices de tabela `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cliente_cpf` (`cliente_cpf`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `entregas`
--
ALTER TABLE `entregas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `estoque`
--
ALTER TABLE `estoque`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `entregas`
--
ALTER TABLE `entregas`
  ADD CONSTRAINT `entregas_ibfk_1` FOREIGN KEY (`id_pedido`) REFERENCES `pedidos` (`id`);

--
-- Restrições para tabelas `estoque`
--
ALTER TABLE `estoque`
  ADD CONSTRAINT `estoque_ibfk_1` FOREIGN KEY (`matricula_func`) REFERENCES `funcionarios` (`matricula`);

--
-- Restrições para tabelas `funcionarios`
--
ALTER TABLE `funcionarios`
  ADD CONSTRAINT `funcionarios_ibfk_1` FOREIGN KEY (`id_pedido`) REFERENCES `pedidos` (`id`);

--
-- Restrições para tabelas `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `pedidos_ibfk_1` FOREIGN KEY (`cliente_cpf`) REFERENCES `cliente` (`cpf`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
