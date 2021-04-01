/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package calculo_metricas;

import java.io.*;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Collections;

/**
 *
 * @author Giancarlo
 */
public class Grafo {

    private int[][] matAdjacencia;

    private int[][] matBinaria;

    private double[][] matInvertida;

    private double[][] matInvPasso;

    private double P = 1.5;  //transformar em um parametro na ferramenta (passo)

    private int[] vetGrau; //Vetor com o numero de arestas de cada vértice

    private int numVertices; //Numero de vértices do grafo

    private ArrayList listaVerticesDiametro; //ArrayList com os vértices envolvidos no diametro do GRAFO

    private ArrayList<Componente> listaComponentes = new ArrayList();

    private int[] visitados; //Array para controlar quais vertices foram visitados na busca em profundidade

    private double[] vetCloseness;//Array contendo closeness da galera

    private ArrayList<Integer> listaBuscaProfundidade = new ArrayList();
    ; //Lista com os nodos de uma componente (encontrados por meio da busca em prof)
        
        private int tamComponente; //NUMERO DE VERTICES EM UMA COMPONENTE

    Grafo(String nmArquivo) throws IOException {
        this.setNumVertices(nmArquivo);
        System.out.println(this.numVertices);
        matAdjacencia = new int[this.numVertices][this.numVertices];
        matBinaria = new int[this.numVertices][this.numVertices];
        matInvertida = new double[this.numVertices][this.numVertices];
        matInvPasso = new double[this.numVertices][this.numVertices];

        vetGrau = new int[this.numVertices];
        visitados = new int[this.numVertices];
        vetCloseness = new double[this.numVertices];

        for (int i = 0; i < numVertices; i++) {
            this.visitados[i] = 0;
            this.vetCloseness[i] = -111;
        }

        this.carregaMatriz(nmArquivo);
        this.inicializaGrau();
        this.geraComponentes();
    }

    /**
     * Função que carrega as matrizes. Inicializada dentro do construtor
     */
    private void carregaMatriz(String um_arquivo) throws IOException {
        System.out.println("CARREGANDO => " + um_arquivo);
        String[] vetorPartes = new String[numVertices];
        BufferedReader file = new BufferedReader(new FileReader(um_arquivo));
        String texto;
        int cont_linha = 0;
        int valor;

        while ((texto = file.readLine()) != null) {
            if (texto.contains(" ")) {
                vetorPartes = texto.split(" ");//quebra o texto em vetores                                                            
            }
            for (int y = 0; y < numVertices; y++) {
                valor = Integer.parseInt(vetorPartes[y]);
                matAdjacencia[cont_linha][y] = valor;
                //matAdjInvertida[cont_linha][y] = (valor==0) ? (valor) : (1.0/valor);
                if (valor != 0) {
                    this.matBinaria[cont_linha][y] = 1;
                    this.matInvertida[cont_linha][y] = (double) (1.0 / valor);
                    this.matInvPasso[cont_linha][y] = (double) (1.0 / valor) + this.P;
                } else {
                    this.matBinaria[cont_linha][y] = 0;
                    this.matInvertida[cont_linha][y] = 0;
                }
            }
            cont_linha++;
        }
    }

    /**
     * recebe como parametro um arquivo, e mostra a quantidade de linhas desse
     * arquivo Ela conta a linha 0 (zero) então o return precisa de 1 elemento a
     * mais! guj.com.br/java/92359-quantidade-de-linhas-de-um-arquivo
     */
    private void setNumVertices(String um_arquivo) throws IOException {
        File arquivoLeitura = new File(um_arquivo);
        LineNumberReader linhaLeitura = new LineNumberReader(new FileReader(arquivoLeitura));
        linhaLeitura.skip(arquivoLeitura.length());
        int qtdLinha = linhaLeitura.getLineNumber();
        numVertices = qtdLinha;
    }

    /**
     * FUNCAO TESTE USADA NO MAIN
     */
    public int getNumVertices() {
        return this.numVertices;
    }

