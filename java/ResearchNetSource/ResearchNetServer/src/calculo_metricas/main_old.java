/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package calculo_metricas;
import java.io.*;
import java.text.DecimalFormat;

/**
 *
 * @author Giancarlo
 */
public class main_old {

    /**
     * @param args the command line arguments
     * @throws java.io.IOException
     */
    public static void main(String[] args) throws IOException {
        try {
            //String nmArquivo = "matrizGiantComponent.txt";
            //String nmArquivo = "matrizDeAdjacencia.txt";
            
            
            String nmArquivo = "matrizClosenessSite.txt";
            
            
            //String nmArquivo = "closeness1.txt";
            //String nmArquivo = "closeness2.txt"; 
            //String nmArquivo = "closeness3.txt";
            //String nmArquivo = "closeness4.txt";
            //String nmArquivo = "ComponenteEmLinha.txt";
            
            
            
            
            //String nmArquivo = "matrizTesteEmpateDiametro.txt";
            //String nmArquivo = "metricasTesteBetw.txt";
            //String nmArquivo = "matriz usada no seminario.txt";
            
            //String nmArquivo = "exemploFW.txt";
            
            Grafo grafo = new Grafo(nmArquivo);
            int nmVert = grafo.getNumVertices();//USADO PARA TESTE
            DecimalFormat df = new DecimalFormat("0.00");
            
            
            grafo.imprimeListaComponentesGrafo();
            
            System.out.println("");
            System.out.println("");
            System.out.println("=======================================");
            grafo.getCloseness();
            System.out.println("");
            System.out.println("");
            System.out.println("=======================================");
            //System.out.println("PAGE RANK");
            //double PR[] = grafo.getPageRank();
            
            for (int i = 0; i < nmVert; i++) {
                //System.out.println("Nodo ["+i+"]  ="+grafo.getGrau(i));
                //totVert = totVert + grafo.getGrau(i);
                //System.out.println("Nodo ["+i+"]  ="+df.format(PR[i]));
                //System.out.println("Nodo ["+i+"]  ="+df.format(CC[i]));
            }
            //System.out.println("TOT VERT = "+totVert);
        }
        catch (IOException ex) {
            System.out.println("Nao Foi possivel ler o arquivo");
        }
        
        System.out.println("FINAL DO ARQUIVO");
    }
}
