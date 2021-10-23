Create database db_registro;

use db_registro;

create table tb_alunos(
	id bigint(4) auto_increment,
    nome varchar(50) not null,
	data_nascimento date ,
    email varchar(200) not null,
    nota float not null,
    
    primary key(id)
    
);
drop table tb_alunos;
insert into tb_alunos(nome, data_nascimento, email, nota)
		Value("Samanta Morales", "1999-05-28", "samanta123@gmail.com", "10"),
			 ("Lucas Benetti", "1980-02-05", "lucasbenetti@gmail.com","7"),
             ("Mauro Paixão", "1960-03-15",   "mpaixao@gmail.com", "3"),
             ("Andre Valadão", "1975-01-11","andrevaladao@gmail.com", "5"),
			 ("Tyler Posey", "1994-10-13","tylerposey@gmail.com", "8"),
             ("Anderson Lima", "1960-02-15",   "andersonlima@gmail.com", "9"),
             ("Sonia Valadão", "1975-11-15","soniav@gmail.com", "6"),
			 ("Ricardo Moura", "1970-03-10","ricardomoura@gmail.com", "10");
 
select id as "ID", nome as "Nome do aluno",date_format(data_nascimento, '%d/%m/%Y')  as "Data de Nascimento",
 email as "Email", nota as "Nota" from tb_alunos where nota >= 7;
 
 select id as "ID", nome as "Nome do aluno",date_format(data_nascimento, '%d/%m/%Y')  as "Data de Nascimento",
 email as "Email", nota as "Nota" from tb_alunos where nota < 7;
             
update tb_alunos set data_nascimento = "1990-12-04" where id = 4;

