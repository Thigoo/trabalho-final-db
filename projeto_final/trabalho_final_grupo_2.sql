PRAGMA foreign_keys = ON;

-- DDL
-- TABELA CATEGORIAS
CREATE TABLE categoria (
	codigo_categoria integer primary key autoincrement not null,
	nome text,
	descricao text
);

-- TABELA FUNCIONARIOS
CREATE TABLE funcionario (
    codigo integer primary key autoincrement not null, 
    nome text,
    cpf text
);

-- TABELA CLIENTES 
CREATE TABLE cliente (
    codigo_cliente integer primary key autoincrement not null,
    nome_completo text,
    nome_usuario text,
    email text,
    cpf text,
    data_nascimento date,
    rua text,
    numero integer,
    cidade text,
    bairro text,
    cep integer,
    uf text,
    pais text
);

-- TABELA PRODUTO 
CREATE TABLE produto (
    codigo_produto integer primary key autoincrement not null,
    nome text,
    descricao text,
    qtd_estoque integer,
    data_fabricacao date,
    valor_unitario integer,
    codigo_categoria integer,
    codigo integer,
    foreign key (codigo_produto) references categoria (codigo_categoria),
    foreign key (codigo) references funcionario (codigo)
);

-- TABELA PEDIDOS 
CREATE TABLE pedido (
    codigo_pedido integer primary key autoincrement not null,
    data_emissao text,
    codigo_cliente integer,
    foreign key (codigo_cliente) references cliente(codigo_cliente)
);

-- TABELA PRODUTO_PEDIDO 
CREATE TABLE produto_pedido (
    codigo_produto_pedido integer primary key autoincrement not null,
    codigo_pedido integer,
    quantidade integer,
    codigo_produto integer,
    foreign key (codigo_pedido) references pedido(codigo_pedido),
    foreign key (codigo_produto) references produto(codigo_produto)
);

-- DML - INSERCAO DE DADOS

INSERT INTO categoria (nome, descricao) values 
	("roupa_masculina", "camisa, calca, bermuda, casaco"),
	("roupa_feminina", "camisa, calca, short, casaco, vestido, saia"),
	("roupa_infantil", "camisa, calca, bermuda, short, casaco, vestido, saia"),
	("acessorio_masculino", "bone, sunga, meia, cueca"),
	("acessorio_feminino", "sapato, meia, bone, cinto");

INSERT INTO cliente (nome_completo, nome_usuario, email, cpf, data_nascimento, rua, numero, cidade, bairro, cep, uf, pais) values 
	('Jose Maria', 'jose123', 'jose@email.com', '998-998-998-98', 1989-05-26, 'Silva Jardim', 451, 'Petropolis', 'Centro', 91991919, 'RJ', 'Brasil'),
	('Maria Jose', 'maria123', 'maria@email.com', '112-113-114-12', 2001-12-15, 'Floriano Peixoto', 13, 'Petropolis', 'Centro', 15155151, 'RJ', 'Brasil'),
	('Leandro Torres', 'leandro123', 'leandro@email.com', '223-224-225-23', 1977-06-13, 'Amadeu Guimaraes', 49, 'Tres Rios', 'Centro', 24244242, 'RJ', 'Brasil'),
	('Josefina Martins', 'josefina123', 'josefina@email.com', '334-335-336-34', 1980-08-26, 'Oswaldo Cruz', 86, 'Petropolis', 'Itamarati', 36366363, 'RJ', 'Brasil'),
	('Marluce Ribeiro', 'marluce123', 'marluce@email.com', '445-446-447-45', 1969-05-16, 'Monsenhor Barcelar', 1204, 'Nova Friburgo', 'Olaria', 4949949, 'RJ', 'Brasil'),
	('Felipe Adriano', 'felipe123', 'felipe@email.com', '556-665-565-76', 1971-02-23, '16 de Março', 'Petropolis',76, 'Centro', 7676676, 'RJ', 'Brasil');

INSERT INTO funcionario (nome, cpf) 
values 	('Thiago Garcia', '043-567-459-65'),
	('Elizama Fortes', '345-367-246-23'), 
	('Julia Lima', '234-534-675-56'), 
	('Lucas Gonçalves', '432-654-245-74'), 
	('Pedro Silva', '243-532-654-34'),
	('Larissa Ferreira', '165-432-845-98'),
	('Carlos Santos', '198-145-785-65'),
	('Evandro Silva', '132-465-798-12'),
	('Madalena Barbosa', '187-765-894-85');

