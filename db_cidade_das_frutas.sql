create database db_cidade_das_frutas;

use db_cidade_das_frutas;

-- Tabela Categoria - 3 atributos - popular 5 dados
create table tb_categoria(
	id_categoria bigint(3) primary key auto_increment,
	departamento varchar(40) , -- Açougue e Peixaria/ Queijaria/ Hortifrúti/ Padaria e Confeitaria/ Lácteos/ Frios/ Outros
	bebidas varchar(40) , -- Vinho/ Cerveja/ Leite/ Suco
    classificacao enum('Quente','Frio') not null -- A classificação é baseada no departamento
);

 -- Popular com 5 dados
insert into tb_categoria(departamento, bebidas, classificacao)
value ("Açougue e Peixaria", "Cerveja", "Frio"),
	  ("Hortifrúti", "Suco", "Frio"),
      ("Padaria e Confeitaria", "Não Levou", "Quente"),
      ("Frios", "Vinho", "Frio"),
      ("Outros", "Leite", "Frio");
      
-- Tabela Produtos - 5 atributos - 8 dados
create table tb_produtos(
	id_produtos bigint(3) primary key auto_increment,
    nome varchar(100),
    preco decimal(10,2),
    quantidade int (100),
    data_fabricacao date not null,
	data_validade date not null,
    fk_categoria bigint(2),
    foreign key(fk_categoria) references tb_categoria(id_categoria)
);

-- Popular com 8 dados

insert into tb_produtos(nome, preco, quantidade, data_fabricacao, data_validade, fk_categoria)
value("Atum", "70.39", "23", "2021-10-03", "2022-01-03", "1" ),
	 ("Maça", "0.99","20", "2021-07-19", "2021-09-19","2"),
	 ("Pão de Forma", "15.90","40", "2021-05-16", "2021-07-16","3"),
     ("Iogurte", "12.00","20", "2021-07-19", "2021-09-19","4"),
     ("Massa para Torta Semilaminada", "54.90","23", "2021-02-11", "2021-12-11","5"),
     ("Banana", "1.20","25", "2021-01-28", "2021-03-28","2"),
     ("Abacaxi", "2.25","10", "2021-07-01", "2021-09-01","2"),
     ("Linguiça Fininha", "44.49","7", "2021-12-10", "2022-02-10","1");
	

-- Valores maiores que 50 reais 
select * from tb_produtos where preco > 50;

-- Valores entre 3 e 60 reais 
select * from tb_produtos where preco between 3.00 and 60.00;

-- Produtos com a letra c
select * from tb_produtos  where tb_produtos.nome like '%c%';

-- Inner join de categoria e produto 
select * from tb_produtos inner join tb_categoria on tb_categoria.id_categoria = tb_produtos.fk_categoria;

-- Produtos de uma categoria especifica
select tb_produtos.nome as "Nome do Produto", tb_produtos.preco as "Preço", tb_categoria.departamento as "Categoria dos Produtos"
from tb_produtos inner join tb_categoria 
on tb_categoria.id_categoria = tb_produtos.fk_categoria where tb_categoria.departamento like 'Hortifrúti';

