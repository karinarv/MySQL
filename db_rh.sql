Create database db_rh;

use db_rh;

# Criei 6 atributos ao invés de 5

create table tb_funcionaries(
	id_funcionarie bigint(4) auto_increment,
    nome varchar(50) not null,
	data_nascimento date,
    cpf varchar(20) not null,
    cargo varchar(50) not null,
    salario float not null,
    
    primary key(id_funcionarie)
    
);

insert into tb_funcionaries(nome, data_nascimento, cpf, cargo, salario)
		Value("Karina Ricioni", "1999-05-28", "192.343.211-52", "Estagiária", "700"),
			 ("Regina Benetti", "1980-02-05", "573.597.343-21","Desenvolvedora Júnior", "1500"),
             ("Luiz Paixão", "1960-03-15",   "375.910.234-32", "Gerente de Projetos", "5700"),
             ("Daniela Valadão", "1975-01-11","819.274.321-08", "Recursos Humanos","3400"),
			 ("Dylan Posey", "1994-10-13","890.334.601-08", "Administrador","1500");
 
select id_funcionarie as "ID", nome as "Nome Funcionarie", date_format(data_nascimento, '%d/%m/%Y') as "Data de Nascimento", cpf as "CPF" , 
cargo as "Cargo", salario as "Salario" from tb_funcionaries where salario >= 2000;

select id_funcionarie as "ID", nome as "Nome Funcionarie", date_format(data_nascimento, '%d/%m/%Y') as "Data de Nascimento", cpf as "CPF" , 
cargo as "Cargo", salario as "Salario" from tb_funcionaries where salario < 2000;

update tb_funcionaries set nome = "Douglas Lima" where id_funcionarie = 3;

