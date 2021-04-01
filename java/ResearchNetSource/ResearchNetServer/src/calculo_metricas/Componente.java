package calculo_metricas;

import java.util.ArrayList;
import java.util.Collections;

/**
 *
 * @author Giancarlo
 */
public class Componente {


	private int tamComponente; // Representa o numero de vertices da maior componente;

	private int origemMaiorelemento; //Valor que guarda a origem do elemento no menor caminho;

        public static final int infinito = 9999; //Valor utilizado para mostrar que não existe ligação entre vertices, usada nas matrizes de FW e PRED;

	private int n; //é chamada N pois é a mesma notação do livro do cormen, N = numero de linhas da matriz.
        
        private int[] vetArestasComponente;
        
	private int[] vetMapeamento; // Array para saber qual a real posição da componente no grafo 'geral';

	private int[][] matAdjacencia; //Matriz correspondente ao componente;

        private double[][] matInv_P;
        
	private int[][] matMenorCaminho;//Matriz de menores caminhos EM NUMERO DE PASSOS (é BINARIA)
        
        private int[][] matPredecessores; //Matriz que mostra qual o 'caminho' encontrado no menor caminho;        
        
        private ArrayList <Integer>listaVerticesDiametro = new ArrayList(); //Lista de vértices que compõem o diâmetro;
        
        private ArrayList <Integer>listaVerticesCloseness = new ArrayList(); // Lista com os vértices envolvidos no momento com o closeness

        private ArrayList <Integer>verticesDaComponente = new ArrayList(); //
        
        private int origemMaiorDistancia;
        private int destinoMaiorDistancia;
    
        
        private double[][] mat_normal;  //Matriz utilizada com os valores normalizados  eZ. 1/(somatório do menor caminho)
        private double[] closeness;
        private int numVerticesGrafo;
        private int[][] matPredecessores_P;
        private final double[][] matMenorCaminho_P;
    
        
        
        Componente(int[][] uma_matriz, double[][] mat_com_P, ArrayList <Integer>vertices_da_matriz, int numVerticesGrafo) {
            this.tamComponente = uma_matriz.length;
            this.matAdjacencia = uma_matriz;
            this.matInv_P = mat_com_P;
            
            
            this.n = uma_matriz.length;//PRECISA? Não!  Esta aqui somente pela notação do cormen
            this.vetArestasComponente = new int[this.tamComponente];
            this.vetMapeamento = new int[this.tamComponente];
            this.closeness = new double[this.tamComponente];
            this.numVerticesGrafo = numVerticesGrafo;
            
            mat_normal = new double[this.tamComponente][this.tamComponente];
            
            inicializaGrau_Componente();
            inicializaMapeamento(vertices_da_matriz);
            
            this.matMenorCaminho = this.floydWarshall(); // inicializar as matrizes
            this.matMenorCaminho_P = floydWarshall_P();
            Inicializa_Diametro_Componente();
        }
        /**
	 * Retorna um inteiro informando o numero de vértices da componente
	 */
	public int tamanho_Componente() {
		return this.tamComponente;
	}
	/**
	 * Numero de arestas de cada vértice. É utilizada para calcular o N da matriz (FW) e a densidade da componente
	 */
        private int getGrau_Componente(int vertice){
            return this.vetArestasComponente[vertice];
        }

	private void inicializaGrau_Componente() {
            int num_arestas = 0;
            for (int i = 0; i < this.tamComponente; i++) {
                for (int j = 0; j < this.tamComponente; j++) {
                    if(matAdjacencia[i][j] != 0){
                        num_arestas ++;
                    }
                }
                this.vetArestasComponente[i] = num_arestas;
                num_arestas = 0;
            }
        }
        
        /**
         * Função que recebe a lista de vertices da componente e faz o mapeamento dos vértices
         */
        private void inicializaMapeamento(ArrayList <Integer>vertices_da_matriz){
            for (int i = 0; i < vertices_da_matriz.size(); i++) {
               this.vetMapeamento[i] = (int)vertices_da_matriz.get(i);
               this.verticesDaComponente.add((int)vertices_da_matriz.get(i));
            }
        }
        
