create database db_pizzaria_legal;

use db_pizzaria_legal;


-- Tabela categoria - 3 atributos relevante para o serviço da pizzaria  - Popular com 5 dados
create table tb_categoria(
	id_categoria bigint(3) primary key  auto_increment,
	tipo varchar(30) not null,
	tempo_de_preparo int(100),
    tempo_de_entrega int(100)
);

insert into tb_categoria(tipo, tempo_de_preparo, tempo_de_entrega)
values("Salgada", 30, 20), -- 50 minutos para chegar a pizza 
	  ("Doce", 20, 15), -- 35 minutos para chegar a pizza 
      ("Salgada e Doce", 50, 10 ), -- 60 minutos para chegar a pizza 
      ("Salgada", 25, 45), -- 70 minutos para chegar a pizza 
      ("Doce", 35, 5); -- 40 minutos para chegar a pizza 

-- Tabela pizza trabalha com os produtos (5 atributos) + chave estrangeira
-- Popular com 8 dados
select * from tb_categoria;

create table tb_pizza(
	id_pizza bigint(4) primary key auto_increment,
    sabores varchar(40) not null,
    tamanho_pizza varchar(20), 
    valor decimal(8,2),
	ingredientes varchar(50) not null,
    qtd_ingredientes int(50),
    fk_categoria bigint(2),
    foreign key(fk_categoria) references tb_categoria(id_categoria)
);

insert into tb_pizza (sabores, tamanho_pizza, valor, ingredientes, qtd_ingredientes, fk_categoria )
value ("Mussarela", "Broto", 20.00, "Queijo", 10 , 1),
	  ("Banana com canela", "Grande", 47.50, "Banana", 50, 5),
      ("Chocolate com morango", "Broto", 30.49, "Morango", 60, 2),
      ("Marguerita e Nutella", "Grande e Broto", 87.00,"Nutella", 7, 3),
      ("Atum","Grande", 47.00,"Atum", 21, 4),
      ("Calabresa", "Broto", 25.00, "Linguiça", 20, 1 ),
      ("Vegetariana", "Grande", 45.57, "Alface", 30, 4),
      ("Escarola", "Broto", 25.45,"Escarola", 10, 1);


select tb_pizza.sabores, tb_pizza.valor from tb_pizza where tb_pizza.valor >= 45.00 order by tb_pizza.sabores, tb_pizza.valor ;
select tb_pizza.sabores,tb_pizza.valor from tb_pizza where tb_pizza.valor between 29.00 and 60.00
order by tb_pizza.sabores, tb_pizza.valor;

select * from tb_pizza where sabores like "C%"  ;

select * from tb_pizza inner join tb_categoria
on tb_categoria.id_categoria = tb_pizza.fk_categoria;


select tb_pizza.sabores as "Sabores", tb_categoria.tipo as "Tipo", tb_pizza.tamanho_pizza as "Tamanho da Pizza",
tb_pizza.valor as "Preço" from tb_pizza inner join tb_categoria 
on tb_categoria.id_categoria = tb_pizza.fk_categoria;      
	
select tb_pizza.sabores as "Sabores", tb_categoria.tipo as "Tipo", tb_pizza.tamanho_pizza as "Tamanho da Pizza",
tb_pizza.valor as "Preço" from tb_pizza inner join tb_categoria 
on tb_categoria.id_categoria = tb_pizza.fk_categoria where tb_categoria.tipo  like "S%" ;
