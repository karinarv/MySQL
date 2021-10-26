create database db_cursoDaMinhaVida;

use db_cursoDaMinhaVida;

-- Tabela Categoria - 3 atributos - popular 5 dados
create table tb_categoria(
	id_categoria bigint(3) primary key auto_increment,
	curso varchar(40) , -- Java/ C#/ DBA/ Security / AWS/ Spring MVC/ IOT
	empresa varchar(40) , 
    categoria enum('Desenvolvimento','Cloud','Segurança') not null 
);

 -- Popular com 5 dados
insert into tb_categoria(curso, empresa, categoria)
value ("Java", "Alura", "Desenvolvimento"),
	  ("C#", "Treina Web", "Desenvolvimento"),
      ("Security", "Cisco", "Segurança"),
      ("AWS", "AWS", "Cloud"),
      ("Python", "Udemy", "Desenvolvimento");
      
-- Tabela Produtos - 5 atributos - 8 dados
create table tb_produtos(
	id_produtos bigint(3) primary key auto_increment,
    nome varchar(100),
    quantidade_vagas int (100),
    duracao varchar(30),
	nivel varchar(30), -- Iniciante, intermediário, Avançado
    preco decimal(10,2),
    fk_categoria bigint(2),
    foreign key(fk_categoria) references tb_categoria(id_categoria)
);

-- Popular com 8 dados

insert into tb_produtos(nome, quantidade_vagas, duracao, nivel, preco, fk_categoria)
value("Desenvolvimento Web com Java", "300", "3 meses", "Intermediário", "127.90", "1" ),
	 ("Desenvolvimento de Games com C#","120", "3 meses", "Intermediário", "127.90", "2" ),
	 ("Desenvolvimento Mobile com Kotlin","120", "1 meses", "Iniciante", "87.90", "1" ),
     ("Security", "120", "2 meses", "Iniciante", "00.00", "3" ),
	 ("Desenvolvimento de Games com Unity", "120", "3 meses", "Intermediário", "70.90", "2" ),
	 ("Desenvolvimento orientado a objeto","120", "1 meses", "Iniciante", "80.00", "1" ),
	 ("AWS Certified Solutions Architect Associate","120", "1 ano", "Intermediário", "307.90", "3" ),
	 ("Machine Learning with Python","320", "5 meses", "Avançado", "1890", "5" ),
	 ("Data Science with Python","120", "7 meses", "Avançado", "1257.90", "5" ),
	 ("Básico de Python","120", "3 meses", "Iniciante", "27.90", "5" );

-- Valores maiores que 50 reais 
select * from tb_produtos where preco > 50;

-- Valores entre 3 e 60 reais 
select * from tb_produtos where preco between 3.00 and 60.00;

-- Produtos com a letra c
select * from tb_produtos  where tb_produtos.nome like '%j%';

-- Inner join de categoria e produto 
select * from tb_produtos inner join tb_categoria on tb_categoria.id_categoria = tb_produtos.fk_categoria;

-- Produtos de uma categoria especifica
select tb_produtos.nome as "Nome do Produto", tb_produtos.preco as "Preço", tb_categoria.categoria as "Categoria dos Produtos"
from tb_produtos inner join tb_categoria 
on tb_categoria.id_categoria = tb_produtos.fk_categoria where tb_categoria.categoria like 'Desenvolvimento';

