#include <stdio.h>
#include <stdlib.h>
#include <libpq-fe.h>

int main() {
	// Variáveis
    int codigo = 0;
	char produto[15];
    int quantidade = 0;
    double preco = 0.0;
	PGresult *res = NULL;
	
    // String de conexão — ajuste os dados conforme seu banco
    const char *conninfo = "host=localhost port=5432 dbname=estoque user=postgres password=123456";

    // Conecta ao banco
    PGconn *conn = PQconnectdb(conninfo);

    // Verifica se a conexão deu certo
    if (PQstatus(conn) != CONNECTION_OK) {
        fprintf(stderr, "Erro de conexão: %s\n", PQerrorMessage(conn));
        PQfinish(conn);
        return 1;
    }

    printf("Conectado ao banco com sucesso!\n");

	printf("Informe o codigo: ");
	scanf("%d",&codigo);
	printf("Informe o nome: ");
	scanf("%s",produto);
	printf("Informe a quantidade: ");
	scanf("%d",&quantidade);
	printf("Informe o valor: ");
	scanf("%lf",&preco);
	
    char *sql = malloc(256 * sizeof(char));
	
	sprintf(sql,"INSERT INTO estoque (cod, descricao, quantidade, preco) VALUES ('%d','%s', %d, %2.lf);", codigo, produto, quantidade, preco); 
    res = PQexec(conn, sql);

    if (PQresultStatus(res) != PGRES_COMMAND_OK) {
        fprintf(stderr, "Erro no INSERT: %s\n", PQerrorMessage(conn));
        PQclear(res);
        PQfinish(conn);
        return 1;
    }

    printf("Insercao realizada com sucesso!\n");
	free(sql);
    PQclear(res);
    PQfinish(conn);
    return 0;
}	