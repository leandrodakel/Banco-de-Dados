--Criação e Estrutura do Banco:

	--1 - Acesse o MariaDB usando o usuário root.
	R: mariadb -u root -p
	
	--2 - Liste todos os bancos de dados existentes.
	R: show databases;
	
	--3 - Crie um banco de dados chamado LOJA_VIRTUAL.
	R: create database LOJA_VIRTUAL;
	
	--4 - Acesse o banco LOJA_VIRTUAL.
	R: use LOJA_VIRTUAL
	
	--5 - Crie uma tabela CLIENTES com os campos:
	R: create table CLIENTES(...
			
	--6 - NOME_COMPLETO (VARCHAR 200, obrigatório)
	R: ... NOME_COMPLETO varchar(200) not null, ...
	
	--7 - CELULAR (VARCHAR 20, opcional)
	R: ... celular varchar(20)
		);
	
	--8 - Crie uma tabela PRODUTOS com os campos:
	R: create table PRODUTOS(...
	
	--9 - NOME (VARCHAR 150, obrigatório)
	R: ... NOME varchar(150) not null, ...
	
	--10 - CATEGORIA (VARCHAR 100, obrigatório)
	R: ... CATEGORIA varchar(100) not null, ...
	
	--11 - PRECO (DECIMAL 10,2, obrigatório)
	R: ... PRECO decimal(10,2) not null
		);
	
	--12 - Liste todas as tabelas criadas no banco.
	R: show tables;
	
	--13 - Mostre a estrutura das tabelas CLIENTES e PRODUTOS.
	R: desc CLIENTES;
	R: desc PRODUTOS;


Inserção e Consulta de Dados

	--14 - Insira 3 clientes na tabela CLIENTES.
	R:
	
	insert into CLIENTES(NOME_COMPLETO,CELULAR)
	values("Jonas Madureira","55 46 9 99345444");

	insert into CLIENTES(NOME_COMPLETO,CELULAR)
	values("José Carlos Ramos","55 46 9 99877678");
	
	insert into CLIENTES(NOME_COMPLETO,CELULAR)
	values("Wilson Sarli","55 46 9 99877678");
	
	--15 - Insira 3 produtos na tabela PRODUTOS.
	R:
	
	insert into PRODUTOS(NOME,CATEGORIA,PRECO)
	values("Notebook Acer","Eletronicos",3000.00),
		  ("Camiseta Nike","Roupas",99.90),
		  ("Iogurte Nestle","Comida",5.50);
	
	--16 - Mostre todos os registros da tabela CLIENTES.
	R: select * from CLIENTES;
	-- exemplo adicional (select NOME_COMPLETO from CLIENTES;) neste caso, apenas a coluna NOME_COMPLETO será exibida
	
	--17 - Mostre todos os registros da tabela PRODUTOS.
	R: select * from PRODUTOS;
	-- exemplo adicional (select NOME, PRECO from PRODUTOS;) neste caso, apenas as colunas NOME E PRECO serão exibidas
	
	--18 - Mostre apenas os produtos com preço maior que 500.00.
	R: select * from PRODUTOS where PRECO < 500.00;
	-- exemplo adicional (select * from PRODUTOS where PRECO > 100 and PRECO < 400;) neste caso, apenas os preços entre 100 e 400 serão exibidos
	
	
	--19 - Mostre apenas os clientes cujo nome seja igual a um nome específico.
	R: select * from CLIENTES where NOME_COMPLETO = "Wilson Sarli";
	-- exemplo adicional -- select * from CLIENTES where NOME_COMPLETO = "Wilson Sarli" or "Jonas Madureira";--


Atualização de Dados

	--20 - Atualize o celular de um cliente específico.
	R: update CLIENTES set CELULAR = "55 46 9 99878880" where NOME_COMPLETO = "Jose Carlos Ramos";
	
	--21 - Atualize a categoria de um produto específico.
	R: update PRODUTOS set CATEGORIA = "Lacteos" where NOME = "Iogurte Nestle";
	-- exemplo adicional -- update PRODUTOS set CATEGORIA = "Alimentos" where CATEGORIA = "Comida"; --
	
	--22 - Aumente o preço de um produto em 15%.
	R: update PRODUTOS set PRECO = 114.88  where NOME = "Camiseta Nike";
	
	-- exemplo adicional -- select PRECO as PRECO_ATUAL,(PRECO + (PRECO * 0.15) as NOVO_PRECO from PRODUTOS; -- simula como ficaria o desconto
	-- exemplo adicional -- update PRODUTOS set (PRECO = PRECO + (PRECO * 0.15)); -- 
	
	
	--23 - Altere o nome de um cliente para outro nome.
	R: update CLIENTES set NOME_COMPLETO = "Wilson Carlos Ramos" where NOME_COMPLETO = "Jose Carlos Ramos";
	

Exclusão de Dados
	--24 - Exclua um cliente específico da tabela CLIENTES.
	R: delete from CLIENTES where NOME_COMPLETO = "Jonas Madureira";
	
	--25 - Exclua um produto específico da tabela PRODUTOS.
	R: delete from PRODUTOS where NOME = "Notebook Acer";
	
	--26 - Exclua todos os registros da tabela CLIENTES (sem apagar a tabela).
	R: delete from CLIENTES;
	

Alterações na Estrutura das Tabelas
	
	--27 - Adicione um novo campo CPF (VARCHAR 14) na tabela CLIENTES.
	R: alter table CLIENTES add column CPF varchar(14);
	
	--28 - Atualize os valores de CPF para os clientes existentes.
	R: 	
	update CLIENTES set CPF = "098.765.432-10" where NOME_COMPLETO = "Wilson Sarli";
	update CLIENTES set CPF = "890.567.234-01" where NOME_COMPLETO = "Jose Carlos Ramos";
	update CLIENTES set CPF = "555.444.333-22" where NOME_COMPLETO = "Jonas Madureira";
	
	--29 - Modifique o tipo do campo CPF para CHAR(11).
	R: alter table CLIENTES modify column CPF CHAR(11);
	
	--30 - Apague o campo CPF da tabela CLIENTES.
	R: alter table CLIENTES drop column CPF;
	
	--31 - Adicione um campo ESTOQUE (INT) na tabela PRODUTOS.
	R: alter table PRODUTOS add column ESTOQUE INT;
	-- exemplo adicional -- alter table PRODUTOS add ESTOQUE INT(4); -- a palavra 'column' não é necessaria no comando
	
	--32 - Liste novamente as tabelas para confirmar a alteração do nome.
	R: 
	desc CLIENTES;
	desc PRODUTOS;