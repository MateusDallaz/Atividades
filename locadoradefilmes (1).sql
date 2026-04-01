-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 01/04/2026 às 02:58
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
-- Banco de dados: `locadoradefilmes`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `cliente`
--

CREATE TABLE `cliente` (
  `cadastro` int(11) NOT NULL,
  `cpf` bigint(11) DEFAULT NULL,
  `data_cadastro` date DEFAULT NULL,
  `historico_aluguel` date DEFAULT NULL,
  `endereco` text DEFAULT NULL,
  `nascimento` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `cliente`
--

INSERT INTO `cliente` (`cadastro`, `cpf`, `data_cadastro`, `historico_aluguel`, `endereco`, `nascimento`) VALUES
(0, 12345678910, '0000-00-00', '0000-00-00', 'Rua 01', '0000-00-00'),
(1, 12345678901, '2023-01-10', '2023-01-01', 'Rua A, São Paulo, SP', '1990-05-12'),
(2, 23456789012, '2023-02-15', '2023-02-01', 'Rua B, Rio de Janeiro, RJ', '1985-08-23'),
(3, 34567890123, '2023-03-20', '2023-03-01', 'Rua C, Belo Horizonte, MG', '1992-11-30'),
(4, 45678901234, '2023-04-25', '2023-04-01', 'Rua D, Curitiba, PR', '1988-02-14'),
(5, 56789012345, '2023-05-30', '2023-05-01', 'Rua E, Porto Alegre, RS', '1995-07-09'),
(6, 67890123456, '2023-06-10', '2023-06-01', 'Rua F, Salvador, BA', '1991-12-01'),
(7, 78901234567, '2023-07-12', '2023-07-01', 'Rua G, Fortaleza, CE', '1987-03-19'),
(8, 89012345678, '2023-08-18', '2023-08-01', 'Rua H, Recife, PE', '1993-06-25'),
(9, 90123456789, '2023-09-22', '2023-09-01', 'Rua I, Brasília, DF', '1989-09-10'),
(10, 1234567890, '2023-10-05', '2023-10-01', 'Rua J, Manaus, AM', '1994-04-04'),
(1313467920, 12345678911, '2026-03-31', '2026-02-26', 'Rua 01', '2000-10-13'),
(2147483647, 12345678911, '2026-03-31', '2026-02-26', 'Rua 01', '2000-10-13');

-- --------------------------------------------------------

--
-- Estrutura para tabela `filme`
--

CREATE TABLE `filme` (
  `codigo` int(11) NOT NULL,
  `data_lancamento` date DEFAULT NULL,
  `genero` varchar(45) DEFAULT NULL,
  `reserva` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `filme`
--

INSERT INTO `filme` (`codigo`, `data_lancamento`, `genero`, `reserva`) VALUES
(1, '2023-01-10', 'Ação', '2023-01-15'),
(2, '2023-02-05', 'Comédia', '2023-02-10'),
(3, '2023-03-12', 'Drama', '2023-03-18'),
(4, '2023-04-20', 'Terror', '2023-04-25'),
(5, '2023-05-08', 'Romance', '2023-05-12'),
(6, '2023-06-14', 'Ficção Científica', '2023-06-20'),
(7, '2023-07-01', 'Aventura', '2023-07-05'),
(8, '2023-08-09', 'Suspense', '2023-08-15'),
(9, '2023-09-17', 'Animação', '2023-09-22'),
(10, '2023-10-03', 'Documentário', '2023-10-10'),
(13467925, '2000-02-25', 'Ação', '2026-03-30');

-- --------------------------------------------------------

--
-- Estrutura para tabela `fornecedor`
--

CREATE TABLE `fornecedor` (
  `cnpj` int(11) NOT NULL,
  `contato` int(11) DEFAULT NULL,
  `preco` double DEFAULT NULL,
  `prazo_entrega` time DEFAULT NULL,
  `endereco` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `fornecedor`
--

INSERT INTO `fornecedor` (`cnpj`, `contato`, `preco`, `prazo_entrega`, `endereco`) VALUES
(1005, 51984321, 450.75, '04:00:00', 'Av. Ipiranga, 654 - Porto Alegre/RS'),
(10001, 119854321, 150.5, '02:00:00', 'Rua das Flores, 123 - São Paulo/SP'),
(100002, 219654321, 299.99, '03:30:00', 'Av. Atlântica, 456 - Rio de Janeiro/RJ'),
(100003, 319854321, 89.9, '01:45:00', 'Rua Afonso Pena, 789 - Belo Horizonte/MG'),
(100004, 419854321, 120, '02:15:00', 'Rua XV de Novembro, 321 - Curitiba/PR'),
(100005, 2147483647, 450.75, '04:00:00', 'Av. Ipiranga, 654 - Porto Alegre/RS'),
(100006, 619854321, 75.3, '01:30:00', 'Rua Chile, 987 - Salvador/BA'),
(100007, 719854321, 210.1, '02:45:00', 'Av. Beira Mar, 147 - Fortaleza/CE'),
(100008, 819854321, 330, '03:00:00', 'Rua do Sol, 258 - Recife/PE'),
(100009, 91954321, 99.99, '01:50:00', 'Setor Comercial, 369 - Brasília/DF'),
(100010, 10954321, 500, '05:00:00', 'Av. Amazonas, 159 - Manaus/AM\''),
(10000001, 2147483647, 150.5, '02:00:00', 'Rua das Flores, 123 - São Paulo/SP'),
(10000002, 2147483647, 299.99, '03:30:00', 'Av. Atlântica, 456 - Rio de Janeiro/RJ'),
(10000003, 2147483647, 89.9, '01:45:00', 'Rua Afonso Pena, 789 - Belo Horizonte/MG'),
(10000004, 2147483647, 120, '02:15:00', 'Rua XV de Novembro, 321 - Curitiba/PR'),
(10000006, 2147483647, 75.3, '01:30:00', 'Rua Chile, 987 - Salvador/BA'),
(10000007, 2147483647, 210.1, '02:45:00', 'Av. Beira Mar, 147 - Fortaleza/CE'),
(10000008, 2147483647, 330, '03:00:00', 'Rua do Sol, 258 - Recife/PE'),
(10000009, 2147483647, 99.99, '01:50:00', 'Setor Comercial, 369 - Brasília/DF'),
(10000010, 2147483647, 500, '05:00:00', 'Av. Amazonas, 159 - Manaus/AM\''),
(100000005, 2147483647, 450.75, '04:00:00', 'Av. Ipiranga, 654 - Porto Alegre/RS'),
(1000000001, 2147483647, 150.5, '02:00:00', 'Rua das Flores, 123 - São Paulo/SP'),
(1000000002, 2147483647, 299.99, '03:30:00', 'Av. Atlântica, 456 - Rio de Janeiro/RJ'),
(1000000003, 2147483647, 89.9, '01:45:00', 'Rua Afonso Pena, 789 - Belo Horizonte/MG'),
(1000000004, 2147483647, 120, '02:15:00', 'Rua XV de Novembro, 321 - Curitiba/PR'),
(1000000006, 2147483647, 75.3, '01:30:00', 'Rua Chile, 987 - Salvador/BA'),
(1000000007, 2147483647, 210.1, '02:45:00', 'Av. Beira Mar, 147 - Fortaleza/CE'),
(1000000008, 2147483647, 330, '03:00:00', 'Rua do Sol, 258 - Recife/PE'),
(1000000009, 2147483647, 99.99, '01:50:00', 'Setor Comercial, 369 - Brasília/DF'),
(1000000010, 2147483647, 500, '05:00:00', 'Av. Amazonas, 159 - Manaus/AM\''),
(2000124558, 998406639, 1296, '15:00:00', 'Rua 7');

-- --------------------------------------------------------

--
-- Estrutura para tabela `funcionario`
--

CREATE TABLE `funcionario` (
  `matiricula` int(11) NOT NULL,
  `funcao` varchar(45) DEFAULT NULL,
  `data_inicial` date DEFAULT NULL,
  `login` varchar(45) DEFAULT NULL,
  `carga_horaria` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `funcionario`
--

INSERT INTO `funcionario` (`matiricula`, `funcao`, `data_inicial`, `login`, `carga_horaria`) VALUES
(1, 'caixa', '2001-05-26', 'fulano123', '08:00:00');

-- --------------------------------------------------------

--
-- Estrutura para tabela `locacao`
--

CREATE TABLE `locacao` (
  `contrato_locacao` int(11) NOT NULL,
  `data_locacao` date DEFAULT NULL,
  `matiricula` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `locacao`
--

INSERT INTO `locacao` (`contrato_locacao`, `data_locacao`, `matiricula`) VALUES
(134612052, '2026-01-03', 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `setor`
--

CREATE TABLE `setor` (
  `numero` int(11) NOT NULL,
  `genero` varchar(45) DEFAULT NULL,
  `vezes_alugado` int(11) DEFAULT NULL,
  `blueray` bit(1) DEFAULT NULL,
  `exemplares` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `setor`
--

INSERT INTO `setor` (`numero`, `genero`, `vezes_alugado`, `blueray`, `exemplares`) VALUES
(1, 'Ação', 7, b'1', 3);

-- --------------------------------------------------------

--
-- Estrutura para tabela `sistema`
--

CREATE TABLE `sistema` (
  `id_sistema` int(11) NOT NULL,
  `login` varchar(45) DEFAULT NULL,
  `data_acesso` date DEFAULT NULL,
  `locacao_inicio` date DEFAULT NULL,
  `locacao_fim` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `sistema`
--

INSERT INTO `sistema` (`id_sistema`, `login`, `data_acesso`, `locacao_inicio`, `locacao_fim`) VALUES
(1001, 'Tiozin', '2026-03-31', '2026-03-31', '2026-04-02');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`cadastro`);

--
-- Índices de tabela `filme`
--
ALTER TABLE `filme`
  ADD PRIMARY KEY (`codigo`);

--
-- Índices de tabela `fornecedor`
--
ALTER TABLE `fornecedor`
  ADD PRIMARY KEY (`cnpj`);

--
-- Índices de tabela `funcionario`
--
ALTER TABLE `funcionario`
  ADD PRIMARY KEY (`matiricula`);

--
-- Índices de tabela `locacao`
--
ALTER TABLE `locacao`
  ADD PRIMARY KEY (`contrato_locacao`),
  ADD KEY `fkmatricula_funcionario` (`matiricula`);

--
-- Índices de tabela `setor`
--
ALTER TABLE `setor`
  ADD PRIMARY KEY (`numero`);

--
-- Índices de tabela `sistema`
--
ALTER TABLE `sistema`
  ADD PRIMARY KEY (`id_sistema`);

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `locacao`
--
ALTER TABLE `locacao`
  ADD CONSTRAINT `fkmatricula_funcionario` FOREIGN KEY (`matiricula`) REFERENCES `funcionario` (`matiricula`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
