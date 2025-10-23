create database ESTACIONA;

use ESTACIONA;

create table Cliente(
    cpf VARCHAR(14) NOT NULL PRIMARY KEY,
    nome VARCHAR(60),
    dtNasc DATE
);

create table Modelo(
    codMod INTEGER NOT NULL PRIMARY KEY,
    Desc_2 VARCHAR(40)
);

create table Veiculo(
    placa VARCHAR(8) NOT NULL PRIMARY KEY,
    Modelo_codMod INTEGER NOT NULL,
    Cliente_cpf VARCHAR(14) NOT NULL,
    cor VARCHAR(20),
    FOREIGN KEY (Modelo_codMod) references Modelo(codMod),
    FOREIGN KEY (Cliente_cpf) references Cliente(cpf)
);

create table Patio(
    num INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
    ender VARCHAR(40),
    capacidade INTEGER DEFAULT(1)
);

create table Estaciona(
    cod INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
    Patio_num INTEGER NOT NULL,
    Veiculo_placa VARCHAR(8) NOT NULL,
    dtEntrada VARCHAR(10),
    dtSaida VARCHAR(10),
    hsEntrada VARCHAR(10),
    hsSaida VARCHAR(10),
    FOREIGN KEY (Patio_num) references Patio(num),
    FOREIGN KEY (Veiculo_placa) references Veiculo(placa)
);

INSERT INTO Cliente (cpf, nome, dtNasc) VALUES
('123.456.789-00', 'Ana Beatriz Silva', '1995-03-12'),
('234.567.890-11', 'Bruno Henrique Costa', '1988-07-25'),
('345.678.901-22', 'Carla Mendes Oliveira', '2001-11-09'),
('456.789.012-33', 'Diego Souza Ramos', '1992-01-30'),
('567.890.123-44', 'Eduarda Lima Pereira', '1998-09-15'),
('678.901.234-55', 'Felipe Gonçalves Rocha', '1985-06-05'),
('789.012.345-66', 'Gabriela Martins Ferreira', '1990-02-21'),
('890.123.456-77', 'Henrique Alves Santos', '1999-12-18'),
('901.234.567-88', 'Isabela Duarte Nogueira', '2003-04-07'),
('012.345.678-99', 'João Pedro Almeida', '1994-10-29');

INSERT INTO Modelo (codMod, Desc_2) VALUES
(1, 'Fiat Strada'),
(2, 'Volkswagen Gol'),
(3, 'Chevrolet Onix'),
(4, 'Toyota Corolla'),
(5, 'Honda Civic'),
(6, 'Hyundai HB20'),
(7, 'Jeep Compass'),
(8, 'Renault Duster'),
(9, 'Ford Ranger'),
(10, 'Nissan Kicks');

INSERT INTO Veiculo ( placa, Modelo_codMod, Cliente_cpf, cor) VALUES
('ABC1A23', 1, '123.456.789-00', 'Prata'),
('BCD2B34', 2, '234.567.890-11', 'Branco'),
('CDE3C45', 3, '345.678.901-22', 'Preto'),
('DEF4D56', 4, '456.789.012-33', 'Cinza'),
('EFG5E67', 5, '567.890.123-44', 'Vermelho'),
('FGH6F78', 6, '678.901.234-55', 'Azul'),
('GHI7G89', 7, '789.012.345-66', 'Branco'),
('HIJ8H90', 8, '890.123.456-77', 'Verde'),
('IJK9I01', 9, '901.234.567-88', 'Preto'),
('JKL0J12', 10, '012.345.678-99', 'Prata');

INSERT INTO Patio (num, ender, capacidade) VALUES
(1, 'Rua das Flores, 120 - Centro', 10),
(2, 'Av. Brasil, 2350 - Jardim América', 25),
(3, 'Rua São Paulo, 45 - Industrial', 15),
(4, 'Av. Paraná, 980 - Zona Norte', 30),
(5, 'Rua das Acácias, 12 - Vila Nova', 5),
(6, 'Av. das Torres, 3100 - Aeroporto', 40),
(7, 'Rua Marechal Deodoro, 88 - Centro', 8),
(8, 'Av. Dom Pedro II, 1777 - Jardim Europa', 20),
(9, 'Rua XV de Novembro, 510 - Centro', 12),
(10, 'Av. Getúlio Vargas, 2220 - Santa Cruz', 18);

