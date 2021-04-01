
package calculo_metricas;

import configuracao.Configuracao;
import java.io.*;
import java.util.ArrayList;
import persistencia.ConexaoPostgreSQL;

/**
 *
 * @author Giancarlo
 */
public class MainCalculaMetricas {

    /**
     * @param args the command line arguments
     * @throws java.io.IOException
     */
    public static void main(String[] args) throws IOException {
        try {
            //String nmArquivo = "matrizGiantComponent.txt";
            String nmArquivo = "C3 Geral 2008.txt";

            ConexaoPostgreSQL conexao = new ConexaoPostgreSQL();
            String query;

            Grafo grafo = new Grafo(Configuracao.DIR_SERVER_DATA + nmArquivo);

            int nmVert = grafo.getNumVertices();

            ArrayList<Integer> diametro = grafo.getDiametro();

            //query="TRUNCATE versionado.diametro;";
            query = "DELETE FROM versionado.diametro where versao = (select atual from versao);";
            int i = 0;
            for (Integer vert : diametro) {
                query += "insert into versionado.diametro (posicao, membro, versao) VALUES(" + i + ", " + vert + ", (select atual from versao));";
                i++;
            }

            conexao.executeUpdate(query);

            query = "";

            double pageRank[] = grafo.getPageRank();
            double clusterCoefficient[] = grafo.getClusterCoeficient();
            double closeness[] = grafo.getCloseness();

            for (int a = 0; a < closeness.length; a++) {
                System.out.println(a);
                System.out.println(closeness[a]);
                System.out.println("");
            }

            for (i = 0; i < nmVert; i++) {
                query += "UPDATE versionado.membros SET pagerank="
                        + pageRank[i]
                        + ", cluster_coefficient=" + clusterCoefficient[i]
                        + ", grau=" + grafo.getGrau(i)
                        + ", closeness=" + closeness[i]
                        + " where id_membro=" + i + " and  "
                        + "versao = (select atual from versao);";
            }

            conexao.executeUpdate(query);

            Double GC = grafo.getGiantComponent();
            Double densidade = grafo.getDensidade();

            query = "TRUNCATE versionado.grafo;";
            query += "INSERT INTO versionado.grafo (id, giant_component,densidade, versao) VALUES (1, " + GC + ", " + densidade + ", (select atual from versao));";

            conexao.executeUpdate(query);

            conexao.close();
        } catch (IOException ex) {
            System.out.println("Nao Foi possivel ler o arquivo");
        }

        System.out.println("FINAL DO ARQUIVO");
    }
}
