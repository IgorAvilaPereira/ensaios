/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.util.Calendar;

/**
 *
 * @author iapereira
 */
public class Regular implements Promocao {

    @Override
    public double descontar() {
        //  Calendar calendar = new Calendar();
        Calendar calendario = Calendar.getInstance();
        double desconto = 0;
        //System.out.println("Set:"+calendario.get(Calendar.MONTH));
        switch(calendario.get(Calendar.MONTH)){ 
            case 0:
                desconto = 0.85;
            break;
            case 1:
                desconto = 0.8;
            break; 
            case 2:
                desconto = 0.8;
            break; 
            case 3:
                desconto = 0.8;
            break; 
            case 4:
                desconto = 0.8;
            break; 
            case 5:
                desconto = 0.8;
            break; 
            case 6:
                desconto = 0.8;
            break;
            case 7:
                desconto = 0.8;
            break;
            case 8:
                //System.out.println("caiu aqui....");
                desconto = 0.8;
            break;
            case 9:
                desconto = 0.8;
            break;
            case 10:
                desconto = 0.8;
            break; 
            case 11:
                desconto = 0.8;
            break; 
            default:
                desconto = 0.9;
            break;        
               
        }            
        return desconto;
    }
    
}