INSERT INTO Estaciona (cod, Patio_num, Veiculo_placa, dtEntrada, dtSaida, hsEntrada, hsSaida) 
VALUES (1, 1, 'ABC1A23', '2025-10-10', '2025-10-10', '08:30', '12:15'),
(2, 2, 'BCD2B34', '2025-10-11', '2025-10-11', '09:00', '14:45'),
(3, 3, 'CDE3C45', '2025-10-11', '2025-10-11', '07:50', '13:20'),
(4, 4, 'DEF4D56', '2025-10-12', '2025-10-12', '10:10', '16:30'),
(5, 5, 'EFG5E67', '2025-10-12', '2025-10-12', '08:00', '12:00'),
(6, 6, 'FGH6F78', '2025-10-13', '2025-10-13', '09:15', '11:45'),
(7, 7, 'GHI7G89', '2025-10-13', '2025-10-13', '13:00', '17:00'),
(8, 8, 'HIJ8H90', '2025-10-14', '2025-10-14', '08:40', '10:55'),
(9, 9, 'IJK9I01', '2025-10-14', '2025-10-14', '14:00', '18:30'),
(10, 10, 'JKL0J12', '2025-10-15', '2025-10-15', '07:30', '11:20');


1. Exiba a placa e o nome dos donos de todos os veículos. 
2. Exiba o CPF e o nome do cliente que possui o veículo de placa “FGH6F78”. 
3. Exiba a placa e a cor do veículo que possui o código de estacionamento 1. 
4. Exiba a placa do veículo que possui o código de estacionamento 1.
5. Exiba a placa, a descrição e modelo do veiculo. 
6. Exiba o endereço, a data de entrada e de saída dos estacionamentos do veículo de placa “HIJ8H90”. 
7. Exiba a quantidade de vezes que os veículos de cor verde estacionaram. 
8. Liste todos os clientes que possuem carro de modelo 1. 
9. Liste as placas, os horários de entrada e saída dos veículos de cor verde. 
10. Liste todos os estacionamentos do veículo de placa “JJJ-2020”. 
11. Exiba o nome do cliente que possui o veículo cujo código do estacionamento é 2. 
12. Exiba o CPF do cliente que possui o veículo cujo código do estacionamento é 3. 
13. Exiba a descrição do modelo do veículo cujo código do estacionamento é 2. 
14. Exiba a placa, o nome dos donos e a descrição dos os modelos de todos os veículos. 


1. Exiba a placa e o nome dos donos de todos os veículos.

SELECT 
    -- Veiculo.*,
    Veiculo.placa,
    Cliente.nome
FROM Veiculo
    JOIN Cliente ON Veiculo.Cliente_cpf = Cliente.cpf;

2. Exiba o CPF e o nome do cliente que possui o veículo de placa “FGH6F78”.
SELECT 
    Cliente.cpf, 
    Cliente.nome,
    Veiculo.placa
FROM Cliente
    JOIN Veiculo ON Cliente.cpf = Veiculo.cliente_cpf
WHERE Veiculo.placa = "FGH6F78";

--CURIOSIDADES
SELECT COUNT(*) FROM Veiculo;
SELECT SUM(Capacidade) FROM Patio;
SELECT AVG(Capacidade) FROM Patio;
SELECT MAX(Capacidade) FROM Patio;
SELECT MIN(Capacidade) FROM Patio;


ALTER TABLE Estaciona Modify dtEntrada DATE;
ALTER TABLE Estaciona Modify dtSaida DATE;
ALTER TABLE Estaciona Modify hsEntrada TIME;
ALTER TABLE Estaciona Modify hsSaida TIME;


SELECT 
    e.dtEntrada,
    e.dtSaida,
    (e.dtSaida - e.dtEntrada) as total_dias
FROM 
    Estaciona as e;


SELECT 
    e.hsEntrada,
    e.hsSaida,
    TIMEDIFF(hsSaida, hsEntrada) as total_horas
FROM estaciona as e;

SELECT 
    CONCAT(dtEntrada,' ', hsEntrada) as DATA_HORA_ENTRADA,
    CONCAT(dtSaida,' ', hsSaida) as DATA_HORA_SAIDA,
    DATEDIFF(CONCAT(dtSaida,' ', hsSaida), CONCAT(dtEntrada,' ', hsEntrada)) TOTAL_DIAS,
    TIMEDIFF(CONCAT(dtSaida,' ', hsSaida), CONCAT(dtEntrada,' ', hsEntrada)) TOTAL_HORAS
FROM ESTACIONA; 
----------

3. Exiba a placa e a cor do veículo que possui o código de estacionamento 1.

SELECT
	 ESTACIONA.VEICULO_PLACA,
	 VEICULO.COR
 FROM Estaciona
	 JOIN PATIO ON ESTACIONA.PATIO_NUM = PATIO.num
	 JOIN VEICULO ON ESTACIONA.VEICULO_PLACA = VEICULO.placa
	 WHERE ESTACIONA.PATIO_NUM = 1;
		  

 
 
