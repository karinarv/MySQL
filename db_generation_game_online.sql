create database db_generation_game_online;

use db_generation_game_online;

-- O Jogo irá trabalhar com duas Tabelas (Personagem e classe)

-- Primeira tabela classe trabalha com o serviço do game (3 atributos)
-- Popular com 5 dados

create table tb_classes(
	id_classe bigint(3) primary key  auto_increment,
    tipo varchar(30),   -- Classificação geral das 17 personalidades - guardiões / artesãos / racionais / idealista
    nivel varchar(100) not null,  -- nivel iniciante, intermediário, avançado
    vida varchar(30) not null  -- Trabalho, Lazer, Descanso, Estudo
);
insert into tb_classes(tipo, nivel, vida)
values("Racionais", "Intermediario", "Trabalho"),
	  ("Idealistas", "Intermediario", "Estudo"),
      ("Artesão", "Avançado", "Descanso"),
      ("Guardiões", "Avançado", "Lazer"),
      ("Artesão", "Iniciante", "Estudo");

-- Seguda tabela personagem trabalha com os funcionários do game (5 atributos) + chave estrangeira
-- Popular com 8 dados

create table tb_personagem(
	id_personagens bigint(4) primary key auto_increment,
    nome varchar(30) not null,
    idade int(30), 
    sexo varchar(20), 
    profissao varchar(50) not null, 
    hobby varchar(30),
    fk_classes bigint(2),
    foreign key(fk_classes) references tb_classes(id_classe)
);

insert into tb_personagem (nome, idade, sexo, profissao, hobby, fk_classes)
value ("Karina", "22", "F", "Cientista da Computação", "Musicista", "2"),
	  ("João", "32", "M", "Engenheiro Eletrônico", "Cantor", "1"),
      ("Maria", "28", "F", "Letras", "Escritora", "4"),
      ("Tyler", "24", "M", "Cientista da Computação", "Fotografo", "3"),
      ("Bruna", "27", "F", "Jornalista", "Cantora", "5"),
      ("Leonardo", "35", "M", "Publicitário", "Lutador", "3"),
      ("Emily", "23", "F", "Publicitária", "Musicista", "2"),
      ("Robson", "30", "F", "Administrador", "Nadador", "5");
      
	
