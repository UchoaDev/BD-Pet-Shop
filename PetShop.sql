create database petshop;
use petshop;

-- tabelas independentes: funcionario, servicos, produtos, cliente, forma_pagamento

create table funcionario
(
registro int primary key,
nome varchar(150),
data_admissao date,
salario float,
cep char(8) ,
bairro varchar(80),
rua varchar(100),
numero int
);

create table servicos
(
id int primary key,
descricao varchar(50),
vacina float,
consulta float,
tosa float,
banho float
);

create table produtos
(
id int primary key,
nome varchar(45),
marca varchar(45),
fornecedor varchar(45),
validade date,
estoque int,
valor float
);

create table cliente
(
cpf char(11) primary key,
nome varchar(150),
cep char(8),
bairro varchar(80),
rua varchar(100),
numero int
);

create table forma_pg
(
id_forma int primary key,
descricao varchar(45)
);

-- tabelas dependentes: telefone_funcionario, telefone_cliente, pedido, pagamento, pet

create table telefone_funcionario
(
celular char(11),
celular_recado char(11),
funcionario_registro int,
foreign key (funcionario_registro)
references funcionario(registro)
);

create table telefone_cliente
(
celular char(11),
celular_recado char(11),
cliente_cpf char(11),
foreign key (cliente_cpf)
references cliente(cpf)
);

create table pedido
(
id_pedido int primary key,
id_produto int,
id_servico int,
valor_total float,
cliente_cpf char(11),
foreign key (cliente_cpf)
references cliente(cpf)
);

create table pagamento
(
id_pagamento int primary key,
forma_pagamento varchar(45),
pedido_id_pedido int,
foreign key (pedido_id_pedido)
references pedido(id_pedido)
);

create table pet
(
id_pet int primary key,
especie varchar(45),
nome varchar(45),
cor varchar(45),
data_nascimento date,
cliente_cpf char(11),
foreign key (cliente_cpf)
references cliente(cpf)
);

-- tabelas associativas: servicos_funcionario, servicos_pedido, pedido_produtos, forma_pg_pagamento

create table servicos_funcionario
(
servicos_id int,
funcionario_registro int,
primary key (servicos_id,funcionario_registro),
foreign key (servicos_id)
references servicos(id),
foreign key (funcionario_registro)
references funcionario(registro)
);

create table servicos_pedidos
(
servicos_id int,
pedido_id_pedido int,
foreign key (servicos_id)
references servicos(id),
foreign key (pedido_id_pedido)
references pedido(id_pedido)
);

create table pedido_produtos
(
pedido_id_pedido int,
produtos_id int,
primary key (pedido_id_pedido, produtos_id),
foreign key (pedido_id_pedido)
references pedido(id_pedido),
foreign key (produtos_id)
references produtos(id)
);

create table forma_pg_pagamento
(
forma_pg_id_forma int,
pagamento_id_pagamento int,
primary key (forma_pg_id_forma, pagamento_id_pagamento),
foreign key (forma_pg_id_forma)
references forma_pg(id_forma),
foreign key (pagamento_id_pagamento)
references pagamento(id_pagamento)
);
