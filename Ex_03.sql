CREATE DATABASE ESCOLA;

use ESCOLA;

CREATE TABLE ALUNO(
    RA VARCHAR(6) NOT NULL PRIMARY KEY,
    NOME VARCHAR(100) NOT NULL,
    NASCIMENTO DATE NOT NULL
);

CREATE TABLE CURSO(
    CODIGO INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    NOME VARCHAR(100) NOT NULL,
    CH INT NOT NULL,
    INICIO DATE NOT NULL,
    TERMINO DATE NOT NULL
);

CREATE TABLE MATRICULA(
    CURSO INT NOT NULL,
    RA VARCHAR(6) NOT NULL,
    DATA DATE NOT NULL,
    VALOR DECIMAL(9, 2) NOT NULL,
    FOREIGN KEY (CURSO) REFERENCES CURSO(CODIGO),
    FOREIGN KEY (RA) REFERENCES ALUNO(RA)
);

INSERT INTO ALUNO VALUES("123456","Ana","1972-01-10"),
						("123457","Bianca","1973-02-11"),
						("123458","Carla","1987-12-12"),
						("123459","Danilo","1990-10-02"),
						("123460","Eliana","1987-01-01");

INSERT INTO CURSO VALUES(1,"java",360,"2007-12-01","2008-10-10"),
						(2,"auto cad",60,"2008-01-10","2008-05-10"),
						(3,"php",90,"2008-02-15","2008-07-10"),
						(4,"redes",60,"2008-01-20","2008-03-20");

INSERT INTO MATRICULA VALUES(1,"123456","2007-09-10",100.00),
							 (3,"123456","2007-10-01",60.00),
							 (1,"123457","2007-09-01",100.00),
							 (2,"123458","2007-01-11",50.00),
							 (2,"123459","2007-07-20",50.00),
							 (1,"123460","2007-08-10",80.00);

1. Listar RA, nome do aluno e nome do curso em que o aluno está matriculado.

SELECT
	 MATRICULA.RA,
	 ALUNO.NOME AS NOME_ALUNO,
	 CURSO.NOME AS NOME_CURSO
 FROM MATRICULA
	 JOIN ALUNO ON MATRICULA.RA = ALUNO.RA
	 JOIN CURSO ON MATRICULA.CURSO = CURSO.CODIGO;

2. Listar RA, nome do aluno e nome do curso em que o aluno está matriculado.

SELECT
	 MATRICULA.RA,
	 ALUNO.NOME AS NOME_ALUNO,
	 CURSO.NOME AS NOME_CURSO
 FROM MATRICULA
	 JOIN ALUNO ON MATRICULA.RA = ALUNO.RA
	 JOIN CURSO ON MATRICULA.CURSO = CURSO.CODIGO
 ORDER BY CURSO.NOME;

3. Exibir o nome de cada curso que teve matriculas e quantos alunos estão matriculados
em cada um deles (obs. usar apelido para o campo do número de alunos).

--ORDENADO POR NOME DO CURSO(CRESCENTE)
SELECT
     CURSO.NOME,
     COUNT(MATRICULA.RA) AS total_alunos
  FROM CURSO
  JOIN MATRICULA ON CURSO.CODIGO = MATRICULA.CURSO
  GROUP BY CURSO.NOME;
	 
--ORDENADO POR QTDE DE ALUNOS (DECRESCENTE)
 SELECT
     CURSO.NOME,
	 COUNT(*) AS total_alunos
 FROM MATRICULA
 JOIN CURSO ON MATRICULA.CURSO =  CURSO.CODIGO
 GROUP BY MATRICULA.CURSO;
 
 4. Exibir o nome do todos os cursos e quantos alunos tem matriculados em cada um
 (obs. caso algum curso nao tenha matriculas exibir numero de alunos = 0).

 SELECT
    CURSO.NOME,
    COUNT(MATRICULA.RA) AS numero_de_alunos
 FROM CURSO
 LEFT JOIN MATRICULA ON CURSO.CODIGO = MATRICULA.CURSO
 GROUP BY CURSO.NOME;

5. Exibir o nome do curso e do valor total recebido das matriculas em cada dia

