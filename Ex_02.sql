-- RESOLUÇÃO DO EXERCICIO 2 --

CREATE DATABASE ESTACIONAMENTO;

CREATE TABLE Cliente(
 cpf INT PRIMARY KEY NOT NULL,
 nome VARCHAR(60) NOT NULL,
 dtNasc DATE NOT NULL
 );
 
 CREATE TABLE Modelo(
 codMod INT PRIMARY KEY NOT NULL,
 Desc_2 VARCHAR(40) NOT NULL
 );

CREATE TABLE Patio(
 num INT PRIMARY KEY NOT NULL,
 ender VARCHAR(40) NOT NULL,
 capacidade INT NOT NULL
 );

CREATE TABLE Veiculo(
 placa VARCHAR(8) PRIMARY KEY NOT NULL,
 Modelo_codMod INT NOT NULL,
 Cliente_cpf INT NOT NULL,
 cor VARCHAR(20) NOT NULL,
 FOREIGN KEY (Cliente_cpf) REFERENCES Cliente(cpf),
 FOREIGN KEY (Modelo_codMod) REFERENCES Modelo(codMod)
 );
 
 CREATE TABLE Estaciona(
 cod INT PRIMARY KEY NOT NULL,
 Patio_num INT NOT NULL,
 Veiculo_placa VARCHAR(8) NOT NULL,
 dtEntrada VARCHAR(10) NOT NULL,
 dtSaida VARCHAR(10) NOT NULL,
 hsEntrada VARCHAR(10) NOT NULL,
 hsSaida VARCHAR(10) NOT NULL,
 FOREIGN KEY (Patio_num) REFERENCES Patio(num),
 FOREIGN KEY (Veiculo_placa) REFERENCES Veiculo(placa)
 );
 
INSERT INTO Cliente(cpf,nome,dtNasc)
	values(12345678900,"Leonardo Farias",1990),
		  (12345678912,"Marcos Tostes",1984);

		  

 
 
