/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package negocio;

/**
 *
 * @author iapereira
 */
public class Matematica {
    
    public int adicao(int x, int y){
        return x+y;
    }
    public int multiplicacao(int x, int y){
        return x*y;
    }
    
    public int divisao(int x, int y){
        return x/y;
    }
    
    public int fatorial(int x){
        if (x == 0 || x == 1){
            return 1;
        }
        return x * fatorial(x-1);
    }
    
}