	/**
	 * Retorna a razão entre o número de arestas e a quantidade máxima de arestas.
	 */
	public double densidade_Componente() {
	        double densidade = 0;
                int numeroArestasExistentes = 0;
                double numeroArestasTotais = this.tamComponente * (this.tamComponente -1 );

                for (int i=0; i<this.tamComponente; i++) {
                    numeroArestasExistentes = numeroArestasExistentes +getGrau_Componente(i);
                }
                System.out.println("ARESTAS NO GRAFO = "+numeroArestasExistentes);
                System.out.println("ARESTAS TOTAIS = "+numeroArestasTotais);

                densidade = (numeroArestasExistentes)/numeroArestasTotais;
                System.out.println("DENSIDADE = "+densidade);

                return densidade;		
	}
        
	/**
	 * Algoritmo te floyd warshall... Retorna uma matriz com o menor caminho em um grafo e monta a matriz de predecessores para determinar os vertices encontrados.
	 */
	private int[][] floydWarshall() {
            int[][] matFloydWarshall = new int[n][n];
            int[][] matGambi = new int[n][n];
            int nill = -1;

            //Inicialização da matriz
            for(int i =0; i<n; i++){
                for(int j=0; j<n; j++){
                   if(i == j){ // diagonal principal
                       matFloydWarshall[i][j] = 0;
                       matGambi[i][j] = nill;
                   }
                   else if((this.matAdjacencia[i][j] == 0)){//Não existe ligação, inicializa com infinito(FW) e nill (predecessores)
                       matFloydWarshall[i][j] = infinito;
                       matGambi[i][j] = nill;
                   }
                   else{//Copia a matriz recebida por parametro e joga na matriz de FW
                       matFloydWarshall[i][j] = this.matAdjacencia[i][j];
                       matGambi[i][j] = i;
                   }
                }
            }
            
            //Algoritmo em sí
            for(int k=0; k<n; k++){
                //imprimir matriz
                for (int i=0; i<n; i++) {
                      for (int j=0; j<n; j++) {
                          if(matFloydWarshall[i][j] > matFloydWarshall[i][k]+matFloydWarshall[k][j]){
                                matGambi[i][j] = matGambi[k][j];
                                matFloydWarshall[i][j] = matFloydWarshall[i][k]+matFloydWarshall[k][j];                
                                //imprimir k,i,j, elem[[i][j], min(emeAnt, ik+kj)
                                //System.out.println("Iteracao = "+k+"  linha i = "+i+" coluna j"+j+" || Elemento = "+matFloydWarshall[i][j]+" min( "+matFloydWarshall[i][k]+" + "+matFloydWarshall[k][j]+")");
                          }
                      }
                }
            }
            //Substituir o valor de infinito por 0
            for(int x=0; x<n; x++){
                for(int y=0; y<n; y++){
                    if((matFloydWarshall[x][y] == infinito) || (matGambi[x][y] == nill)){
                        matFloydWarshall[x][y] = -1;
                        matGambi[x][y] = -1;
                        if(matFloydWarshall[x][y] == -1 && x != y){
                            matFloydWarshall[x][y] = 0;
                        }
                    }
                }
            }
            
            this.matPredecessores = matGambi;
            return matFloydWarshall;
            
        }
        
