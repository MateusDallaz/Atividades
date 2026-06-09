create database pizzaria;
use pizzaria;

create table cliente(
	id_cliente int  auto_increment primary key,
    nome varchar(100),
    telefone varchar(20),
    email varchar(100),
    cidade varchar(80)
);

create table endereco(
	id_endereco int auto_increment primary key,
    id_cliente int,
	rua varchar(150),
    numero varchar(10),
    bairro varchar(80),
    foreign key (id_cliente) references cliente(id_cliente)
);

create table categoria(
	id_categoria int auto_increment primary key,
    nome varchar(80),
    descricao varchar(200)
);


create table pizza(
	id_pizza int auto_increment primary key,
    id_categoria int,
    nome varchar(100),
    sabor varchar(80),
    tamanho varchar(20),
    preco decimal(8,2),
    foreign key (id_categoria) references categoria(id_categoria)
);

create table pedido(
	id_pedido int auto_increment primary key,
    id_cliente int,
    id_pizza int,
    data_pedido date,
    quantidade int, 
    status_pedido varchar(30),
	foreign key (id_cliente) references cliente(id_cliente),
	foreign key (id_pizza) references pizza(id_pizza)
);

insert into categoria (nome, descricao)
values ('Tradicional', 'Pizzas classicas do cardápio'),
('Especial', 'Pizzas premium com ingredientes diferenciados'),
('Doce', 'Pizzas com recheio doce');

insert into cliente (nome, telefone, email, cidade)
values ('Ana Souza', '(49) 9 9111-2233', 'ana@email.com', 'Videira'),
('Bruno Lima', '(49) 9 9444-5566', 'bruno@email.com', 'Caçador'),
('Carla Melo', '(49) 9 9777-8899', 'carla@email.com', 'Fraiburgo'),
('Diego Costa', '(49) 9 9000-1122', 'diego@email.com', 'Videira');

insert into endereco (id_cliente, rua, numero, bairro)
values (1, 'Rua das Flores', '123', 'Centro'),
(2, 'Av. Brasil', '456', 'São Cristóvão'),
(3, 'Rua XV de Novembro ', '789', 'Centro'),
(4, 'Rua Tiradentes', '321', 'Vila Nova');

insert into pizza (id_categoria, nome, sabor,tamanho, preco)
values (1, 'Margherita', 'Queijo e Tomate', 'M', 35.90),
(1, 'Portuguesa', 'Presunto e Ovos', 'G', 49.90),
(2, 'Frango BBQ', 'Frango e Barbecue', 'G', 54.90),
(3, 'Chocolate', 'Nutella e Morango', 'M', 42.00);

insert into pedido (id_cliente, id_pizza, data_pedido, quantidade, status_pedido)
values (1, 2, '2024-10-01', 1, 'Entregue'),
(2, 1, '2024-10-03', 2, 'Entregue'),
(3, 3, '2024-10-05', 1, 'Aguardando'),
(1, 1, '2024-10-07', 3, 'Em preparo'), 
(4, 4, '2024-10-10', 1, 'Aguardando');

select nome, email, cidade from cliente where cidade = 'Videira';

SELECT c.nome AS cliente, 
e.rua, e.numero, e.bairro FROM endereco e
INNER JOIN cliente c ON e.id_cliente = c.id_cliente;

select count(*) as total_pedidos from pedido;

update pedido set status_pedido = 'Entrtegue' where id_pedido = 3;

alter table pedido add column desconto decimal(5,2) default 0.00;

create table log_pedido (
	id_log int auto_increment primary key,
	id_pedido int,
    data_hora datetime,
	mensagem varchar(100)
);

DELIMITER //
CREATE TRIGGER trg_log_pedido
AFTER INSERT ON pedido
FOR EACH ROW
BEGIN
INSERT INTO log_pedido (id_pedido, data_hora, mensagem)
VALUES (NEW.id_pedido, NOW(), 'Novo pedido registrado');
END //
DELIMITER ;

drop trigger trg_log_pedido;

insert into pedido (id_cliente, id_pizza, data_pedido, quantidade, status_pedido)
values (4, 2, '2024-10-01', 2, 'Entregue');

select * from log_pedido;

create view vw_pizzas_cardapio as
select p.nome, p.sabor, p.tamanho, p.preco as pizza, 
c.nome as categoria from categoria c inner join pizza p on c.id_categoria = p.id_categoria;

SELECT * FROM vw_pizzas_cardapio WHERE categoria = 'Especial';