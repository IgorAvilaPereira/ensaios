/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.util.ArrayList;


/**
 *
 * @author iapereira
 */
public class A {
    public int i;    
    public double variable;
    public double function;
    // α i j is the normalising constant for the message qi → j ( xi ) .
    public static final double alpha = 1.0;
    public int graph[][];

    public A(int i) {
        this.i = i;
    }
    
    //M i is set of function indexes, indicating which function nodes are connected to variable node x i .
    public ArrayList<Integer> m(){
        ArrayList<Integer> vetM = new ArrayList();
        for (int j = 0; j < graph.length; j++) {
            if (graph[this.i][j] == 1){
                vetM.add(j);
            }
        }
        return vetM;        
    }
    
     public ArrayList<Integer> mij(A j){
        ArrayList<Integer> vetMi = this.m();
        ArrayList<Integer> vetMj = new ArrayList();
        vetMj.add(j.i);
//        ArrayList<Integer> vetMi = new ArrayList();
//        vetMi.add(1);
//        vetMi.add(2);
//        vetMi.add(3);
//        vetMi.add(4);
//        ArrayList<Integer> vetMj = new ArrayList();
//        vetMj.add(3);
//        vetMj.add(4);
//        vetMj.add(5);
//        vetMj.add(6);        
        ArrayList<Integer> vet = new ArrayList();
        boolean add;
         for (int k = 0; k < vetMi.size(); k++) {
             Integer xi = vetMi.get(k);
             add = true;
             for (int l = 0; l < vetMj.size(); l++) {
                 Integer xj = vetMj.get(l);
                 if (xj.intValue() == xi.intValue()){
                       add = false;
                 }
             }
             if (add){
                 vet.add(xi);
             }
         }
         return vet;  
    }
    
    
    // N j is the set of variable indexes, indicating which variable nodes are connected to function node Fj x j \ xi ≡ { x k : k ∈ N j \ i } .
    public ArrayList<Integer> n(A j){
        ArrayList<Integer> vetMi = this.m();
        ArrayList<Integer> vetMj = j.m();
//        ArrayList<Integer> vetMi = new ArrayList();
//        vetMi.add(1);
//        vetMi.add(2);
//        vetMi.add(3);
//        vetMi.add(4);
//        ArrayList<Integer> vetMj = new ArrayList();
//        vetMj.add(3);
//        vetMj.add(4);
//        vetMj.add(5);
//        vetMj.add(6);        
        ArrayList<Integer> vet = new ArrayList();
        boolean add;
         for (int k = 0; k < vetMi.size(); k++) {
             Integer xi = vetMi.get(k);
             add = true;
             for (int l = 0; l < vetMj.size(); l++) {
                 Integer xj = vetMj.get(l);
                 if (xj.intValue() == xi.intValue()){
                       add = false;
                 }
             }
             if (add){
                 vet.add(xi);
             }
         }
         return vet;        
    }
     
     
//     
//     //ex: q_{3 -> 2} == x3 -> u2
//    public double variableToFunction(A j) {
//        double result = 0.0;
//        ArrayList<Integer> vet = this.n(j);
//        for (int k = 0; k < vet.size(); k++) {
//            Integer aux = vet.get(k);
//            result+= functionToVariable()
//            
//        }
//    }
}