    /**
     * FUNCAO TESTE USADA NO MAIN
     */
    public int[] getVisitados() {
        return this.visitados;
    }

    private void inicializaGrau() {
        int numeroVertices = 0;
        for (int i = 0; i < this.numVertices; i++) {
            for (int j = 0; j < this.numVertices; j++) {
                if (this.matAdjacencia[i][j] != 0) {
                    //System.out.println("in");
                    numeroVertices++;
                }
            }
            this.vetGrau[i] = numeroVertices;
            numeroVertices = 0;
        }
    }

    /**
     * Retorna o numero de arestas de um determinado vértice. Apartir de vetGrau
     *
     * @param vertice
     * @return 
     */
    public int getGrau(int vertice) {
        return this.vetGrau[vertice];
    }

    private void imprimeMatInt(int[][] matInt) {
        System.out.println("IMPRIMINDO MATRIZ ADJACENCIA");
        for (int x = 0; x < matInt.length; x++) {
            for (int y = 0; y < matInt.length; y++) {
                System.out.print(" ");
                System.out.print(" " + matInt[x][y]);
            }
            System.out.println("");
        }
    }

    private void imprimeMatDouble(double[][] matDouble) {
        System.out.println("IMPRIMINDO MATRIZ INVERTIDA");
        for (int x = 0; x < matDouble.length; x++) {
            for (int y = 0; y < matDouble.length; y++) {
                System.out.print(" ");
                System.out.print(" " + matDouble[x][y]);
            }
            System.out.println("");
        }
    }

    /**
     * Cada elemento do vetor é o pagerank do vértice corrspondente ao índice.
     * @return 
     */
    public double[] getPageRank() {
        System.out.println("=== PAGE RANK ===");
        double[] PR = new double[this.numVertices];    // PageRank atual
        double[] PRant = new double[this.numVertices]; // guardar o valor do PR(i) no vértice anterior
        double d = 0.85;
        double somatorio = 0.0;
        double ERRO = 0.01;
        int convergiu = 0;

        for (int i = 0; i < this.numVertices; i++) {//inicializar todos os nodos com 1
            PR[i] = 1.0;
            PRant[i] = 1.0;
        }

        while (convergiu != 1) {
            convergiu = 1;
            for (int linha = 0; linha < this.numVertices; linha++) {
                somatorio = 0;
                for (int coluna = 0; coluna < this.numVertices; coluna++) {
                    if (this.matAdjacencia[linha][coluna] != 0) {
                        somatorio = somatorio + PR[coluna] / this.getGrau(coluna);
                    }
                }
                PR[linha] = (1 - d) + d * somatorio;
                //System.out.println("PR["+linha+"] =  "+PR[linha]);
                if (Math.abs(PR[linha] - PRant[linha]) > ERRO) {
                    convergiu = 0;
                }
                PRant[linha] = PR[linha];

            }
        }
        return PR;
    }

    /**
     * Cada elemento do vetor é o coeficiente de agrupamento do vértice
     * corrspondente ao índice.
     */
    public double[] getClusterCoeficient() {
        System.out.println("=== Cluster Coeficient ===");
        double contVertices = 0;
        double triangulo = 0;
        double CC = 0;
        double[] clusterCoeficient = new double[this.numVertices];
        DecimalFormat MeuFormato = new DecimalFormat("0.00");

        for (int linha = 0; linha < this.numVertices; linha++) {
            for (int coluna = 0; coluna < this.numVertices; coluna++) {
                if (this.matAdjacencia[linha][coluna] != 0) { //se encontrar alguma ligação
                    contVertices++;
                    for (int i = 0; i < this.numVertices; i++) {// ir para a linha apontada
                        if ((this.matAdjacencia[linha][i] != 0) && (this.matAdjacencia[coluna][i] != 0)) {
                            triangulo++;
                        }
                    }
                }
            }
            if (contVertices > 1) {
                double k = (contVertices * (contVertices - 1));
                //System.out.println("CC ["+linha+"] = "+" "+triangulo+" / "+k+"           nmVert= "+contVertices);
                CC = triangulo / (k);
                clusterCoeficient[linha] = CC;//Double.parseDouble(MeuFormato.format(CC));

            }
            triangulo = 0;
            contVertices = 0;//reseta para calcular a proxima linha.
        }
        return clusterCoeficient;
    }

