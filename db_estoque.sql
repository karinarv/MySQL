Create database db_estoque;

use db_estoque;

create table tb_produtos(
	id_produtos bigint(5) auto_increment,
    nome varchar(200) not null,
	quantidade int(255) not null ,
    categoria varchar(100) not null,
    valor float not null,
    
    primary key(id_produtos)
    
);
drop table tb_produtos;
insert into tb_produtos(nome, quantidade, categoria, valor)
		Value("Echo Dot (3ª Geração): Smart Speaker com Alexa", "30", "Dispositivos Amazon", "349"),
			 ("Violão Acústico Clássico Nylon C40MII Natural YAMAHA", "6", "Instrumentos Musicais", "855"),
             ("Capotraste com mola para violão", "100", "Acessórios", "47.59"),
             ("SCRUM: a arte de fazer o dobro do trabalho na metade do tempo", "200", "Livros", "31.99"),
             ("Código limpo: Habilidades práticas do Agile Software", "37", "Livros", "80.90"),
             ("Uno minimalista, Mattel, Black", "30", "Presentes", "40"),
             ("Cafeteira Expresso Prima Latte", "150", "Cozinha", "1.049"),
             ("Conjunto P/ Fondue 6pcs - Bc Brinox Branco", "150", "Cozinha", "77.45");
             

select id_produtos as "ID", nome as "Nome do Produto",  quantidade as "Quantidade" , 
categoria as "Categoria", valor as "Valor" from tb_produtos;

update tb_produtos set valor = "37.40" where id_produtos = 6;