--IGNORANDO OS CURSOS SEM VALOR
SELECT
 CURSO.NOME,
 SUM(MATRICULA.VALOR)
 FROM CURSO
 JOIN MATRICULA
 ON CURSO.CODIGO = MATRICULA.CURSO
 GROUP BY CURSO.NOME;
 
 --INCLUINDO OS CURSOS DE VALOR NULL (USANDO LEFT, POIS SE REFERE À COLUNA ANTERIORMENTE MENCIONADA)
 SELECT
  CURSO.NOME,
  SUM(MATRICULA.VALOR)
  FROM  MATRICULA
  RIGHT JOIN CURSO
  ON MATRICULA.CURSO = CURSO.CODIGO
  GROUP BY CURSO.NOME;
  
  --INCLUINDO OS CURSOS DE VALOR NULL (USANDO RIGHT, POIS SE REFERE À COLUNA POSTERIORMENTE MENCIONADA)
  SELECT
  CURSO.NOME,
  SUM(MATRICULA.VALOR)
  FROM CURSO
  LEFT JOIN MATRICULA
  ON CURSO.CODIGO = MATRICULA.CURSO
  GROUP BY CURSO.NOME;
 
 --TRANSFORMANDO O NULL EM UMA INFORMACAO DESEJADA (NO CASO, "0")
 SELECT
  CURSO.NOME,
  COALESCE(SUM(MATRICULA.VALOR), 0) AS TOTAL_VALOR
  FROM CURSO
  LEFT JOIN MATRICULA
  ON CURSO.CODIGO = MATRICULA.CURSO
  GROUP BY CURSO.NOME;
 
 
6. Exibir o nome do curso, o valor total recebido das matriculas em cada um deles
 e o total arrecadado em matriculas da escola
 
 SELECT
  CURSO.NOME,
  SUM(MATRICULA.VALOR) AS VALOR_TOTAL_CURSO,
  (SELECT SUM(VALOR) FROM MATRICULA) AS VALOR_TOTAL_ESCOLA
  FROM CURSO
  LEFT JOIN MATRICULA
  ON CURSO.CODIGO = MATRICULA.CURSO
  GROUP BY CURSO.NOME;

7. Exibir o valor médio pago na matricula na escola. Chamar a coluna que exibirá
a média de valor médio e seu conteúdo deve ser exibido com 2 casas decimais

SELECT
 ROUND(AVG(VALOR), 2) AS valor_medio
 FROM
 MATRICULA;
 

8. Exibir o nome e o valor médio de matricula de cada curso. Chamar a coluna que
exibirá a média de valor médio e seu conteudo exibido em 2 casas decimais

--SELECIONA TODOS OS CURSOS, COMO PEDE O ENUNCIADO, ARRENDONDANDO OS
--RESULTADOS DE DIZIMAS PERIÓDICAS COM O ROUND
SELECT
  CURSO.NOME,
  ROUND(AVG(MATRICULA.VALOR), 2) AS valor_medio_TOTAL,
  (SELECT ROUND(AVG(VALOR), 2) FROM MATRICULA) AS valor_medio_escola
    FROM CURSO
    JOIN MATRICULA ON CURSO.CODIGO = MATRICULA.CURSO
    GROUP BY CURSO.NOME;

--SELECIONA TODOS OS CURSOS, COMO PEDE O ENUNCIADO, MANTENDO OS
--RESULTADOS DE DIZIMAS PERIÓDICAS SEM ARREDONDAR COM O TRUNCATE
SELECT
  CURSO.NOME,
  TRUNCATE(AVG(MATRICULA.VALOR), 2) AS valor_medio_TOTAL,
  (SELECT ROUND(AVG(VALOR), 2) FROM MATRICULA) AS valor_medio_escola
    FROM CURSO
    JOIN MATRICULA ON CURSO.CODIGO = MATRICULA.CURSO
    GROUP BY CURSO.NOME;

--SELECIONA E ORDENA APENAS UM CURSO
SELECT
  CURSO.NOME,
  ROUND(AVG(MATRICULA.VALOR), 2) AS valor_medio_TOTAL,
  (SELECT ROUND(AVG(VALOR), 2) FROM MATRICULA) AS valor_medio_escola
    FROM CURSO
    JOIN MATRICULA ON CURSO.CODIGO = MATRICULA.CURSO
    WHERE CURSO.CODIGO = 1
    GROUP BY CURSO.NOME;
	
9. Exibir o nome dos cursos que não são VIP (ou seja, que tenha pelo menos 2 alunos)
e a quantidade de alunos matriculados em cada um deles