    /**
     * Retorna a razão entre o número de arestas e a quantidade máxima de
     * arestas.
     */
    public double getDensidade() {
        double densidade = 0;
        int numeroArestasExistentes = 0;
        DecimalFormat df = new DecimalFormat("0.000");

        double numeroArestasTotais = this.numVertices * (this.numVertices - 1);

        for (int i = 0; i < this.numVertices; i++) {
            numeroArestasExistentes = numeroArestasExistentes + this.getGrau(i);
        }
        System.out.println("ARESTAS NO GRAFO = " + numeroArestasExistentes);
        System.out.println("ARESTAS TOTAIS = " + numeroArestasTotais);

        densidade = (numeroArestasExistentes) / numeroArestasTotais;
        System.out.println("DENSIDADE = " + df.format(densidade));

        return densidade;
    }

    /**
     * Cada elemento do vetor é o betweenness do vértice corrspondente ao
     * índice.
     */
    //NAO FUNCIONA AINDA
    public double[] getBetweenness() {
        //http://docs.oracle.com/javase/6/docs/api/java/lang/Math.html
        double betweeness[] = new double[this.numVertices];
        int cont = 0;
        int totInfoCirculada = 0;
        for (int x = 0; x < this.numVertices; x++) {
            for (int i = 0; i < this.numVertices; i++) {
                for (int j = 0; j < this.numVertices; j++) {
                    /**
                     * if(this.predecessores[i][j] == x){ betweeness[x] =
                     * cont++; //System.out.println("elemento =
                     * "+this.predecessores[i][j]+" = "+x+" Cont= "+cont);
                            }
                     */
                }

            }
            cont = 0;
        }
        for (int i = 0; i < this.numVertices; i++) {
            for (int j = 0; j < this.numVertices; j++) {
                /**
                 * if(this.predecessores[i][j] != 0){ totInfoCirculada++;
                            }
                 */
            }
        }
        totInfoCirculada = totInfoCirculada / 2;
        System.out.println("TOT INFO " + totInfoCirculada);
        for (int i = 0; i < betweeness.length; i++) {
            //System.out.println("["+i+"] =  "+betweeness[i]+" / "+tot);
            betweeness[i] = betweeness[i] / totInfoCirculada;
            System.out.println("[" + i + "] = " + betweeness[i]);
        }
        return betweeness;
    }

    /**
     * Função que percorre a lista de componentes e imprime as componentes de um
     * grafo
     */
    public void imprimeListaComponentesGrafo() {
        System.out.println("------------ LISTA DE COMPONENTES -----------------");

        for (int i = 0; i < this.listaComponentes.size(); i++) {
            Componente um_comp = (Componente) this.listaComponentes.get(i);
            //um_comp.Diametro_Componente();//PROCURAR O DIAMETRO DA COMPONENTE
            System.out.println("COMPONENTE (" + i + ")  = " + um_comp.getVertices_Componente()); //RETORNAR O DIAMETRO DA COMPONENTE (MAPEADO MOTHERFUCKER)
            System.out.println("Vertices Diametro = " + um_comp.getVertices_Diametro());
            System.out.println("");
        }

        System.out.println("---------------------------------------------------");
    }

    public void fw() {

        for (int i = 0; i < this.listaComponentes.size(); i++) {
            Componente um_comp = (Componente) this.listaComponentes.get(i);
            System.out.println("Matriz do Componente");
            um_comp.imprimeMatDoComponente();

            System.out.println("------------ Floyd-Warshall -" + i + "----------------");
            um_comp.imprimeMatMenorCaminho();
            System.out.println("------------ Predecessor -----" + i + "------------");
            //um_comp.imprimeMatPredecessor();

        }

    }

