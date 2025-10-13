#include <stdio.h>
#include <stdlib.h>
#include <libpq-fe.h>

int main() {
    // String de conexão — ajuste os dados conforme seu banco
    const char *conninfo = "host=localhost port=5432 dbname=estoque user=postgres password=123456";

    // Conecta ao banco
    PGconn *conn = PQconnectdb(conninfo);

    // Verifica se a conexão deu certo
    if (PQstatus(conn) != CONNECTION_OK) {
        fprintf(stderr, "Erro de conexao: %s\n", PQerrorMessage(conn));
        PQfinish(conn);
        return 1;
    }

    printf("Conectado ao banco com sucesso!\n");

    // Executa uma consulta simples
    PGresult *res = PQexec(conn, "SELECT * FROM estoque;");
	
    
	if (PQresultStatus(res) != PGRES_TUPLES_OK) {
        fprintf(stderr, "Erro na consulta: %s\n", PQerrorMessage(conn));
        PQclear(res);
        PQfinish(conn);
        return 1;
    }


    // Exibe o resultado da consulta
	printf("====================================================================\n");
	printf("|     COD        |    DESCRICAO   |   QUANTIDADE   |     PRECO     |\n");
	printf("====================================================================\n");
	for(int i = 0; i < 2; i++)
	{
		for(int k = 0; k < 4; k++)
		{
			printf("|%15s|",PQgetvalue(res, i, k));
		}
		printf("\n");
	}
	printf("====================================================================\n");
    

    // Libera os resultados e encerra
    PQclear(res);
    PQfinish(conn);
    return 0;
}	