SELECT
     CURSO.NOME,
     COUNT(MATRICULA.RA) AS total_alunos
   FROM CURSO
   JOIN MATRICULA ON CURSO.CODIGO = MATRICULA.CURSO
   GROUP BY CURSO.NOME
   HAVING COUNT(MATRICULA.RA) >= 2;

10. Exiba o nome dos cursos com mesma carga horaria do curso de autocad

--EXIBE O NOME DOS CURSOS INCLUINDO "AUTO CAD"
SELECT
     NOME
     FROM CURSO
     WHERE CH = (SELECT CH FROM CURSO WHERE NOME = 'auto cad');

--EXIBE O NOME DOS CURSOS EXCLUINDO "AUTO CAD"
SELECT
     NOME
     FROM CURSO
     WHERE CH = (SELECT CH FROM CURSO WHERE NOME = 'auto cad')
	 AND NOME <> 'auto cad';

11. Exiba o nome de todos os alunos que fazem
aniversário no mesmo mês que a Ana

SELECT
     NOME
     FROM ALUNO
     WHERE MONTH(NASCIMENTO) = (SELECT MONTH(NASCIMENTO) FROM ALUNO WHERE NOME = 'ANA')
	 AND NOME <> 'ANA';

12. Exiba todos os cursos com inicio em janiero de
2008 que tenham alunos matriculados

SELECT
	 NOME NOME_DO_CURSO
	 FROM curso C
	 INNER JOIN MATRICULA M ON C.CODIGO = M.curso
	 WHERE INICIO >= "2008-01-01"
	 AND INICIO < "2008-01-31"
	 GROUP BY C.NOME;
 

13. Exiba todos os cursos com inicio em janeiro
de 2008 independente de ter alunos matriculadosou não

SELECT
	 NOME NOME_DO_CURSO
	 FROM curso C
	 LEFT JOIN MATRICULA M ON C.CODIGO = M.curso
	 WHERE INICIO >= "2008-01-01"
	 AND INICIO < "2008-01-31"
	 GROUP BY C.NOME;

14. Exiba o nome do aluno e do curso de todos os
alunos que fizeram matricula antes da data de
inicio do curso no quel se matriculou
pois este ganharão um brinde
(observe que a Carla se matriculou no curso
de autocad após o inicio do curso, portanto ela
não foi listada e não recebeu o brinde)

SELECT 
	 A.NOME ALUNO, C.NOME CURSO, C.INICIO, M.DATA
	 FROM MATRICULA M
	 JOIN ALUNO A ON M.RA = A.RA
	 JOIN CURSO C ON M.CURSO = C.CODIGO
	 WHERE M.DATA < C.INICIO; 
	 
15. Listar os cursos que ainda não iniciaram

SELECT
	 NOME
	 FROM CURSO C
	 WHERE INICIO < "2025-10-24";


16. Listar os alunos que fizeram matricula
de sabado pois eles tambem receberão brindes

--USANDO FUNÇÃO DAYNAME()
SELECT
	 A.NOME NOME_ALUNO
	 FROM MATRICULA M
	 JOIN ALUNO A ON M.RA = A.RA
	 WHERE DAYNAME(DATA) = "SATURDAY";

--USANDO FUNÇÃO DAYOFWEEK()
SELECT
	 A.NOME NOME_ALUNO
	 FROM MATRICULA M
	 JOIN ALUNO A ON M.RA = A.RA
	 WHERE DAYOFWEEK(DATA) = "7";

17. Os alunos que fizeram matricula de sabado
receberão 50% do valor pago na MATRICULA de volta,
para incentivar essa pratica de se matricular em
cursos no plantão. Exibir o nome do aluno e o 
valor a restituir(apelidar a coluna com este
nome, e exibir o valor com duas casas decimais)

SELECT
	 A.NOME NOME_ALUNO,
	 ROUND((M.VALOR - (M.VALOR * 0.5)), 2) VALOR_RESTITUICAO
	 FROM MATRICULA M
	 JOIN ALUNO A ON M.RA = A.RA
	 WHERE DAYOFWEEK(DATA) = "7";

18.Exibir o nome e a idade dos alunos

SELECT
	 NOME,
	 TIMESTAMPDIFF(YEAR, nascimento, CURDATE()) idade
	 FROM ALUNO;

19. Listar o nome dos cursos e a duração em meses
de cada um

SELECT
	 NOME,
	 TIMESTAMPDIFF(MONTH, INICIO, TERMINO)  DURACAO_MESES
	 FROM CURSO;


 



 