	/**
	 * Algoritmo te floyd warshall... 
         * Trabalha/Retorna uma matriz de DOUBLE e inicializa a matriz de predecessores 
         */
        private double[][] floydWarshall_P() {
            double[][] matFloydWarshall = new double[n][n];
            int[][] matGambi = new int[n][n];
            int nill = -1;

            //Inicialização da matriz
            for(int i =0; i<n; i++){
                for(int j=0; j<n; j++){
                   if(i == j){ // diagonal principal
                       matFloydWarshall[i][j] = 0;
                       matGambi[i][j] = nill;
                   }
                   else if((this.matInv_P[i][j] == 0)){//Não existe ligação, inicializa com infinito(FW) e nill (predecessores)
                       matFloydWarshall[i][j] = infinito;
                       matGambi[i][j] = nill;
                   }
                   else{//Copia a matriz recebida por parametro e joga na matriz de FW
                       matFloydWarshall[i][j] = this.matInv_P[i][j];
                       matGambi[i][j] = i;
                   }
                }
            }
            
            //Algoritmo em sí
            for(int k=0; k<n; k++){
                //imprimir matriz
                for (int i=0; i<n; i++) {
                      for (int j=0; j<n; j++) {
                          if(matFloydWarshall[i][j] > matFloydWarshall[i][k]+matFloydWarshall[k][j]){
                                matGambi[i][j] = matGambi[k][j];
                                matFloydWarshall[i][j] = matFloydWarshall[i][k]+matFloydWarshall[k][j];                
                                //imprimir k,i,j, elem[[i][j], min(emeAnt, ik+kj)
                                //System.out.println("Iteracao = "+k+"  linha i = "+i+" coluna j"+j+" || Elemento = "+matFloydWarshall[i][j]+" min( "+matFloydWarshall[i][k]+" + "+matFloydWarshall[k][j]+")");
                          }
                      }
                }
            }
            //Substituir o valor de infinito por 0
            for(int x=0; x<n; x++){
                for(int y=0; y<n; y++){
                    if((matFloydWarshall[x][y] == infinito) || (matGambi[x][y] == nill)){
                        matFloydWarshall[x][y] = -1;
                        matGambi[x][y] = -1;
                        if(matFloydWarshall[x][y] == -1 && x != y){
                            matFloydWarshall[x][y] = 0;
                        }
                    }
                }
            }
            
            this.matPredecessores_P = matGambi;
            return matFloydWarshall;
            
        }
        
        
        public int[][] getMenorCaminho(){
            return this.matMenorCaminho;
        }
        
        public int[][] getMatPredecessor(){
            return this.matPredecessores;
        }

                    /**
                     * função de TESTE para saber se o menor caminho foi encontrado com êxito
                     */
                    public void imprimeMatMenorCaminho() {
                            for(int x=0; x<this.tamComponente; x++){
                                System.out.print("["+x+"] ");
                                if(x <=9){
                                    System.out.print(" ");
                                }
                                for(int y=0; y<this.matMenorCaminho.length; y++){
                                    System.out.print(" ");
                                    System.out.print("  "+this.matMenorCaminho[x][y]+"  ");
                                }
                                System.out.println("");
                            }        
                    }
                    
                    public void imprimeMatMenorCaminhoInvertido() {
                            for(int x=0; x<this.tamComponente; x++){
                                System.out.print("["+x+"] ");
                                if(x <=9){
                                    System.out.print(" ");
                                }
                                for(int y=0; y<this.matMenorCaminho_P.length; y++){
                                    System.out.print(" ");
                                    System.out.print("  "+this.matMenorCaminho_P[x][y]+"  ");
                                }
                                System.out.println("");
                            }        
                    }

                    public void imprimeMatPredecessor() {
                            for(int x=0; x<this.tamComponente; x++){
                                System.out.print("["+x+"] ");
                                if(x <=9){
                                    System.out.print(" ");
                                }
                                for(int y=0; y<this.matPredecessores.length; y++){
                                    System.out.print(" ");
                                    System.out.print("  "+this.matPredecessores[x][y]+"  ");
                                }
                                System.out.println("");
                            }        
                    }
        
