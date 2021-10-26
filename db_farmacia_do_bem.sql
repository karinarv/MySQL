create database db_farmacia_do_bem;

use db_farmacia_do_bem;

-- Tabela Categoria - 3 atributos - popular 5 dados
create table tb_categoria(
	id_categoria bigint(3) primary key auto_increment,
	categoria_produtos varchar(40) , -- Cosmético/ não cosmético/ Medicamentos
    categoria_remedio varchar(40) , -- Fitoterápico/ Alopático/ Homeopático/ Similar/Genérico/Referência/Manipulado
    receita enum('Possui','Não Possui') not null
);

 -- Popular com 5 dados
insert into tb_categoria(categoria_produtos, categoria_remedio, receita)
value ("Cosmético", "Não Possui", "Não Possui"),
	  ("Medicamentos", "Homeopático", "Não Possui"),
      ("Medicamentos", "Manipulado", "Possui"),
      ("Medicamentos", "Filoterápico", "Não Possui"),
      ("Medicamentos", "Genérico", "Não Possui");
      
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
value("Fluoxetina", "21.39", "35", "2020-10-03", "2021-10-03", "3" ),
	 ("Valeriana", "9.09","20", "2020-07-19", "2023-07-19","4"),
	 ("Cimegripe", "13.90","40", "2021-05-16", "2023-05-16","5"),
     ("Rivotril", "80.00","20", "2020-07-19", "2021-07-19","3"),
     ("Shampoo Ox", "24.90","23", "2021-02-11", "2023-02-11","1"),
     ("Protetor Solar", "11.90","25", "2021-01-28", "2023-01-28","1"),
     ("Escova de Cabelo", "72.25","10", "2021-07-01", "0000-00-00","1"),
     ("Termômetro Digital", "14.49","7", "2021-12-10", "0000-00-00","1");
	

-- Valores maiores que 50 reais 
select * from tb_produtos where preco > 50;

-- Valores entre 3 e 60 reais 
select * from tb_produtos where preco between 3.00 and 60.00;

-- Inner join de categoria e produto 
select * from tb_produtos inner join tb_categoria on tb_categoria.id_categoria = tb_produtos.fk_categoria;

-- Produtos de uma categoria especifica
select tb_produtos.nome as "Nome do Produto", tb_produtos.preco as "Preço", tb_categoria.categoria_produtos as "Categoria dos Produtos"
from tb_produtos inner join tb_categoria 
on tb_categoria.id_categoria = tb_produtos.fk_categoria where tb_categoria.categoria_produtos like 'Cosmético';
