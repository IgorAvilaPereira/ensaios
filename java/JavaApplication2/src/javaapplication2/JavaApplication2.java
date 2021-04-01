/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package javaapplication2;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/**
 *
 * @author iapereira
 */
public class JavaApplication2 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        List<Integer> elementos = new ArrayList<Integer>();
        for (int i = 0; i < 16; i++) {
            elementos.add(i);
        }
        
        
        
//        for (int i = 0; i < elementos.size(); i++) {
//            System.out.println(elementos.get(i));
//        }
        Collections.shuffle(elementos);
        for (int i = 0; i < 16; i++) {
            System.out.println(elementos.get(i));
        }
//        Collections.shuffle(elementos);
/*
        double[][] elementosEstadoInicial0 = {{0,0,0},{0,0,0},{0,0,0}};
        double[][] elementosEstadoInicial4x4 = {{0,0,0,0},{0,0,0,0},{0,0,0,0},{0,0,0,0}};
//        double[][] elementosEstadoInicial0;
        int numEstados = 0;
        while(numEstados < 5) {
        int k =0;
            while (k<elementos.size()) {
                for (int i = 0; i < 4; i++) {
                    for (int j = 0; j < 4; j++) {
                        elementosEstadoInicial4x4[i][j] = elementos.get(k);
                        k++;
                    }                
                }            
            }
            
            Estado estadoInicial0 = new Estado(elementosEstadoInicial4x4);
            System.out.println("Estado "+(numEstados+1));
            estadoInicial0.imprimeQuadroEstado();
            
            numEstados++;
            Collections.shuffle(elementos);
        }*/
    }
    
}