                    public void imprimeMatDoComponente(){
                        System.out.println("IMPRIMINDO MATRIZ ADJACENCIA");
                        for(int x=0; x< this.tamComponente; x++){
                            for(int y=0; y< this.tamComponente; y++){
                                    System.out.print(" ");
                                    System.out.print(" "+this.matAdjacencia[x][y]);
                            }
                            System.out.println("");
                        }        
                    }
                    public void imprimeMatInvertidaDoComponente(){
                        System.out.println("IMPRIMINDO MATRIZ ADJACENCIA");
                        for(int x=0; x< this.tamComponente; x++){
                            for(int y=0; y< this.tamComponente; y++){
                                    System.out.print(" ");
                                    System.out.print(" "+this.matInv_P[x][y]);
                            }
                            System.out.println("");
                        }        
                    }
        
        /**
         * Função que dado os vértices mais distantes de um grafo/componente, percorre a matriz de predecessores mostrando qual é
         * o caminho percorrido, adicionando primeiro o destino e vindo até o inicio. (faltando colocar a origem)
         */
        private ArrayList <Integer>CaminhamentoSemOrigem(int origem, int destino){
            if(this.matPredecessores[origem][destino] == origem ){
                this.listaVerticesDiametro.add(destino);
                return this.listaVerticesDiametro;
            }
            else if(this.matPredecessores[origem][destino] == -1){
                this.listaVerticesDiametro.add(-1);
                return this.listaVerticesDiametro;
            }
            this.listaVerticesDiametro.add(destino);               
            int novocaminho = this.matPredecessores[origem][destino];
            CaminhamentoSemOrigem(origem, novocaminho);

            return listaVerticesDiametro;
        }

        private void CaminhamentoCompleto(int origem, int destino){
            this.CaminhamentoSemOrigem(origem,destino);
            listaVerticesDiametro.add(origem);
        }   
        
        /**
         * Função que percorre a matriz de menor caminho e encotra a maior distância entre dois vértices
         * em número de passos  
         * é GUARDADO A ORIGEM E O DESTINO PARA PERCORRER A MATRIZ DE PREDECESSORES
         * 
         */
        private void Inicializa_Diametro_Componente(){
            int maiorElemento = 0;
            for(int x=0; x< this.tamComponente; x++){
                for(int y=0; y< this.tamComponente; y++){
                    if(this.matMenorCaminho[x][y] > maiorElemento){
                        maiorElemento = this.matMenorCaminho[x][y];
                        this.origemMaiorDistancia = x;
                        this.destinoMaiorDistancia = y;
                    }
                }
            }
            //O TRECHO A CIMA ENCONTRA A MAIOR DISTANCIA EM UM GRAFO/COMPONENTE, ARMAZENANDO QUAIS OS VÉRTICES ENVOLVIDOS
            
            //Após encontrar a maior distância, chama a função de caminhamento e mostra os vértices
            //System.out.println("MOSTRANDO CAMINHO DO MAIOR ELEMENTO");
            //System.out.println("ORIGEM = " +this.origemMaiorDistancia+ " DESTINO = " +this.destinoMaiorDistancia);
            this.CaminhamentoCompleto(this.origemMaiorDistancia, this.destinoMaiorDistancia);                       
        }
        
        /**
         * Em caso de empate de tamanho de componentes, esta função é utilizada para desempate 
         */
        public int getTotalVertices_Diametro(){
            return this.listaVerticesDiametro.size();
        }
        
