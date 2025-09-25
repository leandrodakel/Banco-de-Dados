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

--Criando tabela com chave primaria (comandos DML) -
create table alunos(
 id int not null primary key,
 nome varchar(255) not null
 );
 
 --Atualizando informações por meio do ID--
 insert into alunos(id,nome) values(1,"Leandro");
 insert into alunos(id,nome) values(2,"Leandro");
 update alunos set nome = "Leonardo" where id = 2;
 
--Criando tabela com chave primaria com auto incremento(comandos DML) -
create table alunos(
 id int not null primary key auto_increment,
 nome varchar(255) not null
 );
 
--Inserir um novo registro em uma tabela com o ID com auto incremento--
 insert into alunos(id,nome) values(null,"Leandro");
 insert into alunos(id,nome) values(null,"Jose");
 insert into alunos(nome) values("Maria");

--Incluir uma coluna na tabela para informacao booleana--
alter table alunos add column ativo boolean not null default(true);
 
--Inserir um novo registro em uma tabela com informacao booleana ativada automaticamente--
insert into alunos(nome,ativo) values("Leandro", false);
insert into alunos(nome) values("Jorge");


--site para programacao--
https://www.w3schools.com/


--Incluir uma coluna na tabela para informacao automatica (serve para qualquer campo)--
alter table alunos add column ra varchar(100) not null default ("Sem Registro");

update alunos set ra = "123" where id = 1;
update alunos set ra = "124" where id = 2;
update alunos set ra = "125" where id = 3;
update alunos set ra = "126" where id = 4;
update alunos set ra = "127" where id = 5;
insert alunos(nome) values("Loreni"); --Loreni sera adicionada com o campo denominado 'Sem Registro' automaticamente no campo 'ra'--

--Exibir lista em forma crescente--
select * from alunos order by nome;

--Exibir lista em forma 'decrescente'--
select * from alunos order by ra desc;

--Exibir filtragem especifica--
select * from alunos where nome = "Leandro";

--Exibir filtragem selecionada--
select * from alunos where nome like "J%";--exibirá os nomes de Jorge e Jose (pois tem 'J' no comeco)--
select * from alunos where nome like "%o";--exibirá os nomes de Leandro e Ricardo (pois tem 'o' no fim)--
select * from alunos where nome like "%a%";--exibirá os nomes de Leandro, Ricardo e Maria(pois tem 'a' em alguma posição na palavra)--

--Exibir filtragem selecionada com dupla especificacao--
select * from alunos where nome like "%a%" and ativo = 1;--exibira os nomes que tem 'A' no meio e os registros ativos-- 
select * from alunos where nome like "J%" or nome like "L%";--exibira os nome que comecam com 'J' e terminam com 'L'--
select * from alunos where not nome like "%J%";--nao exibira os nomes que tem o J--

--Inserindo coluna com o tipo DATE e inserindo registro--
alter table alunos add column data_nsc date;
insert into alunos(nome,data_nsc) values("Gabriel","2001-03-25");

--Inserir datas de nascimentos--
update alunos
set data_nsc = case id
when 1 then '1995-05-23'
when 2 then '1998-05-03'
when 3 then '1997-05-12'
when 4 then '2000-05-30'
when 5 then '1995-05-23'
when 6 then '1997-05-07'
when 7 then '1995-06-15'
end
where id in (1,2,3,4,5,6,7);

--Exibir lista a partir das pessoas mais velhas--
select * from alunos where data_nsc is not null order by data_nsc asc;

--Exibir a pessoa mais velha--
select * from alunos where data_nsc is not null order by data_nsc asc limit 1;


datetime