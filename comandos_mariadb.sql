COMANDOS PARA BANCO DE DADOS

MARIADB

--Logando no serviço MARIADB
MariaDB - u root -p



-- DML --
show
create
use
drop
--     --

--Listar todos os bancos (comandos DML)- DML são comandos estruturais do SQL
show databases;

--Criar um Banco de Dados (comandos DML)-
create database escola;

--Acessar um Banco de Dados (comandos DML)-
use escola;

--Visualizar tabelas em um Banco de Dados (comandos DML)- 
show tables;

--Visualizar tabelas em um Banco de Dados (comandos DML)- 
show tables;

--Destruir uma estrutura (comandos DML)-
drop database escola;
drop table alunos;

--Criar uma tabela (comandos DML)-
create table alunos(
 nome varchar(255),
 telefone varchar(16)
);

create table professores(
 nome varchar(255),
 email varchar(255),
 salario decimal(9,2)
);

--Criar uma tabela com um campo não nulo (comandos DML)-
create table alunos(
 nome varchar(255) not null,
 telefone varchar(16)
);

--Alterando um campo nulo para não nulo (comandos DML)-
update alunos set telefone = ""; -- primeiro esvaziar o campo telefone, pois ele está preenchido por NULL 
alter table alunos modify telefone(16) not null; -- em seguida, modificar o status NULL para NOT NULL


--Visualizar campos da tabela (comandos DML)-
desc alunos;



-- SQL --
insert
select
update
delete
--     --

--Inserir um novo registro em uma tabela (comandos SQL)- SQL são comando para dar manutenção ao Banco de Dados
insert into alunos(nome,telefone)
values("Leandro Dakel Cunha","55 46 9 99345444");

insert into alunos(nome,telefone)
values("José Carlos Prestes","55 46 9 99877678");

insert into professores(nome,email,salario)
values("Kevin Guimaraes","kevinguimaraes@gmail.com",3000.00);

insert into professores(nome,email,salario)
values("Guilherme Pires","guilhermepires@gmail.com",3000.00);

--Selecionar todos os registros em uma tabela (comandos SQL)-
select * from alunos;

--Filtrar uma pessoa (pode-se usar os operdores ">", "<", "<=", ">=", "<>") (comandos SQL)-
select * from professores where nome = "guilherme pires";

--Atualizar todos os registos da tabela indicados (comandos SQL)-
update professores set salario = 625.43; 

--Atualizar o registro especifico da tabela indicado (comandos SQL)-
update professores set salario = 625.43 where nome = "Guilherme Pires";
update professores set nome = 625.43 where nome = "Guilherme";
update professores set email = "guilherme@gmail.com" where nome = "Guilherme";

--Deletar um registro da tabela
delete from professores where nome = "Kevin Guimaraes";

--Adicionar campo à tabela (alterar a estrutura de uma tabela, incluindo um novo campo) (comandos DML) - 
alter table alunos add column RA varchar(5);
alter table professores add column Disciplina varchar(255);

--Atualizar o novo registro da tabela indicado (comandos SQL)-
update alunos set RA = 12345 where nome = "Leandro Dakel Cunha";
update alunos set RA = 54321 where nome = "José Carlos Prestes";

--Deletando um campo na tabela (alterar a estrutura de uma tabela, excluindo um campo existente) (comandos DML) -
alter table alunos drop column RA;

--Modificando um campo na tabela (neste caso, alterando o tipo da variável e a quantidade de caracteres) (comandos DML) -
alter table alunos modify column RA int(5);

--Altera o nome de um campo (comandos DML) -
alter table professores rename column Disciplina to Disciplina2;

--Altera o nome da tabela (comandos DML) -
rename table professores to professores2;

