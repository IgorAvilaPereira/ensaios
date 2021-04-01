/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package presentation;

import java.util.ArrayList;
import java.util.List;
import model.A;

/**
 *
 * @author iapereira
 */
public class Main {

    
//    public double functionToVariable(int m, int n) {
//        double result = 0.0;
////        for (int i = 0; i < SIZE; i++) {
////            Object get = lst.get(i);
////            
////        }
//        return result;
//    }

//    public List<Integer> neighboring(Node node){
//        List<Integer> neigh = new ArrayList();
//        for (int i = 0; i < SIZE; i++) {            
//            if (graph[node.id][i] != -1){
//                neigh.add((i));
//            }
//        }
//        return neigh;        
//    }
//    public void maxsum(Node n){
//        List<Integer> neighboring = this.neighboring(n);
//        int terminationCondition = 3;
//        int aux = 0;
//        boolean variableNode = true;
//        while(aux < terminationCondition){
//            aux++;
//            // collection messages from N_{n}
//            for (Integer nLinha : neighboring) {
////                if (n instanceof VariableNode){;
////                     produces messages m_{n'}
////                        using messages from N_{n} \ {n'}
////                     //variableToFunction(n, nLinha);
////                }                
////                 if (n instanceof FunctionNode){;
////                      produces messages m_{n'}
////                        using constraint and messages from N_{n} \ {n'}
////                }
////                send m_{n'} to n'
//            }
//        }
//    }
    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        int graph[][] = {{-1, 1, -1}, {1, -1, 1}, {-1, 1, -1}};
       
        A a0 = new A(0);
        a0.graph = graph;
        a0.variable = 0;
        a0.function = 0;
        A a1 = new A(1);
        a1.graph = graph;
        a1.variable = 1;
        a1.function = 1;
        A a2 = new A(2);
        a2.graph = graph;
        a2.variable = 2;
        a2.function = 2;
        
        /*
        ArrayList<Integer> vetM1 = a3.m(graph);
        for (int i = 0; i < vetM1.size(); i++) {
            Integer m = vetM1.get(i);
            System.out.println("m:"+m.intValue());
        }*/
        
//        ArrayList<Integer> vetN = a1.n(a0);
//        for (int i = 0; i < vetN.size(); i++) {
//            Integer x = vetN.get(i);            
//            System.out.println(x.intValue());
//        }
//     



    }
    
    void maxsum(A n){
        double Q[] = new double[3];
        double R[] = new double[3];
        int condition = 2;
        while (condition > 0){
            for (int i = 0; j < Ni.size(); i++){
                r = computeMessageToVariable()
            }
            condition--;
        }
    }

}