    /**
     * Retornar o arraylist com os nodos envolvidos no diametro
     * @return 
     */
    public ArrayList<Integer> getDiametro() {
        Componente maiorComponente = this.maiorCompomente();

        //System.out.println("Maior Componente => "+maiorComponente.getVertices_Componente());
        //System.out.println("DIAMETRO DO GRAFO = "+maiorComponente.getVertices_Diametro());
        //System.out.println("");
        return maiorComponente.getVertices_Diametro();
    }

    /**
     * Retorna a componente resposável pela maior componente
     */
    private Componente maiorCompomente() {
        //Maior componente é o primeiro elemento da lista  de componentes

        int maior_tamanho = this.listaComponentes.get(0).tamanho_Componente();
        int[] maior_componente = new int[listaComponentes.size()];
        int cont = 0;
        maior_componente[cont] = 0;
        cont++;

        //Adiciona ao vetor os indices equivalente ao tamanho da componente
        //Observe que o for começa em 1 pois o elemento zero já está no vetor  
        for (int i = 1; i < this.listaComponentes.size(); i++) {
            int desafiante = this.listaComponentes.get(i).tamanho_Componente();

            if (desafiante > maior_tamanho) {
                maior_tamanho = desafiante;
                cont = 0;
                maior_componente[cont] = i;
                cont++;
            } // se as componentes forem do mesmo tamanho, o numero de vértices envolvido o diâmetro é quem irá desempatar
            else if (desafiante == maior_tamanho) {
                maior_componente[cont] = i;
                cont++;
            }

        }
        //sabe-se o tamanho da maior componente, agora é preciso descobrir como retornar o indice equivalente ??
        //System.out.println("tam desafiante = "+maior_componente);

        if (cont == 1) {
            return this.listaComponentes.get(maior_componente[0]);
        } else {
            int maiorDiametro = this.listaComponentes.get(maior_componente[0]).getVertices_Diametro().size();
            int diametroDesafiante;
            int indiceMaioral = 0;
            for (int i = 0; i < cont; i++) {
                diametroDesafiante = this.listaComponentes.get(maior_componente[i]).getVertices_Diametro().size();
                if (diametroDesafiante > maiorDiametro) {
                    maiorDiametro = diametroDesafiante;
                    indiceMaioral = i;
                }
            }
            return this.listaComponentes.get(maior_componente[indiceMaioral]);
        }
    }

    /**
     * Retorna a porcentagem de vértices que compõem a maior componente conexa.
     * @return 
     */
    public double getGiantComponent() {
        double giantComp;
        DecimalFormat df = new DecimalFormat("0.00");
        Componente maiorComponente = this.maiorCompomente();

        System.out.println("num Vertices Maior Componente = " + (double) maiorComponente.tamanho_Componente());
        System.out.println("num Vertices do Grafo = " + (double) this.numVertices);

        giantComp = (double) (maiorComponente.tamanho_Componente() / (double) this.numVertices);

        System.out.println("GC = " + maiorComponente.tamanho_Componente() + " / " + this.numVertices + " = " + df.format(giantComp));

        return giantComp;
    }