INSERT INTO pedido (data_emissao, codigo_cliente) values 
	('2023-08-21', 5),
	('2023-08-20', 4),
	('2023-08-19', 3),
	('2023-08-18', 2),
	('2023-08-17', 1);

INSERT INTO produto (nome, descricao, qtd_estoque, data_fabricacao, valor_unitario, codigo_categoria,codigo) VALUES
   ('Calça', 'Calça jeans azul com corte slim', 50, '2023-02-10', 250, 1 , 5),
   ('Camisa', 'Camiseta de algodão de cor branca', 25, '2023-03-20', 50, 2, 6),
   ('Vestido', 'Vestido curto com estampa floral', 10, '2023-02-05', 80, 3, 7),
   ('Jaqueta', 'Jaqueta de couro preta com zíper frontal', 10,'2023-02-05', 350, 2, 8),
   ('Sapato', 'Sapato social de couro marrom', 5, '2023-02-05', 200, 5, 9);
  
INSERT INTO produto_pedido (codigo_produto, quantidade, codigo_pedido) values
	(2, 4, 4),
	(1, 5, 3),
	(4, 6, 5),
	(3, 7, 2),
	(5, 8, 1);

-- DML - ATUALIZACAO DE DADOS

UPDATE pedido set data_emissao = ('21/08/2023') where codigo_pedido = 1;
UPDATE pedido set data_emissao = ('20/08/2023') where codigo_pedido = 2;
UPDATE pedido set data_emissao = ('19/08/2023') where codigo_pedido = 3;
UPDATE pedido set data_emissao = ('18/07/2023') where codigo_pedido = 4;
UPDATE pedido set data_emissao = ('17/08/2023') where codigo_pedido = 5;
UPDATE produto set data_fabricacao = ('10/02/2023') where codigo_produto = 1;
UPDATE produto set data_fabricacao = ('20/03/2020') where codigo_produto = 2;
UPDATE produto set data_fabricacao = ('05/02/2023') where codigo_produto = 3;
UPDATE produto set data_fabricacao = ('05/02/2019') where codigo_produto = 4;
UPDATE produto set data_fabricacao = ('21/08/2022') where codigo_produto = 5;

-- Um comando SQL de exclusão de algum registro em uma tabela

delete from funcionario where codigo=2;

-- 5 SQLs de consulta
	-- Pelo menos 2 com algum tipo de junção

-- Saber que funcionário cadastrou qual produto
SELECT p.nome as Produto,
       f.nome as Funcionário
FROM produto p
INNER JOIN funcionario f ON p.codigo = f.codigo
INNER JOIN produto_pedido pp ON p.codigo_produto = pp.codigo_produto;

-- Saber quantidade de cada produto que cada cliente comprou
select c.nome_completo as Cliente,
		p.nome as Produto,
		pp.quantidade
		from produto p
		inner join produto_pedido pp on p.codigo_produto =pp.codigo_produto 
		inner join pedido pe on pe.codigo_pedido = pp.codigo_pedido 
		inner join cliente c on c.codigo_cliente = pe.codigo_cliente;
	
	-- Pelo menos 1 com usando count() e group by()
	
--Contar quantos produtos foram fabricados em uma data, listando-os
	select data_fabricacao,group_concat(nome,', '),count(data_fabricacao) as N_Produtos, 
sum(qtd_estoque) as Estoque 
from produto p
group by p.data_fabricacao = '2023-02-05';

--Agrupar usuários (por nome de usuário) por cidades
select c.cidade,group_concat(c.nome_usuario,', ') as Clientes
from cliente c
group by c.cidade;

	-- Uma consulta livre: 
	
--valor total em estoque
select p.nome, sum(p.qtd_estoque*p.valor_unitario) as Caixa
from produto p
group by p.nome;

	-- 1 SQL para construção de nota fiscal: 
	-- Cliente (nome, cpf,rua, bairro, cidade, cep);
	-- Pedido (código, produtos, quantidade, valor individual, descrição, valor total)

select c.nome_completo,c.cpf,'Logradouro '||c.rua||', '||c.bairro||' - '||c.cidade||', '||c.uf||' - '||c.pais||', '||c.cep as Endereco,
		pe.codigo_pedido,p.nome,p.descricao,p.valor_unitario,pp.quantidade,(p.valor_unitario*pp.quantidade) as Valor_total
from cliente c 
inner join pedido pe on pe.codigo_cliente = c.codigo_cliente 
inner join produto_pedido pp on pp.codigo_pedido = pe.codigo_pedido 
inner join produto p on p.codigo_produto = pp.codigo_produto;