	/**
	 * Lembrar de retornar MAPEADO
	 */
	public ArrayList <Integer>getVertices_Diametro() {
            ArrayList <Integer>listaMapeada = new ArrayList();    
            for (int i = 0; i < listaVerticesDiametro.size(); i++) {
                listaMapeada.add(this.vetMapeamento[(int)this.listaVerticesDiametro.get(i)]);
            }
            //Collections.sort(listaMapeada); // ORDENAR A LISTA ANTES DE RETORNAR
            return listaMapeada;
	}
   
        
        public ArrayList <Integer>getVertices_Componente(){
            Collections.sort(verticesDaComponente);
            return verticesDaComponente;
        }

        
        /**
	 * Percorre a matriz de menor caminho da componente (mat de inteiro) 
         * e para cada linha soma os custos, guarda em um vetor onde o indice é o vértice, a razão 1/soma_custos
     * @return 
	 */
        public double[] getCloseness_Componente(){
            double farness = 0;
            System.out.println("MAT. COMPONENTE");
            this.imprimeMatDoComponente();
            System.out.println("");
            System.out.println("------------------");
            System.out.println("MENOR CAMINHO");
            this.imprimeMatMenorCaminho();
            System.out.println("------------------");
            for (int i = 0; i < this.matMenorCaminho.length; i++) {
                farness = 0;                
                for (int j = 0; j < matMenorCaminho.length; j++) {
                    if(this.matMenorCaminho[i][j] > 0){
                        farness = farness + this.matMenorCaminho[i][j];
                    }
                }
                double valor = 1/farness;
                
                this.closeness[i] = valor;    
            }
            return this.closeness;
        }
               
        
        /**
	 * Percorre a matriz de menor caminho da componente (mat de DOUBLE'mat+P') 
         * e para cada linha soma os custos, guarda em um vetor onde o indice é o vértice, a razão 1/soma_custos
	 */        
        public double[] getCloseness_P(){
            double farness = 0;
            System.out.println("MAT. COMPONENTE");
            this.imprimeMatDoComponente();
            System.out.println("");
            System.out.println("------------------");
            System.out.println("MAT. INVERTIDA COMPONENTE");
            this.imprimeMatInvertidaDoComponente();
            System.out.println("");
            System.out.println("------------------");
            System.out.println("MENOR CAMINHO (MAT INVERTIDO)");
            this.imprimeMatMenorCaminhoInvertido();
            System.out.println("------------------");
            for (int i = 0; i < this.matMenorCaminho.length; i++) {
                farness = 0;                
                for (int j = 0; j < matMenorCaminho.length; j++) {
                    if(this.matMenorCaminho_P[i][j] > 0){
                        farness = farness + this.matMenorCaminho_P[i][j];
                    }
                }
                double valor = 1/farness;
                
                this.closeness[i] = valor;    
            }
            return this.closeness;
        }
        
        
         /**
	 * 1º - Monta uma nova matriz, Percorrendo a matriz de menor caminho da componente (mat de inteiro) 
         * e para cada valor encontrado faz uma normalização -> mat_normal[i][j] = 1/(double)matMenorCaminho[i][j];
         * 
         * 2º - Para essa nova matriz normalizada, para cada linha é feito um somatório e dividido pelo número de vértices DO GRAFO-1
	 */       
        public double[] getCloseness_NORMALIZADO(){
            //percorre a matriz da componente e criar a nova matriz normalizada
            double valor =0;
            for (int i = 0; i < this.matMenorCaminho.length; i++) {             
                for (int j = 0; j < matMenorCaminho.length; j++) {
                    if(this.matMenorCaminho[i][j] > 0){
                        mat_normal[i][j] = 1/(double)matMenorCaminho[i][j];
                    }
                    else{
                        mat_normal[i][i] = (double)matMenorCaminho[i][j];
                    }
                }         
            }
            imprimeMATNORMAL();
            double farness = 0;
            
            for (int i = 0; i < mat_normal.length; i++) {
                farness =  0;
                for (int j = 0; j < mat_normal.length; j++) {
                    if(this.matMenorCaminho[i][j] > 0){
                        farness = farness + mat_normal[i][j];
                    }
               }
               int numvert = numVerticesGrafo - 1;
               double valor1 = farness/numvert;
               
               this.closeness[i] = valor1;
            }
            return this.closeness;
        }
 
        
                    public void imprimeMATNORMAL(){
                        System.out.println("IMPRIMINDO MATRIZ NORMALIZADA");
                        for(int x=0; x< this.tamComponente; x++){
                            for(int y=0; y< this.tamComponente; y++){
                                    System.out.print(" ");
                                    System.out.print(" "+this.mat_normal[x][y]);
                            }
                            System.out.println("");
                        }        
                    }
        
        
}