    /**
     * Aplica busca em profundidade nos vértices, e para cada componente
     * encontrada adiciona uma lista na listaComponentes OBSERVE QUE
     * INTERNAMENTE VÉRTICES ISOLADOS NAO SAO CONSIDERADOS COMPONENTES. Lembrar
     * que externamente ele é visto pela matriz de adjacencia
     */
    private void geraComponentes() {
        ArrayList<Integer> listaVertices_componente = new ArrayList();
        int[][] matAux;
        double[][] matPasso;
        //System.out.println("GERANDO COMPONETES...");                   
        for (int i = 0; i < visitados.length; i++) {
            if ((this.visitados[i] == 0) && (this.getGrau(i) > 0)) { //SE AINDA NÃO FOI VISITADO e Não é um vertice isolado

                listaVertices_componente = this.buscaProfundidade(i);

                //Ordenar a ordem dos vértices para que não seja enviado uma lista de nodos aleatorias (encontrada na DFS)
                Collections.sort(listaVertices_componente);

                matAux = this.montaMatriz(listaVertices_componente);
                matPasso = this.montaMatrizPasso(listaVertices_componente);

                Componente componente = new Componente(matAux, matPasso, listaVertices_componente, this.numVertices);

                this.listaComponentes.add(componente);
            }
            listaVertices_componente.clear();

        }
    }

    public ArrayList<Integer> buscaProfundidade(int vertice) {

        listaBuscaProfundidade.add(vertice);

        this.visitados[vertice] = 1;  // ja foi inicializado com 0 em td posiçao  

        for (int i = 0; i < this.numVertices; i++) {
            if (this.matAdjacencia[vertice][i] != 0 && visitados[i] == 0) {
                this.tamComponente++;
                buscaProfundidade(i);
            }
        }

        return listaBuscaProfundidade;
    }

    /**
     * Função que recebe uma lista de vértices, e monta a sua matriz BINÁRIA
     * equivalente
     * @param listaVertices
     * @return 
     */
    public int[][] montaMatriz(ArrayList<Integer> listaVertices) {
        int[][] matrizTransformer = new int[(int) listaVertices.size()][(int) listaVertices.size()];

        //System.out.println("-----MATRIZ MAIOR CLUSTER----");
        for (int i = 0; i < listaVertices.size(); i++) {
            for (int j = 0; j < listaVertices.size(); j++) {
                if (i == j) {
                    matrizTransformer[i][j] = this.matBinaria[(int) listaVertices.get(i)][(int) listaVertices.get(i)];
                } else {
                    matrizTransformer[i][j] = this.matBinaria[(int) listaVertices.get(i)][(int) listaVertices.get(j)];
                }
            }
        }

        return matrizTransformer;
    }

    public double[][] montaMatrizPasso(ArrayList<Integer> listaVertices) {
        double[][] matrizTransformerPasso = new double[(int) listaVertices.size()][(int) listaVertices.size()];

        //System.out.println("-----MATRIZ MAIOR CLUSTER----");
        for (int i = 0; i < listaVertices.size(); i++) {
            for (int j = 0; j < listaVertices.size(); j++) {
                if (i == j) {
                    matrizTransformerPasso[i][j] = this.matInvPasso[(int) listaVertices.get(i)][(int) listaVertices.get(i)];
                } else {
                    matrizTransformerPasso[i][j] = this.matInvPasso[(int) listaVertices.get(i)][(int) listaVertices.get(j)];
                }
            }
        }

        return matrizTransformerPasso;
    }

    public double[] getCloseness() {
        double[] vetClosenessAux = null;

        for (int i = 0; i < this.listaComponentes.size(); i++) {
            Componente uma_componente = this.listaComponentes.get(i);

            //vetClosenessAux = uma_componente.getCloseness_Componente(); //Closeness Real 
            vetClosenessAux = uma_componente.getCloseness_NORMALIZADO(); //Closeness invertido simples  1/NumPassos
            //vetClosenessAux = uma_componente.getCloseness_P(); //Closeness usando o P  (1/NumPassos)+P

            ArrayList<Integer> vertices = uma_componente.getVertices_Componente();//Colocar mapeado no vetor

            for (int j = 0; j < vetClosenessAux.length; j++) {
                int indice = vertices.get(j);
                this.vetCloseness[indice] = vetClosenessAux[j];
            }

        }

        return this.vetCloseness;

        /*for (int i = 0; i < vetCloseness.length; i++) {
                System.out.println("["+i+"] ="+vetCloseness[i]);
            }*/
    